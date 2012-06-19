function y = bitrev(x,n)
% Bit reverse a number or vector of numbers
%
% Y = bitrev(X,N)
%
% X = Number (or vector of numbers) to bit reverse
% N = Number of bits

 b = dec2bin(x,max(1,n));
 y = bin2dec(b(:,end:-1:1));
