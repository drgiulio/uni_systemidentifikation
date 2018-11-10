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

clear; clc; close all;

%--------------------------------------------------------------------------
set(0,'DefaultAxesFontSize',15);
set(0,'DefaultTextFontSize',15);
%--------------------------------------------------------------------------

ini_gdnn

% Trainingslänge neue definieren
train_length = 15;    % [s]

sim('gdnn_lm_rtrl');

%% System-Eingang und System-Ausgang + Modell Ausgang + Fehler 
figure(1);
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

figure(2);
semilogy(data.time,data.signals.values(:,1),'r','Linewidth',1.5); grid;
legend('Fehler e'); xlabel('Zeit t[s]'); ylabel('Fehler');