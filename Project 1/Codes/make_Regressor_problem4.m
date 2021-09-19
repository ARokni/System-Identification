function [X] = make_Regressor_problem4(inputData)
    
    u = inputData;
   % n = modelDegree;
   model_structure = [1,3,6];
    
    X = ones(size(u));
    for i = 1:length(model_structure)
         temp = u.^(model_structure(i)); 
         X = horzcat(X, temp);
    end
end

