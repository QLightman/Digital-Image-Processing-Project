function n_Uniform=Uniform_noise(f,a,b)
[M,N]=size(f);
n_Uniform = a + (b-a)*rand(M,N);  
end