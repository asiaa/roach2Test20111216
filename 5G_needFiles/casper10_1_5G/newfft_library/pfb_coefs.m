function coefs = pfb_coefs(n,taps,window)
% Generate pfb coefficients
%
% COEFS = pfb_coefs(N,TAPS,WINDOW)
%
% N = Window size
% TAPS = Number of taps
% WINDOW = Vector of N*TAPS windowing values
%
% COEFS is a matrix with one column per tap in reverse tap order.
% To plot COEFS, use "plot(reshape(COEFS(:,end:-1:1),[],1))"

  % Default to hamming window
  if nargin() < 3
    window = hamming(taps*n);
  end

  % Generate coefficients
  coefs=fir1(n*taps-1,1/n,window,'noscale')*n;
  % Reshape to one column per tap
  coefs=reshape(coefs,n,taps);
  % Reverse column order
  coefs=coefs(:,end:-1:1);
end
