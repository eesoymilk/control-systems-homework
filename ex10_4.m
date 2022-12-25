% Controls Systems Textbook Example 10.2
% 109061138 張育瑋

% Reset matlab environment
clearvars
close all
clc
s = tf('s');

%%% Specs: zeta = .4, K_v >= 20
G = 40 / (s*(s + 2));

%% Lead + RL
rlocus(G)
G_C = (s + 9) / (s + 30);
rlocus(G * G_C), sgrid(.4, 0)
T = feedback(20.1 * G_C * G, 1);

stepinfo(T)
damp(T)

%% Lag + RL
rlocus(G)
G_C = (s + 9) / (s + 30);
rlocus(G * G_C), sgrid(.4, 0)
T = feedback(20.1 * G_C * G, 1);

stepinfo(T)
damp(T)
