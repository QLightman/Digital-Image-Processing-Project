function [G] = Global_Threshold(F, P)
    T = Average_Graylevel(P, 1, 256);
    while true
        m1 = Average_Graylevel(P, 1, floor(T));
        m2 = Average_Graylevel(P, floor(T)+1, 256);
        Tc = (m1 + m2) / 2.0;
        if (Tc == T) 
            break;
        else
            T = Tc;
        end
    end
    G = zeros(size(F));
    G(F > T) = 1;
end