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
L = eye(n);
U = zeros(n);
for i = 1:n
  for j = i:n
    U(i,j) = A(i,j) - L(i,1:i-1)*U(1:i-1,j);
  end
  for j = i+1:n
    L(j,i) = (A(j,i) - L(j,1:i-1)*U(1:i-1,i))/U(i,i);
  end
end
y = zeros(n,1);
for i = 1:n
  y(i) = b(i) - L(i,1:i-1)*y(1:i-1);
end
x = zeros(n,1);
for i = n:-1:1
  x(i) = (y(i) - U(i,i+1:n)*x(i+1:n))/U(i,i);
end
t = toc;

disp('=== Dekomposisi LU ===');
disp('L ='); disp(L);
disp('U ='); disp(U);
disp('y ='); disp(y);
for i = 1:n
  printf('%s = %.10f\n', nama{i}, x(i));
end
printf('Residu ||Ax-b|| = %.2e\n', norm(A*x-b,inf));
printf('Running time    = %.8f detik\n', t);


