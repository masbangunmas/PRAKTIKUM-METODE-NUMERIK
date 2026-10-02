%L0325036_NABIL MUFLIH

1;

function cetak(A, b, label)
  kosong = repmat(" ", 1, length(label) + 1);
  for i = 1:rows(A)
    if i == 1
      printf("%s", [label " "]);
    else
      printf("%s", kosong);
    end
    printf("%6.4g", A(i, :) + 0);
    printf("  |%6.4g\n", b(i) + 0);
  end
end

function cetak_kolom(label, v)
  kosong = repmat(" ", 1, length(label) + 1);
  for i = 1:length(v)
    if i == 1
      printf("%s", [label " "]);
    else
      printf("%s", kosong);
    end
    printf("%9.6g\n", v(i) + 0);
  end
end

function [U, y] = eliminasi_maju(A, b)
  n = rows(A);
  for i = 1:n-1
    for h = i+1:n
      m = A(h, i) / A(i, i);
      printf("  R%d = R%d - (%.4g) * R%d\n", h, h, m, i);
      A(h, :) = A(h, :) - m * A(i, :);
      b(h) = b(h) - m * b(i);
    end
  end
  U = A;
  y = b;
end

function x = substitusi_mundur(U, y)
  n = length(y);
  x = zeros(n, 1);
  for i = n:-1:1
    x(i) = (y(i) - U(i, i+1:n) * x(i+1:n)) / U(i, i);
  end
end

A = [2 1 -1;
     4 3  1;
    -2 1  2];
b = [3; 9; 4];

cetak(A, b, "Ab =");
printf("\nForward elimination:\n");
[U, y] = eliminasi_maju(A, b);
printf("\n");
cetak(U, y, "Uy =");

x = substitusi_mundur(U, y);
printf("\nHasil substitusi mundur:\n");
for i = 1:length(x)
  printf("x%d = %9.4f\n", i, x(i) + 0);
end

printf("\n");
cetak_kolom("A*x =", A * x);

