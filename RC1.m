X = imread('test1.jpg');
figure
imshow(X), title('H&E image');
image = rgb2lab(X);
X1 = image(:,:,2:3);
X1 = im2single(X1);
nColors = 3;
% starting k means clusstering
pixels = imsegkmeans(X1,nColors,'NumAttempts',3);
figure
imshow(pixels,[])
title('Image Labeled by Cluster Index');
mask1 = pixels==1;
cluster1 = X .* uint8(mask1);
figure
imshow(cluster1)
title('Objects in Cluster 1');
mask2 = pixels==2;
cluster2 = X .* uint8(mask2);
figure
imshow(cluster2)
title('Objects in Cluster 2');
mask3 = pixels==3;
cluster3 = X .* uint8(mask3);
figure
imshow(cluster3)
title('Objects in Cluster 3');
Z = image(:,:,1);
Z_blue = Z .* double(mask3);
Z_blue = rescale(Z_blue);
idx = imbinarize(nonzeros(Z_blue));
blue_idx = find(mask3);
mask_dark = mask3;
mask_dark(blue_idx(idx)) = 0;

blue_nuclei = X .* uint8(mask_dark);
imshow(blue_nuclei)