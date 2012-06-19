function y = bitrevm(x,r,c)
% Bit reverse the row and/or column indices of matrix X
%
% Y = bitrev(X,R,C)
%
% X = Matrix whose indices will be bit reversed
% R = If true, bit reverse row indices
% C = If true, bit reverse column indices
%
% Number of indices to be reversed must be a power of two

  rows=size(x,1); ri=1:rows;
  cols=size(x,2); ci=1:cols;

  if r
    if rows ~= 2^nextpow2(rows)
      error('Error: Number of rows must be a power of two.');
    end
    ri=bitrev(ri-1,nextpow2(rows))+1;
  end

  if c
    if cols ~= 2^nextpow2(cols)
      error('Error: Number of columns must be a power of two.');
    end
    ci=bitrev(ci-1,nextpow2(cols))+1;
  end

  y=x(ri,ci);
