function poligon_distribution=calculate_poligon_distribution(cellsNeighboursValidCells,no_val)
total_valid_cells=length(cellsNeighboursValidCells)-length(no_val);
cellNeighboursArray=cell2mat(cellsNeighboursValidCells); %convert to array

triangles=sum(cellNeighboursArray==3);
squares=sum(cellNeighboursArray==4);
pentagons=sum(cellNeighboursArray==5);
hexagons=sum(cellNeighboursArray==6);
heptagons=sum(cellNeighboursArray==7);
octagons=sum(cellNeighboursArray==8);
other_poligons=sum(cellNeighboursArray>=9);

poligon_distribution=100*[triangles squares pentagons hexagons heptagons octagons other_poligons]/total_valid_cells;

end