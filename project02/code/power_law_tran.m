function g=power_law_tran(f,n)
%f is image, n is the parameter of the power law transformation
for i=1:size(f,1)
    for j=1:size(f,2)
        if f(i,j)<0
            g(i,j)=0;
        else
            g(i,j)=f(i,j)^n;
        end 
    end
end
end