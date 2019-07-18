%% Start here
clear all;
close all;
clc;

%% Open user interface of matlab to get file for testing
delete('output.txt');
disp('Select a file to open...');
[filename, pathname] = uigetfile({'*.jpg';'*.*'},'Select Image File');
ref_im=strcat(pathname,filename); 
disp('Showing the selected file...');
figure,imshow(ref_im);

%% Get the Image
im = getimage;

%% Perform Pre_Processing on the Image
disp('Performing Pre Processes on the Image....');
ref_im=preProcess(im);

%% Extract Features
disp('Extracting features from the image.....');
ref_feature = featureHOG_extract(ref_im.BW);
save('ref_feature.mat');

%% Testing the feature with the model
disp('Testing the feature with the model...');
testCodeShow

%% Clear All
winopen('output.txt');
