function [f_SNR_FSO, SNR_thres] = SNR_FSO(lamda, hv, H, t_av, SNR_av, phi1, Cn)
%======== Parameters of FSO links ===============%

% Cn = 2*1.e-13;
t_slot = 3.568e-03;
k = 2*pi/lamda;
% SNR_av = 20;

[alpha, beta] = alpha_beta(k, hv, H, phi1, Cn);
sig = sigma_s(k, hv, H, phi1, Cn);

%=============== Begin with FSO links =====================%

%====== General Parameters ======%
f_SNR_FSO =[];

SNR1_dB             = -10; %starting threshold (dB) 
SNR1                = 10^(SNR1_dB/10);
f_SNR_FSO = [f_SNR_FSO SNR1_dB];

% count = 1;
%==================================
% func = @(x,y,z)((Probability_kth(alpha, beta, 10^(x/10), 10^(y/10), 10^(z/10))/(LCR(sigma_s, alpha, beta, 10^(x/10), 10^(z/10) ) + LCR(sigma_s, alpha, beta, 10^(y/10),10^(z/10) ) ))- t_av);
% func = @(y,z)((Probability_kth(alpha, beta, SNR1, 10^(y/10), 10^(z/10))/(LCR(sigmas, alpha, beta, SNR1, 10^(z/10) ) + LCR(sigmas, alpha, beta, 10^(y/10),10^(z/10) ) ))- t_av); 
% func = @(x)(PDF_FSO( alpha, beta, 10.^(x./10), 10^(15/10) ) - PDF_FSO( alpha, beta, SNR1, 10^(15/10) ))/(LCR(sigmas, alpha, beta, SNR1, 10^(15/10) ) + LCR(sigmas, alpha, beta, 10.^(x./10), 10^(15/10) ) ))- t_av); 
func = @(x) (CDF_FSO(alpha, beta, 10.^(x./10), 10^(SNR_av/10))-CDF_FSO(alpha, beta, 10.^(SNR1_dB/10), 10^(SNR_av/10) )... 
./(LCR(alpha, beta, sig,10^(SNR_av/10),10.^(x./10), phi1) +LCR(alpha, beta, sig,10^(SNR_av/10),SNR1, phi1))) - t_av;
st  = SNR1_dB;
fi  = 40; %Maximum value in dB
tol = 1e-6;
N   = 20;

for i = 1:N
    tmp = 0.5*(st + fi);
    if(abs(fi - st) <= tol)
        break;
    else
        if func(tmp)*func(st) < 0
            fi = tmp;
        else
            st = tmp;
        end
    end
end
SNR2_dB = tmp;
SNR_thres = tmp;
f_SNR_FSO = [f_SNR_FSO SNR2_dB];
% count  = count +1;
disp("hello");
disp(SNR2_dB);

while abs(CDF_funcFSO(lamda,Cn,10^(SNR_av/10),10^(SNR2_dB/10), phi1)-CDF_funcFSO(lamda,Cn,10^(SNR_av/10),10^(SNR1_dB/10), phi1))>=10^(-5) && abs(SNR2_dB-SNR1_dB)>10^(-4)
SNR1_dB = SNR2_dB;
SNR1    = 10^(SNR1_dB/10);

% func = @(x) (CDF_FSO(alpha, beta, 10.^(x./10), 10^(SNR_av/10))-CDF_FSO(alpha, beta, 10.^(SNR1_dB/10), 10^(SNR_av/10) )... 
% ./(LCR(alpha, beta, sig,10^(SNR_av/10),10.^(x./10)) +LCR(alpha, beta, sig,10^(SNR_av/10),SNR1))) - t_av;
func    = @(x) (CDF_funcFSO(lamda,Cn,10^(SNR_av/10),10.^(x./10), phi1)-CDF_funcFSO(lamda,Cn,10^(SNR_av/10),SNR1, phi1))... 
./(FSO_level_crossing_rate(lamda,Cn,10^(SNR_av/10),10.^(x./10), phi1) + FSO_level_crossing_rate(lamda,Cn,10^(SNR_av/10),SNR1, phi1)) - t_slot;
st  = SNR1_dB;
% disp("Hello");
fi  = 40; %Maximum value in dB
tol = 1e-6;
N   = 20;
for i = 1:N
    tmp = 0.5*(st + fi);
    if(abs(fi - st) <= tol)
        break;
    else
        if(func(tmp)*func(st) < 0)
            fi = tmp;
        else
            st = tmp;
        end
    end
end
SNR2_dB = tmp;
%-----------------------------------------------------------------------%
f_SNR_FSO = [f_SNR_FSO SNR2_dB];
end
% channel_state_thres = channel_state_thres(1,1:length(channel_state_thres)-1);
% f_SNR_FSO(length(f_SNR_FSO)) = 100;    
if length(f_SNR_FSO) == 2
    f_SNR_FSO = [f_SNR_FSO(1) 40 ];
end
end

%===================END============================
