%function CDF1= CDF_funcFSO(Rytov,n_factor,SNR_av,thres)
%alpha= (exp(0.49*Rytov/(1+1.11*Rytov^(12/5))^(7/6))-1)^(-1);
%beta = (exp(0.51*Rytov/(1+0.69*Rytov^(12/5))^(5/6))-1)^(-1);
%C_besselk = ((alpha*beta)^((alpha+beta)/2))/(gamma(alpha)*gamma(beta)*(n_factor^2*SNR_av)^((alpha+beta)/4));% a part of besslk's constant
%CDF1 = integral(@(x) C_besselk.*(x.^(((alpha+beta)/4)-1).*besselk((alpha-beta),2.*sqrt(alpha.*beta.*sqrt(x./(n_factor^2*SNR_av))))),0,thres);
%end

function CDF1= CDF_funcFSO(lamda,Cn,SNR_av,thres, phi)
Rytov= FSO_Rytov(lamda,Cn, phi);
alpha= (exp(0.49*(Rytov^2)/(1+1.11*Rytov^(12/5))^(7/6))-1)^(-1);
beta = (exp(0.51*(Rytov^2)/(1+0.69*Rytov^(12/5))^(5/6))-1)^(-1);
C_besselk = ((alpha*beta)^((alpha+beta)/2))/(gamma(alpha)*gamma(beta)*(SNR_av)^(((alpha+beta)/4)));
CDF1 = integral(@(x) C_besselk.*(x.^(((alpha+beta)/4)-1).*besselk((alpha-beta),2.*sqrt(alpha.*beta.*sqrt(x./SNR_av)))),0,thres);
end
