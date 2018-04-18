%Cargamos el archivo
img=imread('../data/Image_1_Diagram_16.png');
%Binarizacion
img_bw=im2bw(img);
%Etiquetar las celulas
img_label=bwlabel(img_bw);
    x1 = img_label(1,:);
    x2= img_label(end,:);
    y1= img_label(:,1);
    y2= img_label(:,end);
no_val=unique([x1, x2, y1', y2']);

 


        

% Para guardar las imagenes labelleadas
% imwrite( uint8(img_label), 'myLabels.png' );
% imwrite( L, rand( 256, 3 ), 'myIndexedImage.png' );
