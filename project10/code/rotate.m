function n=rotate(b,c)
    n=[c(1)-c(2)+b(2)
        c(2)+c(1)-b(1)];
    if b(2)+b(1)==c(2)+c(1)
        n(1)=n(1)+b(1)-c(1);
    end
    
    if b(2)-b(1)==c(2)-c(1)
        n(2)=n(2)+b(1)-c(1);
    end
end
