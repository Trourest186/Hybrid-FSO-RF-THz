%------------parameters-----------------------------------------------------

C=100*10^6;
RTT=100*10^(-3);
alpha=10^6/(8*1000);
beta=0.5;
N=100; %The total number of state of TCP CUBIC
Da=1000; %bytes in one segment
W=C*RTT/(8*Da);
K=1000;
mu=-2:0.1:0;
tput=zeros(length(mu),1);
lamda =zeros(length(mu),1);
%---------------------Initiate lamda---------------------------------------
for l=1:1:length(mu)
    lamda(l)=10^mu(l);
end


for i=1:length(mu)
    x=zeros(K,1);
    x(1)=0;
    tloss=exprnd(1/lamda(i),K,1);
    t=zeros(K,1);
    s=zeros(K,1);
    D=zeros(K,1);
    for k=1:K
        D(k)= nthroot((W-x(k))/(alpha), 3) +nthroot ((1-beta)*x(k)/(alpha),3);
        t(k)=min(tloss(k),D(k));
        x(k+1)=alpha*(t(k)-nthroot((1-beta)*x(k)/(alpha),3))^3 +x(k) ;
        L=nthroot((1-beta)*x(k,1)/(alpha),3);
        s(k)=x(k)*t(k) +(alpha/4)*((t(k)-L)^4 -L^4);
        
               
    end
   
    T=0;
    S=0;
    
    for m=1:K
        T=T+t(m);
        S=S+s(m);
    end
    R=S/(T);
    tput(i) = R/(W);
    
end
semilogx(lamda,tput,'ko-');
hold on;
xlabel('Loss rate');
ylabel('Normalized throughput');
grid on;                    
          
                
               
        
        
        
        
        
        
        
        
   
        
    
    
    