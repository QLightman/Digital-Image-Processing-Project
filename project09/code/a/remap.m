function [ g ] = remap(f, lb, ub)
%Remap the figure to display better.
    if max(max(f)) ~= min(min(f))
        g = (f - min(min(f))) / (max(max(f)) - min(min(f))) * (ub - lb) + lb;
    else
        g = f - f + (ub + lb) / 2.0;
    end
end
