function LCR1 = FSO_level_crossing_rate(lamda,Cn,SNR_av,thres, phi)
Rytov= FSO_Rytov(lamda,Cn,phi);
sigma_s=FSO_sigma_s(lamda,Cn,phi);
alpha= (exp(0.49*(Rytov^2)/(1+1.11*Rytov^(12/5))^(7/6))-1)^(-1);
beta = (exp(0.51*(Rytov^2)/(1+0.69*Rytov^(12/5))^(5/6))-1)^(-1);
% disp("Alpha");
% disp(alpha);
% disp("beta");
% disp(beta);
% 
% phi= pi/4; % Zenith angle
H =300000; % satellite altitude
v_wind =21;
t0= sqrt(lamda*H*sec(phi))/v_wind;
v0 = 1/(pi*t0*sqrt(2)); %Quasi-frequency
LCR1 = integral(@(x)(sqrt(pi)*sigma_s*v0*alpha^alpha*beta^beta/(gamma(alpha)*gamma(beta)))...
    .*(sqrt(thres/SNR_av))^(beta-0.5).*x.^(alpha-beta-1.5).*sqrt(sqrt(thres/SNR_av)+x.^2).*exp((-alpha).*x-(beta*sqrt(thres/(SNR_av)))./x),0,Inf);

end

%function LCR1 = FSO_level_crossing_rate(sigma_s,Rytov,n_factor,t0,SNR_av,thres)
%alpha= (exp(0.49*Rytov/(1+1.11*Rytov^(12/5))^(7/6))-1)^(-1);
%beta = (exp(0.51*Rytov/(1+0.69*Rytov^(12/5))^(5/6))-1)^(-1);
%v0 = 1/(pi*t0*sqrt(4)); %Quasi-frequency
%LCR1 = integral(@(x)(sqrt(pi)*sigma_s*v0*alpha^alpha*beta^beta/(gamma(alpha)*gamma(beta)))...
 %   .*(sqrt(thres/(n_factor^2*SNR_av)))^(beta-0.5).*x.^(alpha-beta-1.5).*sqrt(sqrt(thres/(n_factor^2*SNR_av))+x.^2).*exp(-alpha.*x-(beta*sqrt(thres/(n_factor^2*SNR_av)))./x),0,500);

%end