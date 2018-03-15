function open_by_construction(f)
subplot(221),imshow(f);
title('Text image of size pixels');
F=erode(f,ones(51,1));
subplot(222),imshow(F);
title('Erosion of (a) with a structuring element of size 51*1 pixels')

subplot(223),imshow(dilate(F,ones(51,1)));
title('Opening of (a) with the same structuring element, shown for reference')
i=0;
while (true)
    tmp=dilate(F,ones(3,3));
    tmp=tmp&f;
    i=i+1;
    fprintf('Opening by reconstruction %d iteration \n',i);
    if tmp==F
    % break is the image remains the same
        break;
    end
    F=tmp;
end
fprintf('Opening by reconstruction overall %d iteration \n',i);
subplot(224),imshow(F);
title('Result of opening by reconstruction');

end