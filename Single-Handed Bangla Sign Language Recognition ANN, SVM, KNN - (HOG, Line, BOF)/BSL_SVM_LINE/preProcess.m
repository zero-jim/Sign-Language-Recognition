function result = preProcess(im)

%% Resize the input image
disp('Resizing the image to 300*300 pixels...');
ref_im=imresize(im,[300,300]);
figure,imshow(ref_im);

%% Histogram equilization
disp('Performing Histogram Equalizarion...');
ref_im=histeq(ref_im);
figure,imshow(ref_im);

%% Skin color segmentation with YCrCb color space then biggestblob analysis for noise reduction
disp('Skin color is being segmented...');
[rec_im,BW]=SkinSegmentation(ref_im);
figure,imshow(BW);

%% Crop from the centre of the image
disp('Image is being cropped from the centre...');
row=300;
col=300;
size = 256;
upper = floor((row-size)/2);
lower = upper + size;

left = floor((col-size)/2);
right = left + size;

BW = BW(upper:lower, left:right, :);
disp('The preprocessed Image');
figure,imshow(BW);

%% Results
result.BW=BW;