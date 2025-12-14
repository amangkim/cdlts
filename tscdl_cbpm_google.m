% tscdl_cbpm_google
% Cost function

clear all

%AAPL = [];
%save('oil', 'OIL');


%Data = load ('oil');
%DAT = Data.OIL;

Data = load ('google');
DAT = Data.GOOG;
DAT=DAT(2500:6218);
%Data = load ('apple');
%DAT = Data.AAPL;

%Data = load ('AMD');
%DAT = Data.AMD;

%Data = load ('bitcoin');
%DAT = Data.bitcoin;


delta0 = 1;
T0 = length(DAT)-1; %[Minutes]
t = [0:delta0:T0]';

%freq = [1 2^2 2^3 2^4 2^5 2^6 2^7 2^8 2^9 2^10]
%delta = 1./freq;

c1 = .5; % 10 cents
c2 = 1;

f0 = DAT;
f0_bar = abs(mean(DAT));
delta_max = length(DAT);
%delta = [1:60];
%delta = [10:10:50 60:60:1500];

step = 30; % Mimuitues
%delta = [step:step:delta_max/6];
delta = [step:step:delta_max/6];
%delta = [900:30:3000];

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

x = delta;

y1 = FRQ; % smaller is better
y2 = MSE/mean(DAT); % smaller is better

cbpm_sibsib_ms