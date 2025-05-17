function [t, y] = RK4(func, h, Tmax, X0)
    func_t = @(t,x)func(x);
    t = 0:h:Tmax;
    y = zeros(2, length(t)); y(:, 1) = X0; % Runge-Kutta7
    for i = 2:length(t)
        y(:, i) = RK4_step(func_t, t(i), y(:, i-1), h);
    end
end