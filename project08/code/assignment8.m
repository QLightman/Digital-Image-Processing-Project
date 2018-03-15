clc;
clear;
f=imread('Fig0929(a)(text_image).tif');
f1=imread('Fig0931(a)(text_image).tif');
open_by_construction(f);
figure,filling_holes(f);
figure,border_clearing(f1);





