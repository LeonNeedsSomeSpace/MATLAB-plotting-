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
alpha_40 = 40; 
alpha_41 = 41;
alpha_42 = 42; 
alpha_43 = 43; 
alpha_44 = 44; 
alpha_45 = 45; 
alpha_46 = 46; 
alpha_47 = 47; 
alpha_48 = 48; 
alpha_49 = 49; 

%Define a distance from {0,...,25} as requred by the exercise 
x_5 = 0:1:25; 

%Calculate the specific functions for each angle 

y_40 = -g*x_5.^2/(2*(v0*cosd(alpha_40)).^2)+x_5*tand(alpha_40)+h_5;
y_41 = -g*x_5.^2/(2*(v0*cosd(alpha_41)).^2)+x_5*tand(alpha_41)+h_5;
y_42 = -g*x_5.^2/(2*(v0*cosd(alpha_42)).^2)+x_5*tand(alpha_42)+h_5;
y_43 = -g*x_5.^2/(2*(v0*cosd(alpha_43)).^2)+x_5*tand(alpha_43)+h_5;
y_44 = -g*x_5.^2/(2*(v0*cosd(alpha_44)).^2)+x_5*tand(alpha_44)+h_5;
y_45 = -g*x_5.^2/(2*(v0*cosd(alpha_45)).^2)+x_5*tand(alpha_45)+h_5;
y_46 = -g*x_5.^2/(2*(v0*cosd(alpha_46)).^2)+x_5*tand(alpha_46)+h_5;
y_47 = -g*x_5.^2/(2*(v0*cosd(alpha_47)).^2)+x_5*tand(alpha_47)+h_5;
y_48 = -g*x_5.^2/(2*(v0*cosd(alpha_48)).^2)+x_5*tand(alpha_48)+h_5;
y_49 = -g*x_5.^2/(2*(v0*cosd(alpha_49)).^2)+x_5*tand(alpha_49)+h_5;

%Plot all functions

figure(2); 
hold on; 
xlabel('Throwing Distance x (m)'); %x-axis label
ylabel('Launch Angle alpha (deg)'); %y-axis label 
plot(x_5, y_40); 
plot(x_5, y_41); 
plot(x_5, y_42); 
plot(x_5, y_43); 
plot(x_5, y_44); 
plot(x_5, y_45); 
plot(x_5, y_46); 
plot(x_5, y_47); 
plot(x_5, y_48); 
plot(x_5, y_49); 
legend('40 deg', '41 deg', '42 deg', '43 deg', '44 deg', '45 deg', '46 deg', '47 deg', '48 deg', '49 deg'); 
title('Throwing Angles'); 
