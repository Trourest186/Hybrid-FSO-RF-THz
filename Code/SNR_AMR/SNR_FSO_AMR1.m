function FSO  = SNR_FSO_AMR1(j)
% BER_0 = 10^-5;


%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% AMR1

% tmp = erfc(((2^j)*j*BER_0)/((2^j)-1));
% FSO = (2*((2^j)-1)*((2^(j+1))-1))/(3*tmp^2);

% AMR2
L = 2;
l = 1080;
FER_0 = 10^-2;
BER_0 = FER_0^(1/(L+1));

tmp = erfc(((2^j)*j*BER_0)/(((2^j)-1)*l));
FSO = (2*((2^j)-1)*((2^(j+1))-1))/(3*tmp^2);
end

