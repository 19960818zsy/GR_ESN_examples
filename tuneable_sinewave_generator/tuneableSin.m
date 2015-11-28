% clear all
% clc
% 
% t = linspace(1,1500,10^4);
% %t = 1:0.05:1500;
% %t = 1:1500;
% f = 0.5*sin(t/50*2*pi);
% y = 1/2*cos(2*pi*0.2*t + 10*f);
% 
% figure(50);
% clf;
% subplot(2,1,1);
% plot(t,f,'b','Linewidth', 2);
% xlim([0 100]);
% xlabel('time');
% ylabel('frequency');
% 
% subplot(2,1,2);
% plot(t,y,'r','Linewidth', 2);
% xlim([0 100]);
% xlabel('time');
% ylabel('signal');


clear all;
clc;

% signal info
Am = 5; % V
fm = 5e3; % kHz

% carrier info
Ac = 1;    % V
fc = 40e3; % Hz

% freq modulation index
beta = 4;

% freguency deviation
delta_f = beta*fm; % Hz

% modulated signal
% vector of time
Tm = 1/fm;
%nop = 2^12;
nop = 1500;
t = linspace(0,3*Tm,nop);
m = Am*cos(2*pi*fm*t);
figure(1); clf
subplot(3,1,1);
plot(t,m,'k','Linewidth', 2); 
ylabel('m [V]');
title('Signal');
subplot(3,1,2);
c = Ac*cos(2*pi*fc*t);
plot(t,c,'b','Linewidth', 2);
ylabel('c [V]');
title('Carrier');
subplot(3,1,3);
y = Ac*cos(2*pi*fc*t + delta_f/fm*sin(2*pi*fm*t));
plot(t,y,'r','Linewidth', 2);
xlabel('t [s]'); ylabel('y [V]');
title('FM Modulated signal');


