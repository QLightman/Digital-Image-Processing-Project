function Histogram_equalization(f,n)
%f is the original image
%n is the gray-level of the image
x=0:n-1;
y=hist(f,n);
subplot(2,3,1),imshow(f);
title('original image');
subplot(2,3,2),plot(x,y),xlabel('x'),ylabel('y'),title('histogram of the original image');
[s,f1]=equalization(f,y,n);
subplot(2,3,3),plot(x,s),xlabel('x'),ylabel('s'),title('transformation function');
subplot(2,3,4),imshow(f1);title('Enhanced image');
y1=hist(f1,n);
subplot(2,3,5),plot(x,y1),xlabel('x'),ylabel('y'),title('histogram of the Enhanced image');
end