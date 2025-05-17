%warning off

%% Ring Test

func = @ring;
X0 = [1; 0];

%% Params
h_global = 1e-1;
im_parts = [ sqrt(3)/6, -sqrt(3)/6 ];
re_parts = [ 1/2, 1/2 ];
Tmax = 10000;
coefs = complex(re_parts, im_parts);

%% Calculation
hs = coefs * h_global;

[~, x] = composition_method(func, hs, Tmax, X0);
[~, x_back] = composition_method(func, -hs, -Tmax, x(:, end));
x = real(x); x_back = real(x_back);

%% Check
err = vecnorm(x(:, 1) - x_back(:, end));
if (err < 1e-9)
    disp('Points are equal');
else
    warning('Points are not equal');
    disp(['Error = ', num2str(err)]);
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