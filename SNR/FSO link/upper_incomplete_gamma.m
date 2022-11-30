function result = upper_incomplete_gamma(a,x)
result = gamma(a)*gammainc(x, a, 'upper');
end

