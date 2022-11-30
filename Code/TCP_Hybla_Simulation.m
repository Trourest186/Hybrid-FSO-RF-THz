clear all;
clc;

%------------parameters-----------------------------------------------------
C=500*10^6;
RTT=150*10^(-3);
RTT0 = 25*10^-3;
alpha=0.4;
beta=0.9;
ph = RTT/RTT0;


N=100; %The total number of state of TCP CUBIC
Da=1460; %bytes in one segment
W=C*RTT/(8*Da);
K=1000;
% SNR = 0:1:20;
% Pe = [0.999999532	0.99999495	0.999944	0.999551569	0.997369278	0.988507364	0.961834979	0.901253115	0.795176513	0.648443118	0.483809533	0.329774969	0.205505725	0.118713625	0.063909832	0.0322979	0.015413036	0.006977893	0.003008113	0.00123878	4.89E-04]';
% mu=-2:0.1:0;
% tput=zeros(length(mu),1);
% lamda =zeros(length(mu),1);
% mu=-8:0.8:0;
% Pe = zeros(length(mu),1);
% for l=1:1:length(mu)
%     Pe(l,1)=10^mu(l);
% end
Pe =[0.003621358	0.008032641	0.013966351	0.020973181	0.028645852	0.03666317	0.044788136	0.052853109	0.06074366]';
% mu=-2:0.1:0;
% tput=zeros(length(mu),1);
% lamda =zeros(length(mu),1);
C_0 =5*10^-15 :3.6875*10^-14:3*10^-13;
lamda = zeros(length(Pe),1);
tput=zeros(length(Pe),1);



%---------------------Initiate lamda---------------------------------------
% for l=1:1:length(Pe)
%     lamda(l)=10^mu(l);
% end


for i=1:length(Pe)
%     Wmax = nthroot(((1-exp(-Pe(i,1)*(W^(4/3))*C_cubic))/(Pe(i,1)*C_cubic)),4/3);
%     lamda(i,1) = nthroot(C_cubic/(beta*Wmax),3);
    Wmax =sqrt(((8*ph^2)*(1-exp(-(Pe(i,1)*3*W^2)/(8*ph^2))))/(3*Pe(i,1)));
    lamda(i,1) = (2*ph^2)/(RTT*Wmax);
    x=zeros(K,1);
    x(1)=0;
    tloss=exprnd(1/lamda(i,1),K,1);
    t=zeros(K,1);
    s=zeros(K,1);
    D=zeros(K,1);
    for k=1:K
        D(k)= ((W-beta*x(k))/ph^2)*RTT;
        % (W-beta*x(k))/ph^2
        t(k)=min(tloss(k),D(k));
        x(k+1)= ((ph^2)*t(k)/RTT) + beta*x(k);
%         L=nthroot((beta)*x(k,1)/(alpha),3);
        s(k)=(((ph*t(k))^2)/(2*RTT)) + beta*x(k)*t(k);
        
               
    end
   
    T=0;
    S=0;
    
    for m=1:K
        T=T+t(m);
        S=S+s(m);
    end
    R=S/(T);
    tput(i) = (R/(W))*C; % Nhân với C
    
end
tput = [63182047.01	42944689.99	32485647.88	29514329.47	27738358.7	24961803.99	24876382.44	24795921.16	24720071.82]';
plot(C_0,tput,'o');
hold on;
xlabel('Loss rate');
ylabel('Normalized throughput');
grid on;                    
          
                
               
        
        
        
        
        
        
        
        
   
        
    
    
    