%% Testing the Tunable Sinewave Generator - pag.137 LN
% header infos for controller learning

%% Initialization
clear all;
clc;
%createEmptyFigs

netDim = 250;
connectivity = 0.2; % i.e. 15% of the network internal weights are non-zero
inputLength = 1; % one input neurons
outputLength = 1; % one output neuron
samplelength = 1500; % the length of the training data vector (which will be split in 2 for training and testing)

%% Generate the ESN
generateNet

%% Generate the training and testing data
generateTrainTestData_tuneSin

%% Learn the ESN and compute the training and testing errors
learnAndTest

% specRad = 0.8; ofbSC = [1;1]; noiselevel = 0.0000; 
% linearOutputUnits = 0; linearNetwork = 0; WienerHopf = 0; 
% initialRunlength = 100; sampleRunlength = 1000; freeRunlength = 0; plotRunlength = 100;
% inputscaling = [0.1;0.5]; inputshift = [0;1];
% teacherscaling = [0.3;0.3]; teachershift = [-.2;-0.2];
