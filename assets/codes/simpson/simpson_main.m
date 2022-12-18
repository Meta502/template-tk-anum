pkg load statistics

minInf = -1e5;
low = -1;
high = 3;
tol = 1e-4;

printf("\nCalculating z-Score Integration with Composite Simpson")
printf("\nSpecifications:")
printf("\nLower Limit: %d", low)
printf("\nUpper Limit: %d", high)
printf("\nTolerance Limit: %d\n\n", tol)

[res, n] = composite_simpson(low,high,tol,@z_norm_dist)

printf("\nActual Result using quadgk\n\n")
[qAns, err] = quadgk(@z_norm_dist, low, high)

printf("\nActual Result using normcdf\n\n")
cdf = normcdf([low high]);
cdfAns = cdf(2) - cdf(1)

printf("\n")