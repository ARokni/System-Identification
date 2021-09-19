function [model_prediction] = prediction_LS(Regressors_train,system_OutPut_train)

    X_train = Regressors_train;
    Y_train = system_OutPut_train;
    model_prediction = (inv(transpose(X_train)*X_train)*transpose(X_train)*Y_train);
    deg_model = length(model_prediction);
    for i = 1:deg_model
        model_prediction(deg_model - i + 1) = 0;
    end
end

