function [g,H]=filter_H(I,a,b,T)
    [M,N]=size(I);
    for u=1:M
        for v=1:N
           t= pi*((u-M/2)*a+(v-N/2)*b);
           if t==0
               H(u,v)=1;
           else        
               H(u,v)=T/(t)*sin(t)*exp(-j*t);
           end
           G(u,v)=I(u,v)*H(u,v);
        end
    end
    g=ifft2(G);
    g=real(g);
    g=center_transform(g);
    g=uint8(g);
end