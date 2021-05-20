u = singleu([1:10:end],[1:2:end]);
v = singlev([1:10:end],[1:2:end]);
p = singlep([1:10:end],[1:2:end]);
phil = singlephi([1:10:end],[1:2:end]);

%load data for training
%%
for i = 1:101
    u1(:,i) = (u(:,i))/max(u(:,i));
    v1(:,i) = (v(:,i))/max(v(:,i));
    p1(:,i) = (p(:,i))/max(p(:,i));
    phil1(:,i) = (phil(:,i))/max(phil(:,i));
end

singleu = singleu([1:10:end],[1:2:end]);
singlev = singlev([1:10:end],[1:2:end]);
singlep = singlep([1:10:end],[1:2:end]);
singlephi = singlephi([1:10:end],[1:2:end]);
%%

% 

X = X([1:10:end],:);