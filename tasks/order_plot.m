warning off

func = @ring;
func_t = @(t,x)func(x);
X0 = [0; 1];

% coefs = 1; % 2 порядок

gamma1 = 1/2 + sqrt(3)/6i; % 3 порядок
gamma2 = 1/2 - sqrt(3)/6i;
coefs = [gamma1, gamma2];

% gamma31 = 1/2 + sqrt(3)/6i; % 4 порядок
% gamma32 = 1/2 - sqrt(3)/6i;
% gamma41 = 1/2 - 1/2i*sqrt(3 - 2*sqrt(2));
% gamma42 = 1/2 + 1/2i*sqrt(3 - 2*sqrt(2));
% coefs = [[gamma31 gamma32] * gamma41, [gamma32 gamma31] * gamma42];


Tmax = 100;
h_test = logspace(-2.6, -1, 25);

E = [];
for h_global = h_test
    hs = coefs * h_global;
    hs2 = coefs * h_global / 2;
    
    [t, x] = composition_method(func, hs, Tmax, X0);
    [~, x2] = composition_method(func, hs2, Tmax, X0);
    %x_ref = [sin(t); cos(t)];                     % Analytical for ring
    [~, x_ref] = RK7(func, h_global, Tmax, X0);

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