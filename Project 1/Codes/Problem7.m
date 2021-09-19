close all
clear
clc
%format long
N = 1000;  %    Number of Observations
n = 7;    %    Degree of polynomial
%% part1: Pure Data
load('p7_Data_1');
u = pairData(:,1);
Y = pairData(:,2);
X = make_Regressor_problem4(u);
testSize = 300 ;
trainSize = 700;

X_train = X(1:trainSize,:);
Y_train = Y(1:trainSize,1);

X_test = X(N-testSize+1:N,:);
Y_test = Y(N-testSize+1:N, 1);

W_LS =  prediction_LS(X_train, Y_train)

Y_predict = X_test*W_LS;
error = Y_test - Y_predict;
averageError = sum(abs(error))/length(error);
plot_problem1(X_test, Y_test, Y_predict);
