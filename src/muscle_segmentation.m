%Open and select the channel which the cells' boundaries are well-defined.
img=imread('../data/G93A-H-100-88-SD-CMSD-1B40X.jpg');
img_green=img(:,:,2);

%Binarize the image to segmentate the cells 
level = graythresh(img_green);
img_bw= im2bw(img_green,level);
figure, imshow(img_bw)

img_close=imclose(imopen(img_bw,ones(8,8)),ones(8,8));
img_boundary = bwmorph(img_close,'remove');
img_skel=bwmorph (img_boundary,'skel',Inf); 

img_dist=bwdist(~img_close);
figure,imshow(img_dist)
img_w=watershed(img_dist);
figure,imshow(img_w)

se=strel('disk',2);
img_erode=imerode(img_close,se);
figure,imshow(img_erode)

img_skel=bwskel (img_erode);

se=strel('disk',2);
img_dilate=imdilate(img_skel,se);
figure,imshow(img_dilate)

img_dist=bwdist(img_dilate);
img_w=watershed(img_dist);
figure,imshow(img_w)