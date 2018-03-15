function g=inverse_filter(f,H)
f=center_transform(f);
F=fft2(f)./H;
g=real(ifft2(F));
g=center_transform(g);
g=calibration(g);
end