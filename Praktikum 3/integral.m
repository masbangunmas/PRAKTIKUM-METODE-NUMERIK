pkg load symbolic

f = input('Fungsi = ','s');
f_asli = sym(f);

f_integral = int(f_asli, 'x');

disp('Hasil integral = ')
disp(f_integral)
