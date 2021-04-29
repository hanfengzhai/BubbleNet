# [BubbleNet](https://hanfengzhai.net/BubbleNet)

[BubbleNet](https://hanfengzhai.net/BubbleNet) is a deep learning framework building on top of [PINN](https://maziarraissi.github.io/PINNs/) for inferring bubble flow in microfluids.

# Intro

BubbleNet consists of three parts: I. three SubNets of deep neural nets for learning and predicting <img src="https://latex.codecogs.com/svg.image?p,&space;\psi,&space;\phi" title="p, \psi, \phi" />, respectively. II. the physics-informed part: inferring velocitites <img src="https://latex.codecogs.com/svg.image?u,&space;v" title="u, v" /> from <img src="https://latex.codecogs.com/svg.image?\psi&space;" title="\psi " /> with <img src="https://latex.codecogs.com/svg.image?u&space;=&space;\partial_y&space;\psi\&space;v\&space;=&space;-&space;\partial_x&space;\psi" title="u = \partial_y \psi\ v\ = - \partial_x \psi" />. (for BubbleNet v.2.0: we added the governing equation from inferred \(u, v, p, \phi\) into the loss function. III. the time discretized normalizer (TDN): a function that can normalize the training data per time step.

![](/Documents/figures/PhysNet_sub.png)

To see the technical details of BubbleNet, please see

# Tutorials

To use BubbleNet, you can either download the code through GitHub:

‘’‘

git clone https://github.com/hanfengzhai/BubbleNet.git

’‘’


# References


