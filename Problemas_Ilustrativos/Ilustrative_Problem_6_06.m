% MATLAB script for Illustrative Problem 6, Chapter 6.
clear
echo on
N=52;	%Numero de muestras 				
noise_var=0.25;
sigma=sqrt(noise_var);			% standard deviation of the noise
for i=1:N,				% generate data sequence
   if (rand<0.5), 
      I(i)=1; %Valores que tendran los datos
   else
      I(i)=-1;
   end;
   echo off ;
end;
echo on ;
% for channel1:
A=1;
B=[0.1 -0.25 1 -0.25 0.1]; %Valores 
rec_sig1=filter(B,A,I);    		% the received signal without noise for channel 1
rec_sig1=rec_sig1([3:N]);  		% to compensate for the delay in filtering
for i=1:N-2,
   noise(i)=gngauss(sigma);
   echo off ;
end;
echo on ;
y1=rec_sig1+noise;	   		% received signal with noise for channel 1
% for channel 2:
A=1;
B=[-0.2 0.5 1 0.5 -0.2];
rec_sig2=filter(B,A,I);    		% the received signal without noise for channel 2
rec_sig2=rec_sig2(3:N);	   		% to compensate for the delay in filtering 
for i=1:N-2,
   noise(i)=gngauss(sigma);
   echo off ;
end;
echo on ;
y2=rec_sig2+noise;         		% received signal with noise for channel 2
% plotting commands follow
figure

%plot(rec_sig1(I),0,'x')
%hold on
plot(y1,0,'-o') %Grafica datos transmitidos 
hold on
%plot(rec_sig2(0:2),'-o');
plot(y2,0,'-x'); %Grafica datos no transmitidos
%hold on;
%plot(rec_sig2,0,'-o');
