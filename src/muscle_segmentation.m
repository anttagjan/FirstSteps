img=imread('../data/G93A-H-100-88-SD-CMSD-1B40X.jpg');
img_green=img(:,:,2);
img_bw=im2bw(img_green);

se=strel('disk',4);
img_dilate=imdilate(img_bw,se);
figure,imshow(img_dilate)
img_skel=bwmorph (img_dilate,'skel',Inf);


img_dist=bwdist(img_skel);
img_w=watershed(img_dist);
