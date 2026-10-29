%L0325036_NABIL MUFLIH
clc; clear; close all;

Vbola = 300;
f = @(r) (4/3)*pi*r.^3 - Vbola;

r = 0:0.01:8;
figure(1);
plot(r, f(r), 'b-', 'LineWidth', 1.6); hold on; grid on;
plot(r, zeros(size(r)), 'k--');
plot([4 5], [0 0], 'ro-', 'LineWidth', 1.5);
xlabel('r (cm)'); ylabel('f(r)');
title('Grafik f(r) = (4/3) pi r^3 - 300');
legend('f(r)', 'sumbu r', 'interval awal [4,5]', 'Location', 'northwest');

a = 4;
b = 5;
toleransi = 0.0001;
iterasiMaksimum = 20;

fprintf('f(%g) = %.4f ; f(%g) = %.4f\n', a, f(a), b, f(b));
if f(a) * f(b) > 0
    error('Interval tidak mengurung akar.');
end

fprintf('\nMETODE BISEKSI\n');
fprintf('%-8s %12s %12s %12s %14s %12s\n', ...
        'Iterasi', 'a', 'b', 'c', 'f(c)', 'Error');
fprintf('%s\n', repmat('-', 1, 77));

for iterasi = 1:iterasiMaksimum
    c = (a + b) / 2;
    errorNilai = abs(b - a) / 2;

    fprintf('%-8d %12.6f %12.6f %12.6f %14.6f %12.6f\n', ...
            iterasi, a, b, c, f(c), errorNilai);

    if abs(f(c)) < toleransi || errorNilai < toleransi
        break;
    end

    if f(a) * f(c) < 0
        b = c;
    else
        a = c;
    end
end

r_hasil  = c;
V_bola   = (4/3)*pi*r_hasil^3;
V_tabung = pi*r_hasil^2 * (2*r_hasil);
V_luar   = V_tabung - V_bola;
r_analitik = (225/pi)^(1/3);

fprintf('\nJari-jari r         = %.6f cm (analitik %.6f cm)\n', r_hasil, r_analitik);
fprintf('Jumlah iterasi      = %d\n', iterasi);
fprintf('Volume bola         = %.4f cm^3\n', V_bola);
fprintf('Volume tabung       = %.4f cm^3\n', V_tabung);
fprintf('Volume tabung luar  = %.4f cm^3\n', V_luar);
