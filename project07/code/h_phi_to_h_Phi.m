function [ g ] = h_phi_to_h_Phi( f )
    g = power(-1, 0:(size(f, 2)-1)) .* fliplr(f);
end

