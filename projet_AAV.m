%% Parameters

clear all, clc
syms a b real
a = -1;
b= 1;
n = 2;

%% Linearisation
% x10 = pi/2+0.4; % Stable 
x10 = 0; % Instable 
% x10 = pi/2; % limite de la stabilité

A = [cos(x10) 1; 2*a*x10 0];
B = [0 1+b]';
C = [1 0];

% L = ss(A, B, C, 0);
% [num_i, den_i] = ss2tf(A, B, C, 0)
% step(A, B, C, 0)
% hold on 

% Stability
vp = eig(A)

% Controllability
controlable = rank (ctrb(A,B)) == n

% Observability
observable = rank (obsv(A,C)) == n

% pole placement
K = place(A, B, [-1,-2])

%Transfer function 
[num, den] = ss2tf(A-B*K, B, [1, 0; 0 1], [0; 0])

% Step response 
% step(A-B*K, B, [1, 0; 0 1], [0; 0])

% grid on

%% Backstepping
lambda = 1

%% Sliding mode first order
k = 1

%% Sliding mode second ordre
k1 = 1
k2 = 1

%% Commande adaptative
gamma1 = 1000
gamma2 = 1000

a = 1
b = 0.25
%% Observateur sans commande
a = 1;
b= 1;
%L = place(A, C', [-1 -5])
L_sliding = 0.1
L = 1

%% Observateur commande backstepping
L_back = 10
L_sliding_back = 10

%% Observateur commande lin
L_lin = 5
L_d_lin = 2

L_sliding_lin = 10

%% Observateur commande adaptative





