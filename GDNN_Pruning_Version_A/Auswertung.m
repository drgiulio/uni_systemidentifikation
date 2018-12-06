% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%   Technische Hochschule Ingolstatdt (THI)                               %
%   Elektromobilität und lernfähige Systeme (ELS)                         %
%   Prof. Dr.-Ing. Christian Endisch                                      %
%   www.els-thi.de                                                        %
%                                                                         %
%   Prof. Dr.-Ing. Chrisitan Endisch                                      %
%   christian.endisch@thi.de                                              %
%   01.05.2016                                                            %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
clear all
clc
close all

%--------------------------------------------------------------------------
set(0,'DefaultAxesFontSize',15);
set(0,'DefaultTextFontSize',15);
%--------------------------------------------------------------------------

ini_gdnn

% Trainingslänge neue definieren
train_length = 100;    % [s]

sim('gdnn_lm_rtrl');

%% System-Eingang und System-Ausgang + Modell Ausgang + Fehler 
fig1 = figure(1);
h1=subplot(311);
plot(data.time,data.signals.values(:,6),'b','Linewidth',1.0); hold on;
plot(data.time,data.signals.values(:,3),'r','Linewidth',1.0); grid;
legend('System Eingang p','System Ausgang y');
h2=subplot(312);
plot(data.time,data.signals.values(:,2),'r','Linewidth',1.5); hold on;
plot(data.time,data.signals.values(:,3),'b','Linewidth',1.0); grid;
legend('Modell Ausgang y_{out}','System Ausgang y');
h3=subplot(313);
plot(data.time,data.signals.values(:,1),'r','Linewidth',1.5); grid;
legend('Fehler e');

linkaxes([h1 h2 h3],'x'); xlabel('Zeit t[s]'); 
set([h1 h2],'xticklabel',[]);

fig2 = figure(2);
semilogy(data.time,data.signals.values(:,1),'r','Linewidth',1.5); grid;
legend('Fehler e'); xlabel('Zeit t[s]'); ylabel('Fehler');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SPEICHERROUTINE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{

if switch_input_wave == 1
    filename = sprintf('Chrip_Excitation_from_%.2f_Hz_to_%.2f_Hz_with_Amplitude_%.2f_alpha_%.2f_beta_%.2f_delta_%.2f_gamma_%.2f.jpg',...
        Freq_init, Freq_max, Amplitude_Chirp, alpha, beta, delta, gamma);
elseif  switch_input_wave == 0
    filename = sprintf('Sine_Excitation_with_%.2fHz_and_Amplitude_%.2f_alpha_%.2f_beta_%.2f_delta_%.2f_gamma_%.2f.jpg',...
         omega, Sine_A, alpha, beta, delta, gamma);
elseif switch_input == 0
    filename = sprintf('APRBS_Excitation_with_tmin%.2f_to_tmax%0.2f_and_Amin_%.2f_to_Amax_%0.2f_alpha_%.2f_beta_%.2f_delta_%.2f_gamma_%.2f.jpg',...
         t_min, t_max, min_ampl, max_ampl, alpha, beta, delta, gamma);
end
    
path = [pwd,'\Results'];
saveas(fig1, fullfile(path, filename));
%}
