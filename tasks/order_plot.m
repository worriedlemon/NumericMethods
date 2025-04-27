warning off

func = @ring;
X0 = [0; 1];

im_parts = [ 1/2, -1/2 ]; % 2 порядок
re_parts = [ 1/2, 1/2 ];
coefs = complex(re_parts, im_parts);

gamma11 = 1/2 + 1/2i; % 3 порядок
gamma12 = 1/2 - 1/2i;
gamma21 = 1/2 + sqrt(3)/6i;
gamma22 = 1/2 - sqrt(3)/6i;
coefs = [[gamma11 gamma12] * gamma21, [gamma12 gamma11] * gamma22];

Tmax = 100;
h_test = logspace(-2, -1, 30);

E = [];
for h_global = h_test
    hs = coefs * h_global;
    hs2 = coefs * h_global / 2;
    
    [t, x] = composition_method(func, hs, Tmax, X0);
    [~, x2] = composition_method(func, hs2, Tmax, X0);
    x_ref = [sin(t); cos(t)];
    
    x2 = x2(:, 2 * (1:length(t)) - 1); % берем только нечетные точки
    e1 = vecnorm(x - x_ref);
    e2 = vecnorm(x2 - x_ref);
    E = [E, max(e1) / max(e2)];
end

figure;
semilogx(h_test, log2(E));
xlabel('Step $h$', Interpreter='latex');
ylabel('Method order', Interpreter='latex');
grid on;
title('Order Plot');