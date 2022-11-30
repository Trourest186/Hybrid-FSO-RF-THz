%function sigma_s = FSO_sigma_s(Cn,lamda,d,D)
%sigma_R= FSO_Rytov(Cn,lamda,d);
%h =  sqrt(2*pi*D^2/(lamda*4*d));
%sigma_s = exp(0.49*sigma_R/(1+0.18*h^2+0.56*sigma_R^(12/5))^(7/6) + 0.51*sigma_R/(1+0.9*h^2+0.62*sigma_R^(5/6))^(5/6))-1;
%end

function sigma_s = FSO_sigma_s(lamda,Cn,phi)
sigma_R= FSO_Rytov(lamda,Cn,phi);
D = 0.01; %aperture diameter
H= 300000;
h =  sqrt(2*pi*D^2/(lamda*4*H));
sigma_s = sqrt(exp(0.49*sigma_R^2/(1+0.18*h^2+0.56*sigma_R^(12/5))^(7/6) + 0.51*sigma_R^2/(1+0.9*h^2+0.62*sigma_R^(5/6))^(5/6))-1);
end
