% Read an image (grayscale)
B = imread('cameraman.tif');
% Size
[M,N] = size(B);
% Make it a column vector!
Br = reshape(B, M*N, 1);

%length(Br)-DFT
NFFT=length(Br);
BR = fft(Br,NFFT);  

BRp = BR(1:NFFT/2 + 1);
BR_tr = BRp;
cut_factor1 = 1/4;
bound1 = round(cut_factor1*M*N);

% Zero-ing values
BR_tr(bound1:end) = 0;

newBr = zeros(2*size(BR_tr,1)-2,1); 
newBr(1:size(BR_tr,1)) = BR_tr(1:size(BR_tr,1));


Xc = flip(BR_tr);
Xc = conj(Xc);

newBr(size(BR_tr,1)+1:end) = Xc(2:end-1);


Brinv = real(ifft(newBr));
% Signal reconstruction
BR_tr_rec = reshape(Brinv, M, N);
% Show what happened
figure; subplot(121); imshow(uint8(B));
subplot(122); imshow(uint8(BR_tr_rec));


%[haar1D(0,4); haar1D(1,4); haar1D(2,4); haar1D(3,4)]


A = imread('cameraman.jpg');
A = rgb2gray(A);
[M,N] = size(A);

% Make it a column vector!
Ar = reshape(A, M*N, 1);

SIZE=length(Ar);
AR = zeros(SIZE,1);
temp = zeros(M,N);
for i = 1:M
    t =  haar1D(i-1,N);
    for j = 1:N
        temp(i,j) = t(j);
    end
end
A = cast(A,'double');
AR = temp*A*transpose(temp);

% Zero-ing values
cut_factorA = 1/4;
boundA = round(cut_factorA*N);
AR(boundA:end,:) = 0;

Arinv = transpose(temp)*AR*temp;

AR_tr_rec = reshape(Arinv, M, N);
% Show what happened
figure; subplot(121); imshow(uint8(A));
subplot(122); imshow(uint8(AR_tr_rec));


