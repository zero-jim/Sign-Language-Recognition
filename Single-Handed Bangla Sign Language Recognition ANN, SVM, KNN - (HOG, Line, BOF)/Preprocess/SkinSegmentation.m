function [BW,maskedImage] = SkinSegmentation(ref_im)

%% Get the file
currentimg=ref_im; %capture the image of interest

%% Read the image, and capture the dimensions
VidImage = currentimg;
height = size(VidImage,1);
width = size(VidImage,2);

%% Initialize the output images
out = VidImage;
bin = zeros(height,width);

%% Convert the image from RGB to YCbCr
img_ycbcr = rgb2ycbcr(VidImage);
Cb = img_ycbcr(:,:,2);
Cr = img_ycbcr(:,:,3);

%% Detect Skin
[r,c,v] = find(Cb>=77 & Cb<=127 & Cr>=133 & Cr<=173);
numind = size(r,1);

%% Mark Skin Pixels
for i=1:numind
    out(r(i),c(i),:) = [0 0 255];
    bin(r(i),c(i)) = 1;
end
binaryImage=im2bw(bin,graythresh(bin));
%%%binaryImage=~binaryImage;
B = bwboundaries(binaryImage);
binaryImage = imfill(binaryImage, 'holes');

%% Remove tiny regions.
binaryImage = bwareaopen(binaryImage, 5000);

%% Extract the largest area using ImageAnalyst's custom function ExtractNLargestBlobs().
biggestBlob = ExtractNLargestBlobs(binaryImage, 1);

%% Results
BW=biggestBlob;
maskedImage=ref_im;
maskedImage(repmat(~BW,[1 1 3])) = 0;