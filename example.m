lambda=532e-9;c=3e8;
freq=c/lambda;
x=-0.25:lambda/8:0.25;
Freq=freq-2*3e8:3e8:freq+2*3e8;
Lambda=c./Freq;I1=0;I2=0;I3=0;
for i=-2:2
   I1=I1+cos(4*pi*x/Lambda(i+3));
if i~=0
   I2=I2+i^2*cos(4*pi*x/Lambda(i+3));
   I3=I3+i^2*cos(4*pi*x/Lambda(i+3));
else
   I2=I2+cos(4*pi*x/Lambda(i+3));
   I3=I3+5*cos(4*pi*x/Lambda(i+3));
end
end
subplot(3,1,1);plot(x,I1);
subplot(3,1,2);plot(x,I2);
subplot(3,1,3);plot(x,I3);