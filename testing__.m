clear all;clc;
Time_e=0.02     %% temps d'échantillonage
t= 0:Time_e:10;
T = 1/2       %% Wc du filtre = 1/T
U=0.1*sin(80*t) + 1
y(1) = 0
for i=2:1:size(U')
    y(i) = y(i-1) +Time_e/T *(U(i-1)-y(i-1))
end
plot(t,U)
hold on 
plot(t,y)

%% analyse du filtre : 
% s=tf('s') 
% filtre=1/(1+T*s)
% bode(filtre)