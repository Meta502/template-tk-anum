function res = z_norm_dist(z)
  res = (1 / (sqrt(2 .* pi))) * exp(-(z.^2)/2);
endfunction