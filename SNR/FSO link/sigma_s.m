function y = sigma_s(k, hv, H, phi1, C_0)
d= 1725;
D = 0.02;
h = sqrt((k*D^2)/(4*d));
tmp = Rytov_v(k, hv, H, phi1, C_0);
giang = exp(((0.49*tmp^2)/((1+(0.18*(h^2)) +0.56*tmp^(12/5))^(7/6))) + ((0.51*tmp^2)/((1+(0.9*(h^2)) +(0.62*(h^2))*((tmp)^(5/6)))^(5/6)) )) -1;
y = sqrt(giang);
end

