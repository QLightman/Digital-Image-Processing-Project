function [a,b]=upperleft(bi)
[m,n]=size(bi);
min=m+n;
a=m;
b=n;
for i=1:m
    for j=1:n
        if bi(i,j)==255&&i+j<=min
            a=i;
            b=j;
            min=i+j;
        end
    end
end