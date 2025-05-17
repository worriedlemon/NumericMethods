function [t, y] = AM4(func, h, Tmax, y0)
  f = @(t, x)func(x);
  t = 0:h:Tmax;
  N = length(t);
  % bootstrap with RK4
  y = zeros(2, N); y(:, 1) = y0;
  V = zeros(2, 4);
  V(:, 1) = f(t(1),y(:, 1));
  for i = 1:3
    y(:, i+1) = RK4_step(f,t(i),y(:, i),h);
    V(:, i+1) = f(t(i+1),y(:, i+1));
  end

  for i = 4:(N-1) 
    y(:, i+1) = y(:, i) + (h/24)*(V*[-9; 37; -59; 55]);
    V(:, 1:3) = V(:, 2:4); V(:, 4) = f(t(i+1),y(:, i+1));
    y(:, i+1) = y(:, i) + (h/24)*(V*[1; -5; 19; 9]);
    V(:, 4) = f(t(i+1),y(:, i+1));
  end
end