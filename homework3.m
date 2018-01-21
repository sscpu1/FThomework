lambda=532e-9;c=3e8;
freq=c/lambda;
x=-0.25:lambda/8:0.25;
for i=1:3
Freq=freq-i*3e8:3e8:freq+i*3e8;
Lambda=c./Freq;I=0;
for j=1:length(Lambda)
I=I+cos(4*pi*x/Lambda(j));
end
subplot(2,3,(i));plot(x,I);
axis([-0.25 0.25 -8 8]);
end
lambda=632.8e-9;
freq=c/lambda;
for i=1:3
Freq=freq-i*3e8:3e8:freq+i*3e8;
Lambda=c./Freq;I=0;
for j=1:length(Lambda)
I=I+cos(4*pi*x/Lambda(j));
end
subplot(2,3,(i+3));plot(x,I);
axis([-0.25 0.25 -8 8]);
end
