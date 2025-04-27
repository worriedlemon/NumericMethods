function [t, x, o_h] = composition_method_var(methods, hs, Tmax, x0, eps)
    assert(Tmax > 0, 'Tmax should be a positive real value');
    assert(iscell(methods), 'methods should be a cell of functions');
    assert(isvector(hs), 'hs should be a vector of coefficients');
    assert(length(methods) == length(hs), 'Methods count should be equal to coefficients count');
    assert(any(imag(hs) ~= 0), 'Coefficients should have imaginary part')

    %h = sum(hs);
    %assert(imag(h) == 0, 'Sum of coefficients must not have imaginary part')

    hs2 = real(hs);
    h = sum(hs2);
    
    N = length(methods);
    
    x = x0;
    xtemp1 = x0;
    o_h = [h];
    t = [0];
    tcur = 0;
    while tcur <= Tmax
        err = 1;
        while (err > eps)
            xtemp2 = xtemp1;
            for n = 1:N
                method = methods{1, n};
                xtemp1 = method(xtemp1, hs(n));
                xtemp2 = method(xtemp2, hs2(n));
            end
            err_new = norm(xtemp1 - xtemp2);
            
            s1 = err_new > eps; s2 = err_new / eps < eps;
            if (s1 || s2)
                if (s1)
                    k = eps / err;
                elseif (s2)
                    k = err / eps;
                end
                hs = hs * k^0.25; % Вау, рандомная формула
                hs2 = real(hs);
                h = sum(hs2);
                o_h = [o_h h];
                t = [t tcur];
            end
            err = err_new;
        end
        tcur = tcur + h;
        x = [x real(xtemp1)];
    end
    o_h = [o_h h];
    t = [t Tmax];
end

