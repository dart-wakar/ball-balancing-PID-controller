m = 0.027; % Mass of the ball
R = 0.002; % Radius of the ball
g = -9.8;  % Gravitational acceleration
L = 0.3;   % Length of the base
d = 0.05;  % Diameter of the servo gear
J = 2/3*m*R^2;   % Moment of inertia of the ball

s = tf('s');
P_ball = -(m*g*d*R^2)/(L*(J + m*R^2)*s^2)
pzmap(P_ball)
step(P_ball)