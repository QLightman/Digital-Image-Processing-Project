function y=hist(f,n)
%f is the original image
%y is the gray-level distribution of this image
%n is the gray-level of the image
y=zeros(1,n);
for i=1:size(f,1)
    for j=1:size(f,2)
        y(f(i,j)+1)=y(f(i,j)+1)+1;
    end
end
y=y/numel(f);
%normalization process
end