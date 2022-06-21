# [BubbleNet](https://doi.org/10.1063/5.0079602)

> :warning:**Note:** this work was partially developed from my undergraduate thesis.

[<img src="https://www.pngkey.com/png/full/911-9113941_international-human-rights-instruments-white-transparent-website-logo.png" height="30"/>](https://hanfengzhai.net/BubbleNet)      [<img src="https://pngimg.com/uploads/github/github_PNG53.png" height="30"/>](https://github.com/hanfengzhai/BubbleNet)      [<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/YouTube_full-color_icon_%282017%29.svg/800px-YouTube_full-color_icon_%282017%29.svg.png" height="30"/>](https://www.youtube.com/watch?v=fKkvRyeWANM)      [<img src="https://cdn6.aptoide.com/imgs/8/f/1/8f16818c289cd522f8bc83ebaceba4b5_icon.png" height="30"/>](https://www.bilibili.com/video/BV1Jv411L7aV)      [<img src="https://cdn.freebiesupply.com/logos/large/2x/wechat-logo-png-transparent.png" height="30"/>](https://mp.weixin.qq.com/s?__biz=MzkxNjIwNTk3Mg==&mid=2247483718&idx=1&sn=783218a0461baeb43b3e3839b05c8ee9&chksm=c15239bdf625b0ab48428cde6664e88c2ff58618bc19fd555b6b048ed43ba39cc840daa48e3a&token=1821514206&lang=zh_CN#rd)

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4769081.svg)](https://doi.org/10.5281/zenodo.4769081) [![DOI](http://img.shields.io/badge/physics.flu_dyn-arXiv%3A2105.07179-B31B1B.svg)](https://arxiv.org/abs/2105.07179)

[BubbleNet](https://hanfengzhai.net/BubbleNet) is a deep learning framework building on top of [PINN](https://maziarraissi.github.io/PINNs/) for inferring bubble flow in microfluids.

# Intro

BubbleNet consists of three parts: I. three SubNets of deep neural nets for learning and predicting <img src="https://latex.codecogs.com/svg.image?p,&space;\psi,&space;\phi" title="p, \psi, \phi" />, respectively. II. the physics-informed part: inferring velocitites <img src="https://latex.codecogs.com/svg.image?u,&space;v" title="u, v" /> from <img src="https://latex.codecogs.com/svg.image?\psi&space;" title="\psi " /> with <img src="https://latex.codecogs.com/svg.image?u&space;=&space;\partial_y&space;\psi\&space;v\&space;=&space;-&space;\partial_x&space;\psi" title="u = \partial_y \psi\ v\ = - \partial_x \psi" />. (for BubbleNet v.2.0: we added the governing equation from inferred <img src="https://latex.codecogs.com/svg.image?u,&space;v,&space;p,&space;\phi" title="u, v, p, \phi" /> into the loss function. III. the time discretized normalizer (TDN): a function that can normalize the training data per time step. 

![](/Documents/figures/fig6.jpg)

BubbleNet is a powerful tool not only for bubble flow, but also for multiphase flow & other fluid dynamics problems.

Here, we show that \textsc{BubbleNet} are able to predict the bubbles' movements and the related physics fields (<img src="https://latex.codecogs.com/svg.image?u,&space;v,&space;p,&space;\phi" title="u, v, p, \phi" />). Due to page limites, we only show how well BubbleNet can work on bubble movements compared with traditional DNNs.

![Deep learning predictions compared with original CFD results for single bubble case.](/Documents/figures/phil.png)

![Deep learning predictions compared with original CFD results for multiple bubbles case.](/Documents/figures/phi_sys.png)

To see more results & the technical details of BubbleNet, visit [2105.07179](https://arxiv.org/abs/2105.07179).

# Tutorials

BubbleNet is a deep learning package building on top of [TensorFlow](https://www.tensorflow.org/), install tf before using BubbleNet:

```bash
pip install tensorflow
```
To use BubbleNet, you first need to download the code through GitHub (on your customized directory):

```bash
git clone https://github.com/hanfengzhai/BubbleNet.git
```
In our practice, we trained our NNs on [Beijing Super Cloud Computing Center](http://www.blsc.cn/), (BLSC). Based on the first author's personal experience, most supercomuting environment use [Slurm](https://slurm.schedmd.com/sbatch.html) system, i.e. [Cornell G2](https://it.coecis.cornell.edu/researchit/g2cluster/), [XSEDE](https://www.xsede.org/), etc. Here, you can try out the single bubble case and train both the DNN and BubbleNet using the slurm command:

*I. For [SC](https://g.co/kgs/Me8WPn) users, please run*
```bash
sbatch super-computer.sub
```
*II. If you are using the work station at your lab or home:*
```bash
bash work-station.sh
```
*III. Or just execute the py files directly:*
```bash
python bubble_DNN.py # run it on traditional deep neural net
python bubble_PhysNet.py # run it on BubbleNet
```
Similarly, training the bubbly flow with multiple bubbles case on NN, run:
```bash
# directly execute the python files
python bubblesys_DNN.py # run it on traditional deep neural net
python bubblesys_PhysNet.py # run it on BubbleNet
```
After the training, you will see the losses callbacks on your command lines, & the accuracy for the NNs. You will also see the saved files of both the DNN & BubbleNet predictions in your directory. Open these '*.txt*' files with matlab and convert them into '*.mat*' numerical matrix files.

Then, execute the '*.m*' files to generate figures for the final results, either with [MATLAB<img src="https://latex.codecogs.com/svg.image?\circledR" title="\circledR" />](https://www.mathworks.com/products/matlab.html) or [Octave](https://www.gnu.org/software/octave/index):
```bash
figure_preparation.m 
figure_generation.m 
```
Now, sort out all the figures and you've already utilize most of BubbleNet! :)

# Tech Info

If you are a developer wishing to custume your own BubbleNet for predictions, please refer the following details of the algorithms.

<center>
<img src="/Documents/figures/ALGORITHM1.jpg" width="550"/>

<img src="/Documents/figures/ALGORITHM2.jpg" width="550"/>
</center>

# Reference & Citation

The authors are more than happy if you refer the following works:

> Hanfeng Zhai, Quan Zhou, and Guohui Hu , "Predicting micro-bubble dynamics with semi-physics-informed deep learning", AIP Advances 12, 035153 (2022) [https://doi.org/10.1063/5.0079602](10.1063/5.0079602)

For (La)TeX users:

```tex
@article{Zhai2022,
  doi = {10.1063/5.0079602},
  url = {https://doi.org/10.1063/5.0079602},
  year = {2022},
  month = mar,
  publisher = {{AIP} Publishing},
  volume = {12},
  number = {3},
  pages = {035153},
  author = {Hanfeng Zhai and Quan Zhou and Guohui Hu},
  title = {Predicting micro-bubble dynamics with semi-physics-informed deep learning},
  journal = {{AIP} Advances}
}
```
```tex
@software{zhai_hanfeng_2021_4769081,
  author       = {Zhai, Hanfeng},
  title        = {{Data for BubbleNet code \& micro-bubbles system 
                   dynamics simulation}},
  month        = mar,
  year         = 2021,
  publisher    = {Zenodo},
  doi          = {10.5281/zenodo.4769081},
  url          = {https://doi.org/10.5281/zenodo.4769081}
}
```
