echo on 
Lenght=101; %101
Fs=10000;
W=2000;
Ts=1/Fs;
n=-(Lenght-1)/2:(Lenght-1)/2;
t=Ts*n;
h=2*W*sinc(2*W*t);
N=61;
rec_windowed_h=h((Lenght-N)/2+1:(Lenght+N)/2);
%Freq response
figure(1);
[rec_windowed_H,W1]=freqz(rec_windowed_h,1);
%Normalize the freq response
rec_windowed_H_in_dB=20*log10(abs(rec_windowed_H)/abs(rec_windowed_H(1)));
hanning_window=hann(N);
plot(W/(2*pi),rec_windowed_H_in_dB);
hanning_windowed_h=h((Lenght-N)/2+1:(Lenght+N)/2)*hanning_window;
plot(W1/(2*pi),rec_windowed_H_in_dB);
[hanning_windowed_H,W2]=freqz(hanning_windowed_h,1);
hanning_windowed_H_in_dB=20*log10(abs(hanning_windowed_H)/abs(hanning_windowed_H(1)));
%Plotting comands
%Phase response
figure(2)
plot(W2/(2*pi),hanning_windowed_H_in_dB);
plot(W1/(2*pi),(180/pi)*unwrap(angle(rec_windowed_H)));
%Impulse response
figure(3)
stem([0:N-1],rec_windowed_h);
