clc;
clear;
close all;
f1=imread('Fig1.jpg');
f2=imread('Fig2.jpg');          
Histogram_equalization(f1,256);
figure,Histogram_equalization(f2,256);