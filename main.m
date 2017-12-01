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

[U_r,S_r,V_r] = svd(X(:,:,1));
[U_g,S_g,V_g] = svd(X(:,:,2));
[U_b,S_b,V_b] = svd(X(:,:,3));

%=============================
% Test Scripts
%=============================

%confirmation checking for red
out_red = U_r*S_r*V_r'
red = X(:,:,1)

%-----------------------------

% S_r has size 640x1138, thus 640 diagonal values
size(S_r)
% Find the largest k singular values
k = 30;
redk = zeros(k,1);
greenk = zeros(k,1);
bluek = zeros(k,1);

% Discovered that the diagonal of the sum matrix is in order
for i = 1:k
    redk(i) = S_r(i,i);
    greenk(i) = S_g(i,i);
    bluek(i) = S_b(i,i);
end

%-----------------------------

% Storage Analysis
initialStorage = 640*1138
currentStorage = (640+1138)*k+k

%-----------------------------

% Error Analysis
sume = 0;
for i = 1:640
    sume = sume + S_r(i,i) + S_g(i,i) + S_b(i,i);
end
error = sum(redk+greenk+bluek) / sume

%-----------------------------

NewImage_r = zeros(640,1138);
NewImage_g = zeros(640,1138);
NewImage_b = zeros(640,1138);
for i = 1:k
    NewImage_r = NewImage_r + redk(i)* U_r(:,i)*V_r(:,i)';
    NewImage_g = NewImage_g + greenk(i) * U_g(:,i)*V_g(:,i)';
    NewImage_b = NewImage_b + bluek(i) * U_b(:,i)*V_b(:,i)';
end

%-----------------------------

% Normalize the matrices to fit the rgb format
for i = 1:640
    for j = 1:1138
        if(NewImage_r(i,j) < 0)
            NewImage_r(i,j) = 0;
        end
        if(NewImage_g(i,j) < 0)
            NewImage_g(i,j) = 0;
        end
        if(NewImage_b(i,j) < 0)
            NewImage_b(i,j) = 0;
        end
    end
end

%-----------------------------

rgbImage = cat(3, NewImage_r, NewImage_g, NewImage_b);
image(rgbImage)
image(X)
difference = rgbImage-X
image(rgbImage-X)

%-----------------------------

