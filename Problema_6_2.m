%Problema 6.2
%Fabiola Marín Rivera
%2014086018


T=1;
delta_f =1/(100*T);
f = -5/T:delta_f:5/T;
Sv=2*(cos(pi*f*T).*sinc(f*T)).^2;

plot(f,Sv); 