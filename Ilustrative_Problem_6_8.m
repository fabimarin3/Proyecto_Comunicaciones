echo on
N=31;
T=1;
W=1/(2*T);
n=-(N-1)/2:(N-1)/2;

for i=1:length(n),
    g_T(i)=0;
    for m=-(N-1)/2:(N-1)/2,
        if (abs((4*m)/(N*T))<=W),
            g_T(i)=g_T(i)+sqrt((1/W)*cos((2*pi*m)/(N*T*W)))*exp(1i*2*pi*m*n(i)/N);
        end;
        echo off;
    end;
end;
echo on;
n2=0:N-1;
g_T=real(g_T);
[G_T,W]=freqz(g_T,1); %Freq response
magG_T_in_dB=20*log10(abs(G_T)/max(abs(G_T)));%Impulse resp
g_R=g_T;
imp_resp_of_cascade=conv(g_R,g_T); %impulse resp of cascade
[G_TT,W]=freqz(imp_resp_of_cascade,1);
ConvImp_in_dB=20*log10(abs(G_TT)/max(abs(G_TT)));
figure(3);
%plot(W/(2*pi),ConvImp_in_dB);
stem(n2,ConvImp_in_dB);


