% Controls Systems Homework 2
% 109061138 張育瑋

% Reset matlab environment
clearvars
close all
clc

%% Problem 1 : Simulate spring-mass-damper system of unforced response with
%              damping ratio equal to 0.3, 0.6, and 1 (see Fig. 2.46)

% Consider the underdamped cases where y(0) = 5m, M = 1kg, k = 1, wn = 1
% Case 1: zeta = 0.3    (underdamped)
% Case 2: zeta = 0.6    (underdamped)
% Case 3: zeta = 1      (critically damped)

y0 = 5;
wn = 1;
zeta_s = [.3 .6];
t = 0: .1: 10;

% damped solution is given in the textbook,
% critically damped solution is obtained by solving the DEs.
y_damped = @(zeta) ...
    (y0/sqrt(1-zeta^2))*exp(-zeta*wn*t)...
    .*sin(wn*sqrt(1-zeta^2)*t+acos(zeta));
y_crit_damped = y0*(exp(-t)+t.*exp(-t));

figure(Name='Problem 1')
for i = 1:2
    plot(t, y_damped(zeta_s(i)))
    hold on
end
plot(t, y_crit_damped)
hold off
grid on
xlabel('Time (s)')
ylabel('Displacement (m)')
legend( ...
    ['\zeta = ' num2str(zeta_s(1))], ...
    ['\zeta = ' num2str(zeta_s(2))], ...
    '\zeta = 1' ...
)

%% Problem 2 : Simulate Example 2.19
G1 = tf(1, [1 10]);
G2 = tf(1, [1 1]);
G3 = tf([1 0, 1], [1 4 4]);
G4 = tf([1 1], [1 6]);
H1 = tf([1 1], [1 2]);
H2 = tf(2);
H3 = tf(1);

sys2_1 = feedback(G3 * G4, H1, +1);
sys2_2 = feedback(G2 * sys2_1, H2 / G4);
T_2 = minreal(feedback(G1 * sys2_2, H3))

%% Problem 3 : Simulate Example 2.20
G3_1 = tf(10, [1 1]);
G3_2 = tf(1, [2 .5]);
G3_3 = tf(540);
sys3_1 = feedback(G3_1 * G3_2, tf(-.1));
T_3 = feedback(G3_3 * sys3_1, 1)

t_3 = 0: .005: 5;
figure(Name='Problem 3')
plot(t_3, step(T_3, t_3))
grid on
xlabel('Time (s)')
ylabel('Wheel velocity')
