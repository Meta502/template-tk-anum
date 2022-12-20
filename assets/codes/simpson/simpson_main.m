pkg load statistics
format long

minInf = -1e3;
low = -1;
high = 3;
tol = 1e-7;

printf("\nKalkulasi z-Score Integration dengan Komposit Simpson")
printf("\nSpesifikasi:")
printf("\nLower Limit: %d", low)
printf("\nUpper Limit: %d", high)
printf("\nTolerance Limit: %d\n", tol)

printf("\nHasil Integrasi dengan P(a <= Z <= b)\n")
[res, n] = composite_simpson(low,high,tol,@z_norm_dist)

printf("\nHasil Integrasi dengan P(Z <= b) - P(Z <= a)\n")
[resA, nA] = composite_simpson(minInf,low,tol,@z_norm_dist)
[resB, nB] = composite_simpson(minInf,high,tol,@z_norm_dist)

printf("\n")
ansMinInf = abs(resB-resA)

printf("\nPerbedaan antara P(a <= Z <= b) dan P(Z <= b) - P(Z <= a)\n")
diff = res - ansMinInf

printf("\nHasil Integrasi dengan quadgk\n\n")
[qAns, err] = quadgk(@z_norm_dist, low, high)

printf("\nError dengan Hasil Integrasi melalui quadgk\n")
err1 = abs(qAns - res);
err2 = abs(qAns - ansMinInf);
printf("\nP(a <= Z <= b): %d", err1)
printf("\nP(Z <= b) - P(Z <= a): %d", err2)

printf("\n\nHasil Integrasi dengan normcdf\n\n")
cdf = normcdf([low high]);
cdfAns = cdf(2) - cdf(1)

printf("\nError dengan Hasil Integrasi melalui normcdf\n")
err1 = abs(cdfAns - res);
err2 = abs(cdfAns - ansMinInf);
printf("\nP(a <= Z <= b): %d", err1)
printf("\nP(Z <= b) - P(Z <= a): %d", err2)

printf("\n")