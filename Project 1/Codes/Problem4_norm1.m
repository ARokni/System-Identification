close all
clear
clc
%format long
N = 700;  %    Number of Observations
n = 7;    %    Degree of polynomial
%% part1: Pure Data
load('p1_Data_1');
u = pairData(:,1);
Y = pairData(:,2);
X = make_Regressor_problem4(u);
testSize = length(pairData) - N ;

X_train = X(1:N,:);
Y_train = Y(1:N,1);

X_test = X(N+1:N+testSize,:);
Y_test = Y(N+1:N+testSize, 1);

W_LS =  prediction_Least_absolute(X_train, Y_train)

Y_predict = X_test*W_LS;
error = Y_test - Y_predict;
averageError = sum(abs(error))/length(error);
plot_problem1(X_test, Y_test, Y_predict);



%% part2: With noise in output
load('p1_Data_2_noisy')
u2 = pairData_noisy(:,1);
Y2 = pairData_noisy(:,2);
X2 = make_Regressor_problem4(u2);

X_train2 = X2(1:N,:);
Y_train2 = Y2(1:N,1);

X_test2 = X2(N+1:N+testSize,:);
Y_test2 = Y2(N+1:N+testSize, 1);

W_LS_2 =  prediction_Least_absolute(X_train2, Y_train2)
Y_predict2 = X_test2*W_LS_2;
plot_problem1(X_test2, Y_test2, Y_predict2);
error2 = Y_test2 - Y_predict2;
averageError2 = sum(abs(error2))/length(error2);







