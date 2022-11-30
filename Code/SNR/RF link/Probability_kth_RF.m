function y = Probability_kth_RF(m, SNR1, SNR2, A_SNR_FSO, A_SNR_RF, SNR_thres, alpha, beta)
tmp = PDF_FSO(alpha, beta, SNR_thres, A_SNR_FSO);    
y = tmp*(PDF_RF(m, SNR2, A_SNR_RF)-PDF_RF(m, SNR1, A_SNR_RF));
end

