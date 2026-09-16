x = -3:0.15:3;
y = -3:0.15:3;
[X,Y] = meshgrid(x,y);
Z = 1.8.^(-1.5*sqrt(X.^2 + Y.^2)) ...
    .* cos(0.5*Y) .* sin(X);
contour3(X,Y,Z,30, 'LineWidth', 1.5);
colormap(jet);
colorbar;
grid on;
view(45,30);
xlabel('Sumbu X');
ylabel('Sumbu Y');
zlabel('Sumbu Z');
title('Grafik Kontur 3D Bergelombang');
