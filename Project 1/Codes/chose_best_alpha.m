function [ alpha ] = chose_best_alpha(ls_Matrix)
    condition_number = cond(ls_Matrix);
    [V D] = eig(ls_Matrix);
    landa = [];
    for i = 1:length(D)
        landa(i) = D(i,i);
    end
    max_eig = max(landa);
    limit_condition = 10^4;
    if(condition_number > limit_condition)
        alpha = max_eig/limit_condition;
    else
        alpha = 0;
end

