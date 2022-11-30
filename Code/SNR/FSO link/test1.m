clear;
clc;
disp("LEFT");

% y = PDF_FSO( alpha, beta, SNR, SNR_a );
% disp(y);

Cn = 2*1.e-13;
% FSO
v_wind = 21; % m/s
C_0 = 10^-15; % m ^-2/3
lamda = 1550*10^-9; % m
k = 2*pi/lamda;
zenith = 55*pi/180; % radian
% h
hv = 1.5; % m - height of vehicle
H = 600*10^3; % m 

[alpha,beta] = alpha_beta(k, hv, H);
sig = sigma_s(k, hv, H);

% FSO
% cf = 2000; % frames/slot 
% Lf = 1784; % bits
% R = 1*10^9; % bps
% T_f = Lf/R;
% t_av = 3.568e-03;

% RF
Lf = 1784;
cr = 2;
R = 150*10^6;
T_f = Lf/R;
t_av = T_f*cr;
% disp(t_av);
m = 1.5;
SNR_thres = 5.3730;
% SNR_thres = -1.1842;
fd = 48*10^3;

SNR1_dB             = -10; %starting threshold (dB) 
SNR1                = 10^(SNR1_dB/10);
SNR_av = 20;
func = @(x) (LCR(alpha, beta, sig, 10^(SNR_av/10),10.^(x./10)) +LCR(alpha, beta, sig,10^(SNR_av/10),SNR1)) - t_av;
% y2 = LCR(alpha, beta, sigma_s,SNR_av,1 );;
% % disp(y2);
% [result, N] = RF_BER_av(m, fd, t_av, SNR_av, SNR_thres);
% FER = zeros(1,length(result));
% for i= 1:1:length(result)
% FER(i) = RF_FER_av(result(i));
% end
% y = zeros(5);
% y = zeros(5,150);
% 
y = Pt_FSO_RF(SNR_av, SNR_thres);

% t_av = 3.568e-03;
% for i=1:10
% y2 = func(i);
% disp(y2);
% end
%0.0036


