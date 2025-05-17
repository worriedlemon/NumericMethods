lambda = -1;
func = @(x)lambda * x; % dx/dt = lambda*x

%% Second order composition method stability region

stab = @(z) (1 + z + (z.^2)/2).*(1 + lambda + lambda^2 - z - lambda .* z + (z.^2)/2);

h = 1e-2;
a = -3;
b = 3;
[x, y] = meshgrid(a:h:b, a:h:b);
z = complex(x, y);
s = abs(stab(z)) <= 1;
colors = uint8([255 255 255; 154 202 255]);

figure;
colormap(colors);
contourf(x, y, s, 2);
colorbar;
grid on;
title("Stability Region");
xlabel("Re($z$)", Interpreter="latex");
ylabel("Im($z$)", Interpreter="latex");