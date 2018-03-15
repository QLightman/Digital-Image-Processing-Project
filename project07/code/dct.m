function [ g ] = dct( f, mask )
%DCT calculates the DCT transform given a 8*8 image & mask
	[m, n] = size(f);
    b_h = fix((m - 1) / 8) + 1;
    b_w = fix((n - 1) / 8) + 1;
    g = zeros(b_h * 8, b_w * 8);
    g(1:m, 1:n) = f;

    r = ones(8) ./ sqrt(8);
    r(2:8, 1:8) = r(2:8, 1:8) .* sqrt(2);
    r = r .* cos(pi * [0:7]' * [1:2:15] / 16);
    for i = 1:b_h
        for j = 1:b_w
            t = (r * g(i * 8 - 7:i * 8, j * 8 - 7:j * 8) * r') .* mask;
            g(i * 8 - 7:i * 8, j * 8 - 7:j * 8) = r' * t * r; 
        end
    end
end

