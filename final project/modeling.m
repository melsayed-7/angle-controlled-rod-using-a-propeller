clear
clc
close all
a1=csvread('4.csv');
b1=csvread('5.csv');
figure 
plot(a1(:,1));
figure
plot(a1(:,2));

plot(b1(:,1));
figure
plot(b1(:,2));