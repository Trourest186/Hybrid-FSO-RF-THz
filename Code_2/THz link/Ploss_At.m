function h1_T = Ploss_At(L)
Gt = 10^(45/10); % sub-Thz antenna gain
Gr = 10^(45/10);
thetaT = 0.3*10^-3; % divergence angle

% =========================================================================
% Lp: the path loss
c = 3*10^8;
deta_h = 2; %cloud coverage ->>>>>>>> Consider "m"
f_Thz = 120*10^9; 
zenith = pi/3;
hv = 50; % m - height of vehicle
H = 20*10^3; % HAP altitude
DT = (H-hv)/sec(zenith)
Lp = c/(4*pi*f_Thz*DT)

% =========================================================================
% La: molecular absorption loss with frequency bands of 100-275GHz
% u: the volume mixing  ratio of water
u = 0.0157;
A = 5.159*(10^-5)*(1-u)*(-6.65*(10^-5)*(1-u)+0.0159);
B = (-2.09*(10^-4)*(1-u)+0.05)^2;
C = 0.1925*u*(0.1350*u+0.0318);
D = (0.4241*u + 0.0998)^2;
p1 = 3.96*10^-2; % cm^-1
p2 = 6.11*10^-2; % cm^-1
a = 0.915*10^(-112);
b = 9.42;

y1 = A/(B+((f_Thz/(100*c)) - p1)^2);
y2 = C/(D+((f_Thz/(100*c)) - p2 )^2);
g = (u/0.0157)*((2*10^-4)+a*f_Thz^b);
K = y1 + y2 + g;

La = exp(K*DT)

% =========================================================================
% Lc: cloud attenuation
theta = 300/273;
f_Thz1 = 120;
fp = (20.20-146*(theta-1)+316*(theta-1)^2)
fs = 39.8*fp;
epsilon2 = 3.52
epsilon0 = 77.66 + 103.3*(theta-1)
epsilon1 = 0.0671*epsilon0

ep2 = ((f_Thz1*(epsilon0-epsilon1))/(fp*(1+(f_Thz1/fp)^2))) + ((f_Thz1*(epsilon1-epsilon2))/(fs*(1+(f_Thz1/fs)^2)))    
ep1 = ((epsilon0-epsilon1)/(1+(f_Thz1/fp)^2)) + ((epsilon1-epsilon2)/(1+(f_Thz1/fs)^2)) + epsilon2
X = (2+ep1)/ep2;
cloud_coef1 = (L*0.819*f_Thz1)/(ep2*(1+X^2))
cloud_coef = cloud_coef1/((10^4)*log10(exp(1))) % m^-1
% cloud_coef = cloud_coef1*0.23
Lc = 10^((-cloud_coef*deta_h)/(10*sin(thetaT)))
% =========================================================================
h1_T = Gt*Gr*Lp*La*Lc
% h1_T = 20
end

