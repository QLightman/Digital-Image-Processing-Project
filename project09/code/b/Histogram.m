function [D, P] = Histogram(f)
    L = 8;
    if L <= max(max(f))
        L = 256;
    end
    D = zeros(L, 1);
    for i = 1:size(f, 1)
        for j = 1:size(f, 2)
            D(f(i, j) + 1, 1) = D(f(i, j) + 1, 1) + 1;
        end
    end
    P = double(D) ./ size(f, 1) ./ size(f, 2);
    for i = 2:L
        P(i) = P(i-1) + P(i);
    end
end