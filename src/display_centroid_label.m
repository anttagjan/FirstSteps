function display_centroid_label(img_label)
centroid_labels=regionprops(img_label,'Centroid');
hold on
for k = 1:numel(centroid_labels)
    c = centroid_labels(k).Centroid;
    text(c(1), c(2), sprintf('%d', k), ...
        'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'middle');
end
hold off
end