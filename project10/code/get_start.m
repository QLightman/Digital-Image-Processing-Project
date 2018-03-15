function [x, y] = get_start(image)
[M, N] = size(image);

x = 0;
y = 0;
for i=1:M
    for j=1:N
        if(image(i,j) == 255)
            x = i;
            y = j;
            return;
        end
    end
end

end