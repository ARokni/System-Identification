function [v1_temp] = gram_shimdt(v, X)  
    for j = 1:length(v)
        v_temp = v(:,j);
        alpha(j) = (transpose(v_temp)*X)/(transpose(v_temp)*v_temp);
        v1_temp = v1_temp - alpha*v_temp;
     end
end

