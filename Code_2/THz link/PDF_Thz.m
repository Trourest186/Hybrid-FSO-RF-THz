function [PDF, CDF] = PDF_Thz(L, thres)
% ============= Parameters ==============
% v = 0.9; %optical detector responsivity
PThz = (10^1.5)*10^-3; % transmitted powers FSO
sigma_t = (10^(-174/10))*10^-3; % noise power spectral density
I_t = ((PThz)^2)/sigma_t;

%=======================================
[beam, vT] = R_qbr_pe_THz();
AT = nthroot(erf(vT),1/2);

alpha = 2;
u = 6;
beta = 0.002;

hR = sqrt(thres/I_t);
% Cloud
hct = Ploss_At(L);  

% PDF
const_Thz = ((beam.^2).*(hR.^((beam.^2)-1)))./((AT.*hct).^(beam.^2));
PDF = const_Thz.*integral(@(x) (x.^(-beam^2)).*(alpha*(u^u).*((x./beta).^(alpha*u-1)).*exp(-u.*((x./beta).^alpha)))./(beta*gamma(u)) ,hR/(AT*hct),Inf);

% CDF
fun = @(x,y) (((beam.^2).*(x.^((beam.^2)-1)))./((AT.*hct).^(beam.^2))).*((y.^(-beam^2)).*(alpha*(u^u).*((y./beta).^(alpha*u-1)).*exp(-u.*((y./beta).^alpha)))./(beta*gamma(u)));
g1 = @(x) x./(AT*hct);   
CDF = integral2(fun,0,thres,g1,Inf);
end

