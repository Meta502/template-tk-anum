function [res, R, j] = rombergIntegration(a, b, tol, f)

  if tol < 1e-14
    printf("Tolerance is too small and will produce errors, please use larger values\n")
    res = 0;
    return;
  endif

  n = 100;
  R = zeros(n, n);
  R(1,1) = (b-a)*(f(a)+f(b))/2;

  for j = 2:n
    h = (b-a)/2^(j-1);
    Rval = 0;

    for i = 1:2^(j-2)
      Rval = Rval + f(a+(2*i - 1)*h);
    endfor

    R(j,1) = (1/2)*R(j-1,1) + h*Rval;

    for k = 2:j
      topval = 4^(k-1)*R(j,k-1) - R(j-1,k-1);
      botval = 4^(k-1) - 1;
      R(j,k) = topval/botval;
    endfor

    if abs(R(j,j)-R(j-1,j-1)) < tol
      break;
    endif

  endfor

  R(1:j,1:j);
  res = R(j,j);

endfunction
