function X1 = hamiltonian_euler_semi(X0, h)
    y1 = X0(1, :);
    y2 = X0(2, :);
    y1 = y1 + h * (-y2 * (y1^2 + 1));
    y2 = y2 + h * (y1 * (y2^2 + 1));
    X1 = [y1; y2];
end
