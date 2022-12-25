% Controls Systems Textbook Example 10.5
% 109061138 張育瑋

% Reset matlab environment
clearvars
close all
clc
s = tf('s');

%% Specs: e_ss for step = 0, P.O. <= 20
% Your can place your zero (K_I/K_P) wherever you 
% want; however, a general rules of thumbs is to 
% place it to cancel the right most dominent pole.

G = 1 / ((s + .5) * (s + 2));   % type 0
G_C = (s + .5) / s;
rlocus(G * G_C), sgrid(.6, 0)
K_P = 2.8;
T = feedback(K_P * G_C * G, 1);

step(T, 100)
stepinfo(T)
