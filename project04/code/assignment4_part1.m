function assignment4_part1(f)
f=im2double(f);
n_gaussian = Gaussian_noise(f,0,0.08);
subplot(2,3,1);imshow(f+n_gaussian);xlabel('Gaussian noise');
subplot(2,3,4);imhist(f+n_gaussian);

n_rayleigh = Rayleigh_noise(f,-0.2,0.03); 
subplot(2,3,2);imshow(f+n_rayleigh);xlabel('Rayleigh noise');
subplot(2,3,5);imhist(f+n_rayleigh);

n_Erlang = Gamma_noise(f,25,3);  
subplot(2,3,3);imshow(f+n_Erlang);xlabel('Gamma noise');
subplot(2,3,6);imhist(f+n_Erlang);
suptitle('FIGURE 5.4 in textbook');
figure(2);
n_Ex = Exponential_noise(f,9); 
subplot(2,3,4);imhist(f+n_Ex);
subplot(2,3,1);imshow(f+n_Ex);xlabel('Exponential noise');

n_Uniform = Uniform_noise(f,0,0.3);  
subplot(2,3,5);imhist(f+n_Uniform);
subplot(2,3,2);imshow(f+n_Uniform);xlabel('Uniform noise');
 
g_sp = Impulse_noise(f,0.05,0.05);
subplot(2,3,6);imhist(g_sp);
subplot(2,3,3);imshow(g_sp);xlabel('Impulse noise');
suptitle('FIGURE 5.4 in textbook');



end