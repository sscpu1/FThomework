function [X,nfft]= pluszero( x,num_times)
%UNTITLED 
%   此处显示详细说明
N=length(x);
n=nextpow2(N)+num_times-1;
nfft=2^n;
n=2^n-N;
if mod(n,2)~=0
    n=n+1;
end
n=n/2;
X=[zeros(1,n) x zeros(1,n)];

end

