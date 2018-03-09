function svd_exercise(imagename,sigma_threshold)

image = imread(imagename); % loads image in integer format as a 3d-array
image = im2double(image);


figure(1)
imshow(image) 
%% TODO
% Decompose the image in rgb values here. (Yop this one is trivial)
R = image(:, :, 1);
G = image(:, :, 2);
B = image(:, :, 3);


%% TODO
% Compute the Single Value decomposition for each channel here.
% Remember that you need to be able to reconstruct the image later on.
[S1, U1, F1] = svd(R);
[S2, U2, F2] = svd(G);
[S3, U3, F3] = svd(B);
figure(2)
plot(diag(U2))
hold off



%% TODO
% Zero out the single values that are smaller than the given threshold
U1(U1<sigma_threshold)=0;
U2(U2<sigma_threshold)=0;
U3(U3<sigma_threshold)=0;

%% TODO
% Reconstruct the respective RGB components of the image using
% only singular values that are bigger than the given threshold.
% This is a lossy reconstruction.
R_K = S1*U1*F1';
G_K = S2*U2*F2';
B_K = S3*U3*F3';

%Compose the final image
AK = zeros(size(image));
AK(:,:,1) = R_K;
AK(:,:,2) = G_K;
AK(:,:,3) = B_K;

%Show the composed image
figure(3)
imshow(AK);
