function y = CDF_RF(m, SNR, A_SNR)
% y = (1/gamma(m))*gammainc((m*SNR/A_SNR), m, 'upper');
func = @(x)(((m^m).*x.^(m-1))./((A_SNR^m)*gamma(m))).*exp(-m.*x./A_SNR);
y = integral(func,0, SNR);
% Both X and A must be real, and A must be nonnegative gammainc(X,A)
end

 