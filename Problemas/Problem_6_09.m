% MATLAB script for Illustrative Problem 6.7.
clear
echo on
N=31;
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
 plot(g_T);
 title('Problema 6.9');
 xlabel('n');
 ylabel('Parte real de gT(n)');
 
 figure(2)
 
%%Gráfica para la magnitud de la respuesta en frecuencia del filtro,
%%realizando la transformada discreta de fourier. 

YfreqDomain = fft(g_T); %take the fft of our step funcion, y(t)
y=abs(YfreqDomain);
plot(fftshift(y));
xlabel('fT')
ylabel('Sv/f)')
title('Problema 6.9')
 
%  figure(2)
%  YfreqDomain = fft(g_T); %take the fft of our step funcion, y(t)
%  y=abs(YfreqDomain);
%  plot(fftshift(g_T));
%  xlabel('fT')
%  ylabel('Sv/f)')
%  title('Problema 6.1')
 
% % Derive g_T(n-(N-1)/2).
% n2=0:N-1;
% % Get the frequency response characteristics.
% [G_T,W]=freqz(g_T,1);
% % normalized magnitude response
% magG_T_in_dB=20*log10(abs(G_T)/max(abs(G_T)));  	
% % %impulse response of the cascade of the transmitter and the receiver filters
% g_R=g_T;
% imp_resp_of_cascade=conv(g_R,g_T);

% Plotting commands follow.

%plot(W/(2*pi),magG_T_in_dB); %Para la respuesta en freq

%stem(g_T); %Resp al impulso del filtro 

%stem(imp_resp_of_cascade); %Resp al impulso del cascada