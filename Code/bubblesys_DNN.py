"""
Bubble Dynamics Deep Learning <https://hanfengzhai.net/BD-PINN.html/>
        @ Hanfeng Zhai <https://hanfengzhai.net/> | <Hanfeng.Zhai@outlook.com>
        
Reference: Physics-Informed Neural Networks <https://maziarraissi.github.io/PINNs/> 
        @ Maziar Raissi <https://maziarraissi.github.io/>
"""

import sys
sys.path.insert(0, '../Utilities/') # OPTIONAL: only if you want to use the plotting function with py

import tensorflow as tf
import numpy as np
import math
import matplotlib.pyplot as plt
import scipy.io
from scipy.interpolate import griddata
import time
import h5py
from itertools import product, combinations
from mpl_toolkits.mplot3d import Axes3D
from mpl_toolkits.mplot3d.art3d import Poly3DCollection
from plotting import newfig, savefig
from mpl_toolkits.axes_grid1 import make_axes_locatable
import matplotlib.gridspec as gridspec
from mpi4py import MPI
from sklearn.preprocessing import MinMaxScaler

mm = MinMaxScaler()

np.random.seed(1234)
tf.set_random_seed(1234)

class PhysicsInformedNN:
    # Initialize the class
    def __init__(self, x, y, t, u, v, p, phil, layers):
        
        X_u = np.concatenate([x, y, t], 1)
        X_v = np.concatenate([x, y, t], 1)
        X_p = np.concatenate([x, y, t], 1)
        X_phil = np.concatenate([x, y, t], 1)

        self.lb_u = X_u.min(0)
        self.ub_u = X_u.max(0)
        self.lb_v = X_v.min(0)
        self.ub_v = X_v.max(0)
        self.lb_p = X_p.min(0)
        self.ub_p = X_p.max(0)
        self.lb_phil = X_phil.min(0)
        self.ub_phil = X_phil.max(0)
                
        self.X_u = X_u
        self.X_v = X_v
        self.X_p = X_p
        self.X_phil = X_phil
        
        self.x_u = X_u[:,0:1]
        self.y_u = X_u[:,1:2]
        self.t_u = X_u[:,2:3]
        self.x_v = X_v[:,0:1]
        self.y_v = X_v[:,1:2]
        self.t_v = X_v[:,2:3]
        self.x_p = X_p[:,0:1]
        self.y_p = X_p[:,1:2]
        self.t_p = X_p[:,2:3]
        self.x_phil = X_phil[:,0:1]
        self.y_phil = X_phil[:,1:2]
        self.t_phil = X_phil[:,2:3]
        
        self.u = u
        self.v = v
        self.p = p
        self.phil = phil
        
        self.layers = layers
        
        # Initialize NN
        self.weights_u, self.biases_u = self.initialize_NN_u(layers)
        self.weights_v, self.biases_v = self.initialize_NN_v(layers)
        self.weights_p, self.biases_p = self.initialize_NN_p(layers)
        self.weights_phil, self.biases_phil = self.initialize_NN_phil(layers)
        
        # tf placeholders and graph
        self.sess = tf.Session(config=tf.ConfigProto(allow_soft_placement=True,
                                                     log_device_placement=True))
        
        self.x_tf_u = tf.placeholder(tf.float32, shape=[None, self.x_u.shape[1]])
        self.y_tf_u = tf.placeholder(tf.float32, shape=[None, self.y_u.shape[1]])
        self.t_tf_u = tf.placeholder(tf.float32, shape=[None, self.t_u.shape[1]])
        self.x_tf_v = tf.placeholder(tf.float32, shape=[None, self.x_v.shape[1]])
        self.y_tf_v = tf.placeholder(tf.float32, shape=[None, self.y_v.shape[1]])
        self.t_tf_v = tf.placeholder(tf.float32, shape=[None, self.t_v.shape[1]])
        self.x_tf_p = tf.placeholder(tf.float32, shape=[None, self.x_p.shape[1]])
        self.y_tf_p = tf.placeholder(tf.float32, shape=[None, self.y_p.shape[1]])
        self.t_tf_p = tf.placeholder(tf.float32, shape=[None, self.t_p.shape[1]])
        self.x_tf_phil = tf.placeholder(tf.float32, shape=[None, self.x_phil.shape[1]])
        self.y_tf_phil = tf.placeholder(tf.float32, shape=[None, self.y_phil.shape[1]])
        self.t_tf_phil = tf.placeholder(tf.float32, shape=[None, self.t_phil.shape[1]])
        
        self.u_tf = tf.placeholder(tf.float32, shape=[None, self.u.shape[1]])
        self.v_tf = tf.placeholder(tf.float32, shape=[None, self.v.shape[1]])
        self.p_tf = tf.placeholder(tf.float32, shape=[None, self.p.shape[1]])
        self.phil_tf = tf.placeholder(tf.float32, shape=[None, self.phil.shape[1]])
        
        self.u_pred = self.net_u(self.x_tf_u, self.y_tf_u, self.t_tf_u)
        self.v_pred = self.net_v(self.x_tf_v, self.y_tf_v, self.t_tf_v)
        self.p_pred = self.net_p(self.x_tf_p, self.y_tf_p, self.t_tf_p)
        self.phil_pred = self.net_phil(self.x_tf_phil, self.y_tf_phil, self.t_tf_phil)
        
        self.loss = tf.reduce_sum(tf.square(self.u_tf - self.u_pred)) + \
                    tf.reduce_sum(tf.square(self.v_tf - self.v_pred)) + \
                    tf.reduce_sum(tf.square(self.phil_tf - self.phil_pred)) + tf.reduce_sum(tf.square(self.p_tf - self.p_pred)) # loss function
                    
        self.optimizer = tf.contrib.opt.ScipyOptimizerInterface(self.loss, 
                                                                method = 'L-BFGS-B',
                                                                options = {'maxiter': 5000000,
                                                                           'maxfun': 5000000,
                                                                           'maxcor': 50,
                                                                           'maxls': 50,
                                                                           'ftol' : 1.0 * np.finfo(float).eps})        
        
        self.optimizer_Adam = tf.train.AdamOptimizer()
        self.train_op_Adam = self.optimizer_Adam.minimize(self.loss)                    
        
        init = tf.global_variables_initializer()
        self.sess.run(init)
# ==============================================================================================
    def initialize_NN_u(self, layers):        
        weights_u = []
        biases_u = []
        num_layers = len(layers) 
        for l_u in range(0,num_layers-1):
            W_u = self.xavier_init_u(size_u=[layers[l_u], layers[l_u+1]])
            b_u = tf.Variable(tf.zeros([1,layers[l_u+1]], dtype=tf.float32), dtype=tf.float32)
            weights_u.append(W_u)
            biases_u.append(b_u)
        return weights_u, biases_u
        
    def xavier_init_u(self, size_u):
        in_dim_u = size_u[0]
        out_dim_u = size_u[1]        
        xavier_stddev_u = np.sqrt(2/(in_dim_u + out_dim_u))
        return tf.Variable(tf.truncated_normal([in_dim_u, out_dim_u], stddev=xavier_stddev_u), dtype=tf.float32)
   
    def neural_net_u(self, X_u, weights_u, biases_u):
        num_layers = len(weights_u) + 1
        
        H_u = 2.0*(X_u - self.lb_u)/(self.ub_u - self.lb_u) - 1.0
        for l_u in range(0,num_layers-2):
            W_u = weights_u[l_u]
            b_u = biases_u[l_u]
            H_u = tf.tanh(tf.add(tf.matmul(H_u, W_u), b_u))
        W_u = weights_u[-1]
        b_u = biases_u[-1]
        Y_u = tf.add(tf.matmul(H_u, W_u), b_u)
        return Y_u
# ==============================================================================================
    def initialize_NN_v(self, layers):        
        weights_v = []
        biases_v = []
        num_layers = len(layers) 
        for l_v in range(0,num_layers-1):
            W_v = self.xavier_init_v(size_v=[layers[l_v], layers[l_v+1]])
            b_v = tf.Variable(tf.zeros([1,layers[l_v+1]], dtype=tf.float32), dtype=tf.float32)
            weights_v.append(W_v)
            biases_v.append(b_v)
        return weights_v, biases_v
        
    def xavier_init_v(self, size_v):
        in_dim_v = size_v[0]
        out_dim_v = size_v[1]        
        xavier_stddev_v = np.sqrt(2/(in_dim_v + out_dim_v))
        return tf.Variable(tf.truncated_normal([in_dim_v, out_dim_v], stddev=xavier_stddev_v), dtype=tf.float32)
   
    def neural_net_v(self, X_v, weights_v, biases_v):
        num_layers = len(weights_v) + 1
        
        H_v = 2.0*(X_v - self.lb_v)/(self.ub_v - self.lb_v) - 1.0
        for l_v in range(0,num_layers-2):
            W_v = weights_v[l_v]
            b_v = biases_v[l_v]
            H_v = tf.tanh(tf.add(tf.matmul(H_v, W_v), b_v))
        W_v = weights_v[-1]
        b_v = biases_v[-1]
        Y_v = tf.add(tf.matmul(H_v, W_v), b_v)
        return Y_v
# ==============================================================================================
    def initialize_NN_p(self, layers):        
        weights_p = []
        biases_p = []
        num_layers = len(layers) 
        for l_p in range(0,num_layers-1):
            W_p = self.xavier_init_p(size_p=[layers[l_p], layers[l_p+1]])
            b_p = tf.Variable(tf.zeros([1,layers[l_p+1]], dtype=tf.float32), dtype=tf.float32)
            weights_p.append(W_p)
            biases_p.append(b_p)
        return weights_p, biases_p
        
    def xavier_init_p(self, size_p):
        in_dim_p = size_p[0]
        out_dim_p = size_p[1]        
        xavier_stddev_p = np.sqrt(2/(in_dim_p + out_dim_p))
        return tf.Variable(tf.truncated_normal([in_dim_p, out_dim_p], stddev=xavier_stddev_p), dtype=tf.float32)
   
    def neural_net_p(self, X_p, weights_p, biases_p):
        num_layers = len(weights_p) + 1
        
        H_p = 2.0*(X_p - self.lb_p)/(self.ub_p - self.lb_p) - 1.0
        for l_p in range(0,num_layers-2):
            W_p = weights_p[l_p]
            b_p = biases_p[l_p]
            H_p = tf.tanh(tf.add(tf.matmul(H_p, W_p), b_p))
        W_p = weights_p[-1]
        b_p = biases_p[-1]
        Y_p = tf.add(tf.matmul(H_p, W_p), b_p)
        return Y_p
# ==============================================================================================
    def initialize_NN_phil(self, layers):        
        weights_phil = []
        biases_phil = []
        num_layers = len(layers) 
        for l_phil in range(0,num_layers-1):
            W_phil = self.xavier_init_phil(size_phil=[layers[l_phil], layers[l_phil+1]])
            b_phil = tf.Variable(tf.zeros([1,layers[l_phil+1]], dtype=tf.float32), dtype=tf.float32)
            weights_phil.append(W_phil)
            biases_phil.append(b_phil)
        return weights_phil, biases_phil
        
    def xavier_init_phil(self, size_phil):
        in_dim_phil = size_phil[0]
        out_dim_phil = size_phil[1]        
        xavier_stddev_phil = np.sqrt(2/(in_dim_phil + out_dim_phil))
        return tf.Variable(tf.truncated_normal([in_dim_phil, out_dim_phil], stddev=xavier_stddev_phil), dtype=tf.float32)
   
    def neural_net_phil(self, X_phil, weights_phil, biases_phil):
        num_layers = len(weights_phil) + 1
        
        H_phil = 2.0*(X_phil - self.lb_phil)/(self.ub_phil - self.lb_phil) - 1.0
        for l_phil in range(0,num_layers-2):
            W_phil = weights_phil[l_phil]
            b_phil = biases_phil[l_phil]
            H_phil = tf.tanh(tf.add(tf.matmul(H_phil, W_phil), b_phil))
        W_phil = weights_phil[-1]
        b_phil = biases_phil[-1]
        Y_phil = tf.add(tf.matmul(H_phil, W_phil), b_phil)
        return Y_phil
# ==============================================================================================
    def net_u(self, x, y, t):
        u = self.neural_net_u(tf.concat([x,y,t],1), self.weights_u, self.biases_u)
        return u
    def net_v(self, x, y, t):
        v = self.neural_net_v(tf.concat([x,y,t],1), self.weights_v, self.biases_v)
        return v
    def net_p(self, x, y, t):
        p = self.neural_net_p(tf.concat([x,y,t],1), self.weights_p, self.biases_p)
        return p
    def net_phil(self, x, y, t):
        phil = self.neural_net_phil(tf.concat([x,y,t],1), self.weights_phil, self.biases_phil)
        return phil
# ==============================================================================================
    def callback(self, loss): #, betta
        print('Loss: %.3e' % (loss)) #, betta B: %.5f
        return loss
      
    def train(self, nIter): 

        tf_dict = {self.x_tf_u: self.x_u, self.y_tf_u: self.y_u, self.t_tf_u: self.t_u,
                   self.x_tf_v: self.x_v, self.y_tf_v: self.y_v, self.t_tf_v: self.t_v,
                   self.x_tf_p: self.x_p, self.y_tf_p: self.y_p, self.t_tf_p: self.t_p,
                   self.x_tf_phil: self.x_phil, self.y_tf_phil: self.y_phil, self.t_tf_phil: self.t_phil,
                   self.u_tf: self.u, self.v_tf: self.v, self.p_tf: self.p, self.phil_tf: self.phil}
        
        start_time = time.time()
        for it in range(nIter):
            self.sess.run(self.train_op_Adam, tf_dict)
            
            # Print
            if it % 10 == 0:
                elapsed = time.time() - start_time
                loss_value = self.sess.run(self.loss, tf_dict)
                print('It: %d, Loss: %.3e, Time: %.2f' % 
                      (it, loss_value, elapsed)) 
                start_time = time.time()
            
        self.optimizer.minimize(self.sess,
                                feed_dict = tf_dict,
                                fetches = [self.loss],
                                loss_callback = self.callback)
            
# ==============================================================================================    
    def predict_u(self, x_star, y_star, t_star):
        
        tf_dict_u = {self.x_tf_u: x_star, self.y_tf_u: y_star, self.t_tf_u: t_star}      
        u_star = self.sess.run(self.u_pred, tf_dict_u)
        
        return u_star

    def predict_v(self, x_star, y_star, t_star):
        
        tf_dict_v = {self.x_tf_v: x_star, self.y_tf_v: y_star, self.t_tf_v: t_star} 
        v_star = self.sess.run(self.v_pred, tf_dict_v)
        
        return v_star

    def predict_p(self, x_star, y_star, t_star):
        
        tf_dict_p = {self.x_tf_p: x_star, self.y_tf_p: y_star, self.t_tf_p: t_star}   
        p_star = self.sess.run(self.p_pred, tf_dict_p)
        
        return p_star

    def predict_phil(self, x_star, y_star, t_star):
        
        tf_dict_phil = {self.x_tf_phil: x_star, self.y_tf_phil: y_star, self.t_tf_phil: t_star}
        phil_star = self.sess.run(self.phil_pred, tf_dict_phil)
        
        return phil_star
# ==============================================================================================      
def axisEqual3D(ax):
    extents = np.array([getattr(ax, 'get_{}lim'.format(dim))() for dim in 'xyz'])
    sz = extents[:,1] - extents[:,0]
    centers = np.mean(extents, axis=1)
    maxsize = max(abs(sz))
    r = maxsize/4
    for ctr, dim in zip(centers, 'xyz'):
        getattr(ax, 'set_{}lim'.format(dim))(ctr - r, ctr + r)     
# ==============================================================================================          
# ==============================================================================================  
if __name__ == "__main__": 
    
    layers = [3, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 1]
    
    # Load Data
#     Xdata = scipy.io.loadmat('../Data/X.mat')
#     tdata = scipy.io.loadmat('../Data/t.mat')
#     pdata = scipy.io.loadmat('../Data/p.mat')
#     udata = scipy.io.loadmat('../Data/u.mat')
#     vdata = scipy.io.loadmat('../Data/v.mat')
#     phildata = scipy.io.loadmat('../Data/phi.mat')
    data = scipy.io.loadmat('../Data/MultiBubbleData_TDN.mat')
           
    u_star = udata['u'] # N x T
    v_star = vdata['v'] # N x T
    P_star = pdata['p'] # N x T
    Phil_star = phildata['phil'] # N x T
    t_star = tdata['t'] # T x 1
    X_star = Xdata['X_star'] # N x 2
    
    N = X_star.shape[0]
    T = t_star.shape[0]
    
    # Rearrange Data 
    XX = np.tile(X_star[:,0:1], (1,T)) # N x T
    YY = np.tile(X_star[:,1:2], (1,T)) # N x T
    TT = np.tile(t_star, (1,N)).T # N x T
    
    UU = u_star # U_star[:,0,:] # N x T
    VV = v_star # U_star[:,1,:] # N x T
    PP = P_star # N x T
    Phil = Phil_star # N x T
    
    x = XX.flatten()[:,None] # NT x 1
    y = YY.flatten()[:,None] # NT x 1
    t = TT.flatten()[:,None] # NT x 1
    
    u = UU.flatten()[:,None] # NT x 1
    v = VV.flatten()[:,None] # NT x 1
    p = PP.flatten()[:,None] # NT x 1
    phil = Phil.flatten()[:,None] # NT x 1
 
    # Training Data    
    idx = np.random.choice(N*T, int(N*T*0.75), replace=False)
    x_train = x[:,:] # [idx,:]
    y_train = y[:,:]
    t_train = t[:,:]
    u_train = u[:,:]
    v_train = v[:,:]
    p_train = p[:,:]
    phil_train = phil[:,:]

    # Training
    model = PhysicsInformedNN(x_train, y_train, t_train, u_train, v_train, p_train, phil_train, layers)
    model.train(200000)
    
    # Test Data
    snap = np.array([50]) # time step --> insert the time step to be predicted

    x_star = X_star[:,0:1]
    y_star = X_star[:,1:2]
    t_star = TT[:,snap]
    
    u_star = u_star[:,snap]
    v_star = v_star[:,snap] 
    p_star = P_star[:,snap]
    phil_star = Phil_star[:,snap]
    
    # Prediction
    u_pred = model.predict_u(x_star, y_star, t_star)
    v_pred = model.predict_v(x_star, y_star, t_star)
    p_pred = model.predict_p(x_star, y_star, t_star)
    phil_pred = model.predict_phil(x_star, y_star, t_star)

    # Error
    error_u = np.linalg.norm(u_star-u_pred,2)/np.linalg.norm(u_star,2)
    error_v = np.linalg.norm(v_star-v_pred,2)/np.linalg.norm(v_star,2)
    error_p = np.linalg.norm(p_star-p_pred,2)/np.linalg.norm(p_star,2)
    error_phil = np.linalg.norm(phil_star-phil_pred,2)/np.linalg.norm(phil_star,2)
    
    error_u_abs = (u_star-u_pred)/(u_star)
    error_v_abs = (v_star-v_pred)/(v_star)
    error_p_abs = (p_star-p_pred)/(p_star)
    error_phil_abs = (phil_star-phil_pred)/(phil_star)
    
    print('Error abs u: %e' % (error_u))    
    print('Error abs v: %e' % (error_v))    
    print('Error abs p: %e' % (error_p))  
    print('Error abs phil: %e' % (error_phil))            

    # Predict for plotting
    lb = X_star.min(0)
    ub = X_star.max(0)
    nn = 200
    x = np.linspace(lb[0], ub[0], nn)
    y = np.linspace(lb[1], ub[1], nn)
    X, Y = np.meshgrid(x,y)

    np.savetxt("u_pred_sys.txt", np.hstack(u_pred))
    np.savetxt("v_pred_sys.txt", np.hstack(v_pred))
    np.savetxt("p_pred_sys.txt", np.hstack(p_pred))
    np.savetxt("phil_pred_sys.txt", np.hstack(phil_pred))
    
    np.savetxt("u_error_sys.txt", np.hstack(error_u_abs))
    np.savetxt("v_error_sys.txt", np.hstack(error_v_abs))
    np.savetxt("p_error_sys.txt", np.hstack(error_p_abs))
    np.savetxt("phil_error_sys.txt", np.hstack(error_phil_abs))
