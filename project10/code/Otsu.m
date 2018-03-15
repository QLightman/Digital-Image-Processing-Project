function g=Otsu(I)
% I is the input image
% g is the output image
    a=I;   
    [m,n]=size(a);    
    count=imhist(a)/(m*n);                
    E=[];             
    for threshold=1:256     
        a_0=0;  
        a_1=0;  
        w_0=sum(count(1:threshold));   
        w_1 = 1 - w_0;  
        for i=1:threshold  
            a_0= a_0 + i*count(i);  
        end   
        u_0 = a_0/w_0;                   

        for i=threshold+1:256  
            a_1= a_1 + i*count(i);   
        end   
        u1 = a_1/w_1;      
        E(threshold) = w_0*w_1*(u1-u_0)*(u1-u_0);  
    end   
    threshold=find(E==max(E)); 
    g = I;
    g(find(I<=threshold))=0;
    g(find(I>threshold))=255; 
end