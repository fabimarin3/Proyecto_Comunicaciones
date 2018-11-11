echo on
f_cutoff=3000; %Freq de corte 
f_stopband=3500; 
fs=10000; %Freq de muestreo
f1=2*(f_cutoff)/(fs);
f2=2*(f_stopband)/(fs);
N=41; %Numero de muestras
F=[0 f1 f2 1]; %Parametros para caracterizar el filtro 
M=[1 1 0 0]; 
B=remez(N-1,F,M); %Designs a linear-phase FIR filter using the Parks-McClellan algorithm. 
%The Parks-McClellan algorithm uses the Remez exchange algorithm and Chebyshev
%%%%%Graficando%%%%%%%%%
figure(1);
[H,W]=freqz(B); %Returns the complex frequency response H of the filter system object. W is the frequencies
%at which the function evaluates the response. 
H_in_dB=20*log10(abs(H)); %Normaliza la resp en freq para graficar
plot(W/(2*pi),H_in_dB); %Grafica la resp en freq
figure(2);
plot(W/(2*pi),(180/pi)*unwrap(angle(H))); %Grafica la fase
%%%%%Grafica la resp al impulso%%%%%%%%
figure(3);
stem([0:N-1],B); %Grafica la resp al impulso 
