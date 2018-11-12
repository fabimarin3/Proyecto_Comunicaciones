echo on
T=1;
for n=-2:2,
  for k=-2:2,
    temp=0;
    for i=-2:2, 
      temp=temp+(1/(1+(n-i)^2))*(1/(1+(k-i)^2)); 
    end;
    X(k+3,n+3)=temp;
  end;
N0=0.01;		    	  	
Ry=X+(N0/2)*eye(5);
Riy=[1/5 1/2 1 1/2 1/5].';        
c_opt=inv(Ry)*Riy;		  	
t=-3:1/2:3;
x=1./(1+(2*t/T).^2);		  	
equalized_pulse=conv(x,c_opt);    
decimated_equalized_pulse=equalized_pulse(1:2:length(equalized_pulse));
