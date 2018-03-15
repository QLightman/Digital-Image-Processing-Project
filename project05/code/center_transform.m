function g=center_transform(f)
    [M,N]=size(f);
    f=double(f);
    for i=1:M
        for j=1:N
            g(i,j)=(-1)^(i+j)*f(i,j);
        end
    end
    
end