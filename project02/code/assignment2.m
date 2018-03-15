clc;
clear;
f1=imread('skeleton_orig.tif');
f=im2double(f1);

Laplacian=[-1,-1,-1;-1,8,-1;-1,-1,-1];
Sobel1=[-1,-2,-1;0,0,0;1,2,1];
Sobel2=[-1,0,1;-2,0,2;-1,0,1];

g=user_filter(f,Laplacian);
g_sobel1=user_filter(f,Sobel1);
g_sobel2=user_filter(f,Sobel2);
g_mid=midium_5filter(f);

subplot(1,4,1),imshow(f),title('a(Image of whole body bone scan)');
subplot(1,4,2),imshow(g),title('b(Laplacian of (a))');
subplot(1,4,3),imshow(g+f),title('c(Sharpened image)');
subplot(1,4,4),imshow(abs(g_sobel1)+abs(g_sobel2)),title('d(Sobel gradient of(a))');

figure,subplot(1,4,1),imshow(g_mid),title('e(averaging filter)');
subplot(1,4,2),imshow((g+f).*g_mid),title('f(Mask image)');
subplot(1,4,3),imshow(f+(g+f).*g_mid),title('g(Sharpened image)');
g_power=power_law_tran(f+(g+f).*g_mid,0.5);
subplot(1,4,4),imshow(g_power),title('h(power-law transformation)');




