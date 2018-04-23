function no_val=no_valid_cells2(img_label)
no_val=unique([img_label(1,:), img_label(end,:), img_label(:,1)', img_label(:,end)']);
no_val(no_val==0) = [];
end
