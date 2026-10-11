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
for k = 1:n-1
  [~,p] = max(abs(Ab(k:n,k)));
  p = p + k - 1;
  if p ~= k
    Ab([k p],:) = Ab([p k],:);
  end
  for i = k+1:n
    m = Ab(i,k)/Ab(k,k);
    Ab(i,k:n+1) = Ab(i,k:n+1) - m*Ab(k,k:n+1);
  end
end
x = zeros(n,1);
for i = n:-1:1
  x(i) = (Ab(i,n+1) - Ab(i,i+1:n)*x(i+1:n))/Ab(i,i);
end
t = toc;

disp('=== Metode Gauss ===');
disp('Matriks segitiga atas [U | y]:'); disp(Ab);
for i = 1:n
  printf('%s = %.10f\n', nama{i}, x(i));
end
printf('Residu ||Ax-b|| = %.2e\n', norm(A*x-b,inf));
printf('Running time    = %.8f detik\n', t);


