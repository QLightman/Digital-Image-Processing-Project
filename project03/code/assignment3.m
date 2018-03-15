clc;
clear;
close all;
f = imread('characters_test_pattern.tif');
f = mat2gray(f,[0 255]);

%% -----------Ideal Lowpass filter----------------------
ILPF(f,10);
figure,ILPF(f,30);
figure,ILPF(f,60);
figure,ILPF(f,160);
figure,ILPF(f,460);

%% -----------Ideal Highpass filter----------------------
IHPF(f,10);
figure,IHPF(f,30);
figure,IHPF(f,60);
figure,IHPF(f,160);

%% -----------Gaussian Lowpass filter----------------------
figure,GLPF(f,10);
figure,GLPF(f,30);
figure,GLPF(f,60);
figure,GLPF(f,160);
figure,GLPF(f,460);

%% -----------Gaussian Highpass filter----------------------
figure,GHPF(f,30);
figure,GHPF(f,60);
figure,GHPF(f,160);

%% -----------Butterworth Highpass filter----------------------
figure,BHPF(f,30,2);
figure,BHPF(f,60,2);
figure,BHPF(f,160,2);

%% -----------Butterworth Lowpass filter----------------------
figure,BLPF(f,10,2);
figure,BLPF(f,30,2);
figure,BLPF(f,60,2);
figure,BLPF(f,160,2);
figure,BLPF(f,460,2);
