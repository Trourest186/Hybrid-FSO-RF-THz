
C=100*10^6;
RTT=100*10^(-3);
alpha=10^6/(8*1000);
beta=0.5;
N=100; %The total number of state of TCP CUBIC 
Da=1000;% bytes in one segment
W=C*RTT/(8*Da);
mu=-2:0.1:0;
tput=zeros(length(mu),1);
lamda =zeros(length(mu),1);



%=======================================
for l=1:1:length(mu)
    lamda(l,1)=10^mu(l);
end
for k=1:1:length(mu)
   T=zeros(N,N);
   S=zeros(N,N);
   A=zeros(N,N);
   B=zeros(N,1);
   F=zeros(N,1);
   F(N,1)=1;
%Stationary Distribution
   for i=1:N
        for j=1:N
            a=(i-0.5)*(W/N);
            L=(((1-beta)*a)/(alpha))^(1/3);    
            t=max(0,nthroot(((j-0.5)*(W/N)-a)/(alpha),3) + nthroot(((1-beta)*a)/(alpha),3));
            T(i,j)=t;
            s=a*t + (alpha/4)*((t-L)^4-L^4);
            S(i,j)=s;
              if j<beta*(i-0.5)
                 p=0;
              else
                 p=exp(-lamda(k,1)*(max(0,nthroot(((j-1)*(W/N)-a)/(alpha),3)+ nthroot(((1-beta)*a)/(alpha),3))))- exp(-lamda(k,1)*(nthroot((j*(W/N)-a)/(alpha),3) + nthroot(((1-beta)*a)/(alpha),3)));           
              end  
           A(i,j)=p;
         end
   end
   for g=1:N
    A(g,N)=1-sum(A(g,[1:N-1]));
   end
   A_p1=A;
   for z=1:N
    A(z,z)=A(z,z)-1;
   end
   H=A';
   for m=1:N
    H(N,m)=1;
   end
   B=inv(H)*F;
  %Throughput
   AW1=0;
   AT1=0;
   for i=1:N
       for j=1:N
        AW1=AW1+B(i,1)*A_p1(i,j)*S(i,j);
        AT1=AT1+B(i,1)*A_p1(i,j)*T(i,j);
       end
   end
 tput(k,1)=(1/W)*(AW1/AT1);
 
end
semilogx(lamda,tput,'bs-');
hold on;
xlabel('Loss rate');
ylabel('Normalized throughput');
grid on;

    

