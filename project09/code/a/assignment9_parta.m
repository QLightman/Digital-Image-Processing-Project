clc; clear;close all;
F = double(imread('building.tif')) / 255;
F = remap(F, 0.0, 1.0);

%% The process of Roberts edge detection.
subplot(221);imshow(F,[]);
title('(a)Original image');

[gx, gy] = Roberts_Edge_Detector(F);
G = remap(abs(gx), 0.0, 1.0);
subplot(222);imshow(G, []);
title('(b)|gx| Figure of Roberts Edge Detector');

G = remap(abs(gy), 0.0, 1.0);
subplot(223);imshow(G, []);
title('(c)|gy| Figure of Roberts Edge Detector');

G = remap(abs(gx)+abs(gy), 0.0, 1.0);
subplot(224);imshow(G, []);
title('(d)|gx|+|gy| Figure of Roberts Edge Detector');

%% The process of Prewitt edge detection.
figure;
subplot(221);imshow(F,[]);
title('(a)Original image');
[gx, gy] = Prewitt_Edge_Detector(F);
G = remap(abs(gx), 0.0, 1.0);
subplot(222);imshow(G, []);
title('|gx| Figure of Prewitt Edge Detector');

G = remap(abs(gy), 0.0, 1.0);
subplot(223);imshow(G, []);
title('|gy| Figure of Prewitt Edge Detector');

G = remap(abs(gx)+abs(gy), 0.0, 1.0);
subplot(224);imshow(G, []);
title( '|gx|+|gy| Figure of Prewitt Edge Detector');

%% The process of Sobel edge detection without Smoothed
figure;
[gx, gy] = Sobel_Edge_Detector(F, 0, 0);
G = remap(abs(gx), 0.0, 1.0);
subplot(221);imshow(G, []);
title('|gx| Figure of Sobel Edge Detector without Smoothed');

G = remap(abs(gy), 0.0, 1.0);
subplot(222);imshow(G, []);
title('|gy| Figure of Sobel Edge Detector without Smoothed');

G = remap(abs(gx)+abs(gy), 0.0, 1.0);
subplot(223);imshow(G, []);
title('|gx|+|gy| Figure of Sobel Edge Detector without Smoothed');

G = abs(gx)+abs(gy);
G = Threshold(G, 0.25 * max(max(G)));
subplot(224);imshow(G, []);
title('The Threshold Processing of |gx|+|gy| without Smoothed');


%% The process of Sobel edge detection with Smoothed
figure;
[gx, gy] = Sobel_Edge_Detector(F, 0, 5);
G = remap(abs(gx), 0.0, 1.0);
subplot(221);imshow(G, []);
title('|gx| Figure of Sobel Edge Detector with Smoothed');

G = remap(abs(gy), 0.0, 1.0);
subplot(222);imshow(G, []);
title('|gy| Figure of Sobel Edge Detector with Smoothed');

G = remap(abs(gx)+abs(gy), 0.0, 1.0);
subplot(223);imshow(G, []);
title('|gx|+|gy| Figure of Sobel Edge Detector with Smoothed');

G = abs(gx)+abs(gy);
G = Threshold(G, 0.18 * max(max(G)));
subplot(224);imshow(G, []);
title('The Threshold Processing of |gx|+|gy| with Smoothed');

%% The process of Marr-Hildreth edge detection.
figure;
subplot(221);imshow(F,[]);
title('(a)Original image');
G = MarrHildreth_Edge_Detector(F, 25, 4);
Gc = G;
tmp = 10;
Gc(G < -tmp) = -tmp;
Gc(G > tmp) = tmp;
Gc = remap(Gc, 0, 1);
subplot(222);imshow(Gc, []);
title('MarrHildreth Edge Detector before Zero Crossing');

subplot(223);imshow(Zero_Crossing(G, 0.0), []);
title('MarrHildreth Edge Detector after Zero Crossing of 0');

subplot(224);imshow(Zero_Crossing(G, 0.1 * max(max(G))), []);
title('MarrHildreth Edge Detector after Zero Crossing of 10%');

%% The process of Canny edge detection.
figure;
subplot(221);imshow(F,[]);
title('(a)Original image');

G = Canny_Edge_Detector(F, 25, 4, 0.04, 0.1);
subplot(222);imshow(G, []);
title('Result of Canny Edge Detector with 0.04 & 0.1');

G = Canny_Edge_Detector(F, 25, 4, 0.06, 0.15);
subplot(223);imshow(G, []);
title('Result of Canny Edge Detector with 0.06 & 0.15');

G = Canny_Edge_Detector(F, 25, 4, 0.1, 0.25);
subplot(224);imshow(G, []);
title('Result of Canny Edge Detector with 0.1 & 0.25');


