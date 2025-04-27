function x1 = euler_exp(func, h, x0)
    x1 = fminsearch(@(x)norm(x - h*func(x) - x0), x0, optimset('Display', 'off'));
end
