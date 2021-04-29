# [BubbleNet](https://hanfengzhai.net/BubbleNet)

[BubbleNet](https://hanfengzhai.net/BubbleNet) is a deep learning framework building on top of [PINN](https://maziarraissi.github.io/PINNs/) for inferring bubble flow in microfluids.

BubbleNet consists of three parts: I. three SubNets of deep neural nets for learning and predicting \(p, \psi, \phi\), respectively. II. the physics-informed part: inferring velocitites ![](http://latex.codecogs.com/gif.latex?\\u, v) from \(\psi\) with \(u = \partial_y \psi, \& v = - \partial_x \psi\). (for BubbleNet v.2.0: we added the governing equation from inferred \(u, v, p, \phi\) into the loss function. III. the time discretized normalizer: a function that can normalize the training data per time step.

![](/Documents/figures/PhysNet_sub.png)

To see the technical details of BubbleNet, please see


