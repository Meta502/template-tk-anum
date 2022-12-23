function Q = TrapezoidAdaptive(f,a,b,Tol,ori)
  c = (a+b)/2;      % evaluate f in midpoint
  fa = f(a); fb = f(b); fc = f(c);

  Q1 = (b-a)*(fa+fb)/2;        % Trapezoid rule for S[a,b]
  Q2 = (c-a)*(fc+fa)/2;        % Trapezoid rule for S[a,c]
  Q3 = (b-c)*(fb+fc)/2;        % Trapezoid rule for S[b,c]

  if abs(Q1-Q2-Q3)<= 3*Tol*(b-a)/ori
    Q = Q2+Q3;   %accept trapezoid rule value
  else
    Q = TrapezoidAdaptive(f,a,c,Tol,ori) + TrapezoidAdaptive(f,c,b,Tol,ori);
    % use algorithm for [a,c] and [c,b]
  endif
end

