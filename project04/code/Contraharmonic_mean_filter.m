function g=Contraharmonic_mean_filter(f,Size,Q)
%f is the input image
%Size is the scale of the filter
% Q is the order of the filter
[m,n]=size(f);
M=zeros(m+(Size-1)*2,n+(Size-1)*2);
M(Size:m+Size-1,Size:n+Size-1)=f;
for i=1:m+(Size-1)/2
    for j=1:n+(Size-1)/2
        tmp=(reshape(M(i:i+Size-1,j:j+Size-1),numel(M(i:i+Size-1,j:j+Size-1)),1));
        g(i,j)=sum(tmp.^(Q+1))/(sum(tmp.^Q));
    end
end
  g(1:(Size-1)/2,:)=[];
  g(:,1:(Size-1)/2)=[];
end