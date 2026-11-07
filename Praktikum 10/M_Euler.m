function [x,y] = M_Euler(f,a,b,y0,N)
  h = (b-a)/N;

  garis = ['+' repmat('-',1,6) '+' repmat('-',1,14) '+' repmat('-',1,16) '+'];
  fprintf('\nHasil Perhitungan Metode Euler (h = %.6f)\n', h);
  fprintf('%s\n', garis);
  fprintf('| %-4s | %-12s | %-14s |\n', 'i', 'xn', 'yn');
  fprintf('%s\n', garis);

  x = a;
  y = y0;
  fprintf('| %-4d | %12.6f | %14.6f |\n', 0, x, y);

  for i = 1:N
    y(i+1) = y(i) + h*f(x(i),y(i));
    x(i+1) = x(i) + h;
    fprintf('| %-4d | %12.6f | %14.6f |\n', i, x(i+1), y(i+1));
  end
  fprintf('%s\n', garis);
end


