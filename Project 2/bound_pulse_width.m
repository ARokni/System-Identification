function [bounded_pulse_width] =  bound_pulse_width(random_pulse_width, minimum_pulse_width, maximum_pulse_width)
bounded_pulse_width = []
    for i = 1:length(random_pulse_width)
        if(random_pulse_width(i)> (maximum_pulse_width-1))
            bounded_pulse_width(i) = floor(maximum_pulse_width)
        elseif(random_pulse_width(i)<minimum_pulse_width)
            bounded_pulse_width(i) = ceil(minimum_pulse_width)
        else
            bounded_pulse_width(i) = floor(random_pulse_width(i))+1
        end
        
    end
end