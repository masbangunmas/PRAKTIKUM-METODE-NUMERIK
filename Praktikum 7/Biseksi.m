%L0325036_NABIL MUFLIH
clc;
clear;

fprintf('PILIH PERSAMAAN\n');
fprintf('1. 3x^3 - 5x^2 + 4x - 7 = 1\n');
fprintf('2. e^x - x^2 = 0\n');
fprintf('3. log(x+2) + 2x - 3 = 0\n');

pilihan = input('Masukkan pilihan: ');

if pilihan == 1
    f = @(x) 3*x.^3 - 5*x.^2 + 4*x - 8;
    a = 1;
    b = 2;
elseif pilihan == 2
    f = @(x) exp(x) - x.^2;
    a = -1;
    b = 0;
elseif pilihan == 3
    f = @(x) log(x + 2) + 2*x - 3;
    a = 0;
    b = 1;
else
    error('Pilihan hanya 1, 2, atau 3.');
end

toleransi = 0.0001;
iterasiMaksimum = 20;

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

fprintf('\nAkar pendekatan  = %.8f\n', c);
fprintf('Nilai fungsi     = %.8f\n', f(c));
fprintf('Jumlah iterasi   = %d\n', iterasi);
fprintf('Error pendekatan = %.8f\n', errorNilai);

