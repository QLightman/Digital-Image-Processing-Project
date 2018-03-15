function f=dilate(F,B)
[M,N]=size(F);
[m,n]=size(B);
f=zeros(M,N);
[x,y]=find(F==1);
for i=1:1:length(x)
    for k=-(m-1)/2:1:(m-1)/2
        for t=-(n-1)/2:1:(n-1)/2
            if x(i)+k<1||x(i)+k>M||y(i)+t<1||y(i)+t>N 
            % if over the boundary, continue
                continue;
            end     
            f(x(i)+k,y(i)+t)=F(x(i)+k,y(i)+t)|B(k+(m+1)/2,t+(n+1)/2);
         end
    end                
end

end

                

                        
                
            