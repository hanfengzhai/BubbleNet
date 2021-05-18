# [BubbleNet](https://hanfengzhai.net/BubbleNet)

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4769081.svg)](https://doi.org/10.5281/zenodo.4769081) [![DOI](http://img.shields.io/badge/physics.flu_dyn-arXiv%3A2105.07179-B31B1B.svg)](https://arxiv.org/abs/2105.07179)

[BubbleNet](https://hanfengzhai.net/BubbleNet) is a deep learning framework building on top of [PINN](https://maziarraissi.github.io/PINNs/) for inferring bubble flow in microfluids.

[<img src="https://www.pngkey.com/png/full/911-9113941_international-human-rights-instruments-white-transparent-website-logo.png" height="50"/>](https://hanfengzhai.net/BubbleNet)      [<img src="https://pngimg.com/uploads/github/github_PNG53.png" height="50"/>](https://github.com/hanfengzhai/BubbleNet)      [<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/YouTube_full-color_icon_%282017%29.svg/800px-YouTube_full-color_icon_%282017%29.svg.png" height="50"/>](https://www.youtube.com/watch?v=fKkvRyeWANM)      [<img src="https://cdn6.aptoide.com/imgs/8/f/1/8f16818c289cd522f8bc83ebaceba4b5_icon.png" height="50"/>](https://www.bilibili.com/video/BV1Jv411L7aV)      [<img src="https://cdn.freebiesupply.com/logos/large/2x/wechat-logo-png-transparent.png" height="50"/>](https://mp.weixin.qq.com/s?__biz=MzkxNjIwNTk3Mg==&mid=2247483718&idx=1&sn=783218a0461baeb43b3e3839b05c8ee9&chksm=c15239bdf625b0ab48428cde6664e88c2ff58618bc19fd555b6b048ed43ba39cc840daa48e3a&token=1821514206&lang=zh_CN#rd)

# Intro

BubbleNet consists of three parts: I. three SubNets of deep neural nets for learning and predicting <img src="https://latex.codecogs.com/svg.image?p,&space;\psi,&space;\phi" title="p, \psi, \phi" />, respectively. II. the physics-informed part: inferring velocitites <img src="https://latex.codecogs.com/svg.image?u,&space;v" title="u, v" /> from <img src="https://latex.codecogs.com/svg.image?\psi&space;" title="\psi " /> with <img src="https://latex.codecogs.com/svg.image?u&space;=&space;\partial_y&space;\psi\&space;v\&space;=&space;-&space;\partial_x&space;\psi" title="u = \partial_y \psi\ v\ = - \partial_x \psi" />. (for BubbleNet v.2.0: we added the governing equation from inferred <img src="https://latex.codecogs.com/svg.image?u,&space;v,&space;p,&space;\phi" title="u, v, p, \phi" /> into the loss function. III. the time discretized normalizer (TDN): a function that can normalize the training data per time step. 

![](/Documents/figures/PhysNet_sub.png)

BubbleNet is a powerful tool not only for bubble flow, but also for multiphase flow & other fluid dynamics problems.

Here, we show that \textsc{BubbleNet} are able to predict the bubbles' movements and the related physics fields (<img src="https://latex.codecogs.com/svg.image?u,&space;v,&space;p,&space;\phi" title="u, v, p, \phi" />). Due to page limites, we only show how well BubbleNet can work on bubble movements compared with traditional DNNs.

![Deep learning predictions compared with original CFD results for single bubble case.](/Documents/figures/phil.png)

![Deep learning predictions compared with original CFD results for multiple bubbles case.](/Documents/figures/phi_sys.png)

To see more results, visit [](), about the technical details of BubbleNet, please see []()

# Tutorials

To use BubbleNet, you can either download the code through GitHub:

```bash
git clone https://github.com/hanfengzhai/BubbleNet.git
```
Try out the single bubble case and train both the DNN and BubbleNet:

*I. if you are using the remote super computing center:*
```bash
sbatch SingleBubble_SuperComputing.sh
```
*II. if you are using the work station at your lab or home:*
```bash
bash SingleBubble_WorkStation.sh
```
*III. or just run it directly:*
```bash
python DNN_SingleBubble.py
python BubbleNet_SingleBubble.py
```

# Tech Info

If you are a developer wishing to custume your own BubbleNet for predictions

# Reference & Citation

The authors are more than happy if you refer the following works:

> H. Zhai and G. Hu. (2021) Inferring micro-bubble dynamics with physics-informed deep learning. *arXiv preprint*. [arXiv:2105.07179
](https://arxiv.org/abs/2105.07179).

For (La)TeX users:

```tex
@misc{zhai2021BubbleNet,
    title={Inferring micro-bubble dynamics with physics-informed deep learning},
    author={Hanfeng Zhai and Guohui Hu},
    year={2021},
    eprint={2105.07179},
    archivePrefix={arXiv},
    primaryClass={physics.flu-dyn}
}
```
```tex
@software{zhai_hanfeng_2021_4769081,
  author       = {Zhai, Hanfeng},
  title        = {{Data for BubbleNet code \& micro-bubbles system 
                   dynamics simulation}},
  month        = mar,
  year         = 2021,
  note         = {This is not the official published version.},
  publisher    = {Zenodo},
  version      = {v.0.0},
  doi          = {10.5281/zenodo.4769081},
  url          = {https://doi.org/10.5281/zenodo.4769081}
}
```
