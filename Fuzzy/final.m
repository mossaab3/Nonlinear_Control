%% Fuzzy input
% input S
step = 0.01
S = -1:step:1;

lambda = 0.3 

Sp = 1/lambda*S;
Sp(S >= lambda ) = 1;
Sp(S <= 0 ) = 0;

Sn = -1/lambda*S;
Sn(S <= -lambda ) = 1;
Sn(S >= 0 ) = 0;

S0 = -1/lambda*abs(S) + 1;
S0(S <= -lambda ) = 0;
S0(S >= lambda ) = 0;


plot(S,Sp);
hold on
plot(S,Sn);
plot(S,S0);
legend('Positif','Négatif', 'Nul')
grid on

%%  
% input dS
dS = -1:.01:1;

beta = 0.2 

dSp = 1/beta*dS;
dSp(dS >= beta ) = 1;
dSp(dS <= 0 ) = 0;

dSn = -1/beta*dS;
dSn(dS <= -beta ) = 1;
dSn(dS >= 0 ) = 0;

dS0 = -1/beta*abs(dS) + 1;
dS0(dS <= -beta ) = 0;
dS0(dS >= beta ) = 0;


plot(dS,dSp);
hold on
plot(dS,dSn);
plot(dS,dS0);
legend('Positif','Négatif', 'Nul')
grid on
%% Fuzzy output

u = -1:.01:1;

delta = 0.5 

up = 10/delta*u;
up(u >= delta ) = 10;
up(u <= 0 ) = 0;

un = -10/delta*u;
un(u <= -delta ) = 10;
un(u >= 0 ) = 0;

u0 = -10/delta*abs(u) + 10;
u0(u <= -delta ) = 0;
u0(u >= delta ) = 0;


plot(u,up);
hold on
plot(u,un);
plot(u,u0);
legend('Positif','Négatif', 'Nul')
grid on

%% Rules 
S_ = 0.5
dS_ = 0.1

it_S = fix(S_/ step)
it_dS = fix(dS_/ step)

% R1 si S>0 et dS> 0 alors u = up
alpha1_ = Sp(it_S)*dSp(it_dS);
% R2 si S>0 et dS< 0 alors u = up
alpha2_ = Sp(it_S)*dSn(it_dS);
% R3 si S>0 et dS= 0 alors u = u0
alpha3_ = Sp(it_S)*dS0(it_dS);

% R4 si S=0 et dS> 0 alors u = u0
alpha4_ = S0(it_S)*dSp(it_dS);
% R5 si S=0 et dS< 0 alors u = u0
alpha5_ = S0(it_S)*dSn(it_dS);
% R6 si S=0 et dS= 0 alors u = u0
alpha6_ = S0(it_S)*dS0(it_dS);

% R7 si S<0 et dS> 0 alors u = un
alpha7_ = Sn(it_S)*dSp(it_dS);
% R8 si S<0 et dS< 0 alors u = un
alpha8_ = Sn(it_S)*dSn(it_dS);
% R9 si S<0 et dS= 0 alors u = u0
alpha9_ = Sn(it_S)*dS0(it_dS);


ufinal_ = ((alpha1_+ alpha2_)*up + (alpha3_ + alpha4_ + alpha5_ + alpha6_ +alpha9_)*u0 + (alpha8_+ alpha9_)*un);

sumalpha_ = (alpha1_+ alpha2_ + alpha3_ + alpha4_ + alpha5_ + alpha6_ + alpha8_ + alpha7_ +alpha9_);

ufinal = ufinal_/sumalpha_;

plot(u,ufinal)

commande = sum(u.*ufinal)/sum(abs(u))
grid on





%% test fuzzy
% input S
%S = -range:step:range;
S_ = 0.1
dS_ = 0.1
range = 4
lambda = 0.4
beta = 0.4
delta = 0.4

Sp = 1/lambda*S_;
if(S_ >= lambda)
    Sp = 1;
elseif(S_ <= 0 )
    Sp = 0;
end

Sn = -1/lambda*S_;
if(S_ <= -lambda ) 
    Sn = 1;
elseif(S_ >= 0 )
    Sn = 0;
end

S0 = -1/lambda*abs(S_) + 1;
if(abs(S_) <= -lambda )
    S0 = 0;
end
 
% input dS
dS = dS_

dSp = 1/beta*dS;
if(dS >= beta )
    dSp= 1;
elseif(dS <= 0 )
    dSp= 0;
end 

dSn = -1/beta*dS;
if(dS <= -beta )
    dSn = 1;
elseif(dS >= 0 )
    dSn = 0;
end

dS0 = -1/beta*abs(dS) + 1;
if (dS <= -beta ) 
    dS0= 0;
end

% Fuzzy output

u = -1:.01:1;

delta = 0.5 

up = 10/delta*u;
up(u >= delta ) = 10;
up(u <= 0 ) = 0;

un = -10/delta*u;
un(u <= -delta ) = 10;
un(u >= 0 ) = 0;

u0 = -10/delta*abs(u) + 10;
u0(u <= -delta ) = 0;
u0(u >= delta ) = 0;

% Rules 

% R1 si S>0 et dS> 0 alors u = un
alpha1 = Sp*dSp;
% R2 si S>0 et dS< 0 alors u = u0
alpha2 = Sp*dSn;
% R3 si S>0 et dS= 0 alors u = un
alpha3 = Sp*dS0;

% R4 si S=0 et dS> 0 alors u = un
alpha4 = S0*dSp;
% R5 si S=0 et dS< 0 alors u = up
alpha5 = S0*dSn;
% R6 si S=0 et dS= 0 alors u = u0
alpha6 = S0*dS0;

% R7 si S<0 et dS> 0 alors u = u0
alpha7 = Sn*dSp;
% R8 si S<0 et dS< 0 alors u = up
alpha8 = Sn*dSn;
% R9 si S<0 et dS= 0 alors u = up
alpha9 = Sn*dS0;


ufinal = ((alpha7+ alpha8 + alpha9)*up + (alpha4 + alpha6 + alpha5)*u0 + (alpha1+ alpha2+ alpha3)*un);

sumalpha = (alpha1+ alpha2 + alpha3 + alpha4 + alpha5 + alpha6 + alpha7+ alpha9 +alpha9);

ufinal = ufinal/sumalpha;

plot(u, ufinal)
grid on 

ufinal = sum(u.*ufinal)/sum(abs(ufinal))

u_result = ufinal
