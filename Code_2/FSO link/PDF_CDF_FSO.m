function [PDF, CDF] = PDF_CDF_FSO(L, thres)

% ============= Parameters ==============
v = 0.9; %optical detector responsivity
Pf = (10^1.5)*10^-3; % transmitted powers FSO
sigma_f = 2*10^-23; % noise power spectral density
I_f = ((v*Pf)^2)/sigma_f;

%=======================================
[beam, vF] = R_qbr_pe();

AF = nthroot(erf(vF),1/2);
sigma_R = FSO_Rytov();

u1 = 1 + beam^2;
u2 = ((sigma_R^2)*(1+2*beam^2))/2;

% Cloud
hcf = Attenuation_cloud(L);

% PDF
PDF1 = ((beam^2)/(4*I_f*(AF*hcf)^(beam^2))) * ((thres/I_f)^(0.5*(beam^2)-1));
PDF2 = exp((u1*(sigma_R*beam)^2)/2) * erfc((log((1/(AF*hcf))*sqrt(thres/I_f))+u2)/(sqrt(2)*sigma_R));
PDF = PDF1*PDF2;

% CDF
Y = log((sqrt(thres))/(AF*hcf*sqrt(I_f)))+u2;

CDF1 = 0.5*exp((beam^2)*(Y-(((sigma_R*beam)^2)/2)))*erfc(Y/(sqrt(2)*sigma_R));
CDF2 = 0.5*erfc(((sigma_R*beam^2)/sqrt(2))-(Y/(sigma_R*sqrt(2))));
CDF = CDF1+CDF2;
% CDF = integral(@(x) ((beam^2)/(4*I_f*(AF*hcf)^(beam^2)))*((x./I_f).^(0.5*(beam^2)-1)).*exp((u1*(sigma_R*beam)^2)/2).*erfc((log((1/(AF*hcf)).*sqrt(x./I_f))+u2)/(sqrt(2)*sigma_R)),0,thres);
end

