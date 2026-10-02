%L0325036_NABIL MUFLIH

1;

function [L, U, P] = faktorkan_lu(A, pakai_pivot)
  n = rows(A);
  L = eye(n);
  P = eye(n);
  for i = 1:n-1
    if pakai_pivot
      [pivot, k] = max(abs(A(i:n, i)));
      k = i + k - 1;
      if k ~= i
        A([i k], :) = A([k i], :);
        P([i k], :) = P([k i], :);
        if i > 1
          L([i k], 1:i-1) = L([k i], 1:i-1);
        end
      end
    end
    if A(i, i) == 0
      error("matriks singular / pivot nol, solusi tidak tunggal");
    end
    for h = i+1:n
      L(h, i) = A(h, i) / A(i, i);
      printf("  m%d%d = %.4g   ->  R%d = R%d - (%.4g) * R%d\n", h, i, L(h, i), h, h, L(h, i), i);
      A(h, :) = A(h, :) - L(h, i) * A(i, :);
    end
  end
  if A(n, n) == 0
    error("matriks singular, solusi tidak tunggal");
  end
  U = A;
end

function y = substitusi_maju(L, c)
  n = length(c);
  y = zeros(n, 1);
  for i = 1:n
    y(i) = (c(i) - L(i, 1:i-1) * y(1:i-1)) / L(i, i);
  end
end

function x = substitusi_mundur(U, y)
  n = length(y);
  x = zeros(n, 1);
  for i = n:-1:1
    x(i) = (y(i) - U(i, i+1:n) * x(i+1:n)) / U(i, i);
  end
end

A = [2 1 -1; 4 3 1; -2 1 2];
b = [3; 9; 4];
pakai_pivot = false;

printf("Forward elimination (mencatat pengali m):\n");
[L, U, P] = faktorkan_lu(A, pakai_pivot);

printf("\nL (segitiga bawah, diagonal 1, isinya pengali m) =\n"); disp(L + 0);
printf("U (segitiga atas, hasil forward elimination) =\n");      disp(U + 0);
if ~isequal(P, eye(rows(A)))
  printf("P (catatan tukar baris) =\n"); disp(P);
end

printf("\ncek P*A = L*U ?  %d   (1 = benar)\n", norm(P * A - L * U) < 1e-12);

y = substitusi_maju(L, P * b);
x = substitusi_mundur(U, y);

printf("\nL y = b  ->  y = "); disp(y');
printf("U x = y  ->\n");
printf("x1 = %.4f\nx2 = %.4f\nx3 = %.4f\n", x

