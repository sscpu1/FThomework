lambda1=532e-7;lambda2=632.8e-7;
theta1=1/lambda1;theta2=1/lambda2;
x=-25:lambda2/8:25;
N=length(x);
nfft=2^nextpow2(N);
theta=linspace(0,8*theta2,nfft);
linecolor=['r','b','k'];
c=cell(1,3);
B=zeros(3,nfft);
for i=1:3
  f=[50 75 100];
  a=0.3;
  omiga=2*pi*(1-cos(atan(a/f(i))));
  dtheta1=theta1*omiga/(2*pi);
  dtheta2=theta2*omiga/(2*pi);
  E1=pi/(omiga*theta1);
  E2=pi/(omiga*theta2);
  B(i,1:nfft)=E1*rectpuls(theta-theta1*(1-(omiga/(4*pi))),dtheta1)+E2*rectpuls(theta-theta2*(1-(omiga/(4*pi))),dtheta2);
  figure(1)
  plot(theta(1:nfft/2),abs(B(i,1:nfft/2)),linecolor(i));
  hold on
  figure(2)
  plot(theta(1:nfft/2),abs(B(i,1:nfft/2)),linecolor(i));
  hold on
  axis([0.9998*theta2 1.0002*theta2 -0.1 8]);
  c{i}=sprintf('f=%dmm a=600um',f(i));
end
figure(1)
title('发散角对光谱测量的影响');
xlabel('σ/cm-1');
figure(2)
title('发散角对光谱测量的影响');
xlabel('σ/cm-1');
legend(c{1},c{2},c{3});