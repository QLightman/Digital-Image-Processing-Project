function g=midium_5filter(f)
%f is the input image
[m,n]=size(f);
M=zeros(m+8,n+8);
M(5:m+4,5:n+4)=f;
for i=1:m+2
    for j=1:n+2
       g(i,j)=median(reshape(M(i:i+4,j:j+4),numel(M(i:i+4,j:j+4)),1));
       %get the midium value of the matrix
    end
end
  g(1:2,:)=[];
  g(:,1:2)=[];
end