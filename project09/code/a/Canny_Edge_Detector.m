function [ G ] = Canny_Edge_Detector( F, n, stdev, TL, TH )
    Gussian_core = Gaussian_Sampling(n, stdev);
    G = Filter(Gussian_core, F);
    [gx, gy] = Sobel_Edge_Detector(G, 0, 0);
    M = sqrt(gx.^2 + gy.^2);
    Angle = atan(gy./gx);
    
    [h,w] = size(M);
    for i = 1:h
        for j = 1:w
            if i <= n || i > h - n
                M(i, j) = 0;
            end
            if j <= n || j > w - n
                M(i, j) = 0;
            end
        end
    end
    gn = zeros(size(M));
    direction = zeros(size(M));
    for i = 1:h
        for j = 1:w
            dk = GetDir(Angle(i,j).*(8/pi));
            if dk == 1 
                if i > 1 && i < h && M(i,j) > max(M(i-1,j),M(i+1,j))
                    gn(i,j) = M(i,j);
                else
                    gn(i,j) = 0;
                end
            end
            if dk == 2 
                if i > 1 && i < h && j > 1 && j < w && M(i,j) > max(M(i-1,j-1),M(i+1,j+1))
                    gn(i,j) = M(i,j);
                else
                    gn(i,j) = 0;
                end
            end
            if dk == 3 
                if j > 1 && j < w && M(i,j) > max(M(i,j-1),M(i,j+1))
                    gn(i,j) = M(i,j);
                else
                    gn(i,j) = 0;
                end
            end
            if dk == 4 
                if i > 1 && i < h && j > 1 && j < w && M(i,j) > max(M(i-1,j+1),M(i+1,j-1))
                    gn(i,j) = M(i,j);
                else
                    gn(i,j) = 0;
                end
            end
            direction(i, j) = dk;
        end
    end
    
    gnh = Threshold(gn, TH * max(max(gn)));
    gnl = Threshold(gn, TL * max(max(gn))) - gnh;
    
    G = zeros(size(gnh));
    queue_x = zeros(h * w, 1);
    queue_y = zeros(h * w, 1);
    tail = 1;
    for i = 1:h
        for j = 1:w
            if G(i,j) == 0 && gnh(i,j) > 0
                queue_x(tail) = i;
                queue_y(tail) = j;
                tail = tail + 1;
                G(i,j) = 1;
            end
        end
    end
    dir_x = [0 0 -1 -1 -1 1 1 1];
    dir_y = [1 -1 -1 0 1 -1 0 1];
    head = 1;
    while head < tail
        x = queue_x(head);
        y = queue_y(head);
        head = head + 1;
        for k = 1:8
            i = x + dir_x(k);
            j = y + dir_y(k);
            if i > 0 && i <= h && j > 0 && j <= w
                if G(i,j) == 0 && (gnh(i,j) > 0 || gnl(i,j) > 0)
                    queue_x(tail) = i;
                    queue_y(tail) = j;
                    tail = tail + 1;
                    G(i,j) = 1;
                end
            end
        end
    end
end

function [dk] = GetDir(angle)
    if angle > 1 && angle <= 3
        dk = 2;
    end
    if angle > 3 || angle < -3
        dk = 3;
    end
    if angle >= -3 && angle < -1
        dk = 4;
    end
    if angle >= -1 && angle <= 1
        dk = 1;
    end
end

