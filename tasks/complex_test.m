warning off

%% Ring Test

% methods = { @ring_euler, @ring_euler }; % Только явный эйлер
% X0 = [0; 1];

%% Hamiltonian

methods = { @hamiltonian_euler, @hamiltonian_euler_semi };
X0 = [0; 2];

%% Params
h_global = 1e-1;
im_parts = [ 1, -1 ];
re_parts = [ 1, 1 ];
Tmax = 100;
coefs = complex(re_parts, im_parts);

%% Calculation
hs = coefs / sum(real(coefs)) * h_global;

[~, x] = composition_method(methods, hs, Tmax, X0);

%% Plot
figure;
plot_2d(x, 'Ring Test with complex coefficients');