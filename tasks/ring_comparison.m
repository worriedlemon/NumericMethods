methods = { @ring_euler, @ring_euler_exp };
X0 = [1; 0];
h_global = 1e-1;
coefs = [1 1];
Tmax = 100;

hs = coefs / sum(coefs) * h_global;

[~, x_imp] = composition_method({ @ring_euler }, h_global / 2, Tmax, X0);
[~, x_exp] = composition_method({ @ring_euler_exp }, h_global / 2, Tmax, X0);

[~, x] = composition_method(methods, hs, Tmax, X0);

figure;
subplot(1, 3, 1);
plot_2d(x_imp, 'Ring Test with implicit euler');
subplot(1, 3, 2);
plot_2d(x_exp, 'Ring Test with explicit euler');
subplot(1, 3, 3);
plot_2d(x, 'Ring Test with composition of both euler methods');