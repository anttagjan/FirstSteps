function [neighbours_labels,cells_neighbours,totalCells]=calculate_neighbours(img_label)
% First, we have to establish the dilation kernel.
ratio=4;
se = strel('disk', ratio);

% This for loop allows to dilate the cells to check which of them share the
% same pixels and this way, we can establish the neighbours' number and the
% label of each of them.
totalCells=1:max(max(img_label));
neighbours_labels={};
cells_neighbours={};
for i=totalCells
    neighbours= unique(img_label(imdilate(img_label==i,se) == 1));
    neighbours(neighbours== 0)=[];
    neighbours(neighbours ==i)=[];
    neighbours_labels{i,1}=neighbours;
    total_neighbours=length(neighbours);
    cells_neighbours{i,1}= total_neighbours;
    
end 
end