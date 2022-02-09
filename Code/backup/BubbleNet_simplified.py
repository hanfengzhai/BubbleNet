import numpy as np
from mpl_toolkits.mplot3d import Axes3D
from PDE_FIND import *
import scipy.io as sio
import itertools

data = sio.loadmat('data.mat')
steps = 299
n = 99
m = 50
U = data['u']#.reshape(n,m,steps)      # x-component of velocity
V = data['v']#.reshape(n,m,steps)      # y-component of velocity
P = data['p']#.reshape(n,m,steps)   # pressure
PHI = data['phil']#.reshape(n,m,steps)
PHIt = data['phil_t']
PHIx = data['phil_x']
PHIy = data['phil_y']

dt = 0.2
dx = 0.02
dy = 0.02

u = U
v = V
phi = PHI
phit = PHIt
phix = PHIx
phiy = PHIy

num_xy = 4950
num_t = 299
num_points = num_xy * num_t
# print(np.ones((num_points,1)))
print(phix)

X_data = np.hstack([phi,u,v])
X_ders = np.hstack([np.ones((num_points,1)), phix, phiy])
X_ders_descr = ['','phi_{x}', 'phi_{y}']
X, description = build_Theta(X_data, X_ders, X_ders_descr, 1, data_description = ['phi','u','v'])
print('Candidate terms for PDE')
['1']+description[1:]

lam = 10**-3
d_tol = 0.01
c = TrainSTRidge(X,phit,lam,d_tol)
print_pde(c, description, ut = 'phi_t')