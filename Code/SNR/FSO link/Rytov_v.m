function y = Rytov_v(k, hv, H, phi1, C_0)
v_wind = 21;
% C_0 = 2*1.e-13;
% phi = pi/4;
% phi1 = pi/4;
tmp = @(h) Hufnagel_Vally(v_wind, h, C_0).*(h-hv).^(5/6);
% giang = 2.25*(k^(7/6))*(1/(cos(phi)^(11/6)))* integral(tmp, hv, H);
giang = 2.25*(k^(7/6))*(sec(phi1)^(11/6))* integral(tmp, hv, H);
y = sqrt(giang);
end

