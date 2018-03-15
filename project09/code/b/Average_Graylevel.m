function [ m ] = Average_Graylevel( P, lb, ub )
    m = 0.0;
    for i = lb:ub
        if i == 1
            m = m + P(1) * 1.0;
        else
            m = m + (P(i)-P(i-1))*double(i);
        end
    end
    if lb == 1
        m = m / P(ub);
    else
        m = m / (P(ub)- P(lb-1));
    end
end

