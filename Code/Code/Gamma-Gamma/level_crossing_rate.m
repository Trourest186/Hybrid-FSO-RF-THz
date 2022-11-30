%Level crossing rate 
%Gamma-gamma distribution
function LCR = level_crossing_rate(sigma_s,alpha,beta,t0,thres,SNR_av,n_factor)
%--------Gamma-gamma distribution---------%
v0 = 1/(pi*t0*sqrt(4)); %Quasi-frequency
LCR = integral(@(x)(sqrt(pi)*sigma_s*v0*alpha^alpha*beta^beta/(gamma(alpha)*gamma(beta)))...
    .*(sqrt(thres/(n_factor^2*SNR_av)))^(beta-0.5).*x.^(alpha-beta-1.5).*sqrt(sqrt(thres/(n_factor^2*SNR_av))+x.^2).*exp(-alpha.*x-(beta*sqrt(thres/(n_factor^2*SNR_av)))./x),0,500);
%------approximate LCR for gamma-gamma channel-----% 
% LCR = (2*v0*sigma_s*sqrt(2*pi*alpha*beta)...
%     ./(gamma(alpha)*gamma(beta)))*(alpha*beta*sqrt(thres/(n_factor^2*SNR_av)))^((alpha+beta-1)/2)*besselk(alpha-beta,2*sqrt(alpha*beta*sqrt(thres/(n_factor^2*SNR_av))));
%--------LCR for log-normal distribution-----------%
% LCR = v0*exp((1/(2*(1-exp(4*sigma_s^2))))*((thres-SNR_av)/(n_factor^2*SNR_av))^2);
end

