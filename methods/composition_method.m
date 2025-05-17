function [t, x] = composition_method(func, hs, Tmax, x0)
    assert(isvector(hs), 'hs should be a vector of coefficients');
    h = 0;
    for i = 1:length(hs)
        h = h + hs(i);
    end

    if (isa(h, 'quaternion'))
        [hr, a(1), a(2), a(3)] = parts(h);
        assert(sum(a) < 1e-9, 'Sum of coefficients must not have imaginary part')
        h = hr;
        clear hr a;
    else
        assert(imag(h) < 1e-9, 'Sum of coefficients must not have imaginary part')
        h = real(h);
    end
    
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
        if (isa(xtemp, 'quaternion'))
            x(:, k + 1) = parts(xtemp);
        else
            x(:, k + 1) = real(xtemp);
        end
    end
end

