% MATLAB script for Illustrative Problem 6.8.
clear
echo on
N=31;
T=1;
W=1/(2*T);
n=-(N-1)/2:(N-1)/2;			% the indices for g_T
% The expression for g_T is obtained next.
for i=1:length(n),
  g_T(i)=0;
  for m=-(N-1)/2:(N-1)/2,
    if ( abs((4*m)/(N*T)) <= W ),
      g_T(i)=g_T(i)+((j/W)*sin(pi*m/W))*exp(j*2*pi*m*n(i)/N);
    end;
    echo off ;
  end;
end;
echo on ;
g_T=real(g_T) ; % The imaginary part is due to the finite machine precision 
% Obtain g_T(n-(N-1)/2).
n2=0:N-1;
% Obtain the frequency response characteristics.
[G_T,W]=freqz(g_T,1);
% normalized magnitude response  
magG_T_in_dB=20*log10(abs(G_T)/max(abs(G_T)));
% impulse response of the cascade of the transmitter and the receiver filters
g_R=g_T;
imp_resp_of_cascade=conv(g_R,g_T);
% Plotting commands follow.

%Gráfica de gT(n)
 figure(1)
 g_T=real(g_T) ; % The imaginary part is due to the finite machine precision
 plot(g_T);
 title('Problema 6.16');
 xlabel('n');
 ylabel('gT(n)');
 
 figure(2)
 
%%Gráfica para la magnitud de la respuesta en frecuencia del filtro,
%%realizando la transformada discreta de fourier. 

YfreqDomain = fft(G_T); %take the fft of our step funcion, y(t)
y=abs(YfreqDomain);
plot(fftshift(y));
xlabel('f')
ylabel('|GT(n)|')
title('Problema 6.16')
