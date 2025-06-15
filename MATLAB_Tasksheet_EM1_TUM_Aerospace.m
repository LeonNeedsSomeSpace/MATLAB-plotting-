fprintf('Data evaluation: Shot Put\n\n');

%Declare the variables

% h: Height of where the ball was thrown
% g: Gravitational constant

h = 2.2; 
g = 9.81;

%Visualize the constants
fprintf('Ball thrown from a height of: %.1f m \n', h); 
fprintf('Gravitational constant: %.2f m/s^2 \n\n', g); 
 
v1 = 13.4; 
v2 = 13.7; 
v3 = 13.5;
v4 = 13.8;
v0 = mean([v1 v2 v3 v4]); 

%Visualize the provided data 
fprintf('Velocity from each throw: \n');
fprintf('First throw: %.1f m/s \n', v1); 
fprintf('Second throw: %.1f m/s \n', v2); 
fprintf('Third throw: %.1f m/s \n', v3); 
fprintf('fourth throw: %.1f m/s \n', v4); 
fprintf('Mean value: %.1f m/s \n', v0); 

%Calculate the throwing distance of the ball in relation to angle 'alpha'
%Since alpha is a vector, define it as such

alpha = 0:1:90; %Be aware that MATLAB begins at 1 instead of 0

alpha_lenght = length(alpha); 
x = zeros(1, alpha_lenght); %Preallocate 'x' to improve performance during iteration

for i = 1:alpha_lenght
    alpha_rad = deg2rad(alpha(i)); %Convert from degrees to radians
    vx0 = v0*cos(alpha_rad); %Calculate x-component of initial velocity
    vy0 = v0*sin(alpha_rad); %Calculate y-component of initial velocity

    %For throwing distance x
    x(i) = (vx0/g) * (vy0 + sqrt(vy0*vy0 + 2*g*h)); 
    
end

%Plot the results for each velocity value

figure(1); 
hold on; 
xlabel('Throwing Distance x (m)'); %x-axis label
ylabel('Launch Angle alpha (deg)'); %y-axis label 
q1 = plot(x, alpha, 'b-'); %x-axis for throwing distance 'x' and y-axis for launch angle 'alpha'

%Calculate the maximum angle for when the maximum distance is reached
%Be aware of the synthax. 
[max_val, max_ind] = max(x); %Use 'max' function to find the maximum value on the vector 
x_max = x(max_ind); 
alpha_max = alpha(max_ind); 
q2 = plot(x_max, alpha_max, 'r*'); 

legend([q1,q2], {'Projectile Range', 'Maximum Distance'}); 
title('Throwing Distance in relation to Launch Angle'); 

%Plot the throwing height y. Focus on angles {40,...,49}
%Redefine initial height to h = 1 m as required by the exercise

h_5 = 1; 
x_5 = 0:1:25; 
angles = 40:49; 

figure(2); 
hold on; 
xlabel('Throwing Distance x (m)'); %x-axis label
ylabel('Height in vertical direction (m)'); %y-axis label 
title('Throwing Angles (40 deg - 49 deg)'); 
colors = lines(length(angles)); 


for i = 1:length(angles)
    alpha_i = angles(i); 
    y_1 = -g * x_5.^2 / (2 * (v0 * cosd(alpha_i))^2) + x_5 * tand(alpha_i) + h_5; 
    y_1(y_1 < 0) = NaN; 
    plot(x_5, y_1, 'DisplayName', sprintf('%d', alpha_i), 'Color', colors(i,:)); 
end 
legend('show'); 