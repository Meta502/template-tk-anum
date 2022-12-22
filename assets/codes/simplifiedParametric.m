function [p, q] = parametricSpline(x, y)
  tt = 1:0.1:length(x);
  kx = getSplineCoeff(1:length(x), x);
  ky = getSplineCoeff(1:length(y), y);

  p = naturalSpline(1:length(x), x, tt, kx);
  q = naturalSpline(1:length(y), y, tt, ky);
endfunction