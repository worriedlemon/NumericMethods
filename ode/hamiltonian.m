function dX = hamiltonian(X)
    dX = X;
    y1 = X(1, :);
    y2 = X(2, :);
    dX(1, :) = (-y2 * (y1^2 + 1));
    dX(2, :) = (y1 * (y2^2 + 1));
end

