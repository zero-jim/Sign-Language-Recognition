%% Load features for test case
load ('Features.mat');
P = Features;

%% Test with net
net.inputs{1}.processFcns = {'removeconstantrows','mapminmax'};
load net.mat;
load net;
y5 = sim(net,P);
[C I] = max(y5);