m = 0.027; % Mass of the ball
R = 0.002; % Radius of the ball
g = -9.8;  % Gravitational acceleration
L = 0.3;   % Length of the base
d = 0.05;  % Diameter of the servo gear
J = 2/3*m*R^2;   % Moment of inertia of the ball

s = tf('s');
% open loop transfer function of the plant
Pop_ball = -(m*g*d*R^2)/(L*(J + m*R^2)*s^2);
% clearly it will show that open loop is unstable for step input
step(Pop_ball);
% Now let's use P, PID controller with a feedback, ofcourse to stabilise  it!
Kp = 1;
C = pid(Kp);
% Plant with close loop and unity feedback
Pcl = feedback(C*Pop_ball,1);
% Let's plot this with a step input
% Now Input will be the position where you want to stop the ball on the
% beam

step(0.25*Pcl)
axis([0 90 0 0.5]) % ([Xmin Xmax Ymin Ymax])
% You will see a Plot which is critically stable
% Let's further modify it using PD/PID
Kp = 9.8; % for these values overshoot % = 3.6
Kd = 19; % Setlling time = 2.41 s """VOILLAAAA!!!"""
Ki = 0;  % Increase it and you will find the parameters increasing
C = pid(Kp,Ki,Kd);
Pcl = feedback(C*Pop_ball,1);
t = 0:0.01:5;
step(0.20*Pcl)
stepinfo(0.2*Pcl)
% You will see tha Mx overshoot is greater than 5 percentage
% And Settling time is greater than 3 seconds
% Tuning is required
% Change Kp and Kd, we started from their alues 10,10 respectively