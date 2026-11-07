function y = M_Runge4(f,a,b,y0,N)
  h = (b-a)/N;

  garis = ['+' repmat('-',1,6) '+' repmat('-',1,14) '+' repmat('-',1,14) '+' ...
           repmat('-',1,14) '+' repmat('-',1,14) '+' repmat('-',1,14) '+' ...
           repmat('-',1,16) '+'];
  fprintf('\nHasil Perhitungan Metode Runge-Kutta Orde 4 (h = %.6f)\n', h);
  fprintf('%s\n', garis);
  fprintf('| %-4s | %-12s | %-12s | %-12s | %-12s | %-12s | %-14s |\n', ...
          'i', 'xn', 'k1', 'k2', 'k3', 'k4', 'yn');
  fprintf('%s\n', garis);

  x = a;
  y = y0;
  k = [];
  fprintf('| %-4d | %12.6f | %12s | %12s | %12s | %12s | %14.6f |\n', ...
          0, x, '-', '-', '-', '-', y);

  for i = 1:N
    k(1) = f(x(i),y(i));
    k(2) = f(x(i)+h/2,y(i)+k(1)*h/2);
    k(3) = f(x(i)+h/2,y(i)+k(2)*h/2);
    k(4) = f(x(i)+h,y(i)+k(3)*h);
    y(i+1) = y(i) + h/6*(k(1)+2*k(2)+2*k(3)+k(4));
    x(i+1) = x(i) + h;
    fprintf('| %-4d | %12.6f | %12.6f | %12.6f | %12.6f | %12.6f | %14.6f |\n', ...
            i, x(i+1), k(1), k(2), k(3), k(4), y(i+1));
  end
  fprintf('%s\n', garis);
  y = y(end);
end



