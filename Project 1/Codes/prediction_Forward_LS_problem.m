function [model_prediction] = prediction_Forward_LS_problem(Regressors_train,system_OutPut_train)

    X_train = Regressors_train;
    Y_train = system_OutPut_train;
    for m = 1:10
        for i = 1:10
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
                 reg_temp = [regressor_choosed ,X_train(:,i)];
                 model_prediction = (inv(transpose(reg_temp)*reg_temp)*transpose(reg_temp)*Y_train);
                 error = Y_train -  reg_temp*model_prediction;
                 lossFunction(i) = transpose(error)*error;
            else 
                 model_prediction = (inv(transpose(X_train(:,i))*X_train(:,i))*transpose(X_train(:,i))*Y_train);
                 error = Y_train - model_prediction* X_train(:,i);
                 lossFunction(i) = transpose(error)*error;
           end
        end
        [minVal, minInd(m)] = min(lossFunction);
         regressor_choosed(:,m) = X_train(:,minInd(m));
         cost(m) = lossFunction(minInd(m));
          lossFunction(minInd(m)) = 10000000;
    end
    t = 1:m;
    plot(t,cost);
end

