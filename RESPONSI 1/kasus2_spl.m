%L0325036_NABIL MUFLIH
clear; clc; format long g;

g = 1/1000; hg = 1/10; dag = 1/100;

A = [ 2.5      1500*g   5        500*g;
      40*hg    0.75     1000*g   2;
      2000*g   15*hg    50*dag   6000*g;
      1        4250*g   20*hg    9*hg ];
b = [161000; 149000; 251500; 173000];
n = length(b);
nama = {'beras','telur','tepung','ayam'};
tol = 0.0001;
max_iter = 50;

dominan = true;
for i = 1:n
    if abs(A(i,i)) <= sum(abs(A(i,:))) - abs(A(i,i))
        dominan = false;
    end
end
fprintf('Dominan diagonal pada urutan asli : %d\n', dominan);

urutan = 1:n;
if ~dominan
    P = perms(1:n);
    ketemu = false;
    for k = 1:size(P,1)
        M = A(P(k,:), :);
        ok = true;
        for i = 1:n
            if abs(M(i,i)) <= sum(abs(M(i,:))) - abs(M(i,i))
                ok = false;
                break;
            end
        end
        if ok
            urutan = P(k,:);
            ketemu = true;
            break;
        end
    end
    if ~ketemu
        error('Tidak ada urutan baris dominan diagonal, gunakan metode langsung.');
    end
end
fprintf('Urutan baris yang dipakai         : %s\n\n', mat2str(urutan));
A2 = A(urutan, :);
b2 = b(urutan);

tic;
x = zeros(n,1);
C = -A2;
d = zeros(n,1);
for i = 1:n
    C(i,i) = 0;
    C(i,:) = C(i,:) / A2(i,i);
    d(i) = b2(i) / A2(i,i);
end

fprintf('%-6s %14s %14s %14s %14s %14s\n', 'Iter', 'x', 'y', 'z', 'w', 'Galat');
konv = false;
k = 0;
while k < max_iter
    xlama = x;
    for j = 1:n
        x(j) = C(j,:) * x + d(j);
    end
    k = k + 1;
    galat_iter = max(abs(x - xlama));
    fprintf('%-6d %14.4f %14.4f %14.4f %14.4f %14.4f\n', k, x, galat_iter);
    if all(abs(x - xlama) <= tol)
        konv = true;
        break;
    end
end
waktu = toc;

x_langsung = A \ b;
galat = abs(x_langsung - x);
fprintf('\n=== Hasil Gauss-Seidel ===\n');
if konv
    fprintf('Gauss-Seidel konvergen dalam %d iterasi.\n', k);
else
    fprintf('Gauss-Seidel belum konvergen dalam batas iterasi.\n');
end
for i = 1:n
    fprintf('Harga %-7s = Rp %12.4f / kg   galat vs A\\b = %.6e\n', nama{i}, x(i), galat(i));
end
fprintf('Residu maksimum |Ax-b| = %.6e\n', max(abs(A*x - b)));
fprintf('Running time = %.8f detik\n', waktu);
