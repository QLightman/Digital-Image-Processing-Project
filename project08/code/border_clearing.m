function border_clearing(I)
[M,N]=size(I);
F=zeros(M,N);
for i=1:1:M
    for j=1:1:N
        if i==1||i==M||j==1||j==N
            F(i,j)=I(i,j);
        end
    end
end
subplot(121),imshow(F);
%F is the marker image
title('Marker image')
i=0;
while(true)
    tmp=dilate(F,ones(3,3));
    tmp=tmp&I;
    i=i+1;
    fprintf('Border clearing %d iteration \n',i);
    if(tmp==F)
    % break is the image remains the same
        break
    end
    F=tmp;
end
fprintf('Border clearing overall %d iteration \n',i);
subplot(122),imshow(I-F);
title('Image with no objects touching the border');
end