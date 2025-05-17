function dX = ring(X)
    dX = X;
    dX(1) = X(2);
    dX(2) = -X(1);
end

