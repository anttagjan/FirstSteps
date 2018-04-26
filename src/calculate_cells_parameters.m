clc
clear all
close all
%Open the required file
img=imread('../data/Image_1_Diagram_16.png');

%Binarize the image and label the cells
img_bw=im2bw(img);
img_label=bwlabel(img_bw);

%Color the cells and display their corresponding numberical labels 
figure, image(img_label), colormap(jet);
display_centroid_label(img_label); % function that I have written

%Call the calculate_neighbours function 
[neighbours_labels,cells_neighbours,totalCells]=calculate_neighbours(img_label);

% Calculate the area of each cell
area_cells=regionprops(img_label,'Area');
area_cells=struct2cell(area_cells); %convert from structure to array

%Call the function which establish no valid cells (cells near the limits of
%the image). This way, we can find these cells and delete their
%measurements from other variables
no_val=no_valid_cells2(img_label);
indexesValidCells=~ismember(totalCells,no_val);

cellsNeighboursValidCells=cell(size(cells_neighbours));%empty cells with the same dimension
NeighboursLabelsValidCells=cell(size(neighbours_labels));
AreaValidCells=cell(size(area_cells));

cellsNeighboursValidCells(indexesValidCells)=cells_neighbours(indexesValidCells);
NeighboursLabelsValidCells(indexesValidCells)=neighbours_labels(indexesValidCells);
AreaValidCells(indexesValidCells)=area_cells(indexesValidCells);

%Call the function which calculate the poligon distribution (percentages of
%cells with k number of neighbours)
poligon_distribution=calculate_poligon_distribution(cellsNeighboursValidCells,no_val);

% Export to excel after convert the variables in tables.
poligon_distribution=array2table(poligon_distribution);
poligon_distribution.Properties.VariableNames = {'Triangles' 'Squares' 'Pentagons' 'Hexagons' 'Heptagons' 'Octogons' 'Other_Poligons'};
AreaValidCells=table((totalCells)',AreaValidCells');
AreaValidCells.Properties.VariableNames = {'Cells','Area'};

writetable(AreaValidCells,'results_cells_parameters.xls','sheet',1,'Range','B3')
writetable(poligon_distribution,'results_cells_parameters.xls','sheet',2,'Range','B3')

% It is optional save these last variables
cellsNeighboursValidCells=table((totalCells)',cellsNeighboursValidCells);
cellsNeighboursValidCells.Properties.VariableNames = {'Cells','Number_of_Neighbours'};
NeighboursLabelsValidCells=table((totalCells)',NeighboursLabelsValidCells);
NeighboursLabelsValidCells.Properties.VariableNames{1} = 'Cells';

writetable(NeighboursLabelsValidCells,'results_cells_parameters.xls','sheet',3,'Range','B3')
writetable(cellsNeighboursValidCells,'results_cells_parameters.xls','sheet',4,'Range','B3')


