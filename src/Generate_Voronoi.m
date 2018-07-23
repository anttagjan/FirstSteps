function Generate_Voronoi
%Clean other stuffs
clc 
close all
%Generate seeds in a binary image.
img_bw = zeros(1024,1024);
n=input('Number of seeds :');
seeds=unique(round(1000*rand(1,n))); 
img_bw(seeds,seeds)=1;

%Generate the Voronoi Diagram.
D=bwdist(img_bw);
img_w=watershed(D);
figure, image(img_w), colormap(jet);

end



