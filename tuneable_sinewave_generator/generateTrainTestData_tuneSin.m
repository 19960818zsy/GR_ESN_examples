% %%%% generate training and testing time series for ESN training
% The learning-and-testing script learn.m expects data to be contained in
% two matrices named sampleinput (of size inputdim x samplelength) and
% sampleout (of size outputdim x samplelength). Such two matrices must be
% the result of calling this script.

% Note: the script learn.m does training AND testing. Training is done with
% an initial sequence of the data generated here, testing is done on
% remaining data. Therefore, the samplelength should be chosen of
% sufficient length to provide data for both training and  testing.


% 
% %t = 1:0.05:1500;
% t = 1:1500;
% %t = linspace(1,1500,1e5); % 10000 is the size of the training data vector
% sampleinput = 0.5*sin(t/50*2*pi);
% sampleout = 1/2*cos(2*pi*0.2*t + 10*sampleinput);


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
nop = 2^12;
%nop = 1500;
t = linspace(0,50*Tm,nop);
sampleinput = Am*cos(2*pi*fm*t);
sampleout = Ac*cos(2*pi*fc*t + delta_f/fm*sin(2*pi*fm*t));


