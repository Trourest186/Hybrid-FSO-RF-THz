function [PDF, CDF] = PDF_CDF_Thz(L, thres)

% ============= Parameters ==============
% v = 0.9; %optical detector responsivity
PThz = (10^1.5)*10^-3; % transmitted powers FSO
sigma_t = (10^(-174/10))*10^-3; % noise power spectral density
I_t = ((PThz)^2)/sigma_t;

%=======================================
[beam, vT] = R_qbr_pe_THz();
AT = nthroot(erf(vT),1/2);

% u1 = 1 + beam^2;
% u2 = ((sigma_R^2)*(1+2*beam^2))/2;
alpha = 2;
u = 6;
beta = 200;

% Cloud
hct = Ploss_At(L);  

% PDF
PDF1 = (((beam^2)*((AT*hct)^(-beam^2)))/(2*I_t))*((thres/I_t)^(0.5*(beam^2)-1))*((u^((beam^2)/alpha))/(beta*gamma(u)));
PDF2 = gammainc((u/((beta*AT)^alpha))*(sqrt(thres/I_t)^alpha),(alpha*u-beam^2)/alpha, 'upper');
PDF = PDF1*PDF2;

% CDF
CDF1 = ((beam^2)/(alpha*(beta^(beam^2))*((AT*hct)^(beam^2))))*(sqrt(thres/I_t)^(beam^2))
CDF2 = 0;
for j =1:1:u
    i = j-1;
    CDF2 = CDF2 + (((u^((beam^2)/alpha))/(factorial(i)))*(gamma_incomplete((u/((beta*AT)^alpha))*(sqrt(thres/I_t)^alpha),(alpha*i-beam^2)/alpha)));
end
CDF = 1- CDF1*CDF2;
% CDF = integral(@(x) (((beam^2)*((AT*hct)^(-beam^2)))/(2*I_t)).*((x./I_t).^(0.5*(beam^2)-1)).*((u^((beam^2)/alpha))/(beta*gamma(u))).*gammainc((u/((beta*AT)^alpha)).*(sqrt(x./I_t).^alpha),(alpha*u-beam^2)/alpha, 'upper') ,0,thres);
end

