%Abrir archivo requerido
img=imread('Image_1_Diagram_16.png');
%Binarizar la imagen y etiquetar las celulas
img_bw=im2bw(img);
img_label=bwlabel(img_bw);
%Establecer las celulas no validas
no_val=no_valid_cells2(img_label);

%Establecer kernel de dilatacion
se = strel('square', 8);

neighbours=0;
w=zeros(1,60);
cells_neighbours=[];
%Dilatacion de las celulas para comprobar cuales comparten pixeles y
%establecer el numero de vecinos y las etiquetas de los vecinos
for i=1:60
    neighbours= unique(img_label(imdilate(img_label==i,se) == 1));
    neighbours(neighbours== 0)=[];
    neighbours(neighbours ==i)=[];
    neighbours_labels{i,1}=neighbours;
    total_neighbours=length(neighbours);
    cells_neighbours{i,1}= total_neighbours;

end 
