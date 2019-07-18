%% start
clear all;
close all;
clc;

%% load test and train set
Database=imageSet('EdgeSetATT','recursive');
[training test]=partition(Database,[.55,.45]);

%% train set feature extract
featureCount = 1;
k=1;
for i=1:size(training,2)
    for j = 1:training(i).Count
        trainMat(featureCount,:) = extract_features(read(training(i),j));
        trainLabel(featureCount) = k;
        featureCount = featureCount + 1;
    end
    k=k+1;
end

%% test set feature extract
k=1;
featureCount = 1;
for i=1:size(test,2)
    for j = 1:test(i).Count
        testMat(featureCount,:) = extract_features(read(test(i),j));
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
save('confMat.mat');

%% Find Accuracy
findAcc