%Abrir archivo requerido
img=imread('../data/Image_1_Diagram_16.png');
%Binarizar la imagen y etiquetar las celulas
img_bw=im2bw(img);
img_label=bwlabel(img_bw);


%Establecer kernel de dilatacion
se = strel('square', 8);

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

% Calcular el area de cada celula
area_cells=calculate_area(img_label);

%Establecer las celulas no validas y eliminar los datos que corresponden a
%estas.
no_val=no_valid_cells2(img_label);
for j=1:length(no_val)
neighbours_labels{no_val(j),1}=[];
cells_neighbours{no_val(j),1}= [];
area_cells{no_val(j),1}= [];
end 

%Poligon Distribution
total=length(cells_neighbours)-length(no_val);
triangles=0;
squares=0;
pentagons=0;
hexagons=0;
heptagons=0;
octagons=0;
other_poligons=0;
for i=1:60
if cells_neighbours{i}(:)==3
    triangles= triangles+1;
elseif cells_neighbours{i}(:)==4
    squares= squares+1;
elseif cells_neighbours{i}(:)==5
    pentagons= pentagons+1;
elseif cells_neighbours{i}(:)==6
    hexagons= hexagons+1;
elseif cells_neighbours{i}(:)==7
    heptagons= heptagons+1;
elseif cells_neighbours{i}(:)==8
    octagons = octagons+1;
elseif cells_neighbours{i}(:) >= 9
    other_poligons= other_poligons+1;
end
end 
poligon_distribution=[100*triangles/total 100*squares/total 100*pentagons/total 100*hexagons/total 100*heptagons/total 100*octagons/total 100*other_poligons/total];

% Exportar a excel

poligon_distribution=array2table(poligon_distribution);
poligon_distribution.Properties.VariableNames = {'Triangles' 'Squares' 'Pentagons' 'Hexagons' 'Heptagons' 'Octogons' 'Other_Poligons'};
area_cells=table((1:60)',area_cells);
area_cells.Properties.VariableNames = {'Cells','Area'};
cells_neighbours=table((1:60)',cells_neighbours);
cells_neighbours.Properties.VariableNames = {'Cells','Number_of_Neighbours'};
neighbours_labels=table((1:60)',neighbours_labels);
neighbours_labels.Properties.VariableNames{1} = 'Cells';

writetable(area_cells,'results_cells_parameters.xls','sheet',1,'Range','B3')
writetable(cells_neighbours,'results_cells_parameters.xls','sheet',2,'Range','B3')
writetable(neighbours_labels,'results_cells_parameters.xls','sheet',3,'Range','B3')
writetable(poligon_distribution,'results_cells_parameters.xls','sheet',4,'Range','B3')



