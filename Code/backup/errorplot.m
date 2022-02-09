%%
[xpDNN,ypDNN,zpDNN]=griddata(X(:,1),X(:,2),abs(perror),linspace(0,15,100),linspace(0,5,100)','v4');
[xpBNet,ypBNet,zpBNet]=griddata(X(:,1),X(:,2),abs(perrorPhysNet),linspace(0,15,100),linspace(0,5,100)','v4'); 
[xphilDNN,yphilDNN,zphilDNN]=griddata(X(:,1),X(:,2),abs(philerror),linspace(0,15,100),linspace(0,5,100)','v4'); 
[xphilBNet,yphilBNet,zphilBNet]=griddata(X(:,1),X(:,2),abs(philerrorPhysNet),linspace(0,15,100),linspace(0,5,100)','v4');
[xuDNN,yuDNN,zuDNN]=griddata(X(:,1),X(:,2),abs(uerror),linspace(0,15,100),linspace(0,5,100)','v4');
[xuBNet,yuBNet,zuBNet]=griddata(X(:,1),X(:,2),abs(uerrorPhysNet),linspace(0,15,100),linspace(0,5,100)','v4'); 
[xvDNN,yvDNN,zvDNN]=griddata(X(:,1),X(:,2),abs(verror),linspace(0,15,100),linspace(0,5,100)','v4'); 
[xvBNet,yvBNet,zvBNet]=griddata(X(:,1),X(:,2),abs(verrorPhysNet),linspace(0,15,100),linspace(0,5,100)','v4');

%%
[xpDNNabs,ypDNNabs,zpDNNabs]=griddata(X(:,1),X(:,2),perrorabsDNN,linspace(0,15,100),linspace(0,5,100)','v4');
[xpBNetabs,ypBNetabs,zpBNetabs]=griddata(X(:,1),X(:,2),perrorabsBubbleNet,linspace(0,15,100),linspace(0,5,100)','v4'); 
[xphilDNNabs,yphilDNNabs,zphilDNNabs]=griddata(X(:,1),X(:,2),philerrorabsDNN,linspace(0,15,100),linspace(0,5,100)','v4'); 
[xphilBNetabs,yphilBNetabs,zphilBNetabs]=griddata(X(:,1),X(:,2),philerrorabsBubbleNet,linspace(0,15,100),linspace(0,5,100)','v4');
[xuDNNabs,yuDNNabs,zuDNNabs]=griddata(X(:,1),X(:,2),uerrorabsDNN,linspace(0,15,100),linspace(0,5,100)','v4');
[xuBNetabs,yuBNetabs,zuBNetabs]=griddata(X(:,1),X(:,2),uerrorabsBubbleNet,linspace(0,15,100),linspace(0,5,100)','v4'); 
[xvDNNabs,yvDNNabs,zvDNNabs]=griddata(X(:,1),X(:,2),verrorabsDNN,linspace(0,15,100),linspace(0,5,100)','v4'); 
[xvBNetabs,yvBNetabs,zvBNetabs]=griddata(X(:,1),X(:,2),verrorabsBubbleNet,linspace(0,15,100),linspace(0,5,100)','v4');
%%
contourf(xpDNN,ypDNN,zpDNN)
figure
contourf(xpBNet,ypBNet,zpBNet)
figure
contourf(xphilDNN,yphilDNN,zphilDNN)
figure
contourf(xphilBNet,yphilBNet,zphilBNet)
figure
contourf(xuDNN,yuDNN,zuDNN)
figure
contourf(xuBNet,yuBNet,zuBNet)
figure
contourf(xvDNN,yvDNN,zvDNN)
figure
contourf(xvBNet,yvBNet,zvBNet)

%%

[xpDNN,ypDNN,zpDNN]=griddata(X(:,1),X(:,2),abs(perrorsys),linspace(-50,50,100),linspace(0,50,100)','v4');
[xpBNet,ypBNet,zpBNet]=griddata(X(:,1),X(:,2),abs(perrorPhysNetsys),linspace(-50,50,100),linspace(0,50,100)','v4'); 
[xphilDNN,yphilDNN,zphilDNN]=griddata(X(:,1),X(:,2),abs(philerrorsys),linspace(-50,50,100),linspace(0,50,100)','v4'); 
[xphilBNet,yphilBNet,zphilBNet]=griddata(X(:,1),X(:,2),abs(philerrorPhysNetsys),linspace(-50,50,100),linspace(0,50,100)','v4');
[xuDNN,yuDNN,zuDNN]=griddata(X(:,1),X(:,2),abs(uerrorsys),linspace(-50,50,100),linspace(0,50,100)','v4');
[xuBNet,yuBNet,zuBNet]=griddata(X(:,1),X(:,2),abs(uerrorPhysNetsys),linspace(-50,50,100),linspace(0,50,100)','v4'); 
[xvDNN,yvDNN,zvDNN]=griddata(X(:,1),X(:,2),abs(verrorsys),linspace(-50,50,100),linspace(0,50,100)','v4'); 
[xvBNet,yvBNet,zvBNet]=griddata(X(:,1),X(:,2),abs(verrorPhysNetsys),linspace(-50,50,100),linspace(0,50,100)','v4');


%%
figure
subplot(2,1,1)
plot(uerrorsys);hold on;plot(uerrorPhysNetsys);
subplot(2,1,2)
plot(uerrorsys);hold on;plot(uerrorPhysNetsys);
figure
subplot(2,1,1)
plot(verrorsys);hold on;plot(verrorPhysNetsys);
subplot(2,1,2)
plot(verrorsys);hold on;plot(verrorPhysNetsys);
figure
subplot(2,1,1)
plot(perrorsys);hold on;plot(perrorPhysNetsys);
subplot(2,1,2)
plot(perrorsys);hold on;plot(perrorPhysNetsys);
figure
subplot(2,1,1)
plot(philerrorsys);hold on;plot(philerrorPhysNetsys);
subplot(2,1,2)
plot(philerrorsys);hold on;plot(philerrorPhysNetsys);

%%
% 
% [xu,yu,zu]=griddata(X(:,1),X(:,2),(abs(uerrorPhysNet)/abs(u()),linspace(0,15,100),linspace(0,5,100)','v4');
% [xv,yv,zv]=griddata(X(:,1),X(:,2),abs(verrorPhysNet),linspace(0,15,100),linspace(0,5,100)','v4'); 
% [xp,yp,zp]=griddata(X(:,1),X(:,2),abs(perrorPhysNet),linspace(0,15,100),linspace(0,5,100)','v4'); 
% [xphi,yphi,zphi]=griddata(X(:,1),X(:,2),abs(philerrorPhysNet),linspace(0,15,100),linspace(0,5,100)','v4');

