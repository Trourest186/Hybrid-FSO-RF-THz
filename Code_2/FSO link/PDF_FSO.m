function [PDF, CDF] = PDF_FSO(L, thres)
[beam, vF] = R_qbr_pe();
AF = nthroot(erf(vF),1/2);
sigma_R = FSO_Rytov();

v = 0.9;     %optical detector responsivity
Pf = (10^1.5)*10^-3; % transmitted powers FSO
sigma_f = 2*10^-23; % noise power spectral density
I_f = ((v*Pf)^2)/sigma_f;

hR = sqrt(thres/I_f);
% Cloud
hcf = Attenuation_cloud(L);

%PDF
const_FSO = ((beam.^2).*(hR.^((beam.^2)-1)))./((AF.*hcf).^(beam.^2));
PDF = const_FSO.*integral(@(x) (x.^(-beam^2)).*((1./(x.*sqrt(2*pi).*sigma_R)).*exp(-0.5.*((log(x) + ((sigma_R^2)/2))./(sigma_R)).^2)) ,hR/(AF*hcf),Inf);

%CDF
g1 = @(x) x./(AF*hcf);
fun = @(x,y) (((beam.^2).*(x.^((beam.^2)-1)))./((AF.*hcf).^(beam.^2))).*((y.^(-beam^2)).*((1./(y.*sqrt(2*pi).*sigma_R)).*exp(-0.5.*((log(y) + ((sigma_R^2)/2))./(sigma_R)).^2)));
CDF = integral2(fun,0,thres,g1,Inf);
end

