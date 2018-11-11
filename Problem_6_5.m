echo on 
Lenght=101; %101
Fs=10000; %Frecuencia de muestreo
W=3000; %Ancho de banda disponible
Ts=1/Fs; %Tasa de muestreo
n=-(Lenght-1)/2:(Lenght-1)/2;
t=Ts*n;
h=2*W*sinc(2*W*t); %Definicion de la ventana de Hanning
N=61; %Numero de muestras
rec_windowed_h=h((Lenght-N)/2+1:(Lenght+N)/2); %Implementacion de la ventana
%Freq response
figure(1);
[rec_windowed_H,W1]=freqz(rec_windowed_h,1); %Respuesta en frecuencia 
%Normalize the freq response
rec_windowed_H_in_dB=20*log10(abs(rec_windowed_H)/abs(rec_windowed_H(1))); %Normaliza la ventana
hanning_window=hann(N); %
plot(W/(2*pi),rec_windowed_H_in_dB); %Grafica la resp en frecuencia
hanning_windowed_h=h((Lenght-N)/2+1:(Lenght+N)/2)*hanning_window; 
plot(W1/(2*pi),rec_windowed_H_in_dB); %Grafica la resp en frecuencia para W1
[hanning_windowed_H,W2]=freqz(hanning_windowed_h,1);
hanning_windowed_H_in_dB=20*log10(abs(hanning_windowed_H)/abs(hanning_windowed_H(1)));
%Plotting comands
%Phase response
figure(2)
plot(W2/(2*pi),hanning_windowed_H_in_dB);%Grafica la resp en frecuencia para W2
plot(W1/(2*pi),(180/pi)*unwrap(angle(rec_windowed_H)));
%Impulse response
figure(3)
stem([0:N-1],rec_windowed_h); %Respuesta al impulso de la ventana