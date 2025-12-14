function [P, Y1, mse_bar] = amgrefgenstockmin(varargin)
% Usage:
%    [Predicted, Real, MSE] = amgrefgenstockmin(Y0, delta, T0, t0)
% Output:
%   Predicted   : Predicted dataset with delta-observations
%   Real        : Real data which selected at delta-observations
%   mse_bar     : Mean value of MSE between real and predicted
% Input:
%   Y0          : Continuous time-series dataset
%   delta       : Duration between sampling
%   T0          : Ending time
%   t0          : Startting time (default t0=0);
%
% Note:
%   - Original file: amgforward
%   - Requred Matlab file(s): Der
%   - Display option is added
% 
% Made by Amang Kim [v0.2 | 8/May/2024]
%-----------------------------


%( Y0, delta )
inputs={'Y0', 'delta', 'T0', 'disp', 't0'};
delta = 1;
T0 = 0;
t0 = 0;
disp = 0;
%T0 = length(Y0)-1;
%delta0 = 0.0001;

for n=1:nargin
    if(~isempty(varargin{n}))
        eval([inputs{n} '=varargin{n};'])
    end
end
%-----------------------------

delta0 = 1; % 1 minute is minimal
Y0_len = length(Y0);

if T0==0
    %T0 = max([T0 length(Y0)-1])
    T0 = delta0*(Y0_len-1)+t0;
end

t_ = [t0:delta0:T0];
    
n_star = floor((T0-t0)/delta);
epsilon = (T0-t0)/delta-n_star;

if epsilon ~= 0
    t0 = t0+epsilon;
    %idx_t0 = min(find(abs(t_-t0)<=delta0));
    idx_t0 = find(abs(t_-t0)<=delta0/2);
    a0 = Y0(idx_t0);
else
    a0 = Y0(1);
end

t = [t0:delta:T0];
Y_len = length(t);
A=[a0];

%idx_t01 = min(find(abs(t_-t(2))<=delta0));
idx_t01 = find(abs(t_-t(2))<=delta0/2);
a = Y0(idx_t01);
A=[A a];
Y1 = [Y0(1) a];
MSE=[];

%Idx_t01 = [1 idx_t01];

for k=3:Y_len
    %a_0 = A(k-2);
    %a_1 = A(k-1);
    
    idx_ta0 = find(abs(t_-t(k-2))<=delta0/2);
    idx_ta1 = find(abs(t_-t(k-1))<=delta0/2);
    %idx_ta0 = min(find(abs(t_-t(k-2))<=delta0));
    %idx_ta1 = min(find(abs(t_-t(k-1))<=delta0));

    a_0 = Y0(idx_ta0);
    a_1 = Y0(idx_ta1);

    a = a_1 + Der(a_0,a_1,delta);    
    A = [A a];
    idx_ta2 = find(abs(t_-t(k))<=delta0/2);
    %y1 = Y0(idx_ta2);
    y10 = Y0(idx_ta2);
    y1 = a;
    
    Y1 = [Y1 y1]; 
    
    mse0 = (y10-y1).^2;
    MSE = [MSE mse0];
    
    %Idx_t01 = [Idx_t01 idx_ta2];    
    %a0 = a;
    
end
P = A';
Y1 = Y1';
mse_bar = mean(MSE);
t_ = t_/60;
t = t/60;
%%%%%%%%%%%%%%%%%%%%%%%%%
lgnd_1 = ['Real-time stock value'];
lgnd_2 = ['Time-series CDL'];
if disp == 1
    %idx_ta0 = find(abs(t_-t(k-2))<=delta0/2);
    %idx_ta1 = find(abs(t_-t(k-1))<=delta0/2);
    figure
    hold on
    grid on
    plot(t_,Y0);
    plot(t,Y1,'.');      
    plot(t,Y1);      
    legend(lgnd_1,lgnd_2, 'location', 'southeast');
    
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%

end