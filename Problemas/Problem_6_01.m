
T=1;
k = 0:127;
delta_f =k/(10);
n = length(k);
y = heaviside(delta_f)-heaviside(delta_f-1);

%FT = abs(fft(y));

     
     YfreqDomain = fft(y); %take the fft of our step funcion, y(t)
     y=abs(YfreqDomain);
     plot(fftshift(y));
     xlabel('fT')
     ylabel('Sv/f)')
     title('Problema 6.1')
%     axis([-100+1e4,100+1e4,0,5000])

%    % plot(y)
%     xlabel('Sample Number');
%     ylabel('Amplitude');
%     title('Using the Matlab fft command');
%     grid;
%     plot(FT);
    
    
    
    
    
    
    
    
    

%     Fs = 1000;   %sampling rate
%     Ts = 1/Fs; %sampling time interval
%     t = -10:Ts:10-Ts; %sampling period
%     n = length(t); %number of samples
%     y = heaviside(t)-heaviside(t-4); %the step curve
% 
%     matlabFFT = figure;  %create a new figure
%     YfreqDomain = fft(y); %take the fft of our step funcion, y(t)
%     y=abs(YfreqDomain);
%     %plot(y)
%     xlabel('Sample Number')
%     ylabel('Amplitude')
%     title('Using the Matlab fft command')
%     grid
%     plot(fftshift(y))
%     axis([-100+1e4,100+1e4,0,5000])