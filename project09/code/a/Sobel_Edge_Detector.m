function [gx, gy] = Sobel_Edge_Detector(F, dir, smoothed)
% dir is the direction of gradient.
% smoothed is the size of smoothed core
    if dir == 0
        Sobel_core_x = [-1 -2 -1;
                         0 0 0; 
                         1 2 1];
        Sobel_core_y = [-1 0 1; 
                        -2 0 2; 
                        -1 0 1];
    else
        Sobel_core_x = [0 1 2;
                        -1 0 1; 
                       -2 -1 0];
        Sobel_core_y = [-2 -1 0; 
                        -1 0 1; 
                        0 1 2];
    end
    if smoothed ~= 0
        smoothed_core = ones(smoothed, smoothed);
        smoothed_core = smoothed_core ./ smoothed^2;
        F = Filter(smoothed_core, F);
    end
    gx = Filter(Sobel_core_x, F);
    gy = Filter(Sobel_core_y, F);
end

