%% start
clear all;
close all;
clc;

%% load test and train set
load training.mat;
load test.mat;

%% train set feature extract
trainMat = zeros(size(training,2)*training(1).Count,20736);
featureCount = 1;
k=1;
for i=1:size(training,2)
    for j = 1:training(i).Count
        trainMat(featureCount,:) = extractHOGFeatures(read(training(i),j));
        trainLabel(featureCount) = k;
        featureCount = featureCount + 1;
    end
    k=k+1;
end
%% test set feature extract
testMat = zeros(size(test,2)*test(1).Count,20736);
k=1;
featureCount = 1;
for i=1:size(test,2)
    for j = 1:test(i).Count
        testMat(featureCount,:) = extractHOGFeatures(read(test(i),j));
        testLabel(featureCount) = k;
        featureCount = featureCount + 1;
    end
    k=k+1;
end
%% knn
signClassifier= fitcknn(trainMat,trainLabel);
%% Prediction
predictedLabels = predict(signClassifier, testMat);


%% Plot confusion
confMat = confusionmat(testLabel, predictedLabels);
helperDisplayConfusionMatrix(confMat);