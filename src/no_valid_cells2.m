function no_val=no_valid_cells2(img_label)
    x1 = img_label(1,:);
    x2= img_label(end,:);
    y1= img_label(:,1);
    y2= img_label(:,end);
no_val=unique([x1, x2, y1', y2']);
no_val(no_val==0) = [];
end
