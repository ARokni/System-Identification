function [regressors] =  prediction_Least_absolute(X_train, Y_train)
    epoch = 50;
    train_shape = size(X_train);
    train_size = train_shape(1);
    regressors = 20*ones(train_shape(2),1);
    for m = 1:epoch
        for i = 1:train_size
            X = X_train(i,:);
            Y = Y_train(i,:);
            Y_predict = X*regressors;
            regressors =  gradient_descent_norm1(Y, Y_predict, X, regressors);
        end
        Y_predict = X_train*regressors;
        error = Y_train-Y_predict;
         averageError(m) = sum(abs(error))/length(error);
    end
    t = 1:length(averageError);
    plot(t,averageError);
end

