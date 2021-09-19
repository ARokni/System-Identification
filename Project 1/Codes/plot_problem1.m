function [] = plot_problem1(X_test, Y_test, Y_predict)
close all
    %variance_prediction = var(Y_predict);
    error = Y_test - Y_predict;
    cov_y = covaraince(error, X_test);
   % error_bar1 = Y_predict + variance_prediction*ones(length(Y_predict), 1);
   % error_bar2 = Y_predict - variance_prediction*ones(length(Y_predict), 1);
   error_bar1 = Y_predict + sqrt(diag(cov_y));
   error_bar2 = Y_predict - sqrt(diag(cov_y));
   
    m = 50;
    t = 1:m;
    figure(1)
    plot(t,Y_test(1:m));
    legend('System Output');
    
    figure(2)
    hold on 
    plot(t,Y_predict(1:m));
    %legend('test', 'prediction')
    hold on
    plot(t,error_bar1(1:m), 'g--');
    hold on 
    plot(t,error_bar2(1:m), 'r--')
    legend('Model Output', 'Error bar1', 'Error bar2');
    figure(3)
    plot(t,error(1:m));
    legend('Error');
end

