clc;
clear all;

L = 20*10^-3; % g/m^3
% % % test1 = PDF_CDF_Hybrid(L, 30);
% SNR = 10^(10/10);
% [x, y]=PDF_T(L, SNR);
% % z = Ploss_At(L);
% t1 = Attenuation_cloud(L);
% [t, g]= R_qbr_pe();
% [m, n] = eq_beam_radius();
% 
% [o,k] = PDF_CDF_Hybrid(L, SNR);
sigma_R = FSO_Rytov();
mu = -30:1:30;
SNR = zeros(length(mu),1);
for i=1:1:length(mu)
    SNR(i) = 10^(mu(i)/10);
end
PDF1 = zeros(length(SNR),1);
CDF1 = zeros(length(SNR),1);

for i =1:1:length(SNR)
    [PDF1(i), CDF1(i)] = PDF_FSO(L, SNR(i));
end
plot(mu,PDF1);
hold on;