close all
clear
clc
%format long
N = 700;  %    Number of Observations
n = 10;    %    Degree of polynomial
%% part1: Pure Data
load('p1_Data_1');
u = pairData(:,1);
Y = pairData(:,2);
X = make_Regressor_normalize(u, n);
testSize = length(pairData) - N ;

X_train = (X(1:N,:));
Y_train = (Y(1:N,1));

X_test = (X(N+1:N+testSize,:));
Y_test = (Y(N+1:N+testSize, 1));

W_LS_normalized =  prediction_LS(X_train, Y_train);
W_LS = deNormlize(W_LS_normalized,u)

Y_predict = X_test*transpose(W_LS);
error = Y_test - Y_predict;
averageError = sum(abs(error))/length(error);
plot_problem1(X_test, Y_test, Y_predict);