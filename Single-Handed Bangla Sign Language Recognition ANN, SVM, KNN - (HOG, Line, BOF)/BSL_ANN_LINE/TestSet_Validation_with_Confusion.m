%% Start here
clc;
clear all;
close all;

%% For TestSet find features and find matching
labels = ['a   '; 'b   '; 'c   '; 'd   '; 'e   '; 'f   '; 'g   '; 'h   '; 'i   '; 'j   '; 'k   '; 'l   '; 'm   '; 'n   '; 'o   ' ;'p   '; 'q   '; 'r   '; 's   '; 't   ' ;'u   ' ;'v   ' ;'w   '; 'x   ' ;'y   '; 'z   '; 'za  ' ;'zb  '; 'zc  '; 'zd  '; 'ze  '; 'zf  '; 'zg  '; 'zh  '; 'zi  '];
increase = 1;
false = 0;
true = 0;
count = 0;
res = zeros(35,18);
bo = 0;
for i = 1 :35
    TrueRes = 0;
    FalseRes = 0;
    bo = bo + 1;
    for j = 1 : 18
        count = count + 1;
        disp(count)
        test = strcat(labels(i,:) , num2str(j));
        imageName = imread(strcat('TestEdgeSet/',test,'.jpg'));
        z = (extract_features(~im2bw(imageName)));
        Features = z;
        save ('Features.mat');
        test_comp
        if (I==i)
            TrueRes = TrueRes + 1;
            res(bo,TrueRes) = j;
        else
            FalseRes = FalseRes + 1;
        end
        if (TrueRes == 18)
            break;
        end
    end;
    TrueRes
    FalseRes
    true = true + TrueRes;
    false = false + FalseRes;
    ff = [TrueRes;FalseRes];
    Result(:, increase) = (ff);
    increase = increase + 1;
end;

%% Save results
Result = Result';
save('Result.mat');