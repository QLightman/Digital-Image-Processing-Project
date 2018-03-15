function [gx, gy] = Roberts_Edge_Detector(F)
    Roberts_core_x = [-1 0;
                       0 1];
    Roberts_core_y = [0 -1; 
                      1 0];
    gx = Filter(Roberts_core_x, F);
    gy = Filter(Roberts_core_y, F);
end

