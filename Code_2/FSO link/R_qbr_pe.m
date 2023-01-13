function [result, vF] = R_qbr_pe()
zenith = pi/3;
hv = 50; % m - height of vehicle
H = 20*10^3; % HAP altitude
D = (H-hv)/sec(zenith);

theta_jt = 30*10^-6;
sigma_jt = sqrt(theta_jt*D);

[tmp1, tmp] = eq_beam_radius();

result = tmp1/(2*sigma_jt);
vF = tmp;
end

