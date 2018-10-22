clc
clear
close all

%% Init

% Simulation settings
hsim = 0.001;
tsim = 50;

% Initial states
x1_init = 1;
x2_init = 0;

% Duffing system
gamma = 2.1; % amplitude of forced oscillation
omega = 1.8; % angular frequency
delta = 0.4; % damping
alpha = -1.1; % linear term
beta = 1; % Duffing term

% Noise
noise_on = 0;
var = 0.00001;

%% Run
[t, y] = sim('duffing_plant');

%% Plot
x1 = y(:,1);
x2 = y(:,2);

% Phase plot
figure
plot(x1, x2)
grid
h = xlabel('$x_1$');
set(h,'Interpreter','LaTex','FontSize',12)
h = ylabel('$x_2$');
set(h,'Interpreter','LaTex','FontSize',12)
h = title('Phase portrait');
set(h,'Interpreter','LaTex','FontSize',12)