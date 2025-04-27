warning off

ref_method = @ring;
methods = { @ring_euler, @ring_euler };
X0 = [0; 1];
im_parts = [ 2, -2 ];
re_parts = [ 1, 1 ];

% ref_method = @hamiltonian;
% methods = { @hamiltonian_euler, @hamiltonian_euler_semi };
% X0 = [0; 2];
% im_parts = [ 5, 4.3 ];
% re_parts = [ 1, 1 ];

Tmax = 100;
coefs = complex(re_parts, im_parts);
h_test = logspace(-3.5, -1.5, 25);

s = sum(coefs);
E = [];

for h_global = h_test
    hs = coefs / s * h_global;
    hs2 = coefs / s * h_global / 2;
    
    [~, x] = composition_method(methods, hs, Tmax, X0);
    [~, x2] = composition_method(methods, hs2, Tmax, X0);
    [t, x_ref] = ode78(ref_method, 0:h_global:Tmax, X0);
    x_ref = x_ref';
    
    x2 = x2(:, 2 * (1:length(t)) - 1); % берем только нечетные точки
    e1 = vecnorm(x - x_ref);
    e2 = vecnorm(x2 - x_ref);
    E = [E, max(e1) / max(e2)];
end

figure;
semilogx(h_test, E);
grid on;
title('Order Plot');