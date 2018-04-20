function area_cells=calculate_area(img_label)
for i=1:60
    area_cells{i,1}=sum(sum(img_label == i));
end 