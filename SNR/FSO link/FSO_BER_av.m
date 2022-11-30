function [result, M] = FSO_BER_av(lamda, hv, H, t_av, SNR_av1, phi1, C_0)
% Z = 2; %BPSK 

SNR_av = 10^(SNR_av1/10);
% 
lambda = 1550*10^-9; 
k = 2*pi/lambda;
% 
[alpha, beta] = alpha_beta(k, hv, H, phi1, C_0);
state_thres = SNR_FSO(lamda, hv, H, t_av, SNR_av1, phi1, C_0);
Pf = FSO_CSS_prob(lamda, hv, H, t_av, SNR_av1, phi1, C_0);

N = length(state_thres)-1;
M = N;
result = zeros(1,N);

C_besselk = ((alpha*beta)^((alpha+beta)/2))/(gamma(alpha)*gamma(beta)*(SNR_av)^(((alpha+beta)/4)));
fun =@(x)C_besselk.*(x.^(((alpha+beta)/4)-1).*besselk((alpha-beta),2.*sqrt(alpha.*beta.*sqrt(x./SNR_av)))).*0.2.*exp(-3.*x./2);

for i =1:1:N
    core = integral(fun, 10^(state_thres(i)/10) ,10^(state_thres(i+1)/10));
    result(i) = (1/Pf(i)) * core;
    if result(i) >1
        result(i) =1;
    end 
    
end

% [alpha, beta] = alpha_beta(k, hv, H);
% state_thres = SNR_FSO(lamda, hv, H, t_av, SNR_av1);
% Pf = FSO_CSS_prob(lamda, hv, H, t_av, SNR_av1);
% N = length(state_thres)-1;
% M = N;
% result = zeros(1,N);

% K, L
% for j = 1:1:N
%     K =0;
%     L =0;
%     for i=1:1:10
%         gz = 1.5;
%         ai_K = ((alpha*beta)^(i+beta))/ (gamma(i-alpha+beta+1)*factorial(i));
%         tmp_K = upper_incomplete_gamma((i+beta)/2, gz*10^(state_thres(j)/10)) - upper_incomplete_gamma((i+beta)/2, gz*10^(state_thres(j+1)/10));
%         count_K = (ai_K/((SNR_av^((i+beta)/2))*(gz^((i+beta)/2))))*tmp_K;
%         K = K + count_K;
%         ai_L = ((alpha*beta)^(i+alpha))/ (gamma(i-beta+alpha+1)*factorial(i));
%         tmp_L = upper_incomplete_gamma((i+alpha)/2, gz*10^(state_thres(j)/10)) - upper_incomplete_gamma((i+alpha)/2, gz*10^(state_thres(j+1)/10));
%         count_L = (ai_L/((SNR_av^((i+beta)/2))*(gz^((i+alpha)/2))))*tmp_L;
%         L = L +count_L;
%     end
%     BER
%     result(j) = (0.1*betaf(alpha-beta, 1-alpha+beta)*(K-L))/(Pf(j)*gamma(alpha)*gamma(beta));
% end

end

