function [X] = makeRegressor(inputData,modelDegree)
    
    u = inputData;
    n = modelDegree;
    
    X = ones(size(u));
    for i = 1:n-1
         temp = u.^(i); 
         std_temp = std(temp);
         mean_temp = mean(temp);
         temp = (temp-mean_temp)/std_temp;
         X = horzcat(X, temp);
    end
end

