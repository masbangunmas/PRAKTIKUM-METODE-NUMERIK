x = 0:0.01:1*pi;
y = 10*sin(2*x);
z = 20*sin(4*x);

plot(x,y,'b',x,z,'r');
xlabel('Sumbu X');
ylabel('Sumbu Y');
title('Grafik Gelombang 3 Variabel');
legend('y = 10 sin(2x)', 'z = 20 sin(4x)');
