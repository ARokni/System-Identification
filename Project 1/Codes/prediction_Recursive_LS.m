function [model_prediction] = prediction_Recursive_LS(Regressors_train,system_OutPut_train)
    r = 200;
    epoch_number = 1;
    X_train = Regressors_train;
    Y_train = system_OutPut_train;
    shape_model = size(X_train);
    P = r * eye(shape_model(2));    %Initial Condition
    theta = zeros(4,1);  %Initial condition
    theta_plot = [];
    for epoch =1:epoch_number
        for i = 1:shape_model(1)
           x = X_train(i,:);
           y = Y_train(i,:);
           P = P - (P*transpose(x)*x*P)/(1+ x*P*transpose(x));
           prediction_err = y - x*theta;
           theta = theta + P*transpose(x)*prediction_err;
           theta_plot(:,i) = theta;
         end
    end
    t =1:shape_model(1);
    plot(t, theta_plot);
    legend('theta1','theta2','theta3','theta4');
    model_prediction = theta;
    
end

