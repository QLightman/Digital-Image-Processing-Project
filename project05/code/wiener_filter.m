function g=wiener_filter(I,I_o,H,noise)
G=fft2(center_transform(I));
Sn = abs(fft2(center_transform(noise))).^2;
Sf = abs(fft2(center_transform(I_o))).^2;
g = (abs(H).^2./H./(abs(H).^2+Sn./Sf)).*G;
g=real(ifft2(g));
g=center_transform(g);
g=uint8(g);
end