clc; clear;close all;
f = double(imread('data/lenna.tif')) / 255;
imwrite(f, 'data/lenna.png');

%% ------------Image compression based on DCT
figure;
subplot(2, 3, 1);
imshow(f, []);
title('original image');

zonal_mask = [1 1 1 1 1 0 0 0
              1 1 1 1 0 0 0 0
              1 1 1 0 0 0 0 0
              1 1 0 0 0 0 0 0
              1 0 0 0 0 0 0 0
              0 0 0 0 0 0 0 0
              0 0 0 0 0 0 0 0
              0 0 0 0 0 0 0 0];
    zonal_image = dct(f, zonal_mask);
subplot(2, 3, 2);
imshow(zonal_image);
title('reconstructed image based on zonal mask')
imwrite(zonal_image, 'data/zonal_image.png');
zonal_difference = difference(f, zonal_image);
subplot(2, 3, 3);
imshow(zonal_difference, []);
title('difference image of zonal mask');

threshold_mask = [1 1 0 1 0 0 0 0
                  1 1 1 1 0 0 0 0
                  1 1 0 0 0 0 0 0
                  1 0 0 0 0 0 0 0
                  0 0 0 0 0 0 0 0
                  0 1 0 0 0 0 0 0
                  0 0 0 0 0 0 0 0
                  0 0 0 0 0 0 0 0];
threshold_image = dct(f, threshold_mask);
subplot(2, 3, 4);
imshow(threshold_image, []);
title('reconstructed image based on threshold mask')
imwrite(threshold_image, 'data/threshold_image.png');
threshold_difference = difference(f, threshold_image);
subplot(2, 3, 5);
imshow(threshold_difference, []);
title('difference image of threshold mask');
suptitle('image compression based on DCT');

%% ------------Image compression based on Harr wavelet
figure;
haar_phi = [1/sqrt(2) 1/sqrt(2)];
subplot(1, 3, 1);
[c1, c2, c3, harr_3level] = dwt_3level(f, haar_phi);
imshow(harr_3level, []);
imwrite(harr_3level, 'data/harr_3level.png');
title('3 level wavelet transform');
subplot(1, 3, 2);
reconstructed_harr = idwt_3level(c1, c2, c3, haar_phi);
imshow(reconstructed_harr, []);
imwrite(reconstructed_harr, 'data/reconstructed_harr.png');
title('reconstructed image');
subplot(1, 3, 3);
harr_diff = difference(f, reconstructed_harr);
imshow(harr_diff, []);
imwrite(harr_diff, 'data/harr_diff.png');
title('difference image of Harr wavelet');
suptitle('Image compression based on Harr wavelet')
%% ------------Image compression based on Daubechies wavelet
figure;
daubechies_phi = [0.23037781 0.71484657 0.63088076 -0.02798376 -0.18703481 0.03084138 0.03288301 -0.01059740];
subplot(1, 3, 1);
[c1, c2, c3, daubechies_3level] = dwt_3level(f, daubechies_phi);
imshow(daubechies_3level, []);
imwrite(daubechies_3level, 'data/daubechies_3level.png');
title('Daubechies wavelet transform');
subplot(1, 3, 2);
reconstructed_daubechies = idwt_3level(c1, c2, c3, daubechies_phi);
imshow(reconstructed_daubechies, []);
imwrite(reconstructed_daubechies, 'data/reconstructed_daubechies.png');
title('reconstructed image');
subplot(1, 3, 3);
daubechies_diff = difference(f, reconstructed_daubechies);
imshow(daubechies_diff, []);
title('difference image');
suptitle('Image compression based on Daubechies wavelet')
%% ------------Image compression based on Symlet wavelet
figure;
symlet_phi = [0.0322 -0.0126 -0.0992 0.2979 0.8037 0.4976 -0.0296 -0.0758];
subplot(1, 3, 1);
[c1, c2, c3, symlet_3level] = dwt_3level(f, symlet_phi);
imshow(symlet_3level, []);
imwrite(symlet_3level, 'data/symlet_3level.png');
title('3 level wavelet transform');
subplot(1, 3, 2);
reconstructed_symlet = idwt_3level(c1, c2, c3, symlet_phi);
imshow(reconstructed_symlet, []);
imwrite(reconstructed_symlet, 'data/reconstructed_symlet.png');
title('reconstructed image');
subplot(1, 3, 3);
symlet_diff = difference(f, reconstructed_symlet);
imshow(symlet_diff, []);
title('difference image');
suptitle('Image compression based on Symlet wavelet');
%% ------------Image compression based on biorthogonal Cohen-Daubechies-Feauveau wavelet
figure;
bcf_phi = [0 0.0019 -0.0019 -0.017 0.0119 0.0497 -0.0773 -0.0941 0.4208 0.8259 0.4208 -0.0941 -0.0773 0.0497 0.0119 -0.017 -0.0019 0.0010];
subplot(1, 3, 1);
[c1, c2, c3, bcf_3level] = dwt_3level(f, bcf_phi);
imshow(bcf_3level, []);
imwrite(bcf_3level, 'data/bcf_3level.png');
title('3 level wavelet transform');
subplot(1, 3, 2);
reconstructed_bcf = idwt_3level(c1, c2, c3, bcf_phi);
imshow(reconstructed_bcf, []);
imwrite(reconstructed_bcf, 'data/reconstructed_bcf.png');
title('reconstructed image');
subplot(1, 3, 3);
bcf_diff = difference(f, reconstructed_bcf);
imshow(bcf_diff, []);
title('difference image');
suptitle('Image compression based on biorthogonal Cohen-Daubechies-Feauveau wavelet')