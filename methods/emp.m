function x1 = emp(func, h, x0)
    k = x0 + h/2 * func(x0);
    x1 = x0 + h * func(k);
end
