%% system variables
a=1;
u=0
a_hat(1) = 0.2;
lamda = 1;
gamma = 2;
%% iteration variables

T = 0.01 
iteration_number = 200 
x(1)=1
 V = 1

for i=2:1:iteration_number
    %% system iteration 
    u = -a_hat(i-1)*x(i-1)^2 -lamda*x(i-1)  +1
    x(i) = x(i-1) + T*(a*x(i-1)^2 + u) 
    
    a_hat(i) = a_hat(i-1) +T*(x(i)^3/gamma)
    
    
end
t=0:T:T*(iteration_number-1)
plot(t,x)
hold on 
plot(t,a_hat,'r')