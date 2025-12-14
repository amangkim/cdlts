% tscdl_cbpm_amd

clear all

Data = load ('AMD');
DAT = Data.AMD;
DAT=DAT(1000:6218);


delta0 = 1;
T0 = length(DAT)-1; %[Minutes]
t = [0:delta0:T0]';


c1 = .1; % 10 cents
c2 = 1;

f0 = DAT;
f0_bar = abs(mean(DAT));
delta_max = length(DAT);

sc = 30;
delta = [sc:sc:floor(delta_max/2)];

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

    cost = c1*frq + c2*mse0;%/f0_bar;
    COST = [COST cost];
       
end

x = delta;
y1 = FRQ; % smaller is better
y2 = MSE;%/mean(DAT); % smaller is better
cbpm_sibsib_ms;