%% Start from here
clc;
clear all;
close all;

%% Load database and split for training and testing just once
Database=imageSet('EdgeSetATT','recursive');
[train, test]=partition(Database,[.55,.45]);

%% Load database
%load('Database');
%load('train.mat');
%load('test.mat');

%% Extract BOF and K-means clustering just once
bag = bagOfFeatures(train);

%% Load bag
%load('bag.mat');

%% Classify using SVM just once
catagoryClassify = trainImageCategoryClassifier(train, bag);

%% Load classifier
%load('catagoryClassify.mat');

%% Test for all the test set images
[label, scores] = predict(catagoryClassify, test);
catagoryClassify.Labels(label);

%% Confusion matrix
confMat=evaluate(catagoryClassify,test);
