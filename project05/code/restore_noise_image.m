function restore_noise_image(I_b,u,v,H,I)
% I_b is the image filtered by filter_H
% u,v is the parameters for Gaussian_noise function
% I is the original image
noise=Gaussian_noise(I_b,u,v);
I_bn=noise+double(I_b); 
I_bn=uint8(I_bn); 
subplot(1,3,1);
imshow(I_bn); 
title(['(a) add gaussian noise v = ',num2str(v)]);

subplot(1,3,2); 
I_bn_inverse=inverse_filter(I_bn,H);
imshow(I_bn_inverse); 
title('(b) restore blurred noisy image with inverse filter');

subplot(1,3,3); 
I_bn_wiener=wiener_filter(I_bn,I,H,noise);
imshow(I_bn_wiener);
title('(c) restore blurred noisy image with Wiener filter');
suptitle(['Restore noisy image v=',num2str(v),' using inverse and Wiener filter']);
end