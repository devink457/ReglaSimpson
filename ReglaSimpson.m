clc;
clear;

% Definir la función original
f = @(x) 0.2 + 25*x - 200*x.^2 + 675*x.^3 - 900*x.^4 + 400*x.^5;

% Definir la cuarta derivada
f4 = @(x) 24*675 - 24*900*x + 120*400*x.^1;

% Límites
a = 0;
b = 0.8;
n = 2;              % Número de segmentos
h = (b - a)/n;      % Tamaño de paso

% Puntos
x0 = a;
x1 = a + h;
x2 = b;

% Simpson 1/3
I_aprox = (h/3)*(f(x0) + 4*f(x1) + f(x2));

% Valor exacto
I_exacto = 1.640533;

% Media de la cuarta derivada
media_f4 = integral(f4, a, b) / (b - a);

% Error de truncamiento estimado
Et = -((b - a)^5 / (180 * n^4)) * media_f4;

% Error relativo porcentual
Erp = abs((I_exacto - I_aprox)/I_exacto)*100;

% Mostrar resultados
fprintf('Integral aproximada (Simpson 1/3) = %.6f\n', I_aprox);
fprintf('Media de la cuarta derivada = %.6f\n', media_f4);
fprintf('Error de truncamiento estimado = %.6f\n', Et);
fprintf('Error relativo porcentual = %.6f%%\n', Erp);