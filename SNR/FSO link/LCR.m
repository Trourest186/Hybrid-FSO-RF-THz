function LCR1 = LCR(alpha, beta, sigma_s,SNR_av,thres, phi )


% phi= pi/4; % Zenith angle
H =300000; % satellite altitude
v_wind =21;
lamda = 1550*10^-9; % m
% k = 2*pi/lamda;
t0= sqrt(lamda*H*sec(phi))/v_wind;
v0 = 1/(pi*t0*sqrt(2)); %Quasi-frequency
% hv = 1.5;
% 
% [alpha, beta] = alpha_beta(k, hv, H);
% sigma_s(k, hv, H);
LCR1 = integral(@(x)(sqrt(pi)*sigma_s*v0*alpha^alpha*beta^beta/(gamma(alpha)*gamma(beta)))...
    .*(sqrt(thres/SNR_av))^(beta-0.5).*x.^(alpha-beta-1.5).*sqrt(sqrt(thres/SNR_av)+x.^2).*exp((-alpha).*x-(beta*sqrt(thres/(SNR_av)))./x),0,500);


end

