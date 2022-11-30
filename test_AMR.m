% 

L = 1500;
C_0 =  2.e-13;
lambda = 1550*10^-9;
k = 2*pi/lambda;
phi1 = pi/4;
hv = 1.5;
H = 600*10^3;
%===================================
SNR_av = 40;
x = Pt_AMR1(SNR_av, C_0);
% SNR_av = 10:1:50;
% SNR_FSO = zeros(length(SNR_av),1);
% BER_FSO = zeros(length(SNR_FSO),1);
% FER_FSO = zeros(length(SNR_FSO),1);
% 
% % for i =1:1:5
% %     SNR_FSO(i) = SNR_FSO_AMR1(i);
% % end
% 
% for i =1:1:length(SNR_av)
%     BER_FSO(i) = BER_R_RF(2^5, 10^(SNR_av(i)/10));
% %     tmp = 10^(BER_FSO(i)/10
% 
%     FER_FSO(i) = 1 - (1-BER_FSO(i))^1080;
% %     FER_FSO(i) = BER_FSO(i)*1080;
% end
% % 
% semilogx(SNR_av, FER_FSO, '--');
% 
% hold on;
