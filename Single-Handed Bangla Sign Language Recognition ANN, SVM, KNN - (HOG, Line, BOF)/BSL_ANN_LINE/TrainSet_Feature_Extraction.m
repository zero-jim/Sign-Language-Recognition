%% Start here
clc;
clear all;
close all;

%% This will create the input to the neural network.   
labels = ['a   '; 'b   '; 'c   '; 'd   '; 'e   '; 'f   '; 'g   '; 'h   '; 'i   '; 'j   '; 'k   '; 'l   '; 'm   '; 'n   '; 'o   ' ;'p   '; 'q   '; 'r   '; 's   '; 't   ' ;'u   ' ;'v   ' ;'w   '; 'x   ' ;'y   '; 'z   '; 'za  ' ;'zb  '; 'zc  '; 'zd  '; 'ze  '; 'zf  '; 'zg  '; 'zh  '; 'zi  '];
increase = 1;
for i = 1 : 35
    for j = 1 : 22
        name = strcat(labels(i,:) , num2str(j));
        ref_im = imread(strcat('TrainEdgeSet/',name,'.jpg'));
        % Extract features from all the images and save to X
        X(:, increase) = (extract_features(~im2bw(ref_im)));
        increase = increase + 1;
    end;
 end;
 
 %% Save results
 X = X';
 save('X.mat');