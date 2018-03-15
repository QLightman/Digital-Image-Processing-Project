clc; clear;close all;
F = imread('polymersomes.tif');
subplot(131);imshow(F, []);
title('Original Figure');
[D, P] = Histogram(F);

%% -------------- The process of global threshold segmentation.
Global_F = Global_Threshold(F, P);
subplot(132);imshow(Global_F, []);
title('Figure after Global Threshold Segmentation');

%% -------------- The process of Otus threshold segmentation.
Otus_F = Otus_Threshold(F, P);
subplot(133);imshow(Otus_F, []);
title('Figure after Otus Threshold Segmentation');

