u_ = u(:,50);
v_ = v(:,50);
p_ = p(:,50);
phil_ = phil(:,50);


%%
phierr_BN = f_BN_err;
phierr_DNN = f_DNN_err;
phierr_P = f_P_err;
perr_BN = p_BN_err;
perr_DNN = p_DNN_err;
perr_P = p_P_err;
uerr_BN = u_BN_err;
uerr_DNN = u_DNN_err;
uerr_P = u_P_err;
verr_BN = v_BN_err;
verr_DNN = v_DNN_err;
verr_P = v_P_err;

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
phierr_BN_1 = phierr_BN_1(:,3735);
phierr_DNN_1 = phierr_DNN_1(:,3735);
phierr_P_1 = phierr_P_1(:,3735);
perr_BN_1 = perr_BN_1(:,785);
perr_DNN_1 = perr_DNN_1(:,785);
perr_P_1 = perr_P_1(:,785);
uerr_BN_1 = uerr_BN_1(:,644);
uerr_DNN_1 = uerr_DNN_1(:,644);
uerr_P_1 = uerr_P_1(:,644);
verr_BN_1 = verr_BN_1(:,2178);
verr_DNN_1 = verr_DNN_1(:,2178);
verr_P_1 = verr_P_1(:,2178);

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
rela_err = [uerr_DNN_1,uerr_BN_1,uerr_P_1;...
    verr_DNN_1,verr_BN_1,verr_P_1;...
    perr_DNN_1,perr_BN_1,perr_P_1;...
    phierr_DNN_1,phierr_BN_1,phierr_P_1];