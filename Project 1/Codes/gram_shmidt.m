function [v1_temp] = gram_shimdt(v, X) 
    v1_temp = X;
    shape = size(v);
    for j = 1:shape(2);
        v_temp = v(:,j);
        alpha = (transpose(v_temp)*X)/(transpose(v_temp)*v_temp);
        v1_temp = v1_temp - alpha*v_temp;
     end
end

