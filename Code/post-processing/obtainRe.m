%% 单气泡流 (国际单位制)

rho = 998;%密度
R1 = 2.5e-6;%半径
L1=5e-6;%特征长度：直径
mu=0.001;%动力学粘度系数
pressuregradients1 = 10/(15e-6);% 压力横向导数 = dp/dx

Re1 = -((rho*R1^2*L1)/(3*mu^2))*pressuregradients1;

%% 多气泡流 (国际单位制)

rho = 998;%密度
R2 = 25e-6;%半径
L2=50e-6;%特征长度：直径
mu=0.001;%动力学粘度系数
pressuregradients2 = 10/(100e-6);% 压力横向导数 = dp/dx

Re2 = -((rho*R1^2*L2)/(3*mu^2))*pressuregradients2;
