%% system 
a= 2
b= 2
U = 0
V = 0

a_hat(1) = 0
b_hat(1) = 0
gamma1 = 0.5
gamma2 = 0.5
E(1) = 0

iteration_number = 200
T=0.1 
x1(1) = 2
x2(1) = 0
U(1)=0
% X(:,1) = [x10;x20]
for i=2:1:iteration_number
    U(i) = 1/(b+1) * (-a*x1(i-1)^2-(x2(i-1)+sin(x1(i-1)))*(cos(x1(i-1))+3)-2*x1(i-1)) + V
    %% system iteration 
    x1(i) = x1(i-1) + T*(x2(i-1)+sin(x1(i-1)))
    x2(i) = x2(i-1) + T*(a*x1(i-1)^2+(1+b)*U(i))
    y = x1(i)
%     %% AAP : finding the error
    yi = a*x1(i)^2+(1+b)*U(i)
    yi_hat = a_hat(i-1) *x1(i)^2 + b_hat(i-1)*x2(i)^2
    E(i) =  0.5*( yi-yi_hat)
%     %% update the parameters
    a_hat(i) = a_hat(i-1) + gamma1*E(i)*x1(i)^2
    b_hat(i) = b_hat(i-1) + gamma2*E(i)*U(i)
    
end
t=0:T:T*(iteration_number-1);
% plot(t,x1)
% hold on 
% plot(t,x2)
% plot(t,E,'r')
plot(t,a_hat)
hold on 
plot(t,b_hat)
legend('a_h','b_h')
% plot(t,x1)
% hold on 
% plot(t,x2)
% legend('x1','x2')