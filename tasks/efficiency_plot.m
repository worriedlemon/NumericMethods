warning off

func = @ring;
X0 = [0; 1];

gamma31 = 1/2 + sqrt(3)/6i; % 4 порядок
gamma32 = 1/2 - sqrt(3)/6i;
gamma41 = 1/2 - 1/2i*sqrt(3 - 2*sqrt(2));
gamma42 = 1/2 + 1/2i*sqrt(3 - 2*sqrt(2));
coefs = [[gamma31 gamma32] * gamma41, [gamma32 gamma31] * gamma42];


Tmax = 100;
h_test = logspace(-3, -1, 25);

E = zeros(3, length(h_test));
ts = E;

for i = 1:length(h_test)
    tic;
    [t, x1] = composition_method(func, coefs * h_test(i), Tmax, X0);
    ts(1, i) = toc;

    tic;
    [~, x2] = RK4(func, h_test(i), Tmax, X0);
    ts(2, i) = toc;
    
    tic;
    [~, x3] = AM4(func, h_test(i), Tmax, X0);
    ts(3, i) = toc;

    x_ref = [sin(t); cos(t)];

    E(1, i) = max(vecnorm(x1 - x_ref));
    E(2, i) = max(vecnorm(x2 - x_ref));
    E(3, i) = max(vecnorm(x3 - x_ref));
end

figure;
loglog(E(1, :), ts(1, :)); hold on; grid on;
loglog(E(2, :), ts(2, :));
loglog(E(3, :), ts(3, :));
legend('Composition EMP 4', 'Runge-Kutta 4', 'Adamson-Moulton 4');
set(gca, 'xdir', 'reverse');
xlabel('Global error $E$', Interpreter='latex');
ylabel('Evaluation time', Interpreter='latex');
grid on;
title('Efficiency plot');
ylim([1e-3 1e1]);