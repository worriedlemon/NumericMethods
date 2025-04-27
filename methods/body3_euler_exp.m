function X1 = body3_euler_exp(X0, h)
    X1 = euler_exp(@body3, h, X0);
    X1 = real(X1); % тут ?
end
