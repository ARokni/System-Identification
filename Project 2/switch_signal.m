function [s_signal] = switch_signal(signal_tmp)
    rand_numb = randi([0 1],1,1);
    if(signal_tmp == 1)
        if(rand_numb==1)
            s_signal = 0;
        else
            s_signal = -1;
        end
    elseif(signal_tmp == 0)
        if(rand_numb ==1)
            s_signal = 1;
        else
            s_signal = -1;
        end
    else
        if(rand_numb == 1)
            s_signal = 1
        else
            s_signal = 0
        end
    end
        
end

