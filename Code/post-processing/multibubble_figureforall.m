[xu,yu,zu]=griddata(X(:,1),X(:,2),u(:,50),linspace(-50,50,100),linspace(0,50,100)','v4');
[xv,yv,zv]=griddata(X(:,1),X(:,2),v(:,50),linspace(-50,50,100),linspace(0,50,100)','v4'); 
[xp,yp,zp]=griddata(X(:,1),X(:,2),p(:,50),linspace(-50,50,100),linspace(0,50,100)','v4'); 
[xf,yf,zf]=griddata(X(:,1),X(:,2),phil(:,50),linspace(-50,50,100),linspace(0,50,100)','v4');
[xu_DNN,yu_DNN,zu_DNN]=griddata(X(:,1),X(:,2),upredDNN,linspace(-50,50,100),linspace(0,50,100)','v4');
[xv_DNN,yv_DNN,zv_DNN]=griddata(X(:,1),X(:,2),vpredDNN,linspace(-50,50,100),linspace(0,50,100)','v4'); 
[xp_DNN,yp_DNN,zp_DNN]=griddata(X(:,1),X(:,2),ppredDNN,linspace(-50,50,100),linspace(0,50,100)','v4'); 
[xf_DNN,yf_DNN,zf_DNN]=griddata(X(:,1),X(:,2),philpredDNN,linspace(-50,50,100),linspace(0,50,100)','v4');
[xu_BN,yu_BN,zu_BN]=griddata(X(:,1),X(:,2),upredBN,linspace(-50,50,100),linspace(0,50,100)','v4');
[xv_BN,yv_BN,zv_BN]=griddata(X(:,1),X(:,2),vpredBN,linspace(-50,50,100),linspace(0,50,100)','v4'); 
[xp_BN,yp_BN,zp_BN]=griddata(X(:,1),X(:,2),ppredBN,linspace(-50,50,100),linspace(0,50,100)','v4'); 
[xf_BN,yf_BN,zf_BN]=griddata(X(:,1),X(:,2),philpredBN,linspace(-50,50,100),linspace(0,50,100)','v4');
%%
[xu_P,yu_P,zu_P]=griddata(X(:,1),X(:,2),upredP,linspace(-50,50,100),linspace(0,50,100)','v4');
[xv_P,yv_P,zv_P]=griddata(X(:,1),X(:,2),vpredP,linspace(-50,50,100),linspace(0,50,100)','v4'); 
[xp_P,yp_P,zp_P]=griddata(X(:,1),X(:,2),ppredP,linspace(-50,50,100),linspace(0,50,100)','v4'); 
[xf_P,yf_P,zf_P]=griddata(X(:,1),X(:,2),philpredP,linspace(-50,50,100),linspace(0,50,100)','v4');
%%
subplot(4,4,1);contourf(xu,yu,zu);
subplot(4,4,5);contourf(xv,yv,zv);
subplot(4,4,9);contourf(xp,yp,zp);
subplot(4,4,13);contourf(xf,yf,zf);
subplot(4,4,2);contourf(xu_DNN,yu_DNN,zu_DNN);
subplot(4,4,6);contourf(xv_DNN,yv_DNN,zv_DNN);
subplot(4,4,10);contourf(xp_DNN,yp_DNN,zp_DNN);
subplot(4,4,14);contourf(xf_DNN,yf_DNN,zf_DNN);
subplot(4,4,3);contourf(xu_BN,yu_BN,zu_BN);
subplot(4,4,7);contourf(xv_BN,yv_BN,zv_BN);
subplot(4,4,11);contourf(xp_BN,yp_BN,zp_BN);
subplot(4,4,15);contourf(xf_BN,yf_BN,zf_BN);
%%
subplot(4,4,4);contourf(xu_P,yu_P,zu_P);
subplot(4,4,8);contourf(xv_P,yv_P,zv_P);
subplot(4,4,12);contourf(xp_P,yp_P,zp_P);
subplot(4,4,16);contourf(xf_P,yf_P,zf_P);
%%
u_DNN_err = abs(u(:,51) - upredDNN);
v_DNN_err = abs(v(:,51) - vpredDNN);
p_DNN_err = abs(p(:,51) - ppredDNN);
f_DNN_err = abs(phil(:,51) - philpredDNN);
u_BN_err = abs(u(:,51) - upredBN);
v_BN_err = abs(v(:,51) - vpredBN);
p_BN_err = abs(p(:,51) - ppredBN);
f_BN_err = abs(phil(:,51) - philpredBN);
u_P_err = abs(u(:,51) - upredP);
v_P_err = abs(v(:,51) - vpredP);
p_P_err = abs(p(:,51) - ppredP);
f_P_err = abs(phil(:,51) - philpredP);
%%
[xu_BN_err,yu_BN_err,zu_BN_err]=griddata(X(:,1),X(:,2),u_DNN_err,linspace(-50,50,100),linspace(0,50,100)','v4');
[xv_BN_err,yv_BN_err,zv_BN_err]=griddata(X(:,1),X(:,2),v_DNN_err,linspace(-50,50,100),linspace(0,50,100)','v4'); 
[xp_BN_err,yp_BN_err,zp_BN_err]=griddata(X(:,1),X(:,2),p_DNN_err,linspace(-50,50,100),linspace(0,50,100)','v4'); 
[xf_BN_err,yf_BN_err,zf_BN_err]=griddata(X(:,1),X(:,2),f_DNN_err,linspace(-50,50,100),linspace(0,50,100)','v4');
[xu_DNN_err,yu_DNN_err,zu_DNN_err]=griddata(X(:,1),X(:,2),u_BN_err,linspace(-50,50,100),linspace(0,50,100)','v4');
[xv_DNN_err,yv_DNN_err,zv_DNN_err]=griddata(X(:,1),X(:,2),v_BN_err,linspace(-50,50,100),linspace(0,50,100)','v4'); 
[xp_DNN_err,yp_DNN_err,zp_DNN_err]=griddata(X(:,1),X(:,2),p_BN_err,linspace(-50,50,100),linspace(0,50,100)','v4'); 
[xf_DNN_err,yf_DNN_err,zf_DNN_err]=griddata(X(:,1),X(:,2),f_BN_err,linspace(-50,50,100),linspace(0,50,100)','v4');
[xu_P_err,yu_P_err,zu_P_err]=griddata(X(:,1),X(:,2),u_P_err,linspace(-50,50,100),linspace(0,50,100)','v4');
[xv_P_err,yv_P_err,zv_P_err]=griddata(X(:,1),X(:,2),v_P_err,linspace(-50,50,100),linspace(0,50,100)','v4'); 
[xp_P_err,yp_P_err,zp_P_err]=griddata(X(:,1),X(:,2),p_P_err,linspace(-50,50,100),linspace(0,50,100)','v4'); 
[xf_P_err,yf_P_err,zf_P_err]=griddata(X(:,1),X(:,2),f_P_err,linspace(-50,50,100),linspace(0,50,100)','v4');

%%
subplot(4,3,2);contourf(xu_DNN_err,yu_DNN_err,zu_DNN_err);
subplot(4,3,5);contourf(xv_DNN_err,yv_DNN_err,zv_DNN_err);
subplot(4,3,8);contourf(xp_DNN_err,yp_DNN_err,zp_DNN_err);
subplot(4,3,11);contourf(xf_DNN_err,yf_DNN_err,zf_DNN_err);
subplot(4,3,1);contourf(xu_BN_err,yu_BN_err,zu_BN_err);
subplot(4,3,4);contourf(xv_BN_err,yv_BN_err,zv_BN_err);
subplot(4,3,7);contourf(xp_BN_err,yp_BN_err,zp_BN_err);
subplot(4,3,10);contourf(xf_BN_err,yf_BN_err,zf_BN_err);
subplot(4,3,3);contourf(xu_P_err,yu_P_err,zu_P_err);
subplot(4,3,6);contourf(xv_P_err,yv_P_err,zv_P_err);
subplot(4,3,9);contourf(xp_P_err,yp_P_err,zp_P_err);
subplot(4,3,12);contourf(xf_P_err,yf_P_err,zf_P_err);

%%

[xu_BN_err,yu_BN_err,zu_BN_err]=griddata(X(:,1),X(:,2),log(u_DNN_err),linspace(-50,50,100),linspace(0,50,100)','v4');
[xv_BN_err,yv_BN_err,zv_BN_err]=griddata(X(:,1),X(:,2),log(v_DNN_err),linspace(-50,50,100),linspace(0,50,100)','v4'); 
[xp_BN_err,yp_BN_err,zp_BN_err]=griddata(X(:,1),X(:,2),log(p_DNN_err),linspace(-50,50,100),linspace(0,50,100)','v4'); 
[xf_BN_err,yf_BN_err,zf_BN_err]=griddata(X(:,1),X(:,2),log(f_DNN_err),linspace(-50,50,100),linspace(0,50,100)','v4');
[xu_DNN_err,yu_DNN_err,zu_DNN_err]=griddata(X(:,1),X(:,2),log(u_BN_err),linspace(-50,50,100),linspace(0,50,100)','v4');
[xv_DNN_err,yv_DNN_err,zv_DNN_err]=griddata(X(:,1),X(:,2),log(v_BN_err),linspace(-50,50,100),linspace(0,50,100)','v4'); 
[xp_DNN_err,yp_DNN_err,zp_DNN_err]=griddata(X(:,1),X(:,2),log(p_BN_err),linspace(-50,50,100),linspace(0,50,100)','v4'); 
[xf_DNN_err,yf_DNN_err,zf_DNN_err]=griddata(X(:,1),X(:,2),log(f_BN_err),linspace(-50,50,100),linspace(0,50,100)','v4');
[xu_P_err,yu_P_err,zu_P_err]=griddata(X(:,1),X(:,2),log(u_P_err),linspace(-50,50,100),linspace(0,50,100)','v4');
[xv_P_err,yv_P_err,zv_P_err]=griddata(X(:,1),X(:,2),log(v_P_err),linspace(-50,50,100),linspace(0,50,100)','v4'); 
[xp_P_err,yp_P_err,zp_P_err]=griddata(X(:,1),X(:,2),log(p_P_err),linspace(-50,50,100),linspace(0,50,100)','v4'); 
[xf_P_err,yf_P_err,zf_P_err]=griddata(X(:,1),X(:,2),log(f_P_err),linspace(-50,50,100),linspace(0,50,100)','v4');
