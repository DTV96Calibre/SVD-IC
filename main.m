#pkg load 'linear-algebra'
# Read the image into A as a matrix of uint8
A = imread('witchhead.jpg');
# Display the image as Figure 1
#image(A)
# Subtract 100 from each value in A and store the result in B
B = A - 100;
#C = A.';
#image(C)
a = gsvd(A, B)