function [a,b] = alpha_beta(k, hv, H, phi1, C_0)
tmp = Rytov_v(k, hv, H, phi1, C_0);
a = (exp((0.49*tmp^2)/((1+ 1.11*tmp^(12/5))^(7/6) )) -1 )^(-1);
b = (exp((0.51*tmp^2)/((1+ 0.69*tmp^(12/5))^(5/6) )) -1 )^(-1);
end

