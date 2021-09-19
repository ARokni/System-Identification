function [model_prediction] = prediction_Backward_LS_problem(Regressors_train,system_OutPut_train)
    
    X_train = Regressors_train;
    Y_train = system_OutPut_train;
    regressors = (inv(transpose(X_train)*X_train)*transpose(X_train)*Y_train);
    reg_temp = regressors;
    
    
    for m = 1:10
        for i = 1:10
            model_prediction = reg_temp;
            flag = 0;
            if(m>1)
                for n = 1:m-1
                    if(i==minInd(n))
                        flag = 1;
                    end
                end
                if(flag==1)
                    continue
                end
            end
            model_prediction(i) = 0;
            error = Y_train - X_train*model_prediction;
            lossFunction(i) = transpose(error)*error;
        end
        [minVal, minInd(m)] = min(lossFunction);
         %regressor_choosed(m) = (inv(transpose(X_train(:,minInd(m)))*X_train(:,minInd(m)))*transpose(X_train(:,minInd(m)))*Y_train);
         cost(m) = lossFunction(minInd(m));
         lossFunction(minInd(m)) = 100000000;
         reg_temp(minInd(m)) = 0;
    end
    t = 1:m;
    plot(t,cost);
end

