X0 = [1; 0];
h_global = 1e-1;
coefs = [1/2 1/2];
Tmax = 20;

hs = coefs * h_global;

[~, x] = composition_method(@ring, hs, Tmax, X0);

figure;
plot_2d(x, 'Ring Test with composition of two EMP methods');