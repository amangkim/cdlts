function Der_1 = Der(a0,a1,delta)
% Usage:
%    [Delta_(k)] = Der(a_(k-1), a_(k), delta)
% Output:
%   Delta_(k)   : Next increase at k-th moment
% Input:
%   Y0          : Continuous time-series dataset
%   delta       : Duration between sampling
%   T0          : Ending time
%   t0          : Startting time (default t0=0);
%
% Note:
%   - Original file: amgforward
%   - Requred Matlab file(s): Der
% 
% Made by Amang Kim [v0.1 | 1/May/2024]
%-----------------------------

Der_1 = (a1-a0)/delta;

end

