lambda1=532e-7;lambda2=632.8e-7;
theta1=1/lambda1;theta2=1/lambda2;
x=-25:lambda2/8:25;
N=length(x);
nfft=2^nextpow2(N);
theta=linspace(0,8*theta2,nfft);
linecolor=['r','b','k'];
c=cell(1,3);
B=zeros(3,nfft);
for i=1:3;
  I=2*(cos(2*pi*x*theta1)+cos(2*pi*x*theta2)).*(rectpuls(x,i));
  B(i,1:nfft)=2*fft(I,nfft)/N;
  figure(1)
  plot(theta(1:nfft/2),abs(B(i,1:nfft/2)),linecolor(i));
  hold on
  figure(2)
  plot(theta(1:nfft/2),abs(B(i,1:nfft/2)),linecolor(i));
  hold on
  axis([0.9998*theta2 1.0002*theta2 0 0.2]);
  c{i}=sprintf('扫描距离=±%2.1fcm',i/2);
end
figure(1)
title('扫描距离对光谱测量的影响');
xlabel('σ/cm-1');
text(1.9e4,0.06,'\leftarrow532nm','color','r');
text(0.5e4,0.06,'632.8nm\rightarrow','color','r');
figure(2)
title('扫描距离对光谱测量的影响');
xlabel('σ/cm-1');
legend(c{1},c{2},c{3});

