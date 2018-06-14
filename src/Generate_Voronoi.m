
%Generate a Voronoi diagram with n seeds
n=input('Number of seeds :');
x = gallery('uniformdata',[1 n],0);
y = gallery('uniformdata',[1 n],1);
voronoi(x,y,'k');

%Save the voronoi diagram as an image
img_voronoi = frame2im(getframe(gca));
img_voronoi=img_voronoi(:,:,1);

%Segmentate the image to eliminate the centroid, to binarize the image and
%establish a resolution of 512x512.
se = strel('disk',2);
img_edge=edge(img_voronoi);
img_dilate=imdilate(img_edge,se);
img_label=bwlabel(img_watershed);




