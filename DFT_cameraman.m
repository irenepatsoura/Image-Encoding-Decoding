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




