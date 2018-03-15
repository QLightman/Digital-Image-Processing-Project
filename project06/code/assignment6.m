clc;
clear;
close all;
I = imread( 'ray_trace_bottle.tif');
I = im2double(I);

deg = [-45,45,90,135];
for i=1:length(deg)
    T = get_rotate_matrix(deg(i));
    I_rotate_near =  nearest_neighbor_interpolation(I, T );
    subplot(2,4,i),imshow(I_rotate_near);
    title(['image rotate by ',num2str(deg(i)),' degree(near)']);
    I_rotate_bili =  Bili_near_Interpolation(I, T );
    subplot(2,4,i+4),imshow(I_rotate_bili);
    title(['image rotate by ',num2str(deg(i)),' degree(bill)']);
end    
suptitle('image rotation using the nearest neighbor and bilinear interpolation')


figure,
offsets = [50,50;50,-50;50,100;150,50]; 
for i=1:length(offsets)
    T = get_translate_matrix(offsets(i,1),offsets(i,2));
    I_trans_near =  nearest_neighbor_interpolation(I, T );
    subplot(2,4,i),imshow(I_trans_near);
    title(['image translation by ',num2str(offsets(i,1)),' ',num2str(offsets(i,2)),' (near)']);
    I_trans_bili =  Bili_near_Interpolation(I, T );
    subplot(2,4,i+4),imshow(I_trans_bili);
    title(['image translation by ',num2str(offsets(i,1)),' ',num2str(offsets(i,2)),' (bill)']);
end
suptitle('image translation using the nearest neighbor and bilinear interpolation')


figure,
scales = [1.2,1.2;0.8,0.8;1.2,0.8;0.8,1.2];
for i=1:length(scales)
    T = get_scale_matrix(scales(i,1),scales(i,2));
    I_scale_near =  nearest_neighbor_interpolation(I, T );
    subplot(2,4,i),imshow(I_scale_near);
    title(['image scaled by ',num2str(scales(i,1)),' ',num2str(scales(i,2)),' (near)']);
    I_scale_bili =  Bili_near_Interpolation(I, T );
    subplot(2,4,i+4),imshow(I_scale_bili);
    title(['image scaled by ',num2str(scales(i,1)),' ',num2str(scales(i,2)),' (bill)']);
end
suptitle('image scale using the nearest neighbor and bilinear interpolation')



