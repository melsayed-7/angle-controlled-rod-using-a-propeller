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
a1=a(:,1);%input

a2=a(:,2); %output
plot(a2)
data1 = iddata(a2,a1,ts);  % this is processing the data to make it compatible with the transfer-function estimation funciton

g = tfest(data1,3,1);   % getting the transfer function and storing it in g


% We found that the best approximation to the system is a system of the
% fifth order
transfer_fn = tf([g.Numerator],[g.Denominator]);
x = step(transfer_fn);
figure
plot(t,x)

tf_z=c2d(transfer_fn,0.01,'tustin')
input = a(:,1);
