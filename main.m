%pkg load 'linear-algebra'
% Read the image into A as a matrix of uint8
[X,map] = imread('witchhead.jpg');
% Display the image as Figure 1
%image(A)
% Subtract 100 from each value in A and store the result in B
%B = A - 100;
%C = A.';
%image(C)
%image(B)
Im = X;
if ~isempty(map)
    Im = ind2rgb(X,map);
    [U,S,V] = svd(Im);
end
% Convert image from uint8 to doubles for svd
X = im2double(X);
[U,S,V] = svd(X(1))
