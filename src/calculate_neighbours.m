%Abrir cell array con celulas validas
load valid_cells.mat
img=imread('Image_1_Diagram_16.png');
img_bw=im2bw(img);
img_w=watershed(-img_bw);
[img_label,NUM]=bwlabeln(img_w);

se = strel('disk', 2);
img_dilate = imdilate(img_label, se);
sum(Neurona_halo_1(:));
