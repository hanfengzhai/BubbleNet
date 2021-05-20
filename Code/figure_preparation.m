%          Copyright (C) 2021, Hanfeng Zhai
% 
% <https://hanfengzhai.net/> | <Hanfeng.Zhai@outlook.com>
%     Department of Mechanics, Shanghai Univeristy
% 
% Bubble Dynamics Deep Learning | <https://hanfengzhai.net/BubbleNet>
% 
% 
% _______This code serves for preparation of figure plottings_______



% load the orginal data
load('Xdata.mat')
load('tdata.mat')
load('pdata_n.mat')
load('udata_n.mat')
load('vdata_n.mat')
load('phildata_n.mat')
load('singlebubble.mat')

% inversed nomarlization
p = mapminmax('reverse',p);
ppred_sys_DNN = mapminmax('reverse',ppredsysDNN);
ppred_single_DNN = mapminmax('reverse',ppredDNN);
ppred_sys_BNet = mapminmax('reverse',ppredsysPhysNet);
ppred_single_BNet = mapminmax('reverse',ppredPhysNet);
u = mapminmax('reverse',u);
upred_sys_DNN = mapminmax('reverse',upredsysDNN);
upred_single_DNN = mapminmax('reverse',upredDNN);
upred_sys_BNet = mapminmax('reverse',upredsysPhysNet);
upred_single_BNet = mapminmax('reverse',upredPhysNet);
v = mapminmax('reverse',v);
vpred_sys_DNN = mapminmax('reverse',vpredsysDNN);
vpred_single_DNN = mapminmax('reverse',vpredDNN);
vpred_sys_BNet = mapminmax('reverse',vpredsysPhysNet);
vpred_single_BNet = mapminmax('reverse',vpredPhysNet);
phil = mapminmax('reverse',phil);
philpred_sys_DNN = mapminmax('reverse',philpredsysDNN);
philpred_single_DNN = mapminmax('reverse',philpredDNN);
philpred_sys_BNet = mapminmax('reverse',philpredsysPhysNet);
philpred_single_BNet = mapminmax('reverse',philpredPhysNet);

% Prepare predicted pressure data (DNN)
[x_p_pred_sys_DNN, y_p_pred_sys_DNN, p_prediction_sys_DNN] = griddata(X_star(:,1),X_star(:,2),ppred_sys_DNN(:,1),linspace(-50,50,1000),linspace(0,50,1000)','v4'); # multiple bubbles case
[x_p_pred_sing_DNN, y_p_pred_sing_DNN, p_prediction_sing_DNN] = griddata(X_star(:,1),X_star(:,2),ppred_single_DNN(:,1),linspace(0,15,1000),linspace(0,5,1000)','v4'); # single bubble case
% Prepare predicted pressure data (BubbleNet)
[x_p_pred_sys_BNet, y_p_pred_sys_BNet, p_prediction_sys_BNet] = griddata(X_star(:,1),X_star(:,2),ppred_sys_BNet(:,1),linspace(-50,50,1000),linspace(0,50,1000)','v4'); # multiple bubbles case
[x_p_pred_sing_BNet, y_p_pred_sing_BNet, p_prediction_sing_BNet] = griddata(X_star(:,1),X_star(:,2),ppred_single_BNet(:,1),linspace(0,15,1000),linspace(0,5,1000)','v4'); # single bubble case
% Prepare exact pressure data
[x_p, y_p, p_exact] = griddata(X_star(:,1),X_star(:,2),p(:,1),linspace(-50,50,1000),linspace(0,50,1000)','v4'); # multiple bubbles case


% Prepare predicted velocity u data (DNN)
[x_u_pred_sys_DNN, y_u_pred_sys_DNN, u_prediction_sys_DNN] = griddata(X_star(:,1),X_star(:,2),ppred_sys_DNN(:,1),linspace(-50,50,1000),linspace(0,50,1000)','v4'); # multiple bubbles case
[x_u_pred_sing_DNN, y_u_pred_sing_DNN, u_prediction_sing_DNN] = griddata(X_star(:,1),X_star(:,2),ppred_single_DNN(:,1),linspace(0,15,1000),linspace(0,5,1000)','v4'); # single bubble case
% Prepare predicted velocity u data (BubbleNet)
[x_u_pred_sys_BNet, y_u_pred_sys_BNet, u_prediction_sys_BNet] = griddata(X_star(:,1),X_star(:,2),ppred_sys_BNet(:,1),linspace(-50,50,1000),linspace(0,50,1000)','v4'); # multiple bubbles case
[x_u_pred_sing_BNet, y_u_pred_sing_BNet, u_prediction_sing_BNet] = griddata(X_star(:,1),X_star(:,2),ppred_single_BNet(:,1),linspace(0,15,1000),linspace(0,5,1000)','v4'); # single bubble case
% Prepare exact velocity u data
[x_u, y_u, u_exact] = griddata(X_star(:,1),X_star(:,2),u(:,1),linspace(-50,50,1000),linspace(0,50,1000)','v4');


% Prepare predicted velocity v data
[x_v_pred_sys_DNN, y_v_pred_sys_DNN, v_prediction_sys_DNN] = griddata(X_star(:,1),X_star(:,2),ppred_sys_DNN(:,1),linspace(-50,50,1000),linspace(0,50,1000)','v4'); # multiple bubbles case
[x_v_pred_sing_DNN, y_v_pred_sing_DNN, v_prediction_sing_DNN] = griddata(X_star(:,1),X_star(:,2),ppred_single_DNN(:,1),linspace(0,15,1000),linspace(0,5,1000)','v4'); # single bubble case
% Prepare predicted velocity u data (BubbleNet)
[x_v_pred_sys_BNet, y_v_pred_sys_BNet, v_prediction_sys_BNet] = griddata(X_star(:,1),X_star(:,2),ppred_sys_BNet(:,1),linspace(-50,50,1000),linspace(0,50,1000)','v4'); # multiple bubbles case
[x_v_pred_sing_BNet, y_v_pred_sing_BNet, v_prediction_sing_BNet] = griddata(X_star(:,1),X_star(:,2),ppred_single_BNet(:,1),linspace(0,15,1000),linspace(0,5,1000)','v4'); # single bubble case
% Prepare exact velocity v data
[x_v, y_v, v_exact] = griddata(X_star(:,1),X_star(:,2),v(:,1),linspace(-50,50,1000),linspace(0,50,1000)','v4');


% Prepare predicted phase phil data
[x_phil_pred_sys_DNN, y_phil_pred_sys_DNN, phil_prediction_sys_DNN] = griddata(X_star(:,1),X_star(:,2),ppred_sys_DNN(:,1),linspace(-50,50,1000),linspace(0,50,1000)','v4'); # multiple bubbles case
[x_phil_pred_sing_DNN, y_phil_pred_sing_DNN, phil_prediction_sing_DNN] = griddata(X_star(:,1),X_star(:,2),ppred_single_DNN(:,1),linspace(0,15,1000),linspace(0,5,1000)','v4'); # single bubble case
% Prepare predicted velocity u data (BubbleNet)
[x_phil_pred_sys_BNet, y_phil_pred_sys_BNet, phil_prediction_sys_BNet] = griddata(X_star(:,1),X_star(:,2),ppred_sys_BNet(:,1),linspace(-50,50,1000),linspace(0,50,1000)','v4'); # multiple bubbles case
[x_phil_pred_sing_BNet, y_phil_pred_sing_BNet, phil_prediction_sing_BNet] = griddata(X_star(:,1),X_star(:,2),ppred_single_BNet(:,1),linspace(0,15,1000),linspace(0,5,1000)','v4'); # single bubble case
% Prepare exact phase phil data
[x_phil, y_phil, phil_exact] = griddata(X_star(:,1),X_star(:,2),phil(:,1),linspace(-50,50,1000),linspace(0,50,1000)','v4');
