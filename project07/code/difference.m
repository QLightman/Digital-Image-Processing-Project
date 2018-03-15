function [ difference ] = difference( a, b )
% a is the original image, b is the reconstructed image
    difference = b - a;
    difference = (difference - min(min(difference))) ./ ...
    (max(max(difference)) - min(min(difference)));
    %generates a gray image in [0, 1]
end

