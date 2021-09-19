function [model_prediction] = prediction_RLS_cutoff(Regressors_train, system_OutPut_train, alpha)

    X_train = Regressors_train;
    Y_train = system_OutPut_train;
     X_shape = size(X_train);
    identity = eye(X_shape(2));
    ls_Matrix = transpose(X_train)*X_train;
    alpha = chose_best_alpha(ls_Matrix);
    rls_Matrix =  ls_Matrix + alpha * identity;
    cond(rls_Matrix)
    model_prediction = (inv(rls_Matrix)*transpose(X_train)*Y_train);
    for i=1:length(model_prediction)
        if(abs(model_prediction(i))<0.1)
            model_prediction(i) = 0;
        end
    end
end

