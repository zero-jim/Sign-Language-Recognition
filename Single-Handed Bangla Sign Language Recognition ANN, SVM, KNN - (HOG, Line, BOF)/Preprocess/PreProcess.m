function result = PreProcess(im)

%% Resize the input image
ref_im=imresize(im,[300,300]);

%% Histogram equilization
ref_im=histeq(ref_im);

%% Skin color segmentation with YCrCb color space then biggestblob analysis for noise reduction
[rec_im,BW]=SkinSegmentation(ref_im);

%% Detect the edges
E=edge(rec_im,'Canny');

%% Crop from the centre of the image
row=300;
col=300;
size = 256;
upper = floor((row-size)/2);
lower = upper + size;

left = floor((col-size)/2);
right = left + size;

rec_im = rec_im(upper:lower, left:right, :);
E = E(upper:lower, left:right, :);
BW = BW(upper:lower, left:right, :);

%% Results
result.BW=BW;
result.im = rec_im;
result.E=E;