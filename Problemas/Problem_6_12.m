% MATLAB script for Illustrative Problem 6.9.
clear
echo on
d=[1 1 1 0 1 0 0 1 0 0 0 1]; %Datos a transmitir
p(1)=0;
for i=1:length(d)
  p(i+1)=rem(p(i)+d(i),2); %M=4 pk
  echo off ;
end
echo on ;
a=2.*p-3; %M=4 ak
b(1)=0;
dd(1)=0;
for i=1:length(d)
  b(i+1)=a(i+1)+a(i); bk
  d_out(i+1)=rem(b(i+1)/2+3,2); %M=4 o 3 d recover
  echo off ;
end
echo on ;
d_out=d_out(2:length(d)+1);