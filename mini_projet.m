%% Les paramètres du modèle
b=3
k1 = 143/(1+b)
k2 = 23/(1+b)

A=[1 1;0 0]
B=[0;1+b]
C=[1 0]
D=0
vp_desired = [-1,-2]
k=place(A,B,vp_desired)

% augmented system
Ae =[A,[0;0];-C 0]
Be = [B ;0]
vp_desired_aug = [-20;-30;-15]
kk = place(Ae,Be,vp_desired_aug)
kp = [kk(1) kk(2)]
ki = kk(3)




