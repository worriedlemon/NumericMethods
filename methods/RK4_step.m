function [y] = RK4_step(func, t, y, h)
    k1 = func(t, y);
    k2 = func(t + h*1/2, y + h*k1/2);
    k3 = func(t + h*1/2, y + h*k2/2);
    k4 = func(t + h, y + h*k3);
    y = y + h/6*(k1 + 2*k2 + 2*k3 + k4);
end