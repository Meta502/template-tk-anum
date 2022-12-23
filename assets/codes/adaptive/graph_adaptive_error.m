a = input('Masukkan batas bawah interval a:  ');
b = input('Masukkan batas atas interval b:  ');

printf("\Kalkulasi nilai Integrasi z-Score dengan Metode Adaptive Quadrature (Trapezoid)")
printf("\nSpesifikasi Perhitungan:")
printf("\nBatas bawah: %d", a)
printf("\nBatas atas: %d", b)

orig = b-a;

[quadAns, err] = quadgk(@func, a, b)
printf("----------")
printf("\nHasil Aktual dengan Metode Quadgk: %d\n", quadAns)

cdf = normcdf([a b]);
cdf_ans = cdf(2) - cdf(1);

printf("----------")
printf("\nHasil NormCDF for Z value (Actual Value)\n: %d", cdf_ans)

printf("\nKalkulasi Error dengan TOL\n")
tol_list = [1e-2,1e-4,1e-5, 1e-6, 1e-10];
err_list_quad = zeros(1, length(tol_list));
err_list_cdf = zeros(1, length(tol_list));

for i=1:length(tol_list)
  printf("\nIterasi ke- %d\n", i)
  tol_curr = tol_list(i);
  approx = TrapezoidAdaptive(@func,a,b,tol_curr,orig);
  printf("\nHasil Approx: %d\n", approx)
  err_list_quad(i) = abs(quadAns-approx);
  err_list_cdf(i) = abs(cdf_ans-approx);
endfor

x = 1:length(tol_list);
plot(x, err_list_quad);
hold on;
plot(x, err_list_cdf);
title ("Error Plot Adaptive Vs. NormCDF and Quadgk");
legend ({"Quadgk", "NormCDF"}, "location", "northeast");
legend hide
legend show
