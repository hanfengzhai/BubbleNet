nt1 = [num1(:,1)+num1(:,2)];
nt2 = [num2(:,1)+num2(:,2)];
nt3 = [num3(:,1)+num3(:,2)];
nt4 = [num4(:,1)+num4(:,2)];
nt5 = [num5(:,1)+num5(:,2)];
nt6 = [num6(:,1)+num6(:,2)];
nt7 = [num7(:,1)+num7(:,2)];
nt8 = [num8(:,1)+num8(:,2)];
nt9 = [num9(:,1)+num9(:,2)];
nt10 = [num10(:,1)+num10(:,2)];
%%

t1m = mean(rog1);t2m = mean(rog2);t3m = mean(rog3);
t4m = mean(rog4);t5m = mean(rog5);t6m = mean(rog6);
t7m = mean(rog7);t8m = mean(rog8);t9m = mean(rog9);
t10m = mean(rog10);

t1S = std(rog1);t2S = std(rog2);t3S = std(rog3);t4S = std(rog4);
t5S = std(rog5);t6S = std(rog6);t7S = std(rog7);
t8S = std(rog8);t9S = std(rog9);t10S = std(rog10);

%%
t1norm = (rog1-t1m)/t1S;t2norm = (rog2-t2m)/t2S;t3norm = (rog3-t3m)/t3S;
t4norm = (rog4-t4m)/t4S;t5norm = (rog5-t5m)/t5S;t6norm = (rog6-t6m)/t6S;
t7norm = (rog7-t7m)/t7S;t8norm = (rog8-t8m)/t8S;t9norm = (rog9-t9m)/t9S;
t10norm = (rog10-t10m)./t10S;

% Reverse
% n_pred*n1S + n1m

%%


test_input_1 = t1norm;
test_input_2 = t2norm;
test_input_3 = t3norm;
test_input_4 = t4norm;
test_input_5 = t5norm;
test_input_6 = t6norm;
test_input_7 = t7norm;
test_input_8 = t8norm;
test_input_9 = t9norm;
test_input_10 = t10norm;


%%


test1 = cell(201,1);
for i = 1:201
    test1{i} = test_input_1;
end

test2 = cell(201,1);
for i = 1:201
    test2{i} = test_input_2;
end

test3 = cell(201,1);
for i = 1:201
    test3{i} = test_input_3;
end

test4 = cell(201,1);
for i = 1:201
    test4{i} = test_input_4;
end

test5 = cell(201,1);
for i = 1:201
    test5{i} = test_input_5;
end

test6 = cell(201,1);
for i = 1:201
    test6{i} = test_input_6;
end

test7 = cell(201,1);
for i = 1:201
    test7{i} = test_input_7;
end

test8 = cell(201,1);
for i = 1:201
    test8{i} = test_input_8;
end

test9 = cell(201,1);
for i = 1:201
    test9{i} = test_input_9;
end

test10 = cell(201,1);
for i = 1:201
    test10{i} = test_input_10;
end

%%
test1 = test1';
test2 = test2';
test3 = test3';
test4 = test4';
test5 = test5';
test6 = test6';
test7 = test7';
test8 = test8';
test9 = test9';
test10 = test10';
%%
tes1 = cell2mat(test1);
tes2 = cell2mat(test2);
tes3 = cell2mat(test3);
tes4 = cell2mat(test4);
tes5 = cell2mat(test5);
tes6 = cell2mat(test6);
tes7 = cell2mat(test7);
tes8 = cell2mat(test8);
tes9 = cell2mat(test9);
tes10 = cell2mat(test10);

%%

testdat2 = [tes1';tes2';tes3';tes4';tes5';tes6';tes7';tes8';tes9';tes10'];
%%
n1m = mean(nt1);n2m = mean(nt2);n3m = mean(nt3);n4m = mean(nt4);n5m = mean(nt5);
n6m = mean(nt6);n7m = mean(nt7);n8m = mean(nt8);n9m = mean(nt9);n10m = mean(nt10);

n1S = std(nt1);n2S = std(nt2);n3S = std(nt3);n4S = std(nt4);n5S = std(nt5);
n6S = std(nt6);n7S = std(nt7);n8S = std(nt8);n9S = std(nt9);n10S = std(nt10);
%%

pred1 = sp_1*n1S + n1m;pred2 = sp_2*n2S + n2m;pred3 = sp_3*n3S + n3m;
pred4 = sp_4*n4S + n4m;pred5 = sp_5*n5S + n5m;pred6 = sp_6*n6S + n6m;
pred7 = sp_7*n7S + n7m;pred8 = sp_8*n8S + n8m;pred9 = sp_9*n9S + n9m;
pred10 = sp_10*n10S + n10m;
%%
n1norm = (nt1-n1m)/n1S;n2norm = (nt2-n2m)/n2S;n3norm = (nt3-n3m)/n3S;
n4norm = (nt4-n4m)/n4S;n5norm = (nt5-n5m)/n5S;n6norm = (nt6-n6m)/n6S;
n7norm = (nt7-n7m)/n7S;n8norm = (nt8-n8m)/n8S;n9norm = (nt9-n9m)/n9S;
n10norm = (nt10-n10m)/n10S;

% Reverse
% n_pred*n1S + n1m
%%

teoudat = [n1norm;n2norm;n3norm;n4norm;n5norm;...
    n6norm;n7norm;n8norm;n9norm;n10norm];

%%

u_test = testdat2;
s_test = teoudat;
%%
y_test = 0:200;
y_test = y_test';
y_test = [ y_test; y_test; y_test; y_test; y_test; y_test; y_test; y_test; y_test; y_test];

%%
plot(y_test(1:201),nt_1)
hold on
plot(y_test(1:201),nt_2);plot(y_test(1:201),nt_3);plot(y_test(1:201),nt_4);
plot(y_test(1:201),nt_5);plot(y_test(1:201),nt_6);plot(y_test(1:201),nt_7);
plot(y_test(1:201),nt_8);plot(y_test(1:201),nt_9);plot(y_test(1:201),nt_10);

%%

plot(y_test(1:201),pred1)
hold on
plot(y_test(1:201),pred2);plot(y_test(1:201),pred3);plot(y_test(1:201),pred4);
plot(y_test(1:201),pred5);plot(y_test(1:201),pred6);plot(y_test(1:201),pred7);
plot(y_test(1:201),pred8);plot(y_test(1:201),pred9);plot(y_test(1:201),pred10);

%%
figure()
err1 = pred1 - nt_1;err2 = pred2 - nt_2;err3 = pred3 - nt_3;
err4 = pred4 - nt_4;err5 = pred5 - nt_5;err6 = pred6 - nt_6;
err7 = pred7 - nt_7;err8 = pred8 - nt_8;err9 = pred9 - nt_9;
err10 = pred10 - nt_10;

%%

rel_err1 = err1/nt1;rel_err2 = err2/nt2;rel_err3 = err3/nt3;
rel_err4 = err4/nt4;rel_err5 = err5/nt5;rel_err6 = err6/nt6;
rel_err7 = err7/nt7;rel_err8 = err8/nt8;rel_err9 = err9/nt9;
rel_err10 = err10/nt10;

%%
rel_err1 = rel_err1(:,1);rel_err2 = rel_err2(:,1);
rel_err3 = rel_err3(:,1);rel_err4 = rel_err4(:,1);
rel_err5 = rel_err5(:,1);rel_err6 = rel_err6(:,1);
rel_err7 = rel_err7(:,1);rel_err8 = rel_err8(:,1);
rel_err9 = rel_err9(:,1);rel_err10 = rel_err10(:,1);


%%
plot(y_test(1:201),err1)
hold on
plot(y_test(1:201),err2);plot(y_test(1:201),err3);plot(y_test(1:201),err4);
plot(y_test(1:201),err5);plot(y_test(1:201),err6);plot(y_test(1:201),err7);
plot(y_test(1:201),err8);plot(y_test(1:201),err8);plot(y_test(1:201),err9);
%%

figure
plot(y_test(1:201),rel_err1)
hold on
plot(y_test(1:201),rel_err2);plot(y_test(1:201),rel_err3);plot(y_test(1:201),rel_err4);
plot(y_test(1:201),rel_err5);plot(y_test(1:201),rel_err6);plot(y_test(1:201),rel_err7);
plot(y_test(1:201),rel_err8);plot(y_test(1:201),rel_err8);plot(y_test(1:201),rel_err9);
