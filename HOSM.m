clc 
clear
x1(1) = 2;
x2(1) = 1 ;
h= 0.01 ;
a=1;
b= 1 ;
K1 = 10 ;
K2 = 11 ;
K3 = 12 ;
K4 = 100 ;
u(1) = 0 ;
t = 0:h:50 ;
for n=1 : length(t)
    s(n) = x1(n);
    phi_1(n) = x1(n) ;
    phi_2(n) = x2(n)+sin(x1(n));
    phi_3(n) = a*x1(n)*x1(n) +(1+b)*u(n)+x2(n)*cos(x1(n))+sin(x1(n))*cos(x1(n));
    x1_dot(n) = x2(n)+sin(x1(n)) ;
    x2_dot(n)  = a*x1(n)*x1(n)+(1+b)*u(n);
    v(n) = (1/1+b)*(-a*2*x1(n)*x1_dot(n)+x1_dot(n)*x2(n)*sin(x1(n))-x1_dot(n)*cos(x1(n))*cos(x1(n))+x1_dot(n)*sin(x1(n))*sin(x1(n))-x2_dot(n)*cos(x1(n))-K1*phi_1(n)-K2*phi_2(n)-K3*phi_3(n)-K4*sign(phi_3(n)));
    u(n+1) = u(n) + h*v(n);
    x1(n+1) = x1(n) + h*(x2(n)+sin(x1(n))) ;
    x2(n+1) = x2(n) + h*(a*x1(n)*x1(n)+(1+b)*u(n)) ;
end
figure(1)
plot(t,x1(1:end-1),'r')
figure(2)
plot(t,x2(1:end-1),'g')
figure(3)
% plot(t,u,'b')