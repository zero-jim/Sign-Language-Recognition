%%
clear all;
close all;
clc;

%%
Database=imageSet('EdgeSetATT','recursive');
[training test]=partition(Database,[.55,.45]);

%%
featureCount = 1;
k=1;
for i=1:size(training,2)
    for j = 1:training(i).Count
        X(featureCount,:) = extractHOGFeatures(read(training(i),j));
        trainLabel(featureCount) = k;
        featureCount = featureCount + 1;
    end
    k=k+1;
end
X=double(X);
save('X.mat');

%%
Y = zeros(770,35);
j = 1;
for i = 1 : 770
    Y(i , j ) = 1;
    if ~(mod(i, 22) > 0)
        j = j + 1;
    end;    
end
save('Y.mat');

%%
trainNetwork

%%
featureCount = 1;
k=1;
increase = 1;
false = 0;
true = 0;
count = 0;
res = zeros(35,18);
bo = 0;
for i=1:size(test,2)
    TrueRes = 0;
    FalseRes = 0;
    bo = bo + 1;
    for j = 1:test(i).Count
        ff = extractHOGFeatures(read(test(i),j));
        testLabel(featureCount) = k;
        featureCount = featureCount + 1;
        P = ff';
        net.inputs{1}.processFcns = {'removeconstantrows','mapminmax'};
        load net.mat;
        load net;
        y5 = sim(net,P);
        [C I] = max(y5);
        if (I==i)
            TrueRes = TrueRes + 1;
            res(bo,TrueRes) = j;
        else
            FalseRes = FalseRes + 1;
        end
        if (TrueRes == 18)
            break;
        end
    end
    k=k+1;
    TrueRes
    FalseRes
    true = true + TrueRes;
    false = false + FalseRes;
    ff = [TrueRes;FalseRes];
    Result(:, increase) = (ff);
    increase = increase + 1;
end