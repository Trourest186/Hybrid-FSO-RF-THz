function result = BER_R_new(N,x)
% x : SNR_FSO
result = ((N-1)*(erfc(sqrt((3*x)/(2*(N-1)*(2*N-1))))))/(N*log2(N)) ;
end

