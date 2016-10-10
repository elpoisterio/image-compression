clc;
close all;

imageFile = imread('cameraman.tif'); 
[height, width] = size(imageFile);
Y = dct2(imageFile);
Z = zeros(256, 256);
Z1 = Z;
O1 = Z;
Z(1:64,1:64) = Y(1:64,1:64);
O = idct2(Z);
imwrite(O/255, 'new_pic.tif');
N = 8;
%now dividing into 8X8 blocks
for i= 1:N:height
    for j= 1:N:width
        f = imageFile(i:i+N-1,j:j+N-1);
        df = dct2(f);
        Z1(i:i+N-1, j:j+N-1) = df;
        dff = idct2(df);
        O1(i:i+N-1,j:j+N-1)= dff;
    end
    
end
new_image=O1/255;
imwrite(new_image, 'another_new_pic.tif');
figure; imshow(imageFile); title('original image');
figure;imshow(O/255); title('image with M/4 and N/4 data points');
figure;imshow(new_image); title('image with 8x8 points');
compression_ratio1 = 60.8/63.7 % image with M/4 and N/4
compression_ratio2 = 63.6/63.7 % image using 8X8 blocks

