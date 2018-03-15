function [s,f1]=equalization(f,y,n)
%f is the original image, f1 is the enhanced image
%y is the gray-level distribution of this image
%s is the gray-level distribution of the enhanced image
%n is the gray-level of the image
s=zeros(1,n);tmp=0;f1=f;
for i=1:n
    tmp=tmp+y(i);
    s(i)=round((n-1)*tmp);
end
for i=1:size(f,1)
    for j=1:size(f,2)
        f1(i,j)=s(f(i,j)+1);
    end
end 
end