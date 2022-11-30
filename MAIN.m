clear all;
clc;

% FSO
v_wind = 21; % m/s
C_0 = 10^-15; % m ^-2/3
lambda = 1550*10^-9; % m
k = 2*pi/lambda;
zenith = 55*pi/180; % radian
% h
hv = 1.5; % m - height of vehicle
H = 600*10^3; % m

 
cf = 3; % frames/slot 
Lf = 1784; % bits
R = 100*10^6; % bps
T_f = Lf/R;

t_av = 3.568e-03;

y = SNR_FSO(lambda, hv, H, t_av);
disp(y);
 
