function [gx, gy] = Prewitt_Edge_Detector(F)
    Prewitt_core_x = [-1 -1 -1;
                       0 0 0; 
                       1 1 1];
    Prewitt_core_y = [-1 0 1; 
                      -1 0 1; 
                      -1 0 1];
    gx = Filter(Prewitt_core_x, F);
    gy = Filter(Prewitt_core_y, F);
end

