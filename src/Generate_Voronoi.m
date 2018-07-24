function Generate_Voronoi
%Clean other stuffs
clc 
close all
%Generate seeds in a binary image.
img_bw = zeros(512,512);
n=input('Number of seeds :');
x = round(512*rand(1,n));
y = round(512*rand(1,n)); 
M=[x ; y];
for i=1:n 
img_bw(M(1,i),M(2,i))=1;
end

%Generate the Voronoi Diagram.
D=bwdist(img_bw);
img_w=watershed(D);
img_bw2=im2bw(~img_w);
se=strel('disk',2);
img_dilate=imdilate(img_bw2,se);
figure,imshow(img_dilate)

imwrite(img_dilate,'../results/Voronoi_Diagram.jpg')
end



