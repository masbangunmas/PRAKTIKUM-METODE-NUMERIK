%L0325036_Nabil Muflih
% menentukan nilai galat perhitungan e^(0.3) menggunakan deret taylor
% dengan n = {0,1,2,3,4},
format long g

x = 0.3;
eksak = exp(x);
printf("Nilai eksak e^(0.3) = %.15f\n", eksak);
printf("%-3s%-20s%-20s%-20s%s\n", "n", "Pendekatan", "Error", "Error Relatif", "RPE(%)");

S = 0;
for n = 0:4
  S = S + x^n / factorial(n);
  AE = abs(eksak - S);
  RE = AE / abs(eksak);
  RPE = RE * 100;
  printf("%-3d%-20.15f%-20.15f%-20.15f%.10f\n", n, S, AE, RE, RPE);
end



