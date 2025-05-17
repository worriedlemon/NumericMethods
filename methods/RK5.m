function [t, y] = RK5(func, h, Tmax, X0)
    func_t = @(t,x)func(x);
    t = 0:h:Tmax;
    y = zeros(2, length(t)); y(:, 1) = X0; % Runge-Kutta7
    for i = 2:length(t)
        y(:, i) = RK5_step(func_t, t(i), y(:, i-1), h);
    end
end

function [y] = RK5_step(func, t, y, h)
    k1 = func(t, y);
    k2 = func(t + h*1/5, y + h*k1/5);
    k3 = func(t + h*3/10, y + h*(3/40*k1 + 9/40*k2));
    k4 = func(t + h*4/5, y + h*(44/45*k1 - 56/15*k2 + 32/9*k3));
    k5 = func(t + h*8/9, y + h*(19372/6561*k1 + -25360/2187*k2 + 64448/6561*k3 + -212/729*k4));
    k6 = func(t + h, y + h*(9017/3168*k1 - 355/33*k2 + 46732/5247*k3 + 49/176*k4 - 5103/18656*k5));
    y = y + h*(35/384*k1 + 0*k2 + 500/1113*k3 + 125/192*k4 - 2187/6784*k5 + 11/84*k6);
end