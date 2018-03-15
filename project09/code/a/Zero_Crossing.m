function [ G ] = Zero_Crossing( F, T )
    G = zeros(size(F));
    [h, w] = size(F);
    for i = 1:h
        for j = 1:w
            if i > 1 && i < h && F(i-1,j)*F(i+1,j)<0 && abs(F(i-1,j)-F(i+1,j)) > T
                G(i,j) = 1;
            end
            if j > 1 && j < w && F(i,j-1)*F(i,j+1)<0 && abs(F(i,j-1)-F(i,j+1)) > T
                G(i,j) = 1;
            end
            if i > 1 && i < h && j > 1 && j < w
                if F(i-1,j-1)*F(i+1,j+1)<0 && abs(F(i-1,j-1)-F(i+1,j+1)) > T
                    G(i,j) = 1;
                end
                if F(i-1,j+1)*F(i+1,j-1)<0 && abs(F(i-1,j+1)-F(i+1,j-1)) > T
                    G(i,j) = 1;
                end
            end
        end
    end
end

