function FER = FER_FSO_AMR1(x)
l = 1200;
FER = l*x;

% t0 = 16;
% Lf = 1200*8;
% sum = 0;
% for i=0:t0
%     % Have RS code
%     tmp = nchoosek(Lf,i);
%     tmp2 =(x^i)*(1-x)^(Lf-i);
%     tmp3 = tmp*tmp2;
%     sum = sum +tmp3;
% end
% % Haven't RS code
% % i=0;
% % tmp = nchoosek(Lf,i);
% % tmp2 =(x^i)*(1-x)^(Lf-i);
% % tmp3 = tmp*tmp2;
% % sum = sum +tmp3;
% FER = 1- sum;
end

