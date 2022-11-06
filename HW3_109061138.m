% Controls Systems Homework 3
% 109061138 張育瑋

% Reset matlab environment
clearvars
close all
clc

%% Problem 1 : CP3.1
disp('Problem 1 : CP3.1')

% (a)
disp('(a)')
ss(tf(1, [1 10]))

% (b)
disp('(b)')
ss(tf([1 5 3], [1 8 5]))

% (c)
disp('(c)')
ss(tf([1 1], [1 3 3 1]))

%% Problem 2 : CP3.2
disp('Problem 2 : CP3.2')

% (a)
disp('(a)')
tf(ss([0 1; 2 8], [0; 1], [1 0], 0))

% (b)
disp('(b)')
tf(ss([1 1 0; -2 0 4; 5 4 -7], [-1; 0; 1], [0 1 0], 0))

% (c)
disp('(c)')
tf(ss([0 1; -1 -2], [0; 1], [-2 1], 0))

%% Problem 3 : CP3.4
disp('Problem 3 : CP3.4')

A = [0 1 0; 0 0 1; -3 -2 -5];
B = [0; 0; 1];
C = [1 0 0];
sys_3 = ss(A, B, C, 0);

% (a)
disp('(a)')
tf(sys_3)

% (b)
fprintf('(b)\n(see plot)\n\n')
x0 = [0; -1; 1];
[y, t, x] = initial(sys_3, x0, 10);
figure(Name='Problem 3 : CP3.4 (b)')
plot(t, x(:,1), t, x(:,2), t, x(:,3), t, y)
grid on
xlabel('Time (s)')
ylabel('Response')
legend('x1', 'x2', 'x3', 'y')

% (c)
disp('(c)')
trans_matrix = expm(A.*10)
y10 = C*trans_matrix*x0;
fprintf([ ...
    'y(10) obtained in the plot is %.16f,\n' ...
    'while y(10) obtained here is %.16f.\n' ...
    'They are fairly close.\n\n' ...
], y(end), y10)

%% Problem 4 : CP3.7
fprintf('Problem 4 : CP3.4\n(see plot)\n\n')

A = [0 1; -2 -3];
B = [0; 1];
C = [1 0];
x0 = [1 0];
sys_4 = ss(A, B, C, 0);

tSample = 0: .1: 10;
[y, tOut, x] = lsim(sys_4, zeros(size(tSample)), tSample, x0);

figure(Name='Problem 4 : CP3.4')
plot(tOut, x(:,1), tOut, x(:,2), tOut, y)
grid on
xlabel('Time (s)')
ylabel('Response')
legend('x1', 'x2', 'y')

%% Problem 5 : CP3.8
fprintf('Problem 5 : CP3.8\n(see plot)\n\n')

% characteristic equation is s^3 + 2s^2 + Ks + 2 = 0
eigenvalues = zeros(101, 3);
for K=0:100
    eigenvalues(K + 1, :) = roots([1 2 K 2]);
    if find(real(eigenvalues(K + 1, :))>0)
        
    end
end

figure(Name='Problem 5 : CP3.8')
hold on
for i=1:size(eigenvalues, 2)
    plot(0: 100, real(eigenvalues(:, i)), '*')
    plot(0: 100, imag(eigenvalues(:, i)), '.')
end
hold off
grid on
xlabel('K')
ylabel('Real / Imag Part')
legend('Real 1', 'Imag 1', 'Real 2', 'Imag 2', 'Real 3', 'Imag 3')

fprintf([ ...
    'K that results in characteristic values lying in RHP are 0 and 1,\n', ...
    'Therefore, the range of K for which ', ...
    'all the characteristic values lie in LHP is 2 <= K <= 100.\n' ...
])
