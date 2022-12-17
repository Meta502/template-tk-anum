minInf = -1e3;
low = -1;
high = 3;
tol = 1e-7;

printf("\nKalkulasi z-Score Integration dengan Romberg")
printf("\nDengan spesifikasi sebagai berikut:")
printf("\nLower Limit: %d", low)
printf("\nUpper Limit: %d", high)
printf("\nTolerance Limit: %d\n\n", tol)

printf("\nHasil Integrasi dengan P(a <= Z <= b)\n")

[res, R, j] = rombergIntegration(low, high, tol, @zNormalDist);
#printf("\nResult: %g", result)
R(1:j,1:j)
res

printf("\nHasil Integrasi dengan P(Z <= b) - P(Z <= a)\n")

[res1, R1, j1] = rombergIntegration(minInf, low, tol, @zNormalDist);
#printf("\nResult: %g", result)
R1(1:j1,1:j1);
res1

[res2, R2, j2] = rombergIntegration(minInf, high, tol, @zNormalDist);
#printf("\nResult: %g", result)
R1(1:j2,1:j2);
res2

printf("\n")
ansMinInf = abs(res2-res1)

printf("\nPerbedaan Antara P(a <= Z <= b) dan P(Z <= b) - P(Z <= a)\n")
diff = res - ansMinInf


printf("\n\nHasil Integrasi dengan quadgk\n")
[quadgkAns, err] = quadgk(@zNormalDist, low, high)

printf("\n\nHasil Integrasi dengan normcdf\n")
cdf = normcdf([low high])
cdfAns = cdf(2)-cdf(1)

printf("\n\nError dengan Hasil Integrasi melalui quadgk\n")
err1 = abs(quadgkAns - res);
err2 = abs(quadgkAns - ansMinInf);
printf("\nP(a <= Z <= b): %d", err1)
printf("\nP(Z <= b) - P(Z <= a): %d", err2)

printf("\n\nError dengan Hasil Integrasi melalui normcdf\n")
err1 = abs(cdfAns - res);
err2 = abs(cdfAns - ansMinInf);
printf("\nP(a <= Z <= b): %d", err1)
printf("\nP(Z <= b) - P(Z <= a): %d", err2)

printf("\n\nKalkulasi Error dengan Tolerance\n")
tolList = [1e-1, 1e-2, 1e-3, 1e-4, 1e-5, 1e-6, 1e-7, 1e-8, 1e-9, 1e-10, 1e-11, 1e-12];
errListquad = zeros(length(tolList),1);
errListnorm = zeros(length(tolList),1);
tableSizeList = zeros(length(tolList),1);
for i = 1:length(tolList)
  [res, R, j] = rombergIntegration(low, high, tolList(i), @zNormalDist);
  errListquad(i,1) = abs(quadgkAns - res);
  errListnorm(i,1) = abs(cdfAns - res);
  tableSizeList(i,1) = j;
endfor

errListquad
errListnorm
tableSizeList

t=1:12;

# plot(t, errListquad, ";Error dengan quad;", t, errListnorm, ";Error dengan norm;")
# xlabel("1e-x")
# ylabel("Error")
 plot(t, tableSizeList)
 xlabel("1e-x")
 ylabel("Ukuran Tabel Romberg (yxy)")
