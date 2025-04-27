warning off

%% System

func = @hamiltonian;
X0 = [0; 2];

%% Params
Tmax = 30;

%% Calculation
[t, x, hs_fact] = composition_method_var3ord(func, Tmax, X0, 1e-1);

%% Plot
figure;
subplot(2, 1, 1);
plot_2d(x, 'Ring Test with complex coefficients');
subplot(2, 1, 2);
plot(t, hs_fact);
xlabel('Time, s'); ylabel('Step');
title('Step change');