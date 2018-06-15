function Generate_Voronoi
%Clean other stuffs
clc 
close all
%Generate a Voronoi diagram with n seeds
n=input('Number of seeds :');
x = gallery('uniformdata',[1 n],0);
y = gallery('uniformdata',[1 n],1);
voronoi(x,y,'k');

%Save the voronoi diagram as an image
img_voronoi = frame2im(getframe(gca));
img_voronoi=img_voronoi(:,:,1);
img_cropped = imresize(img_voronoi, [512, 512]);

%Segmentate the image to eliminate the centroid, to binarize the image and
%establish a resolution of 512x512.
img_edge=edge(img_cropped);
se = strel('disk',4);
img_dilate=imdilate(img_edge,se);
img_watershed=watershed(img_dilate);
c=input('Choose type of connectivity: ');
img_label=bwlabel(img_watershed,c);
figure,imshow(img_label)
imwrite(img_label,'../results/Voronoi_Diagram.jpg')
end



