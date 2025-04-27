function [t, x, o_h] = composition_method_var3ord(func, Tmax, x0, eps)
    assert(Tmax > 0, 'Tmax should be a positive real value');
    
    h = 1e-1;

    gamma11 = 1/2 + 1/2i; % 3 порядок с комплексными коэффициентами
    gamma12 = 1/2 - 1/2i;
    gamma21 = 1/2 + sqrt(3)/6i;
    gamma22 = 1/2 - sqrt(3)/6i;
    hs_c = [[gamma11 gamma12] * gamma21, [gamma12 gamma11] * gamma22];

    gamma1 = 1 / (2 - 2^(1/3)); % 3 порядок с вещественными коэффициентами
    gamma2 = 1 - 2 * gamma1; % тут вопрос, потому что делаем шаг назад по сути...
    hs_r = [gamma1 gamma2 gamma1];
    
    x = x0;
    xtemp1 = x0;
    o_h = [h];
    t = [0];
    tcur = 0;
    while tcur <= Tmax
        err = 1;
        while (err > eps)
            xtemp2 = xtemp1;
            [~, xtmp1] = composition_method(func, hs_c * h, h, xtemp1);
            [~, xtmp2] = composition_method(func, hs_r * h, h, xtemp2);
            xtemp1 = xtmp1(:, end);
            xtemp2 = xtmp2(:, end);
            err_new = norm(xtemp1 - xtemp2);
            
            s1 = err_new > eps; s2 = err_new / eps < eps;
            if (s1 || s2)
                k = eps / err_new;
                h = h * k^(1/3);
                o_h = [o_h h];
                t = [t tcur];
            end
            err = err_new;
        end
        tcur = tcur + h;
        x = [x xtemp1];
    end
    o_h = [o_h h];
    t = [t Tmax];
end

