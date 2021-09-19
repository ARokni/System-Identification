close all
clear
clc
%format long
N = 700;  %    Number of Observations
max_degree = 10;    %    Degree of polynomial
load('p1_Data_1');
u = pairData(:,1);
Y = pairData(:,2);
total_error = [];

for i =1:max_degree
    n = i;
    
    X = make_Regressor(u, n);
    testSize = length(pairData) - N ;
    X_train = X(1:N,:);
    Y_train = Y(1:N,1);
    X_test = X(N+1:N+testSize,:);
    Y_test = Y(N+1:N+testSize, 1);
    W_LS =  prediction_LS(X_train, Y_train)
    Y_predict = X_test*W_LS;
    error = Y_test - Y_predict;
    total_error(i) = transpose(error)*error;
end
t = 1:length(total_error);
plot(t, total_error);
