clc;clear;close all;

figure;
I=imread('noisy_stroke.tif');
subplot(2,3,1);
imshow(I);
title('Original image');

bi=uint8(Arithmetic_mean_filter(I,9));
subplot(2,3,2);
imshow(bi);
title('Smoothed with mean filter(9*9)');

bi=uint8(Otsu(bi));
subplot(2,3,3);
imshow(bi);
title('Otsu''s method');

b = uint8(outer_boundary(bi));
subplot(2,3,4);
imshow(b);
title('Longest outer boundary');

[m,n]=size(I);
sizeD = 40;
subsample = zeros(m,n);
row = floor(m/sizeD);
col = floor(n/sizeD);
connected = zeros(row,col);

for i=1:m
    for j=1:n
        if(b(i, j) == 255)
            connected_x = round(row*i/m);
            connected_y = round(col*j/n);
            sub_x = round(connected_x/row*m);
            sub_y = round(connected_y/col*n);
            connected(connected_x,connected_y) = 255;
            subsample(sub_x, sub_y) = 255;
        end
    end
end

subplot(2,3,5);
subsample = uint8(subsample);
imshow(subsample);
title('Subsample');

subplot(2,3,6);
connected = uint8(connected);
imshow(connected);
title('Connected subsample');

[chain_code,chain_code_Diff] = get_code(connected);

display(num2str(chain_code));
display(num2str(chain_code_Diff));

images = cell(1,6);
for i = 1:6
    images{1,i} = imread(['WashingtonDC_Band',int2str(i),'.tif']);
end

[m,n] = size(images{1,1});
new_pics = reconstruct(images,m,n);
figure;
for i=1:6
    subplot(2,3,i);
    imshow(uint8(new_pics{i}));
end
suptitle('Reconstuction');


