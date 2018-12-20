%% Start
close all;
clear all;
clc;


%% Create a Database

%load images from directiory
handDatabase = imageSet('DataATT','recursive');


%% Split the Database
[training, test]=partition(handDatabase,[0.65,0.35]);



%% Extract features from training set
trainingFeatures = zeros(size(training,2)*training(1).Count,20736);
featureCount = 1;
for i=1:size(training,2)
    for j = 1:training(i).Count
        trainingFeatures(featureCount,:) = extractHOGFeatures(read(training(i),j));
        trainingLabel{featureCount} = training(i).Description;    
        featureCount = featureCount + 1;
    end
    handIndex{i} = training(i).Description;
end


%% Create 26 Class Classifier
signClassifier = fitcknn(trainingFeatures,trainingLabel);

%%
load training;
load test;
load signClassifier;

%% Test For all the Test Set Images
figure;
figureNum = 1;
for hand=1:26
    for j = 1:test(hand).Count
        queryImage = read(test(hand),j);
        queryFeatures = extractHOGFeatures(queryImage);
        handLabel = predict(signClassifier,queryFeatures);
        
        %Map back to training set to find identity
        booleanIndex=strcmp(handLabel, handIndex);
        integerIndex=find(booleanIndex);
        subplot(4,4,figureNum);imshow(imresize(queryImage,3));title('Query Sign');
        signName={training(integerIndex).Description};
        name=subplot(4,4,figureNum+1);text(0.5,0.5,signName);set(name,'visible','off');
        title('Matched Sign');
        figureNum=figureNum+2;
    end
    figure;
    figureNum=1;
end