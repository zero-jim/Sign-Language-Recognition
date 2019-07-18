%% Start Here
clear all;
close all;

%% Load Database
disp('Loading Database....');
load('trainSet.mat');
load('testSet.mat');

%% Extract Features
disp('Extracting Features for Training Set....');
featureCount = 1;
index=1;
for i=1:size(trainSet,2)
    for j = 1:trainSet(i).Count
        trainFeatures(featureCount,:) = extract_Lfeatures(read(trainSet(i),j));
        trainLabel(featureCount) = index;    
        featureCount = featureCount + 1;
    end
    index = index+1;
end
disp('Extracting Features for Testing Set....');
featureCount = 1;
index=1;
for i=1:size(testSet,2)
    for j = 1:testSet(i).Count
        testFeatures(featureCount,:) = extract_Lfeatures(read(testSet(i),j));
        testLabel(featureCount) = index;    
        featureCount = featureCount + 1;
    end
    index = index+1;
end
disp('Extraction Completed.');

%% Save the Label and Features
disp('Saving Features....');
save('testFeatures.mat');
save('trainFeatures.mat');
disp('Saving Labels....');
save('trainLabel.mat');
save('testLabel.mat');
disp('Process Completed');