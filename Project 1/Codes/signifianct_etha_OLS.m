function [etha] = signifianct_etha_OLS(etha)
    significatn_number = 5;
    for i =significatn_number + 1:length(etha)
        %if(etha(i)<0.0001)
            etha(i) = 0;
        %end
    
    end

end

