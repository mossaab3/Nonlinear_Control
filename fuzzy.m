function u_result = fuzzy(S_, dS_)
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

% Fuzzy output

u = -1:.01:1;

delta = 0.5 

up = 1/delta*u;
up(u >= delta ) = 1;
up(u <= 0 ) = 0;

un = -1/delta*u;
un(u <= -delta ) = 1;
un(u >= 0 ) = 0;

u0 = -1/delta*abs(u) + 1;
u0(u <= -delta ) = 0;
u0(u >= delta ) = 0;

% Rules 

it_S = fix(S_/ step)
it_dS = fix(dS_/ step)

% R1 si S>0 et dS> 0 alors u = up
alpha1 = Sp(it_S)*dSp(it_dS);
% R2 si S>0 et dS< 0 alors u = up
alpha2 = Sp(it_S)*dSn(it_dS);
% R3 si S>0 et dS= 0 alors u = u0
alpha3 = Sp(it_S)*dS0(it_dS);

% R4 si S=0 et dS> 0 alors u = u0
alpha4 = S0(it_S)*dSp(it_dS);
% R5 si S=0 et dS< 0 alors u = u0
alpha5 = S0(it_S)*dSn(it_dS);
% R6 si S=0 et dS= 0 alors u = u0
alpha6 = S0(it_S)*dS0(it_dS);

% R7 si S<0 et dS> 0 alors u = un
alpha7 = Sn(it_S)*dSp(it_dS);
% R8 si S<0 et dS< 0 alors u = un
alpha8 = Sn(it_S)*dSn(it_dS);
% R9 si S<0 et dS= 0 alors u = u0
alpha9 = Sn(it_S)*dS0(it_dS);


ufinal = ((alpha1+ alpha2)*up + (alpha3 + alpha4 + alpha5 + alpha6 +alpha9)*u0 + (alpha8+ alpha9)*un);

sumalpha = (alpha1+ alpha2 + alpha3 + alpha4 + alpha5 + alpha6 + alpha7+ alpha9 +alpha9);

ufinal = ufinal/sumalpha;
ufinal = sum(u.*ufinal)/sum(abs(u))

u_result = ufinal
