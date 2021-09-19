load('p1_Data_2_noisy')
u = pairData_noisy(:,1);
Y = pairData_noisy(:,2);
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