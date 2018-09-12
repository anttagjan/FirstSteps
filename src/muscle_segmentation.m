%Open and select the channel which the cells' boundaries are well-defined.
img=imread('../data/G93A-H-100-88-SD-CMSD-1B40X.jpg');
img_green=img(:,:,2);

%Binarize the image to segmentate the cells 
level = graythresh(img_green);
img_bw= im2bw(img_green,level);
figure, imshow(img_bw)

% Curation of the image to define the boundaries of the cells
se=strel('disk',4);
img_dilate=imdilate(img_bw,se);

se=strel('disk',4);
img_erode=imerode(img_dilate,se);
figure,imshow(img_erode)

img_close=imclose(imopen(img_erode,ones(8,8)),ones(8,8));

se=strel('square',10);
img_dilate2=imdilate(img_close,se);
figure,imshow(img_dilate2)

img_boundaries = bwperim(img_dilate,8);
figure,imshow(img_boundaries)
img_dist=bwdist(img_boundaries);
figure,imshow(img_dist)
se=strel('square',2);
img_dilate3=imdilate(img_boundaries,se);
figure,imshow(img_dilate3)

img_areaopen = bwareaopen(img_dilate2,1000);
figure,imshow(img_areaopen)
se=strel('disk',2);
img_dilate4=imdilate(img_areaopen,se);
figure,imshow(img_dilate4)

[centers,radii] = imfindcircles(img_dilate4,[100 160],'ObjectPolarity','dark','Sensitivity',0.95);





% 
% Find Circles
% 
% 
% [centers, radii, metric] = imfindcircles(img_erode,[10000 20000]);
% 
% viscircles(centers, radii,'EdgeColor','b');
% 
% img_fillholes = imfill(~img_dilate2,'holes');
% figure,imshow(img_fillholes)
% 
% img_areaopen = bwareaopen(img_erode,10);
% figure,imshow(img_areaopen)

% img_dist=bwdist(img_areaopen);
% figure,imshow(img_dist)
% img_w=watershed(img_dist);
% figure,imshow(img_w)
% 
% imwrite(img_bw,'../results/muscle_binary.jpg')
% imwrite(img_dist,'../results/muscle_segmentated.jpg')
% imwrite(img_w,'../results/muscle_watershed.jpg')
