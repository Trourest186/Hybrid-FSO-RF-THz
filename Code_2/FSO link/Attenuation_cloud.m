function result = Attenuation_cloud(L)
% L: CLWC
deta_h = 2*10^3; %cloud coverage ->>>>>>>> Consider "m"
theta = 0.3*10^-3; %satellite elevation angle
%L = 16*10^-3; % g/m^3
pw = 1;  % g/m^3
lambda = 1550;
Ha = 20*10^3;
Hu = 50;
zenith = pi/3;
La = (Ha - Hu)/sec(zenith);

r = 2.67; %um
Nc = L / ((4/3)*pi*(r^3)*pw*(10^-6));
V = 1.002/((L*Nc)^0.6473)
q = size_distribution(V)

cloud_coef1 = ((3.91/V)*(lambda/550))^(-q);
cloud_coef = cloud_coef1/((10^4)*log10(exp(1))) % m^-1
% result = exp((-cloud_coef*deta_h/sin(theta)));
result = exp((-cloud_coef*La));
end

