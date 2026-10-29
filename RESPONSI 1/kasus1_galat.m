%L0325036_NABIL MUFLIH
clc; clear; close all;

lambda = 12; v = 36; x = 10; h0 = 5;
t = 0:0.01:5;
N = [23 24 25];
z = t*v/lambda;
batas = 1;

h_eksak = h0*(cos(z) + exp(x));

h_n = zeros(numel(N), numel(t));
for k = 1:numel(N)
    n = N(k);
    e_taylor = 0;
    cos_taylor = zeros(size(z));
    for i = 0:n
        e_taylor   = e_taylor + x^i / factorial(i);
        cos_taylor = cos_taylor + (-1)^i * z.^(2*i) / factorial(2*i);
    end
    h_n(k,:) = h0*(cos_taylor + e_taylor);
end

galat_mutlak   = abs(h_n - h_eksak);
galat_relatif  = galat_mutlak ./ abs(h_eksak) * 100;
rerata_mutlak  = mean(galat_mutlak, 2);
rerata_relatif = mean(galat_relatif, 2);
maks_relatif   = max(galat_relatif, [], 2);

idx = 1:100:501;
fprintf('%-4s %16s %16s %16s %16s\n', 't', 'h eksak', 'n=23', 'n=24', 'n=25');
for j = idx
    fprintf('%-4g %16.4f %16.4f %16.4f %16.4f\n', t(j), h_eksak(j), ...
            h_n(1,j), h_n(2,j), h_n(3,j));
end

fprintf('\n%-4s %20s %20s %20s %-12s\n', 'n', 'Rerata galat mutlak', ...
        'Rerata galat rel(%)', 'Galat rel maks(%)', 'Keputusan');
for k = 1:numel(N)
    if maks_relatif(k) < batas
        ket = 'LAYAK';
    else
        ket = 'TIDAK LAYAK';
    end
    fprintf('%-4d %20.6f %20.6f %20.6f %-12s\n', N(k), ...
            rerata_mutlak(k), rerata_relatif(k), maks_relatif(k), ket);
end

figure(1);
plot(t, h_eksak,  'k-',  'LineWidth', 2.0); hold on;
plot(t, h_n(1,:), 'r--', 'LineWidth', 1.3);
plot(t, h_n(2,:), 'g-.', 'LineWidth', 1.3);
plot(t, h_n(3,:), 'b:',  'LineWidth', 1.8);
grid on; xlabel('t'); ylabel('h(t)');
title('Perbandingan h eksak dan pendekatan deret Taylor');
legend('f_{eksak}', 'f_{n=23}', 'f_{n=24}', 'f_{n=25}', 'Location', 'best');

figure(2);
semilogy(t, galat_mutlak', 'LineWidth', 1.3); grid on;
xlabel('t'); ylabel('|h_n - h_{eksak}|');
title('Galat mutlak terhadap solusi eksak');
legend('n=23', 'n=24', 'n=25', 'Location', 'best');
