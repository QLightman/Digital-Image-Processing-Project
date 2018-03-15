function [ G ] = MarrHildreth_Edge_Detector( F, n, stdev )
    Gussian_core = Gaussian_Sampling(n, stdev);
    G = Filter(Gussian_core, F);
    Laplace_core = [1 1 1; 1 -8 1; 1 1 1];
    G = Filter(Laplace_core, G);
end

