clear;clc;
load('MultiBubbleData_TDN.mat')
%%


test_input_1_u = u(:,1);test_input_2_u = u(:,5);test_input_3_u = u(:,10);
test_input_4_u = u(:,15);test_input_5_u = u(:,20);test_input_6_u = u(:,25);
test_input_7_u = u(:,30);test_input_8_u = u(:,35);test_input_9_u = u(:,40);
test_input_10_u = u(:,45);test_input_11_u = u(:,50);test_input_12_u = u(:,55);
test_input_13_u = u(:,60);test_input_14_u = u(:,65);test_input_15_u = u(:,70);
test_input_16_u = u(:,75);test_input_17_u = u(:,80);test_input_18_u = u(:,85);
test_input_19_u = u(:,90);test_input_20_u = u(:,95);test_input_21_u = u(:,100);

test_input_1_v = v(:,1);test_input_2_v = v(:,5);test_input_3_v = v(:,10);
test_input_4_v = v(:,15);test_input_5_v = v(:,20);test_input_6_v = v(:,25);
test_input_7_v = v(:,30);test_input_8_v = v(:,35);test_input_9_v = v(:,40);
test_input_10_v = v(:,45);test_input_11_v = v(:,50);test_input_12_v = v(:,55);
test_input_13_v = v(:,60);test_input_14_v = v(:,65);test_input_15_v = v(:,70);
test_input_16_v = v(:,75);test_input_17_v = v(:,80);test_input_18_v = v(:,85);
test_input_19_v = v(:,90);test_input_20_v = v(:,95);test_input_21_v = v(:,100);

%%

test1_u = cell(3766,1);
for i = 1:3766
    test1_u{i} = test_input_1_u;
end

test2_u = cell(3766,1);
for i = 1:3766
    test2_u{i} = test_input_2_u;
end

test3_u = cell(3766,1);
for i = 1:3766
    test3_u{i} = test_input_3_u;
end

test4_u = cell(3766,1);
for i = 1:3766
    test4_u{i} = test_input_4_u;
end

test5_u = cell(3766,1);
for i = 1:3766
    test5_u{i} = test_input_5_u;
end

test6_u = cell(3766,1);
for i = 1:3766
    test6_u{i} = test_input_6_u;
end

test7_u = cell(3766,1);
for i = 1:3766
    test7_u{i} = test_input_7_u;
end

test8_u = cell(3766,1);
for i = 1:3766
    test8_u{i} = test_input_8_u;
end

test9_u = cell(3766,1);
for i = 1:3766
    test9_u{i} = test_input_9_u;
end

test10_u = cell(3766,1);
for i = 1:3766
    test10_u{i} = test_input_10_u;
end

test11_u = cell(3766,1);
for i = 1:3766
    test11_u{i} = test_input_11_u;
end

test12_u = cell(3766,1);
for i = 1:3766
    test12_u{i} = test_input_12_u;
end

test13_u = cell(3766,1);
for i = 1:3766
    test13_u{i} = test_input_13_u;
end

test14_u = cell(3766,1);
for i = 1:3766
    test14_u{i} = test_input_14_u;
end

test15_u = cell(3766,1);
for i = 1:3766
    test15_u{i} = test_input_15_u;
end

test16_u = cell(3766,1);
for i = 1:3766
    test16_u{i} = test_input_16_u;
end

test17_u = cell(3766,1);
for i = 1:3766
    test17_u{i} = test_input_17_u;
end

test18_u = cell(3766,1);
for i = 1:3766
    test18_u{i} = test_input_18_u;
end

test19_u = cell(3766,1);
for i = 1:3766
    test19_u{i} = test_input_19_u;
end

test20_u = cell(3766,1);
for i = 1:3766
    test20_u{i} = test_input_20_u;
end

test21_u = cell(3766,1);
for i = 1:3766
    test21_u{i} = test_input_21_u;
end

test1_v = cell(3766,1);
for i = 1:3766
    test1_v{i} = test_input_1_v;
end

test2_v = cell(3766,1);
for i = 1:3766
    test2_v{i} = test_input_2_v;
end

test3_v = cell(3766,1);
for i = 1:3766
    test3_v{i} = test_input_3_v;
end

test4_v = cell(3766,1);
for i = 1:3766
    test4_v{i} = test_input_4_v;
end

test5_v = cell(3766,1);
for i = 1:3766
    test5_v{i} = test_input_5_v;
end

test6_v = cell(3766,1);
for i = 1:3766
    test6_v{i} = test_input_6_v;
end

test7_v = cell(3766,1);
for i = 1:3766
    test7_v{i} = test_input_7_v;
end

test8_v = cell(3766,1);
for i = 1:3766
    test8_v{i} = test_input_8_v;
end

test9_v = cell(3766,1);
for i = 1:3766
    test9_v{i} = test_input_9_v;
end

test10_v = cell(3766,1);
for i = 1:3766
    test10_v{i} = test_input_10_v;
end

test11_v = cell(3766,1);
for i = 1:3766
    test11_v{i} = test_input_11_v;
end

test12_v = cell(3766,1);
for i = 1:3766
    test12_v{i} = test_input_12_v;
end

test13_v = cell(3766,1);
for i = 1:3766
    test13_v{i} = test_input_13_v;
end

test14_v = cell(3766,1);
for i = 1:3766
    test14_v{i} = test_input_14_v;
end

test15_v = cell(3766,1);
for i = 1:3766
    test15_v{i} = test_input_15_v;
end

test16_v = cell(3766,1);
for i = 1:3766
    test16_v{i} = test_input_16_v;
end

test17_v = cell(3766,1);
for i = 1:3766
    test17_v{i} = test_input_17_v;
end

test18_v = cell(3766,1);
for i = 1:3766
    test18_v{i} = test_input_18_v;
end

test19_v = cell(3766,1);
for i = 1:3766
    test19_v{i} = test_input_19_v;
end

test20_v = cell(3766,1);
for i = 1:3766
    test20_v{i} = test_input_20_v;
end

test21_v = cell(3766,1);
for i = 1:3766
    test21_v{i} = test_input_21_v;
end
%%
test1_u = test1_u';test11_u = test11_u';
test2_u = test2_u';test12_u = test12_u';
test3_u = test3_u';test13_u = test13_u';
test4_u = test4_u';test14_u = test14_u';
test5_u = test5_u';test15_u = test15_u';
test6_u = test6_u';test16_u = test16_u';
test7_u = test7_u';test17_u = test17_u';
test8_u = test8_u';test18_u = test18_u';
test9_u = test9_u';test19_u = test19_u';
test10_u = test10_u';test20_u = test20_u';
test21_u = test21_u';
test1_v= test1_v';test11_v= test11_v';
test2_v= test2_v';test12_v= test12_v';
test3_v= test3_v';test13_v= test13_v';
test4_v= test4_v';test14_v= test14_v';
test5_v= test5_v';test15_v= test15_v';
test6_v= test6_v';test16_v= test16_v';
test7_v= test7_v';test17_v= test17_v';
test8_v= test8_v';test18_v= test18_v';
test9_v= test9_v';test19_v= test19_v';
test10_v= test10_v';test20_v= test20_v';
test21_v= test21_v';
%%
tes1_u = cell2mat(test1_u);tes11_u = cell2mat(test11_u);
tes2_u = cell2mat(test2_u);tes12_u = cell2mat(test12_u);
tes3_u = cell2mat(test3_u);tes13_u = cell2mat(test13_u);
tes4_u = cell2mat(test4_u);tes14_u = cell2mat(test14_u);
tes5_u = cell2mat(test5_u);tes15_u = cell2mat(test15_u);
tes6_u = cell2mat(test6_u);tes16_u = cell2mat(test16_u);
tes7_u = cell2mat(test7_u);tes17_u = cell2mat(test17_u);
tes8_u = cell2mat(test8_u);tes18_u = cell2mat(test18_u);
tes9_u = cell2mat(test9_u);tes19_u = cell2mat(test19_u);
tes10_u = cell2mat(test10_u);tes20_u = cell2mat(test20_u);
tes21_u = cell2mat(test21_u);
tes1_v = cell2mat(test1_v);tes11_v = cell2mat(test11_v);
tes2_v = cell2mat(test2_v);tes12_v = cell2mat(test12_v);
tes3_v = cell2mat(test3_v);tes13_v = cell2mat(test13_v);
tes4_v = cell2mat(test4_v);tes14_v = cell2mat(test14_v);
tes5_v = cell2mat(test5_v);tes15_v = cell2mat(test15_v);
tes6_v = cell2mat(test6_v);tes16_v = cell2mat(test16_v);
tes7_v = cell2mat(test7_v);tes17_v = cell2mat(test17_v);
tes8_v = cell2mat(test8_v);tes18_v = cell2mat(test18_v);
tes9_v = cell2mat(test9_v);tes19_v = cell2mat(test19_v);
tes10_v = cell2mat(test10_v);tes20_v = cell2mat(test20_v);
tes21_v = cell2mat(test21_v);
%%

input_u = [tes1_u';tes2_u';tes3_u';tes4_u';tes5_u';tes6_u';tes7_u';...
    tes8_u';tes9_u';tes10_u';tes11_u';tes12_u';tes13_u';tes14_u';...
    tes15_u';tes16_u';tes17_u';tes18_u';tes19_u';tes20_u';tes21_u'];

input_v = [tes1_v';tes2_v';tes3_v';tes4_v';tes5_v';tes6_v';tes7_v';...
    tes8_v';tes9_v';tes10_v';tes11_v';tes12_v';tes13_v';tes14_v';...
    tes15_v';tes16_v';tes17_v';tes18_v';tes19_v';tes20_v';tes21_v'];

input = [[tes1_u'; tes1_v'];[tes2_u'; tes2_v'];[tes3_u'; tes3_v'];...
    [tes4_u'; tes4_v']; [tes5_u'; tes5_v']; [tes6_u'; tes6_v'];...
    [tes7_u'; tes7_v']; [tes8_u'; tes8_v']; [tes9_u'; tes9_v'];...
    [tes10_u'; tes10_v'];[tes11_u'; tes11_v'];[tes12_u'; tes12_v'];...
    [tes13_u'; tes13_v'];[tes14_u'; tes14_v'];[tes15_u'; tes15_v'];...
    [tes16_u'; tes16_v'];[tes17_u'; tes17_v'];[tes18_u'; tes18_v'];...
    [tes19_u'; tes19_v'];[tes20_u'; tes20_v'];[tes21_u'; tes21_v']];

% input = [[tes1_u' tes1_v'];[tes2_u' tes2_v'];[tes3_u' tes3_v'];...
%     [tes4_u' tes4_v']; [tes5_u' tes5_v']; [tes6_u' tes6_v'];...
%     [tes7_u' tes7_v']; [tes8_u' tes8_v']; [tes9_u' tes9_v'];...
%     [tes10_u' tes10_v'];[tes11_u' tes11_v'];[tes12_u' tes12_v'];...
%     [tes13_u' tes13_v'];[tes14_u' tes14_v'];[tes15_u' tes15_v'];...
%     [tes16_u' tes16_v'];[tes17_u' tes17_v'];[tes18_u' tes18_v'];...
%     [tes19_u' tes19_v'];[tes20_u' tes20_v'];[tes21_u' tes21_v']];
%%
output_p = [p(:,1);p(:,5);p(:,10);p(:,15);p(:,20);p(:,25);...
    p(:,30);p(:,35);p(:,40);p(:,45);p(:,50);p(:,55);...
    p(:,60);p(:,65);p(:,70);p(:,75);p(:,80);p(:,85);...
    p(:,90);p(:,95);p(:,100)];%output_p = output_p';
output_phil = [phil(:,1);phil(:,5);phil(:,10);phil(:,15);phil(:,20);phil(:,25);...
    phil(:,30);phil(:,35);phil(:,40);phil(:,45);phil(:,50);phil(:,55);...
    phil(:,60);phil(:,65);phil(:,70);phil(:,75);phil(:,80);phil(:,85);...
    phil(:,90);phil(:,95);phil(:,100)];%output_phil = output_phil';
% output = [[p(:,1) phil(:,1)]; [p(:,5) phil(:,5)]; [p(:,10) phil(:,10)];...
%     [p(:,15) phil(:,15)]; [p(:,20) phil(:,20)]; [p(:,25) phil(:,25)];...
%     [p(:,30) phil(:,30)]; [p(:,35) phil(:,35)]; [p(:,40) phil(:,40)];...
%     [p(:,45) phil(:,45)]; [p(:,50) phil(:,50)]; [p(:,55) phil(:,55)];...
%     [p(:,60) phil(:,60)]; [p(:,65) phil(:,65)]; [p(:,70) phil(:,70)];...
%     [p(:,75) phil(:,75)]; [p(:,80) phil(:,80)]; [p(:,85) phil(:,85)];...
%     [p(:,90) phil(:,90)]; [p(:,95) phil(:,95)]; [p(:,100) phil(:,100)]];

output = [[p(:,1);phil(:,1)]; [p(:,5);phil(:,5)]; [p(:,10);phil(:,10)];...
    [p(:,15);phil(:,15)]; [p(:,20);phil(:,20)]; [p(:,25);phil(:,25)];...
    [p(:,30);phil(:,30)]; [p(:,35);phil(:,35)]; [p(:,40);phil(:,40)];...
    [p(:,45);phil(:,45)]; [p(:,50);phil(:,50)]; [p(:,55);phil(:,55)];...
    [p(:,60);phil(:,60)]; [p(:,65);phil(:,65)]; [p(:,70);phil(:,70)];...
    [p(:,75);phil(:,75)]; [p(:,80);phil(:,80)]; [p(:,85);phil(:,85)];...
    [p(:,90);phil(:,90)]; [p(:,95);phil(:,95)]; [p(:,100);phil(:,100)]];

%%

u_test = input;% [input_u; input_v];
s_test = output;%[output_p output_phil];
%%
y_test = X_star(:,1:2)';% X_star(:,2)];
y_test = y_test';
y_test = [[y_test(:,1); y_test(:,2)]; [y_test(:,1); y_test(:,2)]; [y_test(:,1); y_test(:,2)]; ...
    [y_test(:,1); y_test(:,2)]; [y_test(:,1); y_test(:,2)]; [y_test(:,1); y_test(:,2)]; ...
    [y_test(:,1); y_test(:,2)]; [y_test(:,1); y_test(:,2)]; [y_test(:,1); y_test(:,2)]; ...
    [y_test(:,1); y_test(:,2)]; [y_test(:,1); y_test(:,2)]; [y_test(:,1); y_test(:,2)]; ...
    [y_test(:,1); y_test(:,2)]; [y_test(:,1); y_test(:,2)]; [y_test(:,1); y_test(:,2)]; ...
    [y_test(:,1); y_test(:,2)]; [y_test(:,1); y_test(:,2)]; [y_test(:,1); y_test(:,2)]; ...
    [y_test(:,1); y_test(:,2)]; [y_test(:,1); y_test(:,2)]; [y_test(:,1); y_test(:,2)]];

%%