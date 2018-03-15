clc;clear;close all;
I=imread('book_cover.jpg');
[M,N]=size(I);
I_dft=fft2(center_transform(I));
subplot(1,4,1); imshow(I); title('(a) Original image'); 

a=0.1;b=0.1;T=1;
[I_b,H] =filter_H(I_dft,a,b,T); 
subplot(1,4,2); 
imshow(I_b); 
title('(b) blur test the image'); 

I_b_inverse=inverse_filter(I_b,H);
subplot(1,4,3); 
imshow(I_b_inverse);
title('(c) restore blurred image with inverse filter');
 
I_b_wiener=wiener_filter(I_b,I,H,Gaussian_noise(I_b,0,650));
subplot(1,4,4); 
imshow(I_b_wiener); 
title('(d) restore blurred image with Wiener filter');

figure;
restore_noise_image(I_b,0,650,H,I);
figure;
restore_noise_image(I_b,0,200,H,I);
figure;
restore_noise_image(I_b,0,20,H,I);

