function X1 = body3_euler(X0, h)
    X1 = euler_imp(@body3, h, X0);
    X1 = real(X1); % тут ?
end
