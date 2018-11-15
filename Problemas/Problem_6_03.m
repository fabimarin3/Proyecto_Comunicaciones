%Problema 6_3

 clear
 echo on
 T=1;
 t=0:0.01:1;
 
 
 y = (1/2)*(cos(1-cos((2*pi*t)/T))).*(heaviside(0)-heaviside(1));
%  
%  G = abs(fft(y));
% %  figure(1);
% %  plot(g);
%  figure(2);
%  plot(G);
 
YfreqDomain = fft(y); %take the fft of our step funcion, y(t)
y=abs(YfreqDomain);
plot(fftshift(y));
xlabel('fT')
ylabel('Sv/f)')
title('Problema 6.3')

 %Sa=2*(cos(pi*f*t));
 %Sv=Sa*G(f);
 %plot(f,Sv);

% 
% T=1;
% delta_f=1/(100*T);		
% f=-5/T:delta_f:5/T;
% Sv=2*(cos(pi*f*T).*sinc(f*T)).^2;
% % Plotting command follows.
% plot(f,Sv);



% syms g(t);
% syms G(f);
% T=1;
% 
% g(t) = (1/2)*(cos(1-cos((2*pi)/t))) - (1/2)*(cos(1-cos((2*pi)/t)))*heaviside(t-T);
% %G(f) = fourier(g,t,f);
% plot(g,T);
%  7
% 
% % syms s(t)
% % syms j(w)
% % s(t) = 2 * cos(2*t + 1) * heaviside(sym(t - 2*(t/2))) * heaviside(sym(-t + 2/10 + 2*(t/2)));
% % j(w) = fourier(s, t, w);
% % c