lambda1=532e-9;
x1=-2e-6:lambda1/8:2e-6;
lambda2=632.8e-9;
x2=-2e-6:lambda2/8:2e-6;
I1=cos(2*pi*x1/lambda);
I2=cos(2*pi*x2/lambda);
plot(x1,I1,x2,I2);
xlabel('X/m');
ylabel('Lumina Intensity');
legend('532nm','632.8nm');


