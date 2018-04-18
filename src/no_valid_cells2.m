%Cargamos el archivo
img=imread('Image_1_Diagram_16.png');
%Binarización
img_bw=im2bw(img);
%Etiquetar las células
img_label=bwlabel(img_bw);

for i=1:NUM
[r,n] = find(img_label == i);
    if sum(cell_coordinates(1,:)) >=1 || sum(cell_coordinates(:,1))>=1 || sum(cell_coordinates(1024,:))>=1 || sum(cell_coordinates(:,512))>=1
        no_val{i,1}= (img_label==i);
    else 
        valid_cells{i,1}= (img_label==i);
    end
end 


        

% Para guardar las imagenes labelleadas
% imwrite( uint8(img_label), 'myLabels.png' );
% imwrite( L, rand( 256, 3 ), 'myIndexedImage.png' );
