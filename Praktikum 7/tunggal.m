%L0325036_NABIL MUFLIH
clc;
clear;
close all;

x1 = linspace(0, 3, 1000);
f1 = 3*x1.^3 - 5*x1.^2 + 4*x1 - 8;

x2 = linspace(-2, 1, 1000);
f2 = exp(x2) - x2.^2;

x3 = linspace(-1.9, 2, 1000);
f3 = log(x3 + 2) + 2*x3 - 3;

figure(1);

subplot(3,1,1);
plot(x1, f1, 'b', 'LineWidth', 1.5);
hold on;
plot(x1, zeros(size(x1)), 'k--');
grid on;
xlabel('x');
ylabel('f(x)');
title('Grafik Tunggal Persamaan 1');
legend('3x^3 - 5x^2 + 4x - 8', 'y = 0', ...
       'Location', 'northeast');

subplot(3,1,2);
plot(x2, f2, 'r', 'LineWidth', 1.5);
hold on;
plot(x2, zeros(size(x2)), 'k--');
grid on;
xlabel('x');
ylabel('f(x)');
title('Grafik Tunggal Persamaan 2');
legend('e^x - x^2', 'y = 0', ...
       'Location', 'northeast');

subplot(3,1,3);
plot(x3, f3, 'm', 'LineWidth', 1.5);
hold on;
plot(x3, zeros(size(x3)), 'k--');
grid on;
xlabel('x');
ylabel('f(x)');
title('Grafik Tunggal Persamaan 3');
legend('log(x+2) + 2x - 3', 'y = 0', ...
       'Location', 'northeast');
