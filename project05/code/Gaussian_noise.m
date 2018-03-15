function noise=Gaussian_noise(f,u,v)
[M,N]=size(f);
noise=u+sqrt(v).*randn(M,N); 
end