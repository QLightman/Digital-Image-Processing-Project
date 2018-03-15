function g=outer_boundary(I)
    [m,n]=size(I);
    min=m+n;
    i=m;
    j=n;
    for k1=1:m
        for k2=1:n
            if I(k1,k2)==255 && k1+k2<=min
                i=k1;
                j=k2;
                min=k1+k2;
            end
        end
    end
    
    b=[i,j];
    c=[i-1,j];
    sequence1=ones(100,2);
    sequence1(1,:)=b;
    while I(c(1),c(2))~=255
        t=c;
        c=rotate(b,t);
    end
    b=c;
    sequence1(2,:)=b;
    c=t;
    
    k=2;
    while b(1)~=i||b(2)~=j
        while I(c(1),c(2))~=255
            t=c;
            c=rotate(b,t);
        end
        k=k+1;
        b=c;
        sequence1(k,:)=b;
        c=t;
    end
    
    g=zeros(m,n);
    [m,~]=size(sequence1);
    for k=1:m
        g(sequence1(k,1),sequence1(k,2))=255;
    end
end