# SVD-IC
Singular Value Decomposition based Image Compression

## Intro
A project that implements a form of image compression using singular value
decomposition of the image as a matrix. This project uses MATLAB.

## Project Setup
If you don't already have MATLAB installed, install it now.

If you haven't already, clone this repository (https://github.com/DTV96Calibre/SVD-IC)
or download and extract it as an archive.

Open the script `main.m` with MATLAB. Be sure to double click on the project folder
in MATLAB's "Current Folder" panel so that MATLAB recognizes it as being on it's path.

## Understanding the code
Use the comments (i.e. lines starting with a `%`) to understand what the
code is doing. The following assumes you have some basic programming 
experience.

For getting started in particular, note the section above `Test Scripts`. 
```matlab
% Read the image into A as a matrix of uint8
[X,map] = imread('witchhead.jpg');

% Convert image from uint8 to doubles for svd
X = im2double(X);

% Seperate 
[U_r,S_r,V_r] = svd(X(:,:,1));
[U_g,S_g,V_g] = svd(X(:,:,2));
[U_b,S_b,V_b] = svd(X(:,:,3));
```
The code under the first comment simply reads in our test image file, `witchhead.jpg`,
which can be found in the project folder. For `*.jpg` files, X will contain all of the
image's information and map will be empty.

The file was stored as a matrix of unassigned integers and `svd()` expects doubles
(double precision floating point numbers) so we have to convert it
with `im2double()`. 

In the `%Seperate` code, we use `svd()` on each of the color channels in the image and store
them seperately so as to do compression on each color individually. Later we recombine the
color channels to get the complete image.
