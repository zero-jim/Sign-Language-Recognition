function C = plotConfusion(trueLabels,estLabels,names,color,ordering)
% generate a rotatable 3-dimensional confusion matrix; the z entry of the
% (i,j) cell is the percent of labels i that were labelled j
% also return the computed confusion matrix C (as a 2D matrix); 

% input variables:
% trueLabels: an integer array of the ground truth labels
% estLabels: an integer array of the estimated labels
% names: (opt) a cell of label names; if this is emitted, the labels will
%        be assigned numerical names (in the plot, along the axes)
% color: (opt) a matlab colormap; default: 'hot'
% ordering: (opt) an array of integers that specifies the order in which to
% arrange the labels; default: confusion matrix is ordered in terms of
% decreasing diagonal entry (presumed to be maximal visibility)

% Zoya Gavrilov, Jan. 7, 2013

if nargin < 2
    error(['Must supply at least 2 arguments: an integer array of the ',...
          'ground truth labels, and an integer array of the estimated ',...
          'labels.'])
end

if nargin < 3 % generate numerical labels
   l = unique(trueLabels);
   names = cell(1,length(l));
   for i = 1:length(l)
      names{i} = num2str(l(i)); 
   end
else
    if length(names) ~= length(unique(trueLabels))
        error('Wrong number of label names specified.')
    end
end

% compute confusion matrix and compute percentages
C = confusionmat(trueLabels,estLabels);
C = C./repmat(sum(C,2),1,size(C,2));
C = C*100;

% determine the color scheme
figure()
if nargin<4
    colormap('hot')
else
    colormap(color)
end
%temp = colormap;
%temp = temp(1:end,:); %temp(ep1:end-ep2,:); if want to reduce range of colormap
%colormap(temp);

% if an ordering is not provided, sort accordining to size of diagonal
% entry (largest at the back)
if nargin < 5
    dEnt = diag(C);
    [~,ordering] = sort(dEnt,'descend');
end

% rearrange the confusion matrix 
try
    C = C(ordering,ordering)';
    namesSorted = names(ordering);
catch
    C = C';
    namesSorted = names;
end

bar3(C);
rotate3d on;
set(gca, 'XTickLabel', namesSorted);
set(gca, 'YTickLabel', namesSorted);
xlabel('Intended Label')
ylabel('Chosen Label')
zlabel('Mean Percentage Choices');