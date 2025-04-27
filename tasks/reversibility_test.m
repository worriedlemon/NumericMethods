warning off

%% Ring Test

func = @ring;
X0 = [1; 0];

%% Params
h_global = 1e-1;
im_parts = [ 1/2, -1/2 ];
re_parts = [ 1/2, 1/2 ];
Tmax = 10 * h_global;
coefs = complex(re_parts, im_parts);

%% Calculation
hs = coefs * h_global;

[~, x] = composition_method(func, hs, Tmax, X0);
[~, x_back] = composition_method(func, -hs, -Tmax, x(:, end));

%% Check
if (vecnorm(x(:, 1) - x_back(:, end)) < 1e-3)
    disp('Points are equal');
else
    error('Points are not equal');
end

%% Plot
figure;
plot(x(1, :), x(2, :), DisplayName='Forward'); hold on;
plot(x_back(1, :), x_back(2, :), DisplayName='Backward');
plot(X0(1), X0(2), 'r*', DisplayName='Start point');
legend show;
grid on;
xlabel('$x$', Interpreter='latex');
ylabel('$y$', Interpreter='latex');
title('Reversibility test');