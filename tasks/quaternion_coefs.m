warning off

%% Ring Test

func = @ring;
X0 = [1; 0];

%% Params
h_global = 1e-1;
q1 = quaternion(1/2, 1/6, 1/6, 1/6);
q2 = quaternion(1/2, -1/6, -1/6, -1/6);
Tmax = 20;
coefs = [q1 q2];

%% Calculation
hs = coefs * h_global;

[~, x] = composition_method(func, hs, Tmax, X0);

%% Plot
figure;
plot_2d(x, 'Ring Test with quaternion coefficients');