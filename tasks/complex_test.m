warning off

%% Ring Test

func = @ring;
X0 = [1; 0];

%% Params
h_global = 1e-1;
im_parts = [ 1/2, -1/2 ];
re_parts = [ 1/2, 1/2 ];
Tmax = 20;
coefs = complex(re_parts, im_parts);

%% Calculation
hs = coefs * h_global;

[~, x] = composition_method(func, hs, Tmax, X0);

%% Plot
figure;
plot_2d(x, 'Ring Test with complex coefficients');