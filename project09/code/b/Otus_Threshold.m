function [G] = Otus_Threshold(F, P1)
    P2 = 1.0 - P1;
    minLevel = min(min(F)) + 1;
    maxLevel = max(max(F)) + 1;
    mG = Average_Graylevel(P1, minLevel, maxLevel);
    M1 = double(zeros(size(P1)));
    M2 = double(zeros(size(P1)));
    for k = minLevel:(maxLevel-1)
        M1(k) = Average_Graylevel(P1, minLevel, k);
        M2(k) = Average_Graylevel(P1, k+1, maxLevel);
    end
    D = P1 .* (M1 - mG) .^ 2 + P2 .* (M2 - mG) .^ 2;
    for k = 1:256
        if k < minLevel || k >= maxLevel
            D(k) = 0;
        end
    end
    maxD = max(D);
    [Value] = find(D == maxD);
    T = 0.0;
    count = 0.0;
    for i = 1:size(Value)
        T = T + Value(i);
        count = count + 1.0;
    end
    T = T / count;
    G = zeros(size(F));
    G(F > T) = 1;
end