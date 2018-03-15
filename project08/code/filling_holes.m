function filling_holes(I)
subplot(221),imshow(I);
title('Text image')
[M,N]=size(I);
F=zeros(M,N);
G=1-I;
%G is the mask image
subplot(222),imshow(G);
title('Complement of (a) for use as a mask image')
for i=1:1:M
    for j=1:1:N
        if i==1||i==M||j==1||j==N
            F(i,j)=1-I(i,j);
        end
    end
end
subplot(223),imshow(F);
%F is the marker image
title('Marker image');
i=0;
while(true)
    tmp=dilate(F,ones(3,3));
    tmp=tmp&G;
    i=i+1;
    fprintf('Filling holes %d iteration \n',i);
    if tmp==F 
    % break if the image remains the same
        break
    end
    F=tmp; 
end
fprintf('Filling holes overall %d iteration \n',i);
subplot(224),imshow(1-F);
title('Result of hole-filling')
end