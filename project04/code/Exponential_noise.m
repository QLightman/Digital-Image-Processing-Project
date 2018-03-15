function n_Ex=Exponential_noise(f,a)
[M,N]=size(f);
n_Ex = (-1/a)*log(1 - rand(M,N)); 
end