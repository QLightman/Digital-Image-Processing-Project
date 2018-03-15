function [ g ] = Gaussian_Sampling( n, D0 )
    n = (n-1)/2;
    u = -n:n;
    v = -n:n;
    [V, U] = meshgrid(v, u);
    D = V.^2 + U.^2;
    g = exp(-D./(2*(D0^2)));
end

