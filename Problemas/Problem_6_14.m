% MATLAB script for Illustrative Problem 6.7.
clear
echo on
N=61;
T=1;
alpha=1/2; %Roll off factor
n=-(N-1)/2:(N-1)/2;			% the indices for g_T
% The expression for g_T is obtained next.
for i=1:length(n),
  g_T(i)=0;
  for m=-(N-1)/2:(N-1)/2,
    g_T(i)=g_T(i)+sqrt(xrc(4*m/(N*T),alpha,T))*exp(j*2*pi*m*n(i)/N); %Funcion del filtro 
    echo off ;
  end;
end;
echo on ;


%%Gráfica y evaluación de gT(n) para los valores arbitrarios de alpha y N.

 figure(1)
 g_T=real(g_T) ; % The imaginary part is due to the finite machine precision
 stem(g_T);
 title('Problema 6.14');
 xlabel('n');
 ylabel('Parte real de gT(n)');
 
 figure(2)
 
%%Gráfica para la magnitud de la respuesta en frecuencia del filtro,
%%realizando la transformada discreta de fourier. 

YfreqDomain = fft(g_T,8/T); %take the fft of our step funcion, y(t)
y=abs(YfreqDomain);
stem(fftshift(y));
xlabel('fT')
ylabel('Sv/f)')
title('Problema 6.14')