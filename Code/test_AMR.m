% 
L = 1500;

lambda = 1550*10^-9;
k = 2*pi/lambda;
phi1 = pi/4;
hv = 1.5;
H = 600*10^3;
%===================================
SNR_av = 30;
% C_0 =  5*10^-15 :5.9*10^-15:3*10^-13;
C_0 =5*10^-15 :3.6875*10^-14:3*10^-13;
x = zeros(length(C_0),1);
for i= 1:1:length(C_0)
x(i) = Pt_AMR1(SNR_av, C_0(i));
end


% SNR_av = 10:1:50;
% % SNR_FSO = zeros(length(SNR_av),1);
% BER_FSO = zeros(length(SNR_av),1);
% FER_FSO = zeros(length(SNR_av),1);
% % 
% % % for i =1:1:5
% % %     SNR_FSO(i) = SNR_FSO_AMR1(i);
% % % end
% % 
% for i =1:1:length(SNR_av)
%     BER_FSO(i) = BER_R_new(2^5, 10^(SNR_av(i)/10));
% %     tmp = 10^(BER_FSO(i)/10
% 
%     FER_FSO(i) = 1 - (1-BER_FSO(i))^1080;
% %     FER_FSO(i) = BER_FSO(i)*1080;
% end
% % % 
