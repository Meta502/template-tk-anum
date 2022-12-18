function [res, n] = composite_simpson(a,b,tol,f)

  n = ceil((b-a)/tol^(1/4));
  h = (b-a)/n;
  res = f(a)+f(b);

  # Make sure n is even
  n = n+mod(n,2);

  for i = 1:n/2
    res = res + 4*f(a + h*(2*i-1)) + 2*f(a+h*2*i);
  endfor

  res = res * h / 3;

endfunction