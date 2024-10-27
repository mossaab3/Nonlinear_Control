function dx = HGO( t,x )
%HGO Summary of this function goes here
%   Detailed explanation goes here
A=[0 1;-1 -1];
C= [1 0];
u2 = -x(1)-x(2);
g = [sin(x(1));x(1)^2*u2];
H=place(A',C',[-1 -2]); 
H=H'
xdot = A*[x(1);x(2)]+g;
xhdot = A*[x(3);x(4)]+ g+ H*C*([x(1);x(2)]-[x(3)-x(4)])
dx = [xdot;xhdot]


end

