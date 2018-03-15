function [ T ] = get_rotate_matrix(a)
% a is the input angle, T is the output image
a = pi/180 *a;
T = [cos(a), -sin(a), 0; sin(a), cos(a), 0; 0, 0, 1];
end

