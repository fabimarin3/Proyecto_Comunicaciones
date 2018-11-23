% MATLAB script for Illustrative Problem 6.8.
clear
echo on
N=31;
T=1;
alpha=1/2; %Roll of factor
W=1/(2*T);
n=-(N-1)/2:(N-1)/2;			% the indices for g_T
% The expression for g_T is obtained next.
for i=1:length(n),
  g_T(i)=0;
  for m=-(N-1)/2:(N-1)/2,
    if ( abs((4*m)/(N*T)) <= W ),
      g_T(i)=g_T(i)+sqrt(xrc(4*m/(N*T),alpha,T))*exp(j*2*pi*m*n(i)/3*N); %Funcion del filtro
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
IMP=fft(g_T);
y=abs(IMP);
figure (1);
stem(y);
stem(fftshift(y));

figure(2)

x = ifft(y);
stem(fftshift(x));

% Plotting commands follow.




