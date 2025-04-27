function [t, x] = composition_method(methods, hs, Tmax, x0)
    assert(Tmax > 0, 'Tmax should be a positive real value');
    assert(iscell(methods), 'methods should be a cell of functions');
    assert(isvector(hs), 'hs should be a vector of coefficients');
    assert(length(methods) == length(hs), 'Methods count should be equal to coefficients count');
    
    h = sum(hs);
    
    %assert(imag(h) == 0, 'Sum of coefficients must not have imaginary part')

    t = 0:h:Tmax;
    N = length(methods);
    K = length(t);
    
    x = zeros(size(x0, 1), K);
    x(:, 1) = x0;
    for k = 1:K-1
        xtemp = x(:, k);
        for n = 1:N
            method = methods{1, n};
            xtemp = method(xtemp, hs(n));
        end
        x(:, k + 1) = real(xtemp);
    end
end

