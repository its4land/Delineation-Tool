
%% Demo to show the results of the Ultrametric Contour Map obtained by MCG
clear all;close all;home;

% Read an input image
I = imread(fullfile(mcg_root, 'demos','2048.jpg'));

tic;
% Test the 'fast' version, which takes around 3 seconds
ucm2_scg = im2ucm(I,'fast');
toc;

tic;
% Test the 'accurate' version, which tackes around 15 seconds
ucm2_mcg = im2ucm(I,'accurate');
toc;

%% Show UCM results (dilated for visualization)
figure;
subplot(1,3,1)
imshow(I), title('Image')

subplot(1,3,2)
imshow(imdilate(ucm2_scg,strel(ones(3))),[]), title('Fast UCM (SCG)')

subplot(1,3,3)
imshow(imdilate(ucm2_mcg,strel(ones(3))),[]), title('Accurate UCM (MCG)')

% k = 0.1;
% ucm = ucm2_scg(3:2:end, 3:2:end);
% bdry = (ucm >= k);
% figure;imshow(bdry);
% imtool(bdry)