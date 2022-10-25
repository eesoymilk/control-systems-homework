%% Problem 1
disp('Problem 1')
x = [2 1+2j; -0.45 5];
z1 = (1/2)*log(x+sqrt(1+x.^2)+eye(2))

%% Problem 2
disp('Problem 2')
A = [
    12 34 -4;
    34  7 87;
    3  65  7];
B = [
    1 4 7;
    2 5 8;
    3 6 9];

z2 = A * B
z3 = A .* B
z4 = A^3
z5 = A.^3
z6 = [A([1, 3], :); B^2]
z7 = eig(B)
z8 = det(A)

%% Problem 3
disp('Problem 3')
y1 = [
    1/2 1/3 1/4;
    1/3 1/4 1/5;
    1/4 1/5 1/6];
y2 = [0.95; 0.67; 0.52];
y1_inversed = inv(y1);

x_cell = num2cell(y1 \ y2);
[x1, x2, x3] = x_cell{:};
fprintf('y2(3) = 0.52:\nx1 = %g\nx2 = %g\nx3 = %g\n\n', x1, x2, x3)

y2(3) = 0.53;
x_cell = num2cell(y1 \ y2);
[x1, x2, x3] = x_cell{:};
fprintf('y2(3) = 0.53:\nx1 = %g\nx2 = %g\nx3 = %g\n\n', x1, x2, x3)

%% Problem 4
disp('Problem 4')
H = zeros(9);
for c = 1:9
    for r = 1:10
        H(r, c) = 1 / (r + c + 1);
    end
end
disp('9*9 Hilbert matrix = ')
disp(H)

%% Problem 5
figure(Name='Problem 5', Position=[100 100 1600 800]);

subplot(1,2,1);
fplot(@(x) -sqrt(cos(x)) + 3, [-pi/2, pi/2])
title('Eq1')
xlabel('x')
xlim([-pi/2 pi/2])
ylabel('y1')
grid on

subplot(1,2,2);
[x, y] = meshgrid(linspace(-2, 2),linspace(-4, 4));
f = x.^2 / 2^2 - y.^2 / 4^2;
surf(x, y, f)
title('Eq2')
xlabel('x')
ylabel('y')
zlabel('f(x, y)')
grid on
