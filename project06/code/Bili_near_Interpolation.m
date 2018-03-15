function  O= Bili_near_Interpolation( I, T )
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
        x0 = floor(x);
        y0 = floor(y);
        x1 = ceil(x);
        y1 = ceil(y);
        x_offset = x - x0;
        y_offset = y - y0;
        O(i + m/2, j + n/2) = I(x0,y0)*(1 - x_offset)*(1 - y_offset) + ...
            I(x1,y0)*x_offset*(1 - y_offset) + I(x0,y1)*(1 - x_offset)*y_offset + ...
            I(x1,y1)* x_offset * y_offset;
    end
end

end

