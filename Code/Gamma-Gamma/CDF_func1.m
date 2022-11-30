function CDF1 = CDF_func1(alpha,beta,thres,SNR_av,n_factor)
% C_besselk = ((alpha*beta)^((alpha+beta)/2))/(gamma(alpha)*gamma(beta)*(n_factor^2*SNR_av)^((alpha+beta)/4));% a part of besslk's constant
% CDF1 = integral(@(x) C_besselk.*(x.^(((alpha+beta)/4)-1).*besselk((alpha-beta),2.*sqrt(alpha.*beta.*sqrt(x./(n_factor^2*SNR_av))))),0,thres);
%%%%%%%%%%%%%%%%%%%%
CDF1 = (1/(gamma(alpha)*gamma(beta)))*meijerG({[1],[]},{[alpha,beta],[0]},alpha*beta*sqrt(thres/(n_factor^2*SNR_av)));
end

