function RF = SNR_RF_AMR1(i)

% % AMR1
% BER_0 = 1e-5;
% RF = (2/3)*(2^i-1)*log(1/(5*BER_0));

% AMR2
L = 2;
l = 1080;
FER_0 = 10^-2;
BER_0 = FER_0^(1/(L+1));

RF = (2/3)*(2^i-1)*log(l/(5*BER_0));
end

