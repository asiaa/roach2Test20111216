function w=twiddles(logr_n,radix,stages,mode,br)
% Compute twiddles for arbitrary radix FFTs
%
% W = twiddles( LOGR_N, RADIX, STAGES, MODE, BR)
%
% LOGR_N = Log base RADIX of the number of points in the FFT
% RADIX = Radix of the FFT.  Defaults to 2.
% STAGES = The stages to compute.  Defaults to [1:LOGR_N] if missing/empty/0.
%          For DIT, stages are counted from 1 to logr_n.
%          For DIF, stages are counted from logr_n to 1.
% MODE = If MODE==0: (RADIX-1)/RADIX of the twiddles for each stage will be
%                    returned as a cell, one stage's twiddle factors per
%                    element (1/RADIX of the twiddles will be unity).  Note
%                    that the twiddles for each stage of the compact form will
%                    require different amounts/patterns of repetition for
%                    actual use.  This is the default value.
%        If MODE==1: ALL pre-butterfly (DIT) twiddles (including all unity
%                    twiddles) for STAGES will be returned as a matrix.
%        If MODE==2: ALL pre-butterfly (DIF) twiddles (including all unity
%                    twiddles) for STAGES will be returned as a matrix.
% BR = Flag indicating whether to bit-reverse the indices of the returned
%      twiddle factors.  Defaults to true if stages(1) <= stages(end) and radix
%      is a power of 2; defaults to false otherwise.  Note that this is a
%      binary bit-reversal, not a RADIX digit reversal!
%
% W = Returned twiddles.  Note that the twiddles are actually exponents.  To
%     produce actual complex coefficients, the complex exponential kernel (i.e.
%     exp(-2*pi*j/(RADIX^LOGR_N) must be raised to the these powers.

  if nargin < 2, radix=2; end
  if nargin < 3 || length(stages)==0 || (length(stages)==1 && stages(1)==0)
    stages=[1:logr_n];
  end
  if nargin < 4, mode=0; end
  if nargin < 5, br=(stages(1)<=stages(end) && radix==2^nextpow2(radix)); end

  bad_stages=[find(stages<1) find(stages>logr_n)];
  if bad_stages
    error(['Stages out of range: ' num2str(stages(bad_stages))]); 
  end

  mode=mod(mode,3);

  if mode==0
    w={};
  else
    w=zeros(radix^logr_n,length(stages));
  end

  m=radix;

  for n=1:length(stages)
    k=stages(n)-1;

    l=radix^k;
    si=[1:l]-1;
    mi=[1:m]-1;

    wk=mod(si'*mi,l*m)*radix^(logr_n-k-1);
    %wk=mod(mi'*si,l*m)*radix^(logr_n-k-1);

    if br
      wk=bitrevm(wk,1,0);
    end

    if mode==0
      w{n}=wk(:,2:end);
      %w{n}=wk(2:end,:)';
    else
      if mode == 1
        wk=kron(wk',ones(radix^(logr_n-k-1),1)); % DIT
        %wk=kron(wk',ones(1,radix^(logr_n-k-1))); % DIT?
        %%wk=kron(wk,ones(1,radix^(logr_n-k-1))); % DIT?
      else
        wk=kron(ones(1,radix^(logr_n-k-1)),wk); % DIF
        %wk=kron(ones(1,radix^(logr_n-k-1)),wk); % DIF
      end
      wk=reshape(wk,[],1);
      w(:,n)=wk;
    end
    %disp('----');
  end

  if mode==0 && length(w)==1
    w=w{1};
  end
