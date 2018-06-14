img=zeros(512,512);
x = gallery('uniformdata',[1 10],0);
y = gallery('uniformdata',[1 10],1);
voronoi(x,y,'k');
img_voronoi = frame2im(getframe(gca));
se = strel('disk',4);
img_erode=imclose(img,ones(8,8));
img_edge=edge(img_erode);
img_dilate=imdilate(img_edge,se);




