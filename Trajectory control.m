clear
clc

Vmax=1;
Amax=2;
L=1.2;% L should be bigger than v_max^2/Amax

Ts=Vmax/Amax;
Tf=((L*Amax)+(Vmax*Vmax))/(Amax*Vmax);
dt=0.005;
time=0:dt:Tf;
sigma=zeros(1,size(time,2));
dsigma=zeros(1,size(time,2));
i=1;

for t=0:dt:Tf

if(t<=Ts)
    sigma(1,i)=Amax*t*t/2;
    dsigma(1,i)=Amax*t;
elseif (t>Ts) && (t <= Tf-Ts)
    sigma(1,i)=(Vmax*t)-((Vmax*Vmax)/(2*Amax));
    dsigma(1,i)=Vmax;
elseif (t>Tf-Ts) && (t <= Tf)
    sigma(1,i)=(-Amax*(t-Tf)*(t-Tf)/2)+(Vmax*Tf)-(Vmax*Vmax/Amax);
    dsigma(1,i)=Amax*(Tf-t);
end
    
   
 i=i+1;   
end

figure
plot(time,sigma)
figure
plot(time,dsigma)



