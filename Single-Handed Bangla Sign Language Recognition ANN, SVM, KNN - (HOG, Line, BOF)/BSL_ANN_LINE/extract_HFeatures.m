function [features]=extract_HFeatures(image);

%% Return hog features
ref_im =image;
features=extractHOGFeatures(ref_im);