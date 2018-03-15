function ILPF(f,radius)
[M,N] = size(f);
P = 2*M;
Q = 2*N;
fc = zeros(M,N);

for x = 1:1:M
    for y = 1:1:N
        fc(x,y) = f(x,y) * (-1)^(x+y);
    end
end

F = fft2(fc,P,Q);

H_1 = zeros(P,Q);

for x = (-P/2):1:(P/2)-1
     for y = (-Q/2):1:(Q/2)-1
        D = (x^2 + y^2)^(0.5);
        if(D <= radius)  H_1(x+(P/2)+1,y+(Q/2)+1) = 1;
        end    
     end
end

G_1 = H_1 .* F;

g_1 = real(ifft2(G_1));
g_1 = g_1(1:1:M,1:1:N);      

for x = 1:1:M
    for y = 1:1:N
        g_1(x,y) = g_1(x,y) * (-1)^(x+y);
    end
end
subplot(2,2,1);
imshow(f,[0 1]);
xlabel('a.Original Image');

subplot(2,2,2);
imshow(log(1 + abs(F)),[]);
xlabel('b.Fourier spectrum of a');

subplot(2,2,3);
imshow(H_1,[0 1]);
xlabel(sprintf('c.Ideal Lowpass filter (D=%d)',radius));

subplot(2,2,4);
imshow(g_1,[0 1]);
xlabel('e.Result image');

end
