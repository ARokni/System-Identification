function [W_Ls] = deNormlize(W_LS_normalized, inputData)
    u = inputData;
    W_Ls =[];
    X = ones(size(u));
    for i = 2:length(W_LS_normalized)  %Firts regressor is constant number which we did not normalized it at all(all trainin was 1)
         temp = u.^(i); 
         std_temp = std(temp);
         mean_temp = mean(temp);
         W_Ls(i) = W_LS_normalized(i)*std_temp + mean_temp;
    end



end

