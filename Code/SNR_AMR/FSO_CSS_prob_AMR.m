function result = FSO_CSS_prob_AMR(SNR_av, C_0)
% SNR_av = 20; %dB
lambda = 1550*10^-9; 
k = 2*pi/lambda;
hv = 1.5; % m - height of vehicle
H = 600*10^3; % m
phi1 = 55*pi/4;

[alpha, beta] = alpha_beta(k, hv, H, phi1, C_0);
state_thres = zeros(5,1);
for i =1:1:5
    state_thres(i) = SNR_FSO_AMR1(10^(i/10));
end

% state_thres = SNR_FSO(lamda, hv, H, t_av, SNR_av, phi1, C_0);
N = length(state_thres)-1;
result= zeros(1,N);
for i=1:1:N
    tmp1 = CDF_FSO(alpha, beta, 10^(state_thres(i+1)/10), 10^(SNR_av/10));
    tmp2 = CDF_FSO(alpha, beta,10^(state_thres(i)/10), 10^(SNR_av/10));
    result(i) = tmp1 - tmp2;
end

end

