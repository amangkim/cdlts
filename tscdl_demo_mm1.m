% tscdl_demo_09
% M/M/1 queue time series

clear all

T0 = 20; %[sec]
delta0 = 0.0001;


t = [0:delta0:T0]';

lam = .12;
mu = .13;

a1 = lam;
a2 = (lam*mu/2);
a3 = (lam+mu)*(lam-mu)^2/24;
a4 = (lam-mu)^4/384;
F0 = @(t) a1*t-a2*t.^2-a3*t.^3-a4*t.^4;


f0 = F0(t);
f0(find(f0<0))=0;

delta = [0.01:0.01:2];

del_len = length(delta);
MSE = [];


for del_i = 1:del_len
    delta_ = delta(del_i);

    [Y1 Y2, mse0]= amgrefgenpredictonly(f0,delta_);
    MSE = [MSE mse0];  
    
       
end


msevisual_ms_mm1
RMSE = sqrt(mse_min)


[Y1 Y2, mse0]= amgrefgenpredictonly(f0,delta_star,T0,1);


