u_rel_err_DNN = abs(uerror)./abs(u(:,50));
v_rel_err_DNN = abs(verror)./abs(v(:,50));
p_rel_err_DNN = abs(perror)./abs(p(:,50));
phil_rel_err_DNN = abs(philerror)./abs(phil(:,50));

%%
u_rel_err_BN = abs(uerrorPhysNet)./abs(u(:,50));
v_rel_err_BN = abs(verrorPhysNet)./abs(v(:,50));
p_rel_err_BN = abs(perrorPhysNet)./abs(p(:,50));
phil_rel_err_BN = abs(philerrorPhysNet)./abs(phil(:,50));
%%
u_rel_err_P = abs(uerrorP)./abs(u(:,50));
v_rel_err_P = abs(verrorP)./abs(v(:,50));
p_rel_err_P = abs(perrorP)./abs(p(:,50));
phil_rel_err_P = abs(philerrorP)./abs(phil(:,50));

%%
[xpDNN,ypDNN,zpDNN]=griddata(X(:,1), X(:,2), p_rel_err_DNN,linspace(0,15,100),linspace(0,5,100)','v4');
[xpBNet,ypBNet,zpBNet]=griddata(X(:,1),X(:,2), p_rel_err_BN,linspace(0,15,100),linspace(0,5,100)','v4'); 
[xpP,ypP,zpP]=griddata(X(:,1),X(:,2),p_rel_err_P,linspace(0,15,100),linspace(0,5,100)','v4'); 
%%
[xphilDNN,yphilDNN,zphilDNN]=griddata(X(:,1),X(:,2),phil_rel_err_DNN,linspace(0,15,100),linspace(0,5,100)','v4'); 
[xphilBNet,yphilBNet,zphilBNet]=griddata(X(:,1),X(:,2),phil_rel_err_BN,linspace(0,15,100),linspace(0,5,100)','v4');
[xphilP,yphilP,zphilP]=griddata(X(:,1),X(:,2),phil_rel_err_P,linspace(0,15,100),linspace(0,5,100)','v4');
%%
[xuDNN,yuDNN,zuDNN]=griddata(X(:,1),X(:,2),u_rel_err_DNN,linspace(0,15,100),linspace(0,5,100)','v4');
[xuBNet,yuBNet,zuBNet]=griddata(X(:,1),X(:,2),u_rel_err_BN,linspace(0,15,100),linspace(0,5,100)','v4'); 
[xuP,yuP,zuP]=griddata(X(:,1),X(:,2),u_rel_err_P,linspace(0,15,100),linspace(0,5,100)','v4'); 
%%
[xvDNN,yvDNN,zvDNN]=griddata(X(:,1),X(:,2),v_rel_err_DNN,linspace(0,15,100),linspace(0,5,100)','v4'); 
[xvBNet,yvBNet,zvBNet]=griddata(X(:,1),X(:,2),v_rel_err_BN,linspace(0,15,100),linspace(0,5,100)','v4');
[xvP,yvP,zvP]=griddata(X(:,1),X(:,2),v_rel_err_P,linspace(0,15,100),linspace(0,5,100)','v4');

%%
subplot(4,3,1)
contourf(xuDNN,yuDNN,zuDNN)
subplot(4,3,2)
contourf(xuBNet,yuBNet,zuBNet)
subplot(4,3,3)
contourf(xuP,yuP,zuP)
subplot(4,3,4)
contourf(xvDNN,yvDNN,zvDNN)
subplot(4,3,5)
contourf(xvBNet,yvBNet,zvBNet)
subplot(4,3,6)
contourf(xvP,yvP,zvP)
subplot(4,3,7)
contourf(xpDNN,ypDNN,zpDNN)
subplot(4,3,8)
contourf(xpBNet,ypBNet,zpBNet)
subplot(4,3,9)
contourf(xpP,ypP,zpP)
subplot(4,3,10)
contourf(xphilDNN,yphilDNN,zphilDNN)
subplot(4,3,11)
contourf(xphilBNet,yphilBNet,zphilBNet)
subplot(4,3,12)
contourf(xphilP,yphilP,zphilP)

%%

% phierr_BN = abs(philpredBubbleNet-phil_);
% phierr_DNN = abs(philpredreal-phil_);
% phierr_P = abs(philerrorP);
% perr_BN = abs(ppredBubbleNet-p_);
% perr_DNN = abs(ppredreal-p_);
% perr_P = abs(perrorP);
% uerr_BN = abs(upredBubbleNet-u_);
% uerr_DNN = abs(upredreal-u_);
% uerr_P = abs(uerrorP);
% verr_BN = abs(vpredBubbleNet-v_);
% verr_DNN = abs(abs(sum(vpredreal))-abs(sum(v_)));
% verr_P = abs(verrorP);

phierr_BN = philpredBubbleNet-phil_;
phierr_DNN = philpredreal-phil_;
phierr_P = philerrorP;
perr_BN = ppredBubbleNet-p_;
perr_DNN = ppredreal-p_;
perr_P = perrorP;
uerr_BN = upredBubbleNet-u_;
uerr_DNN = upredreal-u_;
uerr_P = uerrorP;
verr_BN = vpredBubbleNet-v_;
verr_DNN = vpredreal-v_;
verr_P = verrorP;

%%
phierr_BN_1 = phierr_BN/phil_;
phierr_DNN_1 = phierr_DNN/phil_;
phierr_P_1 = phierr_P/phil_;
perr_BN_1 = perr_BN/p_;
perr_DNN_1 = perr_DNN/p_;
perr_P_1 = perr_P/p_;
uerr_BN_1 = uerr_BN/u_;
uerr_DNN_1 = uerr_DNN/u_;
uerr_P_1 = uerr_P/u_;
verr_BN_1 = verr_BN/v_;
verr_DNN_1 = verr_DNN/v_;
verr_P_1 = verr_P/v_;

%%
phierr_BN_1 = phierr_BN_1(:,759);
phierr_DNN_1 = phierr_DNN_1(:,759);
phierr_P_1 = phierr_P_1(:,759);
perr_BN_1 = perr_BN_1(:,2);
perr_DNN_1 = perr_DNN_1(:,2);
perr_P_1 = perr_P_1(:,2);
uerr_BN_1 = uerr_BN_1(:,917);
uerr_DNN_1 = uerr_DNN_1(:,917);
uerr_P_1 = uerr_P_1(:,917);
verr_BN_1 = verr_BN_1(:,747);
verr_DNN_1 = verr_DNN_1(:,747);
verr_P_1 = verr_P_1(:,747);

%%
phierr_BN_1 = mean(abs(phierr_BN_1));
phierr_DNN_1 = mean(abs(phierr_DNN_1));
phierr_P_1 = mean(abs(phierr_P_1));
perr_BN_1 = mean(abs(perr_BN_1));
perr_DNN_1 = mean(abs(perr_DNN_1));
perr_P_1 = mean(abs(perr_P_1));
uerr_BN_1 = mean(abs(uerr_BN_1));
uerr_DNN_1 = mean(abs(uerr_DNN_1));
uerr_P_1 = mean(abs(uerr_P_1));
verr_BN_1 = mean(abs(verr_BN_1));
verr_DNN_1 = mean(abs(verr_DNN_1));
verr_P_1 = mean(abs(verr_P_1));

%%
relatt_err = [uerr_DNN_1,uerr_BN_1,uerr_P_1;...
    verr_DNN_1,verr_BN_1,verr_P_1;...
    perr_DNN_1,perr_BN_1,perr_P_1;...
    phierr_DNN_1,phierr_BN_1,phierr_P_1];
%%
% rel_phi_DNN = sum(phierr_DNN)/sum(abs(phil_));
% rel_phi_BN = sum(phierr_BN)/sum(abs(phil_));
% rel_phi_P = sum(phierr_P)/sum(abs(phil_));
% rel_p_DNN = sum(perr_DNN)/sum(abs(p_));
% rel_p_BN = sum(perr_BN)/sum(abs(p_));
% rel_p_P = sum(perr_P)/sum(abs(p_));
% rel_u_DNN = sum(uerr_DNN)/sum(abs(u_));
% rel_u_BN = sum(uerr_BN)/sum(abs(u_));
% rel_u_P = sum(uerr_P)/sum(abs(u_));
% rel_v_DNN = sum(verr_DNN)/sum(abs(v_));
% rel_v_BN = sum(verr_BN)/sum(abs(v_));
% rel_v_P = sum(verr_P)/sum(abs(v_));

%%
% rel_phi_err=[rel_phi_DNN,rel_phi_BN,rel_phi_P];
% rel_u_err=[rel_u_DNN,rel_u_BN,rel_u_P];
% rel_v_err=[rel_v_DNN,rel_v_BN,rel_v_P];
set(0, 'defaultAxesTickLabelInterpreter','latex');