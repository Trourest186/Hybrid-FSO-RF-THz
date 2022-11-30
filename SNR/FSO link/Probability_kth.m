function y = Probability_kth( alpha, beta, SNR_1, SNR_2, A_SNR )
y = PDF_FSO(alpha, beta, SNR_2, A_SNR) - PDF_FSO(alpha,beta,SNR_1,A_SNR);
end

