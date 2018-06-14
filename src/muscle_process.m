img=imread('../data/G93A-H-100-88-SD-CMSD-1B40X.jpg');
img_green=img(:,:,2);
img_edge=edge(img_green);
se=strel('disk',8);
img_dilate=imdilate(img_edge,se);
