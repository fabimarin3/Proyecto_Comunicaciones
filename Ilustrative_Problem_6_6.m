% MATLAB script for Illustrative Problem 6.6
N=1000; % Length of sequence
M=100; % Autocorrelation fanction length
Fs=N; % Sampling frequency
NFFT = 2^nextpow2(N); % Next power of 2 from length of y
f=Fs/2*linspace(-0.5,0.5,NFFT/2+1 );
F=1/2*linspace(-0.5,0.5,NFFT/2+1 );
p=0.99;
d=5; % Time delay between the two paths
% Preallocation for speed:
bl=zeros(3,N); b2=zeros(1,N); c=zeros(1,N);
% Input WGN sequence
w=randn(2,N);
% Output sequences:
b1(1)=(1-p)^2*w(1,1);
b1(2)=2*p*b1(1)+(1-p)^2*w(1,2);
b2(1)=(1-p)^2*w(2,1);
b2(2)=2*p*b2(1)+((1-p)^2)*w(2,2);
u=1:M+1;
for n=3:N
end
bl(n)=2*p*bl(n-1)-p^2*bl(n-2)+(1-p)^2*w(1,n);
b2(n)=2*p*b2(n-1)-p^2*b2(n-2)+(1-p)^2*w(2,n);
% Channel impulse response:
for n=1:5
c(n)=bl(n);
end
for n=5:N
c(n)=b1(n)+b2(n-d);
end
% Autocorrelation calculations:
Rx_bl=Rx_est(bl,M);
Rx_b2=Rx_est(b2,M);
Rx_c =Rx_est(c,M);
% Power spectra calculations:
Sx_bl=fftshift(abs(fft(Rx_bl ,NFFT)/N));
Sx_b2=fftshift(abs(fft(Rx_b2,NFFT)/N));
Sx_c =fftshift(abs(fft(Rx_c,NFFf)/N));
% Calculation of H(f):
z=exp(1i*2*pi*F);
nurn=(1-p)^2;
denurn=(1-p*z.^-1).^2;
H=nurn./denurn;
% Plot the results:
subplot(3,2,1)
plot(Rx_bl)
axis([O M rnin(Rx_bl) rnax(Rx_bl)])
xlabel(' Time (sec) ')
legend('R_x(b_1)')
subplot(3,2,2)
plot(f,Sx_bl(NFFT/4:3*NFFf/4))
xlabel(' Frequency (Hz) ')
axis([-100 100 rnin(Sx_bl) rnax(Sx_bl)])
legend('S_x(b_1)')
subplot(3,2,3)
plot(Rx_b2)
axis([O M rnin(Rx_b2) rnax(Rx_b2)])