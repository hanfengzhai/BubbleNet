%                Copyright (C) 2021, Hanfeng Zhai
% 
%      <https://hanfengzhai.net/> | <Hanfeng.Zhai@outlook.com>
%          Department of Mechanics, Shanghai Univeristy
% 
% Bubble Dynamics Deep Learning | <https://hanfengzhai.net/BubbleNet>
% 
% 
% _____________This code serves for figure plottings______________

figure(1) % plot predicted pressure p_pred
contourf(x_p, y_p, p_exact)
figure(2) % plot exact pressure p_exact
contourf(x_p_pred_sys_DNN, y_p_pred_sys_DNN, p_prediction_sys_DNN)
figure(3) % plot predicted pressure p_pred
contourf(x_p_pred_sing_DNN, y_p_pred_sing_DNN, p_prediction_sing_DNN)
figure(4) % plot predicted pressure p_pred
contourf(x_p_pred_sys_BNet, y_p_pred_sys_BNet, p_prediction_sys_BNet)
figure(5) % plot predicted pressure p_pred
contourf(x_p_pred_sing_BNet, y_p_pred_sing_BNet, p_prediction_sing_BNet)

figure(6) % plot predicted pressure u_pred
contourf(x_u, y_u, u_exact)
figure(7) % plot exact pressure u_exact
contourf(x_u_pred_sys_DNN, y_u_pred_sys_DNN, u_prediction_sys_DNN)
figure(8) % plot predicted pressure u_pred
contourf(x_u_pred_sing_DNN, y_u_pred_sing_DNN, u_prediction_sing_DNN)
figure(9) % plot predicted pressure u_pred
contourf(x_u_pred_sys_BNet, y_u_pred_sys_BNet, u_prediction_sys_BNet)
figure(10) % plot predicted pressure u_pred
contourf(x_u_pred_sing_BNet, y_u_pred_sing_BNet, u_prediction_sing_BNet)

figure(11) % plot predicted pressure v_pred
contourf(x_v, y_v, v_exact)
figure(12) % plot exact pressure v_exact
contourf(x_v_pred_sys_DNN, y_v_pred_sys_DNN, v_prediction_sys_DNN)
figure(13) % plot predicted pressure v_pred
contourf(x_v_pred_sing_DNN, y_v_pred_sing_DNN, v_prediction_sing_DNN)
figure(14) % plot predicted pressure v_pred
contourf(x_v_pred_sys_BNet, y_v_pred_sys_BNet, v_prediction_sys_BNet)
figure(15) % plot predicted pressure v_pred
contourf(x_v_pred_sing_BNet, y_v_pred_sing_BNet, v_prediction_sing_BNet)

figure(16) % plot predicted pressure phil_pred
contourf(x_phil, y_phil, phil_exact)
figure(17) % plot exact pressure phil_exact
contourf(x_phil_pred_sys_DNN, y_phil_pred_sys_DNN, phil_prediction_sys_DNN)
figure(18) % plot predicted pressure phil_pred
contourf(x_phil_pred_sing_DNN, y_phil_pred_sing_DNN, phil_prediction_sing_DNN)
figure(19) % plot predicted pressure phil_pred
contourf(x_phil_pred_sys_BNet, y_phil_pred_sys_BNet, phil_prediction_sys_BNet)
figure(20) % plot predicted pressure phil_pred
contourf(x_phil_pred_sing_BNet, y_phil_pred_sing_BNet, phil_prediction_sing_BNet)