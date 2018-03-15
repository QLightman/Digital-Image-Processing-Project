function g=reconstruct(f,w,h)
    [~,num] = size(f);
    p = w*h;
    vectors = zeros(p, num);
    
    cnt = 1;
    for i=1:w
        for j=1:h
            for k=1:num
                vectors(cnt, k) = f{k}(i, j);
            end
            cnt = cnt + 1;
        end
    end

    mx = (sum(vectors)./p)';

    cx = zeros(num, num);
    for i=1:p
        cx = cx + vectors(i, :)' * vectors(i, :);
    end
    cx = cx./(p) - mx*mx';

    [A, ~] = eig(cx);
    A = flipud(A);

    PCs = 2;
    y = zeros(p, PCs);
    for i=1:p
        y(i, :) = (A(1:PCs,:) * (vectors(i, :)' - mx))';
    end

    x_hat = zeros(p, num);
    for i=1:p
        x_hat(i, :) = (A(1:PCs,:)' * y(i, :)' + mx)';
    end

    g = f;
    cnt = 1;
    for i=1:w
        for j=1:h
            for k=1:num
                g{k}(i, j) = x_hat(cnt,k);
            end
            cnt = cnt + 1;
        end
    end

end