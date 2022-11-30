clear all;
clc;
disp("LEFT");

% y = PDF_FSO( alpha, beta, SNR, SNR_a );
% disp(y);


% FSO
v_wind = 21; % m/s
% C_0 = 10^-15; % m ^-2/3
lamda = 1550*10^-9; % m
k = 2*pi/lamda;
% zenith = 55*pi/180; % radian
% h
 
% 
% [alpha,beta] = alpha_beta(k, hv, H);
% sig = sigma_s(k, hv, H);

% FSO
cf = 2000; % frames/slot 
Lf = 1784; % bits
R = 1*10^9; % bps
T_f = Lf/R;
t_av = 3.568e-03;

% RF
Lf1 = 1784;
cr1 = 2;
R1 = 150*10^6;
T_f1= Lf1/R1;
t_av1 = T_f1*cr1;
% disp(t_av);
m = 1.5;
fd = 50*10^3;

% SNR1_dB             = -10; %starting threshold (dB) 
% SNR1                = 10^(SNR1_dB/10);

func = @(x) (LCR(alpha, beta, sig, 10^(SNR_av/10),10.^(x./10)) +LCR(alpha, beta, sig,10^(SNR_av/10),SNR1)) - t_av;
% y2 = LCR(alpha, beta, sigma_s,SNR_av,1 );;
% % disp(y2);
% [result, N] = RF_BER_av(m, fd, t_av, SNR_av, SNR_thres);
% FER = zeros(1,length(result));
% for i= 1:1:length(result)
% FER(i) = RF_FER_av(result(i));
% end
% y = zeros(5);
% disp("G");
% SNR_av = 5;
% SNR_av = 15 ;

% y = zeros(length(SNR_av), 1);
% for  i=1:1:14
% SNR_av = 14;
% SNR_av = 0:1:40;  
% SNR_thres = zeros(length(SNR_av),1);
% N = zeros(length(SNR_av), 1);
% y = 0;
% for i=1:1:length(SNR_thres)
% % z = zeros(length(SNR_av),1);
% % for i =1:1:length(SNR_av
% y = SNR_FSO(lamda, hv, H, t_av, 10);
% disp("Giang");
%     [y, N(i)] = SNR_FSO(lamda, hv, H, t_av, SNR_av(i));
% end

% y= Pt_FSO_RF(1,40);
% z = Pt_FSO_RF(15, 
% y = FSO_BER_av(lamda, hv, H, t_av, 20);
% end

% SNR_thres = [40	40	40	40	40	40	40	40	40	40	40	40	40	40	0.063285828	0.630760193	1.180458069	1.71245575	2.227363586	2.726325989	3.210945129	3.682670593	4.143333435	4.594459534	5.03780365	5.474586487	5.906257629	6.333885193	6.758460999	7.18082428	7.601661682	8.021583557	8.441123962	8.860588074	9.280357361	9.700737	10.12195587	10.54416656	10.96744537	11.39194489	11.81781769];
% SNR_thres = [39.99996185 39.99996185	39.99996185	39.99996185	39.99996185	39.99996185	39.99996185	39.99996185	39.99996185	39.99996185	39.99996185	39.99996185	39.99996185	39.99996185	0.436515808	1.053123474	1.661720276	2.265510559	2.868614197	3.476600647	4.096336365	4.735527039	5.402565002	6.10584259	6.852302551	7.646064758	8.487052917	9.371070862	10.29056549	11.23706818	12.20264435	13.18119049	14.16797638	15.16002655	16.15520477	17.15236664	18.15067291	19.14974213	20.14911652	21.14879608	22.14862823];

% disp(y);
% 
% SNR_av = 0:1:40;  
% y = zeros(1, length(SNR_av));
% for i=1:1:length(SNR_av)
% y(i) = Pt_FSO_RF(SNR_av(i), SNR_thres(i));
% end
% y(isnan(y)) = 0;
% y = y';
% x = [0	0	0	0	0	0	0	0	0	0	0	0	374351937.6	379538348.8	408824503.8	468824503.8	592869429.6	700006660.2	779182116.1	813136675	830222139.6	834994699.5	837040362.8	837533106.2	837815823	837815823	837815823	837815823	837815822.6	837815821.5	837815819.3	837815815.1	837815807.9	837815796.5	837815780.7	837815761.9	837815743.4	837815728.6	837815719.3	837815714.7	837815713.2];
% SNR = 0:1:40;
% SNR_thresx = zeros(length(SNR), 1);
% for i =1:1:length(SNR)
%     SNR_thresx(i) = SNR_thres(lamda, hv, H, t_av, SNR(i));
% en2

% SNR = 20;
% y = SNR_thres(lamda, hv, H, t_av, SNR, pi/4, Cn);		
% % % Pe0 = SNR_FSO(lamda, hv, H, t_av, SNR);																										
% % % Pe= FSO_CSS_prob(lamda, hv, H, t_av, SNR);
% % Pe1 = FSO_BER_av(lamda, hv, H, t_av, SNR);
% % % Pe2 = RF_BER_av(m, fd, t_av1, SNR, y);
% % % Pe3 = RF_CSS_prob(m, fd, t_av, SNR, y);
% result = Pt_FSO_RF(SNR, y, pi/4,Cn );





% y = 0:1:40;
% plot(y,x, '-');
% clear all;
% clc;
% giang = FSO_BER_av(lamda, hv, H, t_av, 15);

hv = 1.5; % m - height of vehicle
H = 600*10^3; % m
Cn = 2.e-13;
SNR = 15;
zenith = pi/4;
phi1 = pi/4;
[alpha,beta] = alpha_beta(k, hv, H, phi1, Cn);
% Pe = zeros(length(SNR), 1);
% for i=1:1:length(zenith)
%     y = SNR_thres(lamda, hv, H, t_av, SNR, zenith, Cn);	
%     y1 = FSO_BER_av(lamda, hv, H, t_av, SNR, zenith, Cn);
% % %     y2 = RF_BER_av(m, fd, t_av1, SNR, y);
% %     y3 = SNR_FSO(lamda, hv, H, t_av, SNR);
% %     y2 = FSO_CSS_prob(lamda, hv, H, t_av, SNR);
%     Pe = Pt_FSO_RF(SNR,y, zenith, Cn);
% end







% C=900*10^6;
% RTT=100*10^(-3);
% alpha=0.4;
% beta=0.2;
% % C=100*10^6;
% % RTT=100*10^(-3);
% % alpha=0.4;
% % beta=0.2;
% % y= Pt_FSO_RF(2,40);
% N=100; %The total number of state of TCP CUBIC 
% Da=1460;% bytes in one segment
% W=C*RTT/(8*Da);
% mu=-8:0.1:0;
% 
% % SNR = 0:1:40;
% % Pe = zeros(length(SNR), 1);
% lamda = zeros(length(Pe),1);
% tput=zeros(length(Pe),1);
% 
% C_cubic = ((4-beta)/4*RTT)*nthroot(beta/alpha,3);
% 
% %=======================================
% % for l=1:1:length(mu)
% %     Pe(l,1)=10^mu(l);
% % end
% % SNR_thres1 = zeros(length(Pe),1);
% for k=1:1:length(Pe)
% %    SNR_thres1(k,1) = SNR_thres(lamda1, hv, H, t_av, SNR(k,1));
% %    Pe(k,1)= Pt_FSO_RF(SNR(k,1),SNR_thres1);
% 
%    Wmax = nthroot(((1-exp(-Pe(k,1)*(W^(4/3))*C_cubic))/(Pe(k,1)*C_cubic)),4/3);
%    lamda(k,1) = nthroot(C_cubic/(beta*Wmax),3);
%    T=zeros(N,N);
%    S=zeros(N,N);
%    A=zeros(N,N);
%    B=zeros(N,1);
%    F=zeros(N,1);
%    F(N,1)=1;
% %Stationary Distribution
%    for i=1:N
%         for j=1:N
%             a=(i-0.5)*(W/N);
%             L=(((beta)*a)/(alpha))^(1/3);    
%             t=max(0,nthroot(((j-0.5)*(W/N)-a)/(alpha),3) + nthroot(((beta)*a)/(alpha),3));
%             T(i,j)=t;
%             s=a*t + (alpha/4)*((t-L)^4-L^4);
%             S(i,j)=s;
%             if j*W/N< (1-beta)*a
%                 p=0;
%             else
%                 p=exp(-lamda(k,1)*(max(0,nthroot(((j-1)*(W/N)-a)/(alpha),3)+ nthroot(((beta)*a)/(alpha),3))))- exp(-lamda(k,1)*(nthroot((j*(W/N)-a)/(alpha),3) + nthroot(((beta)*a)/(alpha),3)));           
%             end  
%            A(i,j)=p;
%          end
%     end
%     for g=1:N
%         A(g,N)=1-sum(A(g,[1:N-1]));
%     end
%     A_p1=A;
%     for z=1:N
%         A(z,z)=A(z,z)-1;
%     end
%     H=A';
%     for m=1:N
%         H(N,m)=1;
%     end
%     B=inv(H)*F;
%     %Throughput
%     AW1=0;
%     AT1=0;
%     for i=1:N
%         for j=1:N
%             AW1=AW1+B(i,1)*A_p1(i,j)*S(i,j);
%             AT1=AT1+B(i,1)*A_p1(i,j)*T(i,j);
%         end
%     end
% %     if k<12
% %         tput(k,1) =1;
% %     else
%         tput(k,1)=((1/W)*(AW1/AT1))*C;
% %     end
%     tput(isnan(tput)) =0;
% end
% % tput(isnan(tput)) = 1;
% semilogx(SNR,tput,'-');
% hold on;
% xlabel('SNR');
% ylabel('Throughput');
% grid on;
% 
%     
% 
% 
