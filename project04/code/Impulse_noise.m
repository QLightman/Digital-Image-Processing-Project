function g_sp=Impulse_noise(f,a,b) 
[M,N]=size(f);
x = rand(M,N);  
g_sp = f;   
g_sp(find(x<=a)) = 0;  
g_sp(find(x > a & x<(a+b))) = 1;  
end