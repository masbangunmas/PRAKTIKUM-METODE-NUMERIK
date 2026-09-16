pkg load symbolic

f = input('Masukkan bentuk persamaan f(x) = ','s');
f_asli = sym(f);
f_turunan = diff(f_asli,'x');

disp('Turunan f(x) = ')
disp(f_turunan)

