function assignment4_part2(f)
f=im2double(f);
n_gaussian = Gaussian_noise(f,0,0.08);
subplot(2,2,1);imshow(f);title('(a)X-ray image');
f_noise=f+n_gaussian;
subplot(2,2,2);imshow(f_noise);title('(b)Image corrupted by additive Gaussian noise')
Arithmetic_filter_result=Arithmetic_mean_filter(f_noise,3);
subplot(2,2,3);imshow(Arithmetic_filter_result);title('(c)filtering with an arithmetic mean filter of size 3*3');
Geometric_filter_result=Geometric_mean_filter(f_noise,3);
subplot(2,2,4);imshow(Geometric_filter_result);title('(d)filtering with an Geometric mean filter of size 3*3');
suptitle('FIGURE 5.07 in textbook');
figure;

pepper_noise_result = Impulse_noise(f,0.1,0);
subplot(2,2,1);imshow(pepper_noise_result);xlabel('(a)Image corrupted by pepper noise with a probability of 0.1');
salt_noise_result = Impulse_noise(f,0,0.1);
subplot(2,2,2);imshow(salt_noise_result);xlabel('(b)Image corrupted by salt noise with a probability of 0.1');
pepper_noise_reduce = Contraharmonic_mean_filter(pepper_noise_result,3,1.5);
subplot(2,2,3);imshow(pepper_noise_reduce);xlabel('(c)Result of Contraharmonic_mean_filter(3*3)(Q=1.5) ');
salt_noise_reduce = Contraharmonic_mean_filter(salt_noise_result,3,-1.5);
subplot(2,2,4);imshow(salt_noise_reduce);xlabel('(d)Result of Contraharmonic_mean_filter(3*3)(Q=-1.5) ');
suptitle('FIGURE 5.08 in textbook')

figure;
pepper_noise_wrong_reduce = Contraharmonic_mean_filter(pepper_noise_result,3,-1.5);
subplot(1,2,1);imshow(pepper_noise_wrong_reduce);xlabel('(a)Result of Contraharmonic_mean_filter(3*3)(Q=-1.5) ');
salt_noise_wrong_reduce = Contraharmonic_mean_filter(salt_noise_result,3,1.5);
subplot(1,2,2);imshow(salt_noise_wrong_reduce);xlabel('(b)Result of Contraharmonic_mean_filter(3*3)(Q=1.5) ');
suptitle('FIGURE 5.09 in textbook')

figure;
salt_pepper_noise_result = Impulse_noise(f,0.1,0.1);
subplot(2,2,1);imshow(salt_pepper_noise_result);
xlabel('(a)Image corrupted by salt and-pepper noise with probabilities Pa=Pb=0.1');
salt_pepper_noise_reduce=median_filter(salt_pepper_noise_result,3);
subplot(2,2,2);imshow(salt_pepper_noise_reduce);
xlabel('(b)Result of one pass with a median filter of size 3*3');

salt_pepper_noise_reduce2=median_filter(salt_pepper_noise_reduce,3);
subplot(2,2,3);imshow(salt_pepper_noise_reduce2);
xlabel('(c)Result of processing (b) with this filter.');

salt_pepper_noise_reduce3=median_filter(salt_pepper_noise_reduce2,3);
subplot(2,2,4);imshow(salt_pepper_noise_reduce3);
xlabel('(d)Result of processing (c) with this filter.');
suptitle('FIGURE 5.10 in textbook')
figure;
pepper_noise_result = Impulse_noise(f,0.1,0);
max_filter_result=max_filter(pepper_noise_result,3);
subplot(121);imshow(max_filter_result);
xlabel('(a)Result of filtering pepper noise image with max filter')

salt_noise_result = Impulse_noise(f,0,0.1);
min_filter_result=min_filter(salt_noise_result,3);
subplot(122);imshow(min_filter_result);
xlabel('(b)Result of filtering salt noise image with min filter');
suptitle('FIGURE 5.11 in textbook')
figure;

uniform_noise_result=Uniform_noise(f,0,sqrt(800)/255);
uniform_noise_result=f+uniform_noise_result;
subplot(231);imshow(uniform_noise_result);
xlabel('(a) Image corrupted by additive uniform noise');

salt_pepper_noise_result=Impulse_noise(uniform_noise_result,0.1,0.1);
subplot(232);imshow(salt_pepper_noise_result);
xlabel('(b) Image additionally corrupted by additive salt and pepper noise.');

arithmetic_filter_result=Arithmetic_mean_filter(salt_pepper_noise_result,5);
subplot(233);imshow(arithmetic_filter_result);
xlabel('(c)arithmetic mean filter(5*5)');

Geometric_filter_result=Geometric_mean_filter(salt_pepper_noise_result,3);
subplot(234);imshow(Geometric_filter_result);
xlabel('(d)geometric mean filter');

median_filter_result=median_filter(salt_pepper_noise_result,5);
subplot(235);imshow(median_filter_result);
xlabel('(e)median filter(5*5)');

Alpha_trimmed_filter_result=Alpha_trimmed_mean_filter(salt_pepper_noise_result,5,5);
subplot(236);imshow(Alpha_trimmed_filter_result);
xlabel('(f)alpha-trimmed mean filter with d = 5');
suptitle('FIGURE 5.12 in textbook')
end
