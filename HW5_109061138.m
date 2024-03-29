% Controls Systems Homework 5
% 109061138 張育瑋

% Reset matlab environment
clearvars
close all
clc

s = tf('s');

%% Problem 1 : CP6.6
% Using the for function, develop an m-file script to compute the 
% closed-loop transfer function poles for 0 … K … 5 and plot the results 
% denoting the poles with the "X" symbol. 
% Determine the maximum range of K for stability with the Routh–Hurwitz 
% method. 
% Compute the roots of the characteristic equation when K is the minimum 
% value allowed for stability.

disp('Problem 1 : CP6.6')

G1 = @(K) 1/(s^3+5*s^2+(K-3)*s+K);
T1 = @(K) feedback(G1(K), 1);

figure(Name='Problem 1 : CP6.6'), hold on
for K = 0:5
    disp(['When K = ', num2str(K), ', '])
    transfer_function = T1(K)
    pzplot(transfer_function);
end
grid on, hold off
legend('K = 0', 'K = 1', 'K = 2', 'K = 3', 'K = 4', 'K = 5')

routh_array = [
    "1" "k-3";
    "5" "k+1";
    "(4*k - 16)/5" " ";
    "k+1" " ";
];

routh_array_table = array2table(routh_array, ...
    'RowNames',{'s^3','s^2','s^1', 's^0'}, 'VariableNames', [" ", "  "])
fprintf(['According to the routh-array above,\n', ...
    'the maximum range of K for stability is K >= 4.\n', ...
    'And the roots of the characteristic equation when K is the minimum are'])
roots([1, 5, 1, 5])


%% Problem 2 : CP6.7
disp('Problem 2 : CP6.7')

A = [0 1 0; 0 0 1; -5 -12 -8];
B = [0; 0; 1];
C = [1 1 0];
D = 0;

disp('(a)')
characteristic_equation = poly(A)

disp('(b)')
roots(characteristic_equation)
disp('Since all roots are less than 0, the system is stable.')

disp('(c)')
disp('(see plot)')
ss(A, B, C, D);
t = 0: .01: 5;
u = ones(1, numel(t));
figure(Name='Problem 2 : CP6.7')
lsim(ss(A, B, C, D), u, t, [0 0 0]), grid on

%% Problem 3 : CP5.4
disp('Problem 3 : CP5.4')

T3 = feedback((21/s)*(1/(s+2)), 1);

disp('(a) Analytic')
delta = .01;
tFinal = 5;
t = 0: delta: tFinal;
step_signal = ones(1, numel(t));
y_anal = lsim(T3, step_signal, t);

figure(Name='Problem 3 : CP5.4 (a) Step by Analytic Approach')
plot(t, y_anal), grid on
fprintf('The percent overshoot is %g%%.\n', (max(y_anal) - 1) * 100)

disp('(b) step funtion')
y_step = step(T3, t);
figure(Name='Problem 3 : CP5.4 (a) Step by step Funtion')
step(T3, tFinal), grid on
fprintf(['The percent overshoot is %g%%,', ...
    'and it is pretty close to part (a).\n'], stepinfo(T3).Overshoot)
