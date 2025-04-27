function [t, x] = composition_method(func, hs, Tmax, x0)
    assert(isvector(hs), 'hs should be a vector of coefficients');
    h = sum(hs);
    assert(abs(imag(h)) < 1e-9, 'Sum of coefficients must not have imaginary part')
    
    t = 0:h:Tmax;
    N = length(hs);
    K = length(t);
    
    x = zeros(size(x0, 1), K);
    x(:, 1) = x0;
    for k = 1:K-1
        xtemp = x(:, k);
        for n = 1:N
            xtemp = emp(func, hs(n), xtemp);
        end
        x(:, k + 1) = xtemp;
    end
end

