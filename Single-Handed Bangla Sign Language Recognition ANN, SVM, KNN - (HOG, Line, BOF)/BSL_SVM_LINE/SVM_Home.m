%% Start Here
clc;
clear all;
close all;
disp('Starting Processing....');

%% Create Database
disp('Creating Databse....');
Database = imageSet('EdgeSetATT','recursive');
disp('Separating Training and Testing Set....');
[trainSet testSet] = partition(Database,[.55,.45]);

%% Save Database
disp('Saving Training Set');
save('trainSet.mat');
disp('Saving Testing Set');
save('testSet.mat');

%% Extract Features for Training and Testing Set
disp('Calling Extract_Features Script');
Extract_Features

%% Train the Model
disp('Calling the Multiclass OvO SVM....');
mSVM
disp('Training Completed.');

%% Testing the Test Features with the Model
disp('Testing the Model with Testing Database...');
load('trainModel.mat');
load('testFeatures.mat');
predictedLabels=svm.predict(trainModel,testFeatures);
save('predictedLabels.mat');

%% Confusion Matrix
disp('Generating the Confusion Matrix...');
confMat=confusionmat(testLabel, predictedLabels);
save('confMat.mat');
disp(confMat);

%% Calculate Accuracy
disp('Calculating the Accuracy of the Model');
findAcc