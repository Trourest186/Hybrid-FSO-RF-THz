function result = FSO_CSS_prob(lamda, hv, H, t_av, SNR_av, phi1, C_0)
% SNR_av = 20; %dB
lambda = 1550*10^-9; 
k = 2*pi/lambda;

[alpha, beta] = alpha_beta(k, hv, H, phi1, C_0);

state_thres = SNR_FSO(lamda, hv, H, t_av, SNR_av, phi1, C_0);
N = length(state_thres)-1;
result= zeros(1,N);

for i=1:1:N
    result(i) = CDF_FSO(alpha, beta, 10^(state_thres(i+1)/10), 10^(SNR_av/10)) - CDF_FSO(alpha, beta,10^(state_thres(i)/10), 10^(SNR_av/10));
end

end

