function result = SNR_RF(m, fd, t_av, SNR_avf, SNR_thres, phi1, C_0)
% dB
SNR_av = 15;
%=============== Begin with RF links =====================%
result =[];

SNR1_dB             = -10; %starting threshold (dB) 
SNR1                = 10^(SNR1_dB/10);
result = [result SNR1_dB];

lambda = 1550*10^-9; 
k = 2*pi/lambda;
hv = 1.5; 
H = 300*10^3;
% SNR_avf =20;

[alpha, beta] = alpha_beta(k, hv, H, phi1, C_0);
%===========================================================
func = @(x) (((CDF_FSO(alpha, beta, 10^(SNR_thres/10), 10^(SNR_avf/10))))*(CDF_RF(m, 10.^(x./10), 10^(SNR_av/10)) - CDF_RF(m, 10^(SNR1_dB/10), 10^(SNR_av/10)))... 
./(LCR_RF(m, fd, 10^(SNR_av/10), 10.^(x./10)) + LCR_RF(m, fd, 10^(SNR_av/10), SNR1))) - t_av;
st  = SNR1_dB;
fi  = SNR_thres; %Maximum value in dB
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
result = [result SNR2_dB];
% disp((1-(CDF_FSO(alpha, beta, 10^(SNR_thres/10), 10^(SNR_avf/10))))*(CDF_RF(m, 10^(SNR1_dB/10), 10^(SNR_av/10)) - CDF_RF(m, 10^(SNR2_dB/10), 10^(SNR_av/10))));
% disp(SNR2_dB-SNR1_dB);
while abs(((CDF_FSO(alpha, beta, 10^(SNR_thres/10), 10^(SNR_avf/10))))*(CDF_RF(m, 10^(SNR1_dB/10), 10^(SNR_av/10)) - CDF_RF(m, 10^(SNR2_dB/10), 10^(SNR_av/10))))>=10^(-5) && abs(SNR2_dB-SNR1_dB)>10^(-4)
SNR1_dB = SNR2_dB;
SNR1    = 10^(SNR1_dB/10);

func = @(x) (((CDF_FSO(alpha, beta, 10^(SNR_thres/10), 10^(SNR_avf/10))))*(CDF_RF(m, 10.^(x./10), 10^(SNR_av/10)) - CDF_RF(m, 10^(SNR1_dB/10), 10^(SNR_av/10)))... 
./(LCR_RF(m, fd, 10^(SNR_av/10), 10.^(x./10)) + LCR_RF(m, fd, 10^(SNR_av/10), SNR1))) - t_av;
disp("hello");
st  = SNR1_dB;
fi  = SNR_thres; %Maximum value in dB
tol = 1e-6;
N   = 20;
for i = 1:N
    tmp = 0.5*(st + fi);
    if(abs(fi - st) <= tol)
        break;
    else
%         disp("hello");
        if(func(tmp)*func(st) < 0)
            fi = tmp;
        else
            st = tmp;
        end
    end
end

SNR2_dB = tmp;
%-----------------------------------------------------------------------%
result = [result SNR2_dB];
end
% channel_state_thres = channel_state_thres(1,1:length(channel_state_thres)-1);
% result(length(result)) = 100;    
if length(result) == 2
    result = [result(1) 40];
end
end

