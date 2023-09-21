clc
clear all;
img = imread(‘image008.tif’); %select the image of interest
%imshow(img);
img_gray = rgb2gray(img);%convert to grayscale
%imshow(img_gray, [0 150]);
cropped = imcrop(img_gray, [1 1 2040 1418]);%select the top left and bottom right of 
the rectangle
%imshow(cropped);
threshold = 150;
[r,c] = size(cropped);
%%for cropping all the images in the folder
for i = 1:r
  for j = 1:c
    if cropped(i,j)<150
      im(i,j) =1;
      end
    end
end
bw = imbinarize(im, ‘adaptive’);
200
bw = imfill(bw,’holes’);
cc = bwconncomp(bw);
F = bwferet(cc,properties);%Obtain the Feret diameter
T = strut2table(ft);
a = T(:17);
a = table2array(a);
dia = a*1.5;
