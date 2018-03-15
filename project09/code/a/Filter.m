function [g] = Filter(core, figure)
%output a figure by filtering a figure with core.
    [h_figure, w_figure] = size(figure);
    [h_core, w_core] = size(core);
    g = zeros(h_figure, w_figure);
    if h_core ~= 2 && w_core ~= 2
        h_core_half = (h_core - 1) / 2;
        w_core_half = (w_core - 1) / 2;
        for i = 1 : h_figure
            for j = 1 : w_figure
                for k = -h_core_half : h_core_half
                    for l = -w_core_half : w_core_half
                        if i + k > 0 && i + k <= h_figure && j + l > 0 && j + l <= w_figure
                            g(i, j) = g(i, j) + core(k + h_core_half + 1, l + w_core_half + 1) * figure(i + k, j + l);
                        end
                    end
                end
            end
        end
    else
        for i = 1 : h_figure
            for j = 1 : w_figure
                for k = 0 : 1
                    for l = 0 : 1
                        if i + k <= h_figure && j + l <= w_figure
                            g(i, j) = g(i, j) + core(k + 1, l + 1) * figure(i + k, j + l);
                        end
                    end
                end
            end
        end
    end
end