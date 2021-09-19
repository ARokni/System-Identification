close all
clear
clc

N = 200;  %    Number of Observations
n = 10;    %    Degree of polynomial
trainSize = 150;
testSize = 50;
u = rand(N,1);
x = horzcat(ones(size(u)), u, u.^3, u.^6);
for i = 1:N
    theta2 = 0.6 + (i -1)*0.4/(N-1) ;
    theta3 = 0.1 - (i-1)*0.2/(N-1);
    theta = [-0.5; theta2; theta3; 2];   
    y(i,:) = x(i,:)*theta;  % My Notation : y = x*theta_0; each column of theta_0 = coefficient of one cat of regressors
end
    
% Data without noise or other things
pairData = horzcat(u,y);
save('F:\My_Courses\Master98\Term2\SystemIdentification_Bahar98-99\Hw\Hw1\Codes\Data\p6_Data_1','pairData')
% Noisy data
mean = 0;
varr = 10^-4;
y_noisy = y + normrnd(mean, varr, [size(y),1]);
pairData_noisy = horzcat(u,y_noisy);
save('F:\My_Courses\Master98\Term2\SystemIdentification_Bahar98-99\Hw\Hw1\Codes\Data\p6_Data_2_noisy','pairData_noisy')




