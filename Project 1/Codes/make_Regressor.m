function [X] = makeRegressor(inputData,modelDegree)
    
    u = inputData;
    n = modelDegree;
    
    X = ones(size(u));
    for i = 1:n-1
         temp = u.^(i); 
         X = horzcat(X, temp);
    end
end

