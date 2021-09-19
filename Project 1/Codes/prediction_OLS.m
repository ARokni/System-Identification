function [W] = prediction_OLS(X, Y, ns, n)
    totalSum = transpose(Y)*Y

% Step1
    for i = 1:n
        v_temp = X(:,i)
        etha(i) = transpose(v_temp)*Y/norm(v_temp)^2;
        error(i) = etha(i)^2 * norm(v_temp)^2;
    end
    [argvalue, argmax] = max(error);
    v = X(:,argmax);
    reg_used = argmax
    error_reduction_step = argvalue;
    error_step = totalSum - error_reduction_step;

% Next Steps


   for k = 2:ns
         etha = [] ;
         error = [] ;
         for i = 1:n
             if(repeated(i, reg_used))
                 continue;
             end
             v1_temp = gram_shmidt(v, X(:,i));
             etha(i) = transpose(v1_temp)*Y/norm(v1_temp)^2;
             error(i) = etha(i)^2 * norm(v1_temp)^2;
         end
         [argvalue, argmax] = max(error);
          v(:,k) = gram_shmidt(v, X(:,argmax));
          reg_used(k) = argmax;
          error_reduction_step(k) = argvalue;
          error_step(k) = error_step(k - 1) - error_reduction_step(k);
   end

t = 1:length(error_step);
plot(t, error_step)
xlabel('Regressors')
ylabel('Error')
figure(2)
plot(t, error_reduction_step);
xlabel('Regressors')
ylabel('Error Reduction')
% Last line will transform regressors from orthogonal space to the first vector space
W = inv(transpose(v)*X)*transpose(v)*Y;

end
