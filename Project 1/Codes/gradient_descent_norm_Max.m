function [regressors] = gradient_descent_norm_Max(error, x, regressors)
    
    step_size = 0.1;
    if(error>0)
        gradient = -transpose(x);
    else
        gradient = transpose(x);
    end
    regressors = regressors - step_size*gradient;
end

