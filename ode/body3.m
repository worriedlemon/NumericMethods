function dX = body3(X)
    m = [15 7 8];
    G = 31;
    dX = zeros(size(X));
    v1 = X(1:3, :);
    v2 = X(4:6, :);
    v3 = X(7:9, :);
    r1 = X(10:12, :);
    r2 = X(13:15, :);
    r3 = X(16:18, :);
    r = [r1 r2 r3];

    dX(10:12, :) = v1;
    dX(13:15, :) = v2;
    dX(16:18, :) = v3;
    
    for k = 1:3
        temp = 0;
        for n = 1:3
            if (k ~= n)
                dif = r(:, n) - r(:, k);
                temp = temp + G * m(n) * dif / (norm(dif)^3);
            end
        end
        dX((3 * k - 2):(3 * k), :) = temp;
    end
end

