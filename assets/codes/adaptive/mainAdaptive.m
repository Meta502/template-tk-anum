minInf = -1e4;

a = input('Masukkan batas bawah interval a:  ');
b = input('Masukkan batas atas interval b:  ');
TOL = input('Masukkan Tolerance TOL:  ');

printf("\Kalkulasi nilai Integrasi z-Score dengan Metode Adaptive Quadrature (Trapezoid)")
printf("\nSpesifikasi Perhitungan:")
printf("\nAsumsi -inf adalah nilai yang sangat kecil: %d", minInf)
printf("\nBatas bawah: %d", a)
printf("\nBatas atas: %d", b)
printf("\nBatas TOL: %d\n", TOL)

% P(a <= Z <= b)
% P(Z <= b) - P(Z <= a)
orig = b-a;

printf("\nP(Z <= a)\n")
Pa = TrapezoidAdaptive(@func,minInf,a,TOL,orig)

printf("\nP(Z <= b)\n")
Pb = TrapezoidAdaptive(@func,minInf,b,TOL,orig)

approx = Pb-Pa
printf("\nHasil Aproksimasi Integrasi: %d\n", approx)

% P(a <= Z <= b)
integ = TrapezoidAdaptive(@func,a,b,TOL,orig);
printf("\nHasil Aproksimasi Integral P(a<=Z<=b): %d\n", integ)

printf("\nBeda Hasil Komputasi P(a <= Z <= b) dan P(Z <= b) - P(Z <= a)\n")
diff_res = approx - integ

[quadAns, err] = quadgk(@func, a, b)
err_quad = abs(quadAns-approx);
err_quad_ab = abs(quadAns-integ);
printf("----------")
printf("\nHasil Aktual dengan Metode Quadgk: %d\n", quadAns)
printf("\nEror P(Z <= b) - P(Z <= a)  Vs. Metode Quadgk: %d\n", err_quad)
printf("\nEror P(a <= Z <= b) Vs. Metode Quadgk: %d\n", err_quad_ab)

cdf = normcdf([a b]);
cdf_ans = cdf(2) - cdf(1);
err_cdf = abs(cdf_ans - approx);
err_cdf_ab = abs(cdf_ans - integ);
printf("----------")
printf("\nHasil NormCDF for Z value (Actual Value)\n: %d", cdf_ans)
printf("\nEror P(Z <= b) - P(Z <= a)  Vs. Metode NormCDF: %d\n", err_cdf)
printf("\nEror P(a <= Z <= b) Vs. Metode NormCDF: %d\n", err_cdf_ab)
