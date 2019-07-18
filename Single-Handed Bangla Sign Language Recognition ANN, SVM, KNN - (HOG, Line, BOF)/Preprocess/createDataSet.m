function result = createDataSet(ref_im)

%% Skin color segmentation with YIQ color space then biggestblob analysis for noise reduction
[rec_im,BW]=SkinSegmentation(ref_im);

%% Detect the edges
E=edge(rec_im,'Canny');

%% Results
result.im = rec_im;
result.E=E;