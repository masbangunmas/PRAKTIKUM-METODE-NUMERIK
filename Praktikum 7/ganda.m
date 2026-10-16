%L0325036_NABIL MUFLIH
clc;
clear;
close all;

x1 = linspace(0, 3, 1000);
y1a = 3*x1.^3 - 5*x1.^2 + 4*x1 - 7;
y1b = ones(size(x1));

x2 = linspace(-2, 1, 1000);
y2a = exp(x2);
y2b = x2.^2;

x3 = linspace(-1.9, 2, 1000);
y3a = log(x3 + 2);
y3b = 3 - 2*x3;

figure(1);

subplot(3,1,1);
plot(x1, y1a, 'b', 'LineWidth', 1.5);
hold on;
plot(x1, y1b, 'r', 'LineWidth', 1.5);
grid on;
xlabel('x');
ylabel('y');
title('Grafik Ganda Persamaan 1');
legend('y = 3x^3 - 5x^2 + 4x - 7', 'y = 1', ...
       'Location', 'northeast');

subplot(3,1,2);
plot(x2, y2a, 'b', 'LineWidth', 1.5);
hold on;
plot(x2, y2b, 'r', 'LineWidth', 1.5);
grid on;
xlabel('x');
ylabel('y');
title('Grafik Ganda Persamaan 2');
legend('y = e^x', 'y = x^2', ...
       'Location', 'northeast');

subplot(3,1,3);
plot(x3, y3a, 'b', 'LineWidth', 1.5);
hold on;
plot(x3, y3b, 'r', 'LineWidth', 1.5);
grid on;
xlabel('x');
ylabel('y');
title('Grafik Ganda Persamaan 3');
legend('y = log(x+2)', 'y = 3 - 2x', ...
       'Location', 'northeast');
