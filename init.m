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
gamma = 0; % amplitude of forced oscillation
f = 1; % Eigenfrequency
omega = 2*pi*f;%1.8; % angular frequency
q = 50; % Quality factor of oscillation (inversely proportional to damping)
delta = omega/q; % damping
alpha = omega^2; % linear term
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

% Time plot states
figure
subplot(2,1,1)
plot(t, x1)
grid
h = ylabel('$x_1$');
set(h,'Interpreter','LaTex','FontSize',12)
h = xlabel('$t$');
set(h,'Interpreter','LaTex','FontSize',12)
h = title('Time plots');
set(h,'Interpreter','LaTex','FontSize',12)
subplot(2,1,2)
plot(t, x2)
grid
h = ylabel('$x_2$');
set(h,'Interpreter','LaTex','FontSize',12)
h = xlabel('$t$');
set(h,'Interpreter','LaTex','FontSize',12)

% TO DO: Plot frequency response

