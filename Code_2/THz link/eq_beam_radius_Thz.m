function [result, vh] = eq_beam_radius_Thz()
%===============Parameters===============
% D = 0; % Propagation distance
theta = 0.3*10^-3; % Divergence angle
lambda = 1550*10^-9; % THz wavelength
k = 2*pi/lambda;

wo_Thz = (2*lambda)/(pi*theta); % The beam waist

zenith = pi/3;
hv = 50; % m - height of vehicle
H = 20*10^3; % HAP altitude
D = (H-hv)/sec(zenith);

F0 = 500; %m  radius of curvature

sigma_R = FSO_Rytov();
%=================End=====================
% 
% poF = (0.55*Hufnagel_Vally(v_wind, D, C_0)*((4*pi^2)/(lambda^2))*D)^(-3/5); % Coherence length
% ef = ( 1+2*wo_Thz^2)/(poF^2);
theta0 = 1- (D/F0);
delta0 = (2*D)/(k*wo_Thz^2);
delta1 = delta0/((theta0^2)+(delta0^2));

wz_Thz = wo_Thz*sqrt(((theta0^2)+(delta0^2))*(1+1.625*(sigma_R^(12/5))*delta1));

at = 10*10^-2; % Optical detector radius
vh = sqrt(pi/2)*at/wz_Thz;

result = nthroot((wz_Thz^2)*((sqrt(pi)*erf(vh))/(2*vh*exp(-vh^2))),2);
end

