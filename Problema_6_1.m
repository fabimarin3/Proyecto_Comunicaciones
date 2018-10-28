%Problema 6.1
%Fabiola Marín Rivera
%2014086018


T=1;
delta_f =1/(100*T);
f = -5/T:delta_f:5/T;
sgma_a=1;
Sv=sgma_a^2*sinc(f*T).^2;

plot(f,Sv); 