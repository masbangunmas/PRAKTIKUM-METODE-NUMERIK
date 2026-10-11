%L0325036_NABIL MUFLIH
clear; clc; format long
A = [ 5 -1 -1  0  0;
     -1  5 -1 -1  0;
     -1 -1  4 -1 -1;
      0  0  1  4 -2;
      0  1 -1  1  4];
b = [-1; 2; 6; 2; -1];
n = length(b);
nama = {"p","q","r","s","t"};

tic;
Ab = [A b];
for k = 1:n
  [~,p] = max(abs(Ab(k:n,k)));
  p = p + k - 1;
  if p ~= k
    Ab([k p],:) = Ab([p k],:);
  end
  Ab(k,:) = Ab(k,:)/Ab(k,k);
  for i = 1:n
    if i ~= k
      Ab(i,:) = Ab(i,:) - Ab(i,k)*Ab(k,:);
    end
  end
end
x = Ab(:,n+1);
t = toc;

disp('=== Metode Gauss-Jordan ===');
disp('Matriks augmented akhir [I | x]:'); disp(Ab);
for i = 1:n
  printf('%s = %.10f\n', nama{i}, x(i));
end
printf('Residu ||Ax-b|| = %.2e\n', norm(A*x-b,inf));
printf('Running time    = %.8f detik\n', t);

