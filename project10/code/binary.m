function im=binary(src,threshold)
im=src;
im(find(src<=threshold))=0;
im(find(src>threshold))=1;