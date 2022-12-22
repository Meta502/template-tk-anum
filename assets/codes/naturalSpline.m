function res = naturalSpline(x, y, p, k)
  res = zeros(1, length(p));

  for i = 1:length(p);
    idx = 1;

    if p(i) >= x(end)
      idx = length(x) - 1;
    else
      for j=1:length(x) - 1;
        if p(i)>=x(j) && p(i)<x(j+1)
          idx = j;
          break
        endif
      endfor
    endif

    a = (k(idx)) * (((p(i) - x(idx + 1))^3 / (x(idx) - x(idx + 1))) - (p(i) - x(idx + 1)) * (x(idx) - x(idx + 1)));
    b = (k(idx+1)) * (((p(i) - x(idx))^3 / (x(idx) - x(idx + 1))) - (p(i) - x(idx)) * (x(idx) - x(idx + 1)));
    c = (y(idx) * (p(i) - x(idx + 1)) - y(idx + 1) * (p(i) - x(idx))) / (x(idx) - x(idx + 1));
    res(i) = a - b + c;
  endfor
endfunction