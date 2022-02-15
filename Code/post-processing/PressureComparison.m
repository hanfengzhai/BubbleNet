theta1=linspace(0,1,24182);theta2=linspace(0,1,2419);
singlep=singlep(:,1:2:end);Y1=singlep(:,51);
Y2=p(:,51);
Y3=ppredreal;Y4=ppredBubbleNet;Y5=ppredP;
Z1=ones(1,length(theta1));Z2=ones(1,length(theta2));
subplot(1,2,1)
plot3(4.*Z1,theta1,Y1, 3.*Z2,theta2,Y2, 2.*Z2,theta2,Y3, 1.*Z2,theta2,Y4, 0.*Z2,theta2,Y5)

%%
theca1m=linspace(0,1,75302);theca2m=linspace(0,1,3766);
p_star=p_star(:,1:30:end);Y1m=p_star(:,51);
Y2m=p(:,51);
Y3m=ppredDNN;Y4m=ppredBN;Y5m=ppredP;
Z1m=ones(1,length(theca1m));Z2m=ones(1,length(theca2m));
subplot(1,2,2)
plot3(4.*Z1m,theca1m,Y1m, 3.*Z2m,theca2m,Y2m, 2.*Z2m,theca2m,Y3m, 1.*Z2m,theca2m,Y4m, 0.*Z2m,theca2m,Y5m)
