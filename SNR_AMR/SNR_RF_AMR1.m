function RF = SNR_RF_AMR1(i)
BER_0 = 1e-5;
RF = (2/3)*(2^i-1)*log(1/(5*BER_0));
end

