function h = haar1D(k, SIZE)
% FUNCTION HAAR1D
%
% Function H = HAAR1D(k, SIZE) implements the basis functions for the 
% Discrete Haar Transform. Regarding its input arguments, k equals the row 
% number of Haar Matrix or, alternatively, the basis function number k of 
% h_k(t). Variable SIZE is the length of the basis function in samples.
%
% @ G. P. Kafentzis, 2019
% CS370 - Digital Signal Processing

% check power of two
if floor(log(SIZE) / log(2)) ~= (log(SIZE) /log(2))
    fprintf(1,"Haar defined only for lengths that are a power of two.\n")
    h = [];
    return;
end
if k >= SIZE || k < 0
    fprintf(1,"invalid Haar index.\n")
    h = [];
    return;
end
% zero basis vector
if k == 0
    h = (1/sqrt(SIZE))*ones(1, SIZE);
    return;
end
% express k >= 1 as 2^p + q with p as large as possible;
% then M = SIZE/2^p is the length of the support
% and s = qM is the shift
p = floor(log2(k));    % INSERT CODE HERE;
pp = round(power(2, p));
M = SIZE/pp;    % INSERT CODE HERE;
temp =k;

while not(log2(temp) == round(log2(temp))) && not(log2(temp)==0)
    temp=temp-1;
end
q = k-temp+1;

s = q*M-M;    % INSERT CODE HERE;

h = zeros(1, SIZE);

h(round(s+1):round(s+M/2+1)) = power(2, p/2)/sqrt(SIZE);    % INSERT CODE HERE
h(round(s+M/2+1):round(s+M)) = -power(2, p/2)/sqrt(SIZE); % INSERT CODE HERE
return;