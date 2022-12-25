% Controls Systems Textbook Example 10.3
% 109061138 張育瑋

% Reset matlab environment
clearvars
close all
clc
s = tf('s');

%% Specs: T_s <= 4s, P.O. for step <= 35%

G =  10 / s^2;
G_C = (2 + s) / (15 + s);
rlocus(G*G_C), sgrid(.4, 0)

K = 1   % magnitude criterion
T = feedback(K * G_C * G, 1);

stepinfo(T)
margin(T), grid on
