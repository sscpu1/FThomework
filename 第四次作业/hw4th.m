clear all;
lambda=532e-7;
sigma=1/lambda;
x0=-1024*256*lambda/8:lambda/8:(1024*256-1)*lambda/8;
n=length(x0);
nfft=2^(nextpow2(n)+4);
Sigma=linspace(0,8*sigma,nfft);
n1=floor(0.9998*nfft/8);   
n2=ceil(1.0002*nfft/8); 
%n1，n2为波数坐标上下限 
I=2*cos(2*pi*x0*sigma);
B=2*abs(fft(I,nfft))/n;
figure
subplot(1,2,1),plot(x0(10:400),I(10:400));
subplot(1,2,2),plot(Sigma(1:nfft/2),B(1:nfft/2)); 
[temp,wd]=sort(abs(B(n1:n2)-max(B(n1:n2))/2));              
peakwd=abs(wd(1)-wd(2))*sigma*8/nfft;
text(sigma,1,sprintf('峰宽=%0.3f',peakwd));
text(sigma,1.8,sprintf('峰高=%0.3f',max(B)));
noise=[2*rand(size(x0))-1;sin(2e12*pi*sigma*x0);randn(size(x0))];
figure;
for i=1:3
    x=x0+lambda/16*noise(i,:);
    I=2*cos(2*pi*x*sigma);
    B=2*abs(fft(I,nfft))/n;
    subplot(3,3,3*i-2),plot(x0(10:40),I(10:40));
    subplot(3,3,3*i-1),hist(noise(i,:),100);
    subplot(3,3,3*i),plot(Sigma(n1:n2),B(n1:n2)); 
    [temp,wd]=sort(abs(B(n1:n2)-max(B(n1:n2))/2));             
    peakwd=abs(wd(1)-wd(2))*sigma*8/nfft;
    text(sigma,1,sprintf('峰宽=%0.3f',peakwd));
    text(sigma,1.8,sprintf('峰高=%0.3f',max(B)));
    xlabel('σ/cm-1');
end

