clear
clc
close all

a=csvread('4.csv');
b=csvread('5.csv');
%  figure 
%  plot(a(:,2));
% hold on
%  plot(a(:,1));
% figure

% 
% plot(b(:,1));
% figure
% plot(b(:,2));

ts = .01;  % this is the sampling time it is computed from the array t

data1 = iddata(a(:,2),a(:,1),ts);  % this is processing the data to make it compatible with the transfer-function estimation funciton

g = tfest(data1,2,0);   % getting the transfer function and storing it in g
  

% We found that the best approximation to the system is a system of the
% fifth order
transfer_fn = tf([g.Numerator],[g.Denominator])
x = step(transfer_fn)
figure 
plot(x)

 figure 
 plot(a(:,2)(1:162));

