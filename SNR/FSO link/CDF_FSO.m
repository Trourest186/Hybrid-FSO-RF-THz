function y = CDF_FSO(alpha, beta, thres, SNR_av)
%     tmp = alpha*beta*sqrt(SNR/A_SNR);
%     y = (1 / (gamma(alpha)*gamma(beta))) * meijerG([1],[],[alpha,beta],[0],tmp);
C_besselk = ((alpha*beta)^((alpha+beta)/2))/(gamma(alpha)*gamma(beta)*(SNR_av)^(((alpha+beta)/4)));
y = integral(@(x) C_besselk.*(x.^(((alpha+beta)/4)-1).*besselk((alpha-beta),2.*sqrt(alpha.*beta.*sqrt(x./SNR_av)))),0,thres);
end

