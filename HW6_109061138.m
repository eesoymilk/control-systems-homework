% Controls Systems Homework 6
% 109061138 張育瑋

% Reset matlab environment
clearvars
close all
clc

s = tf('s');

%% Problem 1 : P8.1
% Sketch the polar plot for the following loop transfer functions:

disp('Problem 1 : P8.1')

% (a)
disp('(a) see polar plot')
L1a = 1/((1+.25*s)*(1+3*s));
[mag, phase] = bode(L1a);
mag = mag(1, :);
phase = phase(1, :);
figure(Name='Problem 1 : P8.1 (a)')
polarplot(phase*pi/180 , mag), grid on

% (b)
disp('(b) see polar plot')

L1b = 5*(s^2+1.4*s+1)/((s-1)^2);
[mag, phase] = bode(L1b);
mag = mag(1, :);
phase = phase(1, :);

figure(Name='Problem 1 : P8.1 (b)')
polarplot(phase*pi/180 , mag), grid on

% (c)
disp('(c) see polar plot')
L1c = (s-8)/(s^2+6*s+8);
[mag, phase] = bode(L1c);
mag = mag(1, :);
phase = phase(1, :);

figure(Name='Problem 1 : P8.1 (c)')
polarplot(phase*pi/180 , mag), grid on

% (d)
disp('(d) see polar plot')
L1d = 20*(s+8)/(s*(s+2)*(s+4));
[mag, phase] = bode(L1d);
mag = mag(1, :);
phase = phase(1, :);

figure(Name='Problem 1 : P8.1 (d)')
polarplot(phase*pi/180 , mag), grid on

%% Problem 2 : P8.4
fprintf('\nProblem 2 : P8.4 (see bode plot)\n')
controller = 1 + 5*s;
valve = .02*(1 + 10*s)/((1 + 7*s)*(1 + 12*s));
process = 10/(s^2 + 5*s + 12);
measurement = 20 / (s^2 + 5*s + 12);

T2 = feedback(controller * valve * process, measurement, -1);
figure(Name='Problem 2 : P8.4')
bode(T2), grid

%% Problem 3 : P8.9
fprintf('\nProblem 3 : P8.9\n')

% (a)
disp('(a) see polar plot')
L1a = 1/((1+.25*s)*(1+3*s));
[mag, phase] = bode(L1a);
mag = mag(1, :);
phase = phase(1, :);
figure(Name='Problem 1 : P8.1 (a)')
polarplot(phase*pi/180 , log10(mag)), grid on

% (b)
disp('(b) see polar plot')

L1b = 5*(s^2+1.4*s+1)/((s-1)^2);
[mag, phase] = bode(L1b);
mag = mag(1, :);
phase = phase(1, :);

figure(Name='Problem 1 : P8.1 (b)')
polarplot(phase*pi/180 , log10(mag)), grid on

%% Problem 4 : CP9.3
fprintf(['\nProblem 4 : CP9.3\n', ...
    'You can label the charts manually by right clicking the chart.\n\n'])

% (a)
disp('(a) see plot')
G1a = 1/(s + .2);
figure(Name='Problem 4 : CP9.3 (a)')
nichols(G1a), ngrid
[Gm, Pm] = margin(G1a);
fprintf(['The gain margin is %g,\n', ...
    'and the phase margin is %g.\n\n'], Gm, Pm)

% (b)
disp('(b) see plot')
G1b = 1/(s^2 + 2*s + 1);
figure(Name='Problem 4 : CP9.3 (b)')
nichols(G1b), ngrid
[Gm, Pm] = margin(G1b);
fprintf(['The gain margin is %g,\n', ...
    'and the phase margin is %g.\n\n'], Gm, Pm)

% (c)
disp('(c) see plot')
G1c = 6/(s^3 + 6 * s^2 + 11*s + 6);
figure(Name='Problem 4 : CP9.3 (c)')
nichols(G1c), ngrid
[Gm, Pm] = margin(G1c);
fprintf(['The gain margin is %g,\n', ...
    'and the phase margin is %g.\n\n'], Gm, Pm)

%% Problem 5 : CP7.9
disp('Problem 5 : CP7.9')
G5 = (s+2)/(s^3+6*s^2+14*s+8);

figure(Name='Problem 5 : CP7.9')
[r, k] = rlocus(G5);
rlocus(G5), sgrid(.707, 0)
grid on

fprintf(['According to the root locus,\n', ...
    'K is about 3.19 when damping ratio is 0.707.\n\n'])

%% Problem 6 : CP7.4
disp('Problem 6 : CP7.4')
G6 = (s-1)/(s^3+4*s^2+5*s+4);

figure(Name='Problem 6 : CP7.4')
rlocusplot(G6), grid on
fprintf(['According to the root locus,\n', ...
    'the system is stable for K < 4 (approximately).\n\n'])
