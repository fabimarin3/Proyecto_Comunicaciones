%Problema 6.2


T=1;
k = 0:127;
delta_f =k/(10);
n = length(k);
y = (1/2)*(cos(1-cos((2*pi*t)/T))).*(heaviside(0)-heaviside(1));
 


     YfreqDomain = fft(y); %take the fft of our step funcion, y(t)
     y=abs(YfreqDomain);
     plot(fftshift(y));
     xlabel('fT')
     ylabel('Sv/f)')
     title('Problema 6.2')
     
     
% FT = abs(fft(y));
% 
%    % plot(y)
%     xlabel('Sample Number');
%     ylabel('Amplitude');
%     title('Using the Matlab fft command');
%     grid;
%     plot(FT);
% %     axis([-100+1e4,100+1e4,0,5000]);