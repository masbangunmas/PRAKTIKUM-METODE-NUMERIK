%L0325036_NABIL MUFLIH
clear;
clc;

f  = @(x,y) (4*x.^3 - 2*x + 1) ./ (2 + y);
a  = 0;   b = 2;   y0 = 1;   N = 15;

yeksak = sqrt(2*b^4 - 2*b^2 + 2*b + 9) - 2;

[~, yE] = M_Euler(f,a,b,y0,N);   yE = yE(end);
yH      = M_Heun(f,a,b,y0,N);
yR      = M_Runge4(f,a,b,y0,N);

metode = {'Euler'; 'Heun'; 'Runge-Kutta 4'};
yapr   = [yE; yH; yR];
galabs = abs(yeksak - yapr);
galrel = galabs ./ abs(yeksak);

garis = ['+' repmat('-',1,16) '+' repmat('-',1,16) '+' repmat('-',1,18) ...
         '+' repmat('-',1,16) '+' repmat('-',1,14) '+'];
fprintf('\nRingkasan Hasil y(%g)  |  N = %d  |  h = %.6f\n', b, N, (b-a)/N);
fprintf('Nilai eksak y(%g) = %.10f\n', b, yeksak);
fprintf('%s\n', garis);
fprintf('| %-14s | %-14s | %-16s | %-14s | %-12s |\n', ...
        'Metode', 'y(2) hampiran', 'Galat absolut', 'Galat relatif', 'Galat (%)');
fprintf('%s\n', garis);
fprintf('| %-14s | %14.8f | %16.4e | %14.4e | %12.6f |\n', 'Eksak', yeksak, 0, 0, 0);
for i = 1:3
  fprintf('| %-14s | %14.8f | %16.4e | %14.4e | %12.6f |\n', ...
          metode{i}, yapr(i), galabs(i), galrel(i), 100*galrel(i));
end
fprintf('%s\n', garis);




