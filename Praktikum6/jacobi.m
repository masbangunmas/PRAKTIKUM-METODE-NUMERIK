%L0325036_NABIL MUFLIH
clear; clc; format long g;

A = [ 5 -1 -1  0  0;
     -1  5 -1 -1  0;
     -1 -1  4 -1 -1;
      0  0  1  4 -2;
      0  1 -1  1  4 ];

b = [-1; 2; 6; 2; -1];
n = length(b);
nama = {'p','q','r','s','t'};
tol = 0.001;
max_iter = 20;
x_eksak = [55/169; 422/507; 70/39; 7/169; -10/507];

tic;
x = zeros(n,1);
C = -A;
d = zeros(n,1);
for i = 1:n
    C(i,i) = 0;
    C(i,:) = C(i,:) / A(i,i);
    d(i) = b(i) / A(i,i);
end

konv = false;
k = 0;
while k < max_iter
    xlama = x;
    xbaru = C * xlama + d;
    k = k + 1;

    if all(abs(xbaru - xlama) <= tol)
        x = xbaru;
        konv = true;
        break;
    end

    x = xbaru;
end
waktu = toc;

galat = abs(x_eksak - x);
fprintf('=== Metode Jacobi ===\n');
if konv
    fprintf('Metode Jacobi konvergen.\n');
else
    fprintf('Metode Jacobi belum konvergen dalam batas iterasi.\n');
end
fprintf('Jumlah iterasi = %d\n', k);
for i = 1:n
    fprintf('%s = %.10f   galat = %.6e\n', nama{i}, x(i), galat(i));
end
fprintf('Galat maksimum = %.6e\n', max(galat));
fprintf('Running time = %.8f detik\n', waktu);
