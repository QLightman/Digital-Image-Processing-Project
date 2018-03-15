function g=user_filter(f,d)
% f is the image, d is the filter mask
[m,n]=size(f);
[x,y]=size(d);
x=(x+1)/2;
y=(y+1)/2;
M=zeros(m+2*x,n+2*y);
M(1+x:m+x,1+y:n+y)=f;

for i=1:m+x-1
    for j=1:n+y-1
       g(i,j)=sum(reshape(d.*M(i:i+x,j:j+y),numel(d.*M(i:i+x,j:j+y)),1));
       %get the all the value of the matrix
    end
end
g(x-1,:)=[];
g(:,y-1)=[];
end

     
