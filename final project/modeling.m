clear
clc
close all
a1=csvread('4.csv');
b1=csvread('5.csv');
figure 
plot(a(:,1));
figure
plot(a(:,2));

plot(b(:,1));
figure
plot(b(:,2));