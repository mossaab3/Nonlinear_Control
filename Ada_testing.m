clear all; clc
%% system 
theta = 0.5
U = 0
V=1
%% adaptive algorithm
gamma = 0.5
theta_h(1) = 0 
T=0.1 
iteration_number =300
k(1) = 0
x0 = 5
x(1) = x0
E(1)=0
for i=2:1:iteration_number
    x(i) = x(i-1) + T*(theta*x(i-1)+U)
    %% adaptatif direct 
    
%     k(i) = k(i-1) + T*x(i-1)^2           adaptatif direct 
%     U = -(k(i)+1)*x(i)

    %% adaptatif indirect 
    yi = theta*x(i) + U 
    yihat = theta_h(i-1)*x(i) + U
    E(i) = yi-yihat 
    
    theta_h(i) = theta_h(i-1) + gamma*E(i)*x(i)    %%% the update of Theta
    U = -(theta_h(i) + 2)*x(i) + V                 %%% the control to stabilize and to follow a reference V 
    
end
t=0:T:T*(iteration_number-1);