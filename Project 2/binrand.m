function [binrand_signal] = binrand(T,N,t_min,t0, dist)
    %if(dist == normal)
        minimum_pulse_width = t_min;
        maximum_pulse_width = floor(T/N);
        normal_mean = (minimum_pulse_width + maximum_pulse_width)/2;
        normal_std = (maximum_pulse_width - minimum_pulse_width)/6;
        random_pulse_width = normrnd(normal_mean, normal_std, N);
        random_pulse_width = bound_pulse_width(random_pulse_width, minimum_pulse_width, maximum_pulse_width);
        binrand_signal = zeros([T,1]);
        signal_tmp = 0;
        cnt = 1;
        pulse_width = 0;
        for i = 1:T
            if(cnt <= length(random_pulse_width))
                if( pulse_width == random_pulse_width(cnt))
                    cnt = cnt+1;
                    if(cnt<= length(random_pulse_width))
                        signal_tmp = switch_signal(signal_tmp);
                    end
                    pulse_width = 0;
                end
            end
            binrand_signal(i) = signal_tmp;
            pulse_width = pulse_width + 1;
        end
    
end

