clear;
clc;
disp("LEFT");

% y = PDF_FSO( alpha, beta, SNR, SNR_a );
% disp(y);


% FSO
v_wind = 21; % m/s
C_0 = 10^-15; % m ^-2/3
lambda = 1550*10^-9; % m
k = 2*pi/lambda;
zenith = 55*pi/180; % radian
% h
hv = 1.5; % m - height of vehicle
H = 600*10^3; % m

[alpha,beta] = alpha_beta(k, hv, H);
sig = sigma_s(k, hv, H);

%FSO
% cf = 2000; % frames/slot 
% Lf = 1784; % bits
% R = 1*10^9; % bps
% T_f = Lf/R;
% t_av = 3.568e-03;

% % RF
Lf = 233;
cr = 2;
R = 150*10^6;
T_f = Lf/R;
t_av = 3.568e-03;
m = 1.5;
SNR_thres = 15.2;
fd = 50*10^3;
Rf =  1*10^9;
Rr = 150*10^6;

SNR1_dB             = -10; %starting threshold (dB) 
SNR1                = 10^(SNR1_dB/10);
SNR_av = 15;
func = @(x) (LCR(alpha, beta, sig, 10^(SNR_av/10),10.^(x./10)) +LCR(alpha, beta, sig,10^(SNR_av/10),SNR1)) - t_av;
% y2 = LCR(alpha, beta, sigma_s,SNR_av,1 );
% % disp(y2);
% y = RF_BER_av(m, fd, t_av, SNR_av, SNR_thres);
% disp(y);
% [y, M] = FSO_BER_av(lambda, hv, H, t_av);
% Pr = RF_CSS_prob(m, fd, t_av, SNR_av, SNR_thres);
% 
y = Pt_FSO_RF(SNR_av, SNR_thres);
% for n=1:1:N
%     disp(y(n));
%     TS_RF = RF_FER_av(y(n));
%     MS_RF = Rr*Pr(n);
% end
% 3.7635e+07
% MS_FSO
%    3.6144e+04
% 
% MS_RF
%    2.1690e+06

% MS_FSO
%    3.6144e+04
% 
% MS_RF
%    5.1792e+06
% disp(y(1));
% disp(y(2));
% tmp = RF_FER_av(y(1));
% 
% 
% t0 = 16;
% Lf = 223*8;
% sum = 0;
% for i=0:16
%     disp("i="); disp(i);
%     tmp = nchoosek(Lf,i)
%     tmp1 = (y(1)^i)*(1-y(1))^(Lf-i)
%     tmp2 = round(tmp,3)*round(tmp1,3)
%     sum = sum +tmp;
% end
% FER = 1- sum;
% tmp = zeros(1,N);
% for n=1:1:N
%     tmp(n) = RF_FER_av(y(n));
% end

% tmp = zeros(1,M);
% for m=1:1:M
%     tmp(m) = FSO_FER_av(y(m));
% end
% y =nchoosek(233,2);
% disp(y);
% y = combination(4,2);
% t_av = 3.568e-03;
% for i=1:10
% y2 = func(i);
% disp(y2);
% end
%0.0036


