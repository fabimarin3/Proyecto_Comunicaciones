% MATLAB script for Illustrative Problem 6, Chapter 6.
clear
echo on
N=10000;					
noise_var=1;
sigma=sqrt(noise_var);			% standard deviation of the noise
for i=1:N,				% generate data sequence
   if (rand<0.5), 
      I(i)=1;
   else
      I(i)=-1;
   end;
   echo off ;
end;
echo on ;
% for channel1:
A=1;
B=[0.1 -0.25 1 -0.25 0.1];
rec_sig1=filter(B,A,I);    		% the received signal without noise for channel 1
rec_sig1=rec_sig1([3:N]);  		% to compensate for the delay in filtering
for i=1:N-2,
   noise(i)=gngauss(sigma);
   echo off ;
end;
echo on ;
y1=rec_sig1+noise;	   		% received signal with noise for channel 1

% plotting commands follow
figure
plot(y1,0,'-o')
title('Varianza "1"')

%plot(rec_sig1(I),0,'x')
%hold on

