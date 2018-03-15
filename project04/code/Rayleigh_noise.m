function n_rayleigh=Rayleigh_noise(f,a,b)
[M,N]=size(f);
n_rayleigh = a + (-b .* log(1 - rand(M,N))).^0.5; 
end