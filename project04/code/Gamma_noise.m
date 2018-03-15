function n_Erlang=Gamma_noise(f,a,b) 
[M,N]=size(f);
n_Erlang = zeros(M,N);   
 [M,N]=size(f);
for j=1:b  
    n_Erlang = n_Erlang + (-1/a)*log(1 - rand(M,N));  
end  
end