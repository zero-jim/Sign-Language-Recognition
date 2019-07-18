%% Start Here
clc;
clear all;
close all;

%% This will crate the target matrix
Y = zeros(770,35);
j = 1;
for i = 1 : 770
    Y(i , j ) = 1;
    if ~(mod(i, 22) > 0)
        j = j + 1;
    end;    
end

%% Save matrix
save('Y.mat');