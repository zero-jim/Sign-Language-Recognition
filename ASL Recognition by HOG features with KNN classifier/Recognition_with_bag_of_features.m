%% Strat Here
clear all;
close all;
clc;

%% Load Images
load('training.mat');
load('test.mat');

%% ExtractBag of features and K-means clustering
bag = bagOfFeatures(training);

%% classify
catagoryClassify = trainImageCategoryClassifier(training, bag);

%% Test For all the Test Set Images
[label, scores] = predict(catagoryClassify, test);
catagoryClassify.Labels(label);

%% confusion_mat
confMat=evaluate(catagoryClassify,test);