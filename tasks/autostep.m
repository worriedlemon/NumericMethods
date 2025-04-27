warning off

%% System

methods = { @hamiltonian_euler, @hamiltonian_euler_exp };
X0 = [0; 2];

%% Params
h_global = 1e-1;
im_parts = [ 1, -1 ];
re_parts = [ 1, 1 ];
Tmax = 25;
coefs = complex(re_parts, im_parts);

%% Calculation
hs = coefs / sum(coefs) * h_global;

[t, x, hs_fact] = composition_method_var(methods, hs, Tmax, X0, 1e-1);

%% Plot
figure;
subplot(2, 1, 1);
plot_2d(x, 'Ring Test with complex coefficients');
subplot(2, 1, 2);
plot(t, hs_fact);
xlabel('Time, s'); ylabel('Step');
title('Step change');