%Cargamos el archivo
img=imread('Image_1_Diagram_16.png');
%Binarizacion y watershed
img_bw=im2bw(img);
img_w=watershed(-img_bw);
%Etiquetar las celulas
[img_label,NUM]=bwlabeln(img_w);
%Crear un cell array con las distintas celulas en imagenes diferentes
for i=1:NUM
  cells{i,1}= (img_w==i);
end 
%Establecer celulas validas y no validas
for i=1:NUM
    study_cell=cell2mat(cells(i,:));
    if sum(study_cell(1,:)) >=1 || sum(study_cell(:,1))>=1 || sum(study_cell(1024,:))>=1 || sum(study_cell(:,512))>=1
        no_val{i,1}= (img_w==i);
    else 
        valid_cells{i,1}= (img_w==i);
    end
end


