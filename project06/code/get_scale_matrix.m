function [ T ] = get_scale_matrix(x,y)
%x is the offsets in x scale, y is the offsets in y scale
if x == 0
    x = 1;
end
if y == 0
    y = 1;
end

T = [1/x, 0, 0; 0, 1/y, 0; 0, 0, 1];

end

