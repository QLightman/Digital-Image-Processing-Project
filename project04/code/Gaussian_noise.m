function n_gaussian=Gaussian_noise(f,a,b)
[M,N]=size(f);
n_gaussian = a + b .* randn(M,N);  
end