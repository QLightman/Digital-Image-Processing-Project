function O= nearest_neighbor_interpolation( I, T )
%I is the input image
%T is the transform matrix
%O is the output image
[m,n] = size(I);
O = zeros(m,n);
for i = -m/2 + 1 : m/2
    for j = -n/2 + 1 : n/2
        p_trans = [i,j,1];
        pi = p_trans/T;
        x = pi(1) + m/2;
        y = pi(2) + n/2;
        if x<1||x>m||y<1||y>n
            continue;
        end
        x = round(x);
        y = round(y);
        O(i + m/2, j + n/2) = I(x,y);
    end
end

end

