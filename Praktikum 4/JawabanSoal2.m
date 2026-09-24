%L0325036_Nabil Muflih

format long g

n_terms = 20;
n_desimal = 4;

% (a) Perhitungan secara eksak
S_loop = 0;
for k = 1:n_terms
  S_loop = S_loop + 1/k;
end

% (b) Masing-masing pembagian dibulatkan
scale = 10^n_desimal;
terms = round( (1 ./ (1:n_terms)) * scale ) / scale;
S_round = sum(terms);

% (c) Tanpa looping (menggunakan fungsi sum)
S_vec = sum(1 ./ (1:n_terms));

S_ref = S_vec;

printf("a. Looping (eksak double)           : %.15f\n", S_loop);
printf("b. Pembulatan per suku (%d desimal)  : %.15f\n", n_desimal, S_round);
printf("c. Tanpa looping (sum vektor)       : %.15f\n", S_vec);
printf("Galat metode b terhadap eksak       : %.8f\n", abs(S_ref - S_round));
printf("Galat metode c terhadap eksak       : %.8f\n\n", abs(S_ref - S_vec));

printf("%-20s%-20s%-20s%-20s%s\n", "Metode", "Nilai", "Error", "Error Relatif", "RPE(%)");

AE = abs(S_ref - S_loop); RE = AE/abs(S_ref); RPE = RE*100;
printf("%-20s%-20.15f%-20.15f%-20.15f%.8f\n", "(a)", S_loop, AE, RE, RPE);

AE = abs(S_ref - S_round); RE = AE/abs(S_ref); RPE = RE*100;
printf("%-20s%-20.15f%-20.15f%-20.15f%.8f\n", "(b)", S_round, AE, RE, RPE);

AE = abs(S_ref - S_vec); RE = AE/abs(S_ref); RPE = RE*100;
printf("%-20s%-20.15f%-20.15f%-20.15f%.8f\n", "(c)", S_vec, AE, RE, RPE);



