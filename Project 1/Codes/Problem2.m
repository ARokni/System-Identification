close all
clear
clc

N = 700;  %    Number of Observations
n = 7;    %    Degree of polynomial
alpha = 0.001;
%% part1: Pure Data
load('p1_Data_1');
u = pairData(:,1);
Y = pairData(:,2);
X = make_Regressor(u, n);
testSize = length(pairData) - N ;

X_train = X(1:N,:);
Y_train = Y(1:N,1);

X_test = X(N+1:N+testSize,:);
Y_test = Y(N+1:N+testSize, 1);

W_LS =  prediction_RLS(X_train, Y_train, alpha)

Y_predict = X_test*W_LS;
error = Y_test - Y_predict;
averageError = sum(abs(error))/length(error)
%% part2: norm1
W_Labs =  prediction_Least_absolute(X_train, Y_train)

Y_predict = X_test*W_Labs;
error = Y_test - Y_predict;
averageError = sum(abs(error))/length(error)

%% part3: norm Max

W_LMax =  prediction_Least_maxError(X_train, Y_train)

Y_predict = X_test*W_LMax;
error = Y_test - Y_predict;
averageError = sum(abs(error))/length(error)

