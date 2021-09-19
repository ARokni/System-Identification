close all
clear
clc
%format long
N = 500;  %    Number of Observations
n = 7;    %    Degree of polynomial
%% part1: Pure Data
load('p6_Data_1');
u = pairData(:,1);
Y = pairData(:,2);
X = make_Regressor_problem4(u);
%testSize = length(pairData) - N ;
testSize = 200;

X_train = X(1:N,:);
Y_train = Y(1:N,1);

X_test = X(N-testSize:N,:);
Y_test = Y(N-testSize:N, 1);

W_LS =  prediction_Recursive_LS(X_train, Y_train)

Y_predict = X_test*W_LS;
error = Y_test - Y_predict;
averageError = sum(abs(error))/length(error)
plot_problem1(X_test, Y_test, Y_predict);


