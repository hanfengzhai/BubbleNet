% clear;clc
%%
% load("singlebubble.mat");
% load("singlebubbledata.mat");
% load("Xdata.mat");
load("singlebubble.mat");
% X = X_star([1:10:end],:);
% singlephi = phils([1:10:end],[1:30:end]);
%%
for i = 1:251
    count(i) = sum(singlephi(:,i)<=0.5);
    rate(i) = count(i)/24182;
end