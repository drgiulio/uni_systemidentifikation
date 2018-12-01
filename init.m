clc
clear
close all

%% Init

% Simulation settings
hsim = 0.001;
tsim = 200;

% Initial states
x1_init = 1;
x2_init = 0;

% Duffing system
%gamma = 0.2;%0.28;%0.29;%0.37;%0.65;%1;%0.5; % amplitude of forced oscillation
omega_d = 1.2; % angular frequency
delta = 0.3; % damping
alpha = 1; % linear term
beta = 1; % Duffing term

% Noise
noise_on = 0;
var = 0.00001;

%% Simulate and plot
figure;

for gamma = [0.2,0.28,0.29,0.37,0.65,1]%omega_d = [0.5,1,1.2]
    
    % Variable parameter
    par = gamma;%omega_d;
    par_name = '\gamma';%'\omega_d';
    
    % Run
    [t, y] = sim('duffing_plant');

    % Save
    x1 = y(:,1);
    x2 = y(:,2);

    % Phase plot
    subplot(3,1,1)
    l = legend('-DynamicLegend','Location','Best');
    set(l,'Interpreter','LaTex','FontSize',12);
    plot(x1, x2, 'DisplayName', ['$', par_name,' = ',num2str(par), '$'])
    hold on
    
    % Time plot states
    subplot(3,1,2)
    l = legend('-DynamicLegend','Location','Best');
    set(l,'Interpreter','LaTex','FontSize',12);
    plot(t, x1, 'DisplayName', ['$', par_name,' = ',num2str(par), '$'])
    hold on
    
    % Compute frequency response and plot
    subplot(3,1,3)
    func = @(om,y) ( ((om.^2 - alpha)/gamma - 0.75*beta*y.^2).^2 + (delta/gamma*om).^2 ) .* y.^2 - 1/(gamma^2);
    l = legend('-DynamicLegend','Location','Best');
    set(l,'Interpreter','LaTex','FontSize',12);
    fimplicit(func,'XRange', [0 2], 'YRange', [0 4], 'DisplayName', ['$', par_name,' = ',num2str(par), '$'])%,'MeshDensity',152)
    hold on
end
    
    
%% Format plots

% Phase portrait
subplot(3,1,1)
grid
h = xlabel('$x_1$');
set(h,'Interpreter','LaTex','FontSize',12)
h = ylabel('$x_2$');
set(h,'Interpreter','LaTex','FontSize',12)
h = title(['Phase portrait: $\gamma=', num2str(gamma),'$, $\alpha=', num2str(alpha),'$, $\beta=', num2str(beta),'$, $\delta=', num2str(delta),'$, $\omega_d=', num2str(omega_d),'$']);
set(h,'Interpreter','LaTex','FontSize',12)

% Time plot states
subplot(3,1,2)
grid
h = ylabel('$x_1$');
set(h,'Interpreter','LaTex','FontSize',12)
h = xlabel('$t$');
set(h,'Interpreter','LaTex','FontSize',12)
h = title('Time plot');
set(h,'Interpreter','LaTex','FontSize',12)

% Frequency response
subplot(3,1,3)
grid
h = xlabel('$\omega$');
set(h,'Interpreter','LaTex','FontSize',12)
h = ylabel('$z/\gamma$');
set(h,'Interpreter','LaTex','FontSize',12)
h = title('Frequency response');
set(h,'Interpreter','LaTex','FontSize',12)