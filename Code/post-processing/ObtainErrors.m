mean(u_DNN_err)
mean(u_BN_err)
mean(u_P_err)
mean(v_DNN_err)
mean(v_BN_err)
mean(v_P_err)
mean(p_DNN_err)
mean(p_BN_err)
mean(p_P_err)
mean(f_DNN_err)
mean(f_BN_err)
mean(f_P_err)
%% single bubble case
a1 = mean(abs(u_ - upredreal));
a2 = mean(abs(u_ - upredBubbleNet));
a3 = mean(abs(u_ - uP));
b1 = mean(abs(v_ - vpredreal));
b2 = mean(abs(v_ - vpredBubbleNet));
b3 = mean(abs(v_ - vP));
c1 = mean(abs(p_ - ppredreal));
c2 = mean(abs(p_ - ppredBubbleNet));
c3 = mean(abs(p_ - pP));
d1 = mean(abs(phil_ - philpredreal));
d2 = mean(abs(phil_ - philpredBubbleNet));
d3 = mean(abs(phil_ - philP));
single_error = [a1,b1,c1,d1; a2,b2,c2,d2; a3,b3,c3,d3];