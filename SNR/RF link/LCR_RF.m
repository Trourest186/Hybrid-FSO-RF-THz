function y = LCR_RF(m, fd, A_SNR, SNR)
y = sqrt(2*pi*(m*SNR/A_SNR))*(fd/gamma(m))*((m*SNR/A_SNR)^(m-1))*exp(-m*SNR/A_SNR);
end

