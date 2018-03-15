function g=calibration(f)
f = double(f);
f = f-min(f(:));
f = 255 * (f/max(f(:)));
g = uint8(f); 
end