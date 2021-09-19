close all
clear
clc
%format long

N = 700;  %    Number of Observations
n = 10;    %    Degree of polynomial
ns = 10   % Degree of OLS
alpha = 0.001;
%% part1: OLS
load('p1_Data_1');
u = pairData(:,1);
Y = pairData(:,2);
X = make_Regressor(u, n);
testSize = length(pairData) - N ;

X_train = X(1:N,:);
Y_train = Y(1:N,1);

X_test = X(N+1:N+testSize,:);
Y_test = Y(N+1:N+testSize, 1);

W_OLS = signifiacnt_regressors_OLS(X_train, Y_train, ns, n)

Y_predict = X_test*W_OLS;
error = Y_test - Y_predict;
averageError = sum(abs(error))/length(error)