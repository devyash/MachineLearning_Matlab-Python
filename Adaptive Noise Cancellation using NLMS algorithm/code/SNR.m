clear;
load('project1.mat');
i=0;
for M=50:5:100
i=i+1;
k=0;

for mu=0.1:0.1:0.5
    k=k+1;
[e,w]=nlms1(mu,M,primary,reference);
md=sum(primary.^2);
me=sum(e.^2);
SNRo(i,k)=10*( log(me)- log(md) );
end
end
surf(0.1:0.1:0.5,50:5:100,SNRo);
%plot(0.0001:0.001:0.01,SNRo);
title('Best Filter order and Step size')
xlabel('Step Size')
ylabel('Filter Order')
zlabel('ERLE for (output voice signal/noise+ voice signal )')