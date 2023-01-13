f = @(x,y) y.*x.^2;
g = @(x) sqrt(x);
fun = integral2(f, 0, 4, 0, g);
% CDF
% CDF = integral2(@(x,y) (((beam.^2).*(y.^((beam.^2)-1)))./((AT.*hct).^(beam.^2))).*((x.^(-beam^2)).*(alpha*(u^u).*((x./beta).^(alpha*u-1)).*exp(-u.*((x./beta).^alpha)))./(beta*gamma(u))) ,y/(AT*hct),Inf,0,thres);
