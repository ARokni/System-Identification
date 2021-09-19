function [result] = repeated(index, reg_used)
    for i = 1:length(reg_used)
        if(index == reg_used(i))
            result = 1;
            return;
        end
    end
    result = 0;
end

