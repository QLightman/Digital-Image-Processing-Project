function g=Geometric_mean_filter(f,Size)
%f is the input image
%Size is the scale of the filter
[m,n]=size(f);
M=zeros(m+(Size-1)*2,n+(Size-1)*2);
M(Size:m+Size-1,Size:n+Size-1)=f;
for i=1:m+(Size-1)/2
    for j=1:n+(Size-1)/2
        tmp=reshape(M(i:i+Size-1,j:j+Size-1),numel(M(i:i+Size-1,j:j+Size-1)),1);
        g(i,j)=real(prod(tmp)^(1/(Size*Size)));
        %get the geometric mean value of the matrix
    end
end
  g(1:(Size-1)/2,:)=[];
  g(:,1:(Size-1)/2)=[];
end