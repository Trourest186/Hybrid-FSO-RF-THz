function result = RF_CSS_prob_AMR(SNR_avf, C_0)

SNR_thres = SNR_FSO_AMR1(10^(2/10));
SNR_av = 15;
m = 1.5;
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
lambda = 1550*10^-9; 
k = 2*pi/lambda;
hv = 1.5; % m - height of vehicle
H = 600*10^3; % m
phi1 = 55*pi/4;

[alpha, beta] = alpha_beta(k, hv, H, phi1, C_0);

state_thres = zeros(5,1);
for i =1:1:5
    state_thres(i) = SNR_RF_AMR1(10^(i/10));
end

N = length(state_thres)-1;
result = zeros(1,N);

for i=1:1:N
    tmp = CDF_RF(m, 10^(state_thres(i+1)/10), 10^(SNR_av/10)) - CDF_RF(m, 10^(state_thres(i)/10), 10^(SNR_av/10));
    result(i) = (1-CDF_FSO(alpha, beta, 10^(SNR_thres/10), 10^(SNR_avf/10)))*tmp;
end

end
% 
% function result = RF_CSS_prob(m, fd, t_av, SNR_avf, SNR_thres, phi1, C_0)
% SNR_av =15;
% % dB
% lambda = 1550*10^-9; 
% k = 2*pi/lambda;
% hv = 1.5; % m - height of vehicle
% H = 300*10^3; % m
% 
% [alpha, beta] = alpha_beta(k, hv, H, phi1, C_0);
% 
% state_thres = SNR_RF(m, fd, t_av, SNR_avf, SNR_thres, phi1, C_0);
% N = length(state_thres)-1;
% result = zeros(1,N);
% 
% for i=1:1:N
%     tmp = CDF_RF(m, 10^(state_thres(i+1)/10), 10^(SNR_av/10)) - CDF_RF(m, 10^(state_thres(i)/10), 10^(SNR_av/10));
%     result(i) = CDF_FSO(alpha, beta, 10^(SNR_thres/10), 10^(SNR_avf/10))*tmp;
% end
% end
