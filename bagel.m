% 绘制一个贝果

% 定义绘图的角度参数
% 'alpha' 从 0 到 2*pi，包含 2468 个样本（点），定义水平角度
% 'beta' 从 -pi/2 到 pi/2，包含 250 个样本（点），定义垂直角度
alpha = linspace(0, 2*pi, 2468);
beta = linspace(-pi/2, pi/2, 250);
% 向量中的样本数量越多，绘制的曲面就越平滑


% 创建参数化表面的网格
% 'Alpha' 和 'Beta' 表示绘制 3D 表面时的网格坐标
[Alpha, Beta] = meshgrid(alpha, beta);

% 变量 'a' 控制 x 和 y 方向的缩放，决定贝果的半径n
a = 20; 
% 变量 'b' 控制 z 方向的缩放，影响贝果的高度
b = 9;


% x、y 和 z 坐标的参数化方程
x = a * cos(Alpha) .* cos(Beta); % 决定水平位置（x）
y = a * sin(Alpha) .* cos(Beta); % 决定水平位置（y），带有正弦变化
z = b * sin(2*Beta) + 0.001 * sin(5*Alpha); % 决定垂直位置，带有波动

% 贝果
figure;
% 创建 3D 曲面图，不显示边缘 
surf(x, y, z, 'EdgeColor', 'none'); 
axis equal;% 所有坐标轴长度相等 
% 创作题目
title('Bagel');
xlabel('Bagel from x angle');
ylabel('Bagel from y angle');
zlabel('Bagel height');
% 显示网格
grid on;
