% Controls Systems Homework 4
% 109061138 張育瑋

% Reset matlab environment
clearvars
close all
clc

s = tf('s');

%% Problem 1 : CP4.3
% Obtain the family of step responses for K = 10, 200, and 500. 
% Co-plot the responses and develop a table of results that includes 
% the percent overshoot, settling time, and steady-state error.

disp('Problem 1 : CP4.3')

T1 = @(K) 5*K/(s^2+15*s+K);
figure(Name='Problem 1 : CP4.3')
[y1, tOut1] = step(T1(10), 10);
[y2, tOut2] = step(T1(200), 10);
[y3, tOut3] = step(T1(500), 10);
plot(tOut1, y1), grid on, hold on
plot(tOut2, y2)
plot(tOut3, y3), hold off
legend('K = 10', 'K = 200', 'K = 500')
K = [10; 200; 500];
Overshoot = [
    stepinfo(T1(10)).Overshoot;
    stepinfo(T1(200)).Overshoot;
    stepinfo(T1(500)).Overshoot
];
SettlingTime = [
    stepinfo(T1(10)).SettlingTime;
    stepinfo(T1(200)).SettlingTime;
    stepinfo(T1(500)).SettlingTime
];
SteadyStateError = [abs(y1(end) - 5); abs(y2(end) - 5); abs(y3(end) - 5)];
table(K, Overshoot, SettlingTime, SteadyStateError, ...
    'VariableNames', ...
    ["K", "Persent Overshoot", "Settling Time", "Steady-State Error"])

%% Problem 2 : CP4.4
disp('Problem 2 : CP4.4')

disp('(a)')
T2 = feedback(10/(s*(s+2)), 1)
[y1, tOut1] = step(T2, 10);
figure(Name='Problem 2 : CP4.4 (a)')
plot(tOut1, y1), grid on

disp('(b)')
Td2 = feedback(1/(s*(s+2)), 10)
[y2, tOut2] = step(Td2, 10);
figure(Name='Problem 2 : CP4.4 (b)')
plot(tOut2, y2), grid on

disp('(c)')
SteadyStateTrackingError = table( ...
    abs(y1(end) - 1),abs(y2(end) - .1), 'VariableNames', ...
    ["unit step input", "unit step disturbance input"] ...
)

disp('(d)')
Header = ["Unit Step Input"; "Unit Step Disturbance Input"];
MaximumTrackingError = [
    stepinfo(T2).Overshoot / 100; 
    stepinfo(Td2).Overshoot / 1000
];
PeakTime = [stepinfo(T2).PeakTime; stepinfo(Td2).PeakTime];
table(Header, MaximumTrackingError, PeakTime, 'VariableNames', ...
    [" ", "Maximum Tracking Error", ...
    "Time at which Maximum Tracking Error Occurs"])


%% Problem 3 : CP5.1
disp('Problem 3 : CP5.1')

T3 = 35/(s^2+12*s+35);
delta = .01;
impulse_height = 1 / delta;
tFinal = 5;
t = 0: delta: tFinal;
impulse_signal = [impulse_height; zeros(tFinal / delta, 1)];
y_lsim = lsim(T3, impulse_signal, t);
y_imp = impulse(T3, t);
figure(Name='Problem 3 : CP5.1')
plot(t, y_lsim, t, y_imp), grid on, legend('Analytic', 'Impulse Funtion')
fprintf('As we can see from our plot, they are pretty close.\n\n')


%% Problem 4 : CP5.10
disp('Problem 5 : CP5.10')

T4 = feedback(10/(s*(s+15)*(s+5)), 1);
t = 0: .01: 100;
ramp_signal = 1.*t;
y_ramp = lsim(T4, ramp_signal, t);
figure(Name='Problem 4 : CP5.10')
plot(t, y_ramp, t, ramp_signal), grid on
legend('Ramp Response', 'Ramp Input')
SteadyStateError = abs(y_ramp(end) - ramp_signal(end))
