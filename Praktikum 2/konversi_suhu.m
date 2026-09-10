x = input('Masukan nilai suhu Celcius : ');
if (x > 100)
    fprintf('Maaf, batas titik didih Celcius 100 derajat Celcius\n');
elseif (x < 0)
    fprintf('Maaf, batas titik beku Celcius 0 derajat Celcius\n');
else
    fprintf('\nPilih jenis konversi:\n');
    fprintf('1. Reamur\n');
    fprintf('2. Fahrenheit\n');
    fprintf('3. Kelvin\n');
    y = input('Tentukan konversi suhu : ');
    switch (y)
        case 1
            x = 0.8*x;
            fprintf('Sukses konversi ke Reamur. Maka nilai R : %g\n', x);
        case 2
            x = 1.8*x + 32;
            fprintf('Sukses konversi ke Fahrenheit. Maka nilai F : %g\n', x);
        case 3
            x = x + 273;
            fprintf('Sukses konversi ke Kelvin. Maka nilai K : %g\n', x);
        otherwise
            fprintf('Pilihan Anda tidak ada dalam sistem ini');
    end
end
