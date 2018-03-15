function [ G ] = Threshold( F, T )
    G = zeros(size(F));
    [m,n]=find(F>T);
    for i=1:length(m)
        G(m(i),n(i))=F(m(i),n(i));
    end
end

