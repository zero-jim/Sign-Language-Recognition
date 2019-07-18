%% Load the Confusion Matrix
load('confMat.mat');

%% Evaluate All the Values
Result=0;
con=zeros(35,35);
for i=1:35
    for j=1:35
        if i==j
            con(i,j)=confMat(i,j)/18;
        end
        Result=Result+con(i,j);
    end
end
Result=Result/35;
Result=Result*100;
fprintf('Average Accuracy = %f',Result);