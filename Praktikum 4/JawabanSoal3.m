%L0325036_Nabil Muflih

format long g

x = 1;
eksak = sin(x);
printf("Nilai eksak sin(1) = %.15f\n\n", eksak);
printf("%-3s%-20s%-20s%-20s%s\n", "N", "Pendekatan", "Error", "Error Relatif", "RPE(%)");

S = 0;
for N = 0:5
  suku = ((-1)^N) * x^(2*N+1) / factorial(2*N+1);
  S = S + suku;
  AE = abs(eksak - S);
  RE = AE / abs(eksak);
  RPE = RE * 100;
  if N >= 1
    printf("%-3d%-20.15f%-20.15f%-20.15f%.10f\n", N, S, AE, RE, RPE);
  end
end




