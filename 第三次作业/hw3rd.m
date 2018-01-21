clear all;
lambda=632.8e-7;                                     %选定波长
sigma=1/lambda;                                      %相应波数
x=-1024*256*lambda/8:lambda/8:(1024*256-1)*lambda/8;   %扫描距离
n=length(x);                                         %采样点数
I=2*cos(2*pi*x*sigma);                               %光强公式
for i=1:4
    [I_zero nfft]=pluszero(I,i);                     %补i-1倍零，，X是补零后矩阵，nfft是X的长度
    Sigma=linspace(0,8*sigma,nfft);                  %波数坐标Sigma
    n1=floor(0.9998*nfft/8);   
    n2=ceil(1.0002*nfft/8);                          %n1，n2为波数坐标上下限                              
    B=abs(fft(I_zero,nfft));                         %傅里叶光谱
    figure(1);
    subplot(2,2,i),plot(Sigma(n1:n2),B(n1:n2));  %sigma附近的光谱图
    xlabel('σ/cm-1');
end
[temp,wd]=sort(abs(B(n1:n2)-max(B(n1:n2))/2));             
peakwd=abs(wd(1)-wd(2))*sigma*8/nfft;                 %计算补零后峰宽
text(sigma,B(wd(1)),sprintf('峰宽=%0.2e',peakwd));
figure(2);
for i=1:4
   wn=[hann(n)';triang(n)';kaiser(n,6)';sinc(x).^2];  %4种不同的窗
   Wn=pluszero(wn(i,:),4);                            %对窗矩阵补零，保证相同矩阵维数
   I_wn=I_zero.*Wn;                                        %加窗
   B_wn=abs(fft(I_wn,nfft));                              %傅里叶变换
   [temp,wd]=sort(abs(B_wn(n1:n2)-max(B_wn(n1:n2))/2));             
   peakwd=abs(wd(1)-wd(2))*sigma*8/nfft;              %计算加窗后峰宽
   subplot(2,2,i),plot(Sigma(n1:n2),B_wn(n1:n2));
   xlabel('σ/cm-1');  
   text(sigma,B(wd(1)),sprintf('峰宽=%0.3f',peakwd));
end
    


    
    



