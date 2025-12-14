% tscdl_demo_apple
% Cost function

clear all


Data = load ('apple');
DAT = Data.AAPL;



delta0 = 1;
T0 = length(DAT)-1; %[Minutes]
t = [0:delta0:T0]';


c1 = .5; % 10 cents
c2 = 1;

f0 = DAT;
f0_bar = abs(mean(DAT));
delta_max = length(DAT);

delta = [30:30:1500];

del_len = length(delta);
MSE = [];
COST = [];
FRQ = [];

for del_i = 1:del_len
    delta_ = delta(del_i);
    [Y1 Y2, mse0]= amgrefgenstockmin(f0,delta_);    
    frq = T0/delta_;
    MSE = [MSE mse0];  
    FRQ = [FRQ frq];
    cost = c1*frq + c2*mse0;
    COST = [COST cost];
       
end


%msevisual_ms
[mse_min i_star] = min(MSE);
delta_star = delta(i_star)
MSE = mse_min
RMSE = sqrt(mse_min)

%scale =0.4;
%costvisual_ms


[Y1 Y2, mse0]= amgrefgenstockmin(f0,delta_star,T0,1);