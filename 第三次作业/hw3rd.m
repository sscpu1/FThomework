clear all;
lambda=632.8e-7;                                     %ѡ������
sigma=1/lambda;                                      %��Ӧ����
x=-1024*256*lambda/8:lambda/8:(1024*256-1)*lambda/8;   %ɨ�����
n=length(x);                                         %��������
I=2*cos(2*pi*x*sigma);                               %��ǿ��ʽ
for i=1:4
    [I_zero nfft]=pluszero(I,i);                     %��i-1���㣬��X�ǲ�������nfft��X�ĳ���
    Sigma=linspace(0,8*sigma,nfft);                  %��������Sigma
    n1=floor(0.9998*nfft/8);   
    n2=ceil(1.0002*nfft/8);                          %n1��n2Ϊ��������������                              
    B=abs(fft(I_zero,nfft));                         %����Ҷ����
    figure(1);
    subplot(2,2,i),plot(Sigma(n1:n2),B(n1:n2));  %sigma�����Ĺ���ͼ
    xlabel('��/cm-1');
end
[temp,wd]=sort(abs(B(n1:n2)-max(B(n1:n2))/2));             
peakwd=abs(wd(1)-wd(2))*sigma*8/nfft;                 %���㲹�����
text(sigma,B(wd(1)),sprintf('���=%0.2e',peakwd));
figure(2);
for i=1:4
   wn=[hann(n)';triang(n)';kaiser(n,6)';sinc(x).^2];  %4�ֲ�ͬ�Ĵ�
   Wn=pluszero(wn(i,:),4);                            %�Դ������㣬��֤��ͬ����ά��
   I_wn=I_zero.*Wn;                                        %�Ӵ�
   B_wn=abs(fft(I_wn,nfft));                              %����Ҷ�任
   [temp,wd]=sort(abs(B_wn(n1:n2)-max(B_wn(n1:n2))/2));             
   peakwd=abs(wd(1)-wd(2))*sigma*8/nfft;              %����Ӵ�����
   subplot(2,2,i),plot(Sigma(n1:n2),B_wn(n1:n2));
   xlabel('��/cm-1');  
   text(sigma,B(wd(1)),sprintf('���=%0.3f',peakwd));
end
    


    
    



