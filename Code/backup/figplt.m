[xu, yu, zu]=griddata(X(:,1),X(:,2),u(:,1),linspace(0,15,100),linspace(0,5,100)','v4');
[xv, yv, zv]=griddata(X(:,1),X(:,2),v(:,1),linspace(0,15,100),linspace(0,5,100)','v4'); 
[xp, yp, zp]=griddata(X(:,1),X(:,2),p(:,1),linspace(0,15,100),linspace(0,5,100)','v4'); 
[xphi, yphi, zphi]=griddata(X(:,1),X(:,2),phil(:,1),linspace(0,15,100),linspace(0,5,100)','v4');
%%
subplot(2,2,1)
contourf(xu, yu, zu);
subplot(2,2,2)
contourf(xv, yv, zv);
subplot(2,2,3)
contourf(xp, yp, zp);
subplot(2,2,4)
contourf(xphi, yphi, zphi);



