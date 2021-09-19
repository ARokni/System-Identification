close all
clear
clc

N = 1000;  %    Number of Observations
n = 10;    %    Degree of polynomial
trainSize = 700;
testSize = 300;
u = rand(N,1);
x = horzcat(ones(size(u)), u, u.^3, u.^6);
theta_0 = [-0.5; 0.6; 0.1; 2];   
y = x*theta_0;  % My Notation : y = x*theta_0; each column of theta_0 = coefficient of one cat of regressors
% Data without noise or other things
pairData = horzcat(u,y);
save('F:\My_Courses\Master98\Term2\SystemIdentification_Bahar98-99\Hw\Hw1\Codes\Data\p1_Data_1','pairData')
% Noisy data
mean = 0;
sigma = 10^-1;
y_noisy = y + normrnd(mean, sigma, [size(y),1]);
pairData_noisy = horzcat(u,y_noisy);
save('F:\My_Courses\Master98\Term2\SystemIdentification_Bahar98-99\Hw\Hw1\Codes\Data\p8_Data_5_noisy','pairData_noisy')




