Atest=[0 1;0 0]
Btest = [0;1]
Ctest = [1 0]
Dtest = 0
desired_vp_k = [-5,-10]

k = place(Atest,Btest,desired_vp_k)


%% adding a feedback integrator 
Aaug = [Atest [0;0];-Ctest 0]
Baug = [Btest;0]
desired_vp_i = [-50,-10,-15]
KKK = place(Aaug,Baug,desired_vp_i)

%% adding an observer 

desired_vp_o = [-50 ,-60]
L= place(Atest',Ctest',desired_vp_o)     %% an observer of x2,x1
L = L'                                 %% an observer of x2,x1
% Aaugo = [Atest [0;0];-Ctest 0]
% Baugo = [Btest ; 0]
% L = place(Aaugo',Baugo'

