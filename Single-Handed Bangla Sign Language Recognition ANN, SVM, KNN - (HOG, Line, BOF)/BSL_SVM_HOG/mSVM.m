disp('Training the Classification Model...');
trainLabel=trainLabel';
trainModel=svm.train(trainFeatures,trainLabel);
disp('Saving the Model....');
save('trainModel.mat');
