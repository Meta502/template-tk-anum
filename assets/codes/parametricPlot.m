function parametricPlot(x, y, res, speed)
  tt = 1:res:length(x);
  kx = getSplineCoeff(1:length(x), x);
  ky = getSplineCoeff(1:length(y), y);

  p = naturalSpline(1:length(x), x, tt, kx);
  q = naturalSpline(1:length(y), y, tt, ky);
  pmin = min(p)
  pmax = max(p)
  qmin = min(q)
  qmax = max(q)

  if qmin == qmax
    temp = qmin
    qmin = temp - 1
    qmax = temp + 1
  endif

  if pmin == pmax
    temp = pmin
    pmin = temp - 1
    pmax = temp + 1
  endif

  hold on
  p1 = subplot(2, 2, [1 2])
    h = plot(p(1), q(1))
    hold on
    h1 = plot(x, y, "o")
    xlim([pmin pmax])
    ylim([qmin qmax])
    axis equal
    hold off
  p2 = subplot(2, 2, 3)
    l = plot(tt(1), x(1), "color", "red")
    hold on
    xlim([0 length(x) - 1])
    ylim([pmin pmax])
    xlabel("Waktu");
    ylabel("X");
    hold off
  p3 = subplot(2, 2, 4)
    m = plot(tt(1), y(1), "color", "blue")
    hold on
    xlim([0 length(y) - 1])
    ylim([qmin qmax])
    xlabel("Waktu");
    ylabel("Y");
    hold off
  for k = 1:length(p);
    set(h, 'XData', p(1:k))
    set(h, 'YData', q(1:k))

    set(l, 'XData', tt(1:k) - 1)
    set(l, 'YData', p(1:k))

    set(m, 'XData', tt(1:k) - 1)
    set(m, 'YData', q(1:k))

    pause(res / speed)
  endfor
  hold off
endfunction