function X1 = ring_euler_exp(X0, h)
    X1 = [1 -h; h 1] \ X0;
end
