clear all; clc
%% parameters
a1 = 18
a2 = 1
b=2

%% system 
A=[0 1;a1 a2]
B=[0;b]
C=[1 0]


U=0
V = 2
X0 = [0;0.5]
iteration_number = 200;
T= 0.1
X=[]

e = 0
desired_vp = [-1,-2]
k = place(A,B,desired_vp)
gamma1 = 0.5; gamma2 = 0.5;
gamma = [gamma1 0;0 gamma2];
a0 = [0;0]
Theta(:,1) = a0
%% implementing an integrator 
Aaug = [A [0;0];C 0]
Baug = [B;0]
Kaug = place(Aaug,Baug,[-2,-3,-4])
K =[Kaug(1),Kaug(2)]
ki = Kaug(3)
E(1) = 0
X(:,1)=X0
x1(1) = X0(1)
x2(1) = X0(2)
for i=2:1:iteration_number
    %% system 
    X(:,i) = X(:,i-1) + T*(A*X(:,i-1)+B*U)
    x1(i) = X(1,i)
    x2(i) = X(2,i) 
     e = e + T*( x1(i) - V)      %%% control using feedback and integrator
     U = -K*[x1(i);x2(i)] -ki*e + V

    %% AAP algorithm
    yi = a1*x1(i)+a2*x2(i)                               %a1*x1(i+1)+a2*x2(i+1)+b*U              %% chosen predicteur
    yihat = X(:,i)'*Theta(:,i-1)              
    E(i) =  (yi-yihat)                            %% error 
    
    Theta(:,i) = Theta(:,i-1) + 0.5*(gamma*E(i)*X(:,i))
    
    
    
    

end
x1 = x1'
x2 = x2'
t=0:0.1:T*(iteration_number-1)
