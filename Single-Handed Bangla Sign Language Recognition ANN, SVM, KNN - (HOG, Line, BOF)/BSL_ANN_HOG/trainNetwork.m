%% Start here
clc;
clear all;
close all;

%% Neural network for pattern recognition
rng('default');
load('X.mat');
load('Y.mat');
input = X';
target = Y';

%% Create a pattern recognition network
hiddenLayerSize = [100 100 100 100];
net = patternnet(hiddenLayerSize);

%% Choose Input and Output Pre/Post-Processing Functions
% For a list of all processing functions type: help nnprocess
net.inputs{1}.processFcns = {'removeconstantrows','mapminmax'};
net.outputs{2}.processFcns = {'removeconstantrows','mapminmax'};
% Setup Division of Data for Training, Validation, Testing
% For a list of all data division functions type: help nndivide
net.divideFcn = 'dividerand';  % Divide data randomly
net.divideMode = 'sample';  % Divide up every sample
net.divideParam.trainRatio = 80/100;
net.divideParam.testRatio = 20/100;
% For help on training function 'trainscg' type: help trainscg
% For a list of all training functions type: help nntrain
net.trainFcn = 'trainscg';  % Scaled conjugate gradient
% Choose a Performance Function
% For a list of all performance functions type: help nnperformance
net.performFcn = 'mse';  % Mean squared error
% Choose Plot Functions
% For a list of all plot functions type: help nnplot
net.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
  'plotregression', 'plotfit'};
net.efficiency.memoryReduction = 100;
net.trainParam.max_fail = 6;
net.trainParam.min_grad=1e-5;
net.trainParam.show=10;
net.trainParam.lr=0.9;
net.trainParam.epochs=1000;
net.trainParam.goal=0.00;

%% Train the Network
[net,tr] = train(net,input,target);

%% Test the Network
outputs = net(input);
errors = gsubtract(target,outputs);
performance = perform(net,target,outputs)

%% Recalculate Training, Validation and Test Performance
trainTargets = target .* tr.trainMask{1};
valTargets = target  .* tr.valMask{1};
testTargets = target  .* tr.testMask{1};
trainPerformance = perform(net,trainTargets,outputs)
valPerformance = perform(net,valTargets,outputs)
testPerformance = perform(net,testTargets,outputs)

%% View the Network
view(net)
disp('after training')
y1 = sim(net,input);
y1=abs(y1);
y1=round(y1);

%% Save the network
save   net net;