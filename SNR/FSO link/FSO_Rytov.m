function Rytov = FSO_Rytov(lamda,Cn,phi)
%Cn= 2*1.e-13; % the ground level turbulence
Hv=1.5; % vehicle height
H = 300000; % Orbit altitude
v_wind = 21;
% phi = pi/4;
Rytov = sqrt(2.25*(2*pi/lamda)^(7/6)*1/(cos(phi)^(11/6))*integral(@(x)((0.00594*(v_wind/27)^2*(10^(-5)*x).^10....
.*exp(-x/1000) +2.7*10^(-16).*exp(-x/1500)+ Cn.*exp(-x/100)).*(x-Hv).^(5/6)),Hv,H)); 
end
%function Rytov = FSO_Rytov(Cn,lamda,d)
%Rytov = 1.23*Cn*(2*pi/lamda)^(7/6)*d^(11/6);