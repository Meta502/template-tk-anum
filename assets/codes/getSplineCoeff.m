function [c] = getSplineCoeff(t, x)
  [s, yt] = createMatrix(t, x);
  c = s \ yt;
endfunction

function [s, yt] = createMatrix(t, x)
  s = zeros(length(t), length(t));
  s(1, 1) = 1;
  s(length(t), length(t)) = 1;
  for i = 2:length(t) - 1
    ki = 2*(t(i-1) - t(i + 1));
    kp = t(i-1) - t(i);
    kn = t(i) - t(i+1);

    s(i, i - 1) = kp;
    s(i, i) = ki;
    s(i, i + 1) = kn;
  endfor

  yt = zeros(length(t), 1);
  for i = 2:length(t) - 1
    a = (x(i - 1) - x(i)) / (t(i - 1) - t(i));
    b = (x(i) - x(i + 1)) / (t(i) - t(i+1));
    yt(i, 1) =  (a - b);
  endfor
endfunction