%接下来，我们使用数学函数绘制一个彩蛋

theta = linspace(0, 2*pi, 100); 
phi = linspace(-pi/2, pi/2, 500); 

[Theta, Phi] = meshgrid(theta, phi);  % 创建角度 theta 和 phi 的网格，用于后续的函数计算或绘图

a = 40; 
b = 48; 
c = -6; 

x = a * cos(Theta) .* cos(Phi); 
y = a * sin(Theta) .* cos(Phi); 
z = c * cos(Phi) - b * sin(Phi) + 0.001 * sin(Theta); 


figure; 
surf(x, y, z, 'EdgeColor','none'); 
axis equal; 
title ('Easter Egg'); 
grid on; 


%复活节快乐 :)
