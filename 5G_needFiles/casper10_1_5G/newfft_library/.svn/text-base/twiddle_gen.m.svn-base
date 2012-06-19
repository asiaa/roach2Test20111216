function w = twiddle_gen(...
  n_stages,radix,cur_stage,decimation,n_bits_w,bin_pt_w)
% Compute unique twiddle factors for arbitrary (fixed) radix FFT
%
% w = twiddle_gen(n_stages,radix,cur_stage,decimation,n_bits_w,bin_pt_w)
% 
% n_stages = Total number of FFT stages
% radix = Radix of the FFT.
% cur_stage = FFT stage for computed twiddles.  Note that stages are
%             counted from 1 to n_stages for DIT (i.e. cur_stage==1 for
%             the first stage) and n_stages to 1 for DIF (i.e.
%             cur_stage==1 for the last stage).
% decimation = Decimation mode (1 == DIT, 2 == DIF)
% n_bits_w = Number of bits to use for real and imaginary components
% bin_pt_w = Binary point position in the generated twiddles
%
% w = The computed twiddle factors.  This will be a matrix with radix-1
%     columns.
%
% If n_bits_w is greater than 0, the computed twiddles are scaled by
% 2^(bin_pt_w)-(n_bits_w==bin_pt_w+1), converted to unsigned, and bitwise
% concatenated with the real component in the upper n_bits_w bits and the
% imaginary component in the lower n_bits_w bits.
%
% If n_bits_w is less than 0, the twiddle exponents are returned.  To produce
% actual complex coefficients, the complex exponential kernel (i.e.
% exp(-2*pi*j/(radix^n_stages)) must be raised to the these powers.
%
% If n_bits_w equals 0, the computed twiddles are returned as unscaled complex
% doubles.
%
% Twiddle order assumes FFT has inputs in normal order and outputs in
% bit-reversed order.
%
% NB: This only computes the *unqiue* twiddle facters in the correct order
% for the specified decimation mode, but it does *not* repeat twiddle
% factors or twiddle factor sequences.

  if ~isnumeric(cur_stage) || prod(size(cur_stage)) ~= 1
    error('Current stage must be a single number.');
  end

  w=twiddles(n_stages,radix,cur_stage,0,2-decimation);

  if n_bits_w < 0
   return
  end

  w=exp(-j*2*pi*w/(radix^n_stages));

  if n_bits_w > 0,

    % The number of fractional bits in the twiddle factors determines the
    % scaling.  If we have only one non-fractional bit, then we cannot
    % represent +1 or -1, so we can only go as high as 1-1/2^(bin_pt_w) so we
    % scale by 2^(bin_pt_w)-1 (e.g. if n_bits_w=8 and bin_pt_w=7, we would
    % scale by 127).  If we have two or more fractional bits, however, then
    % we can represent +1 and -1 (at the expense of n_bits_w-bin_pt_w bits of
    % precision) so we can scale by 2^bin_pt_w (e.g. if n_bits=8, we would
    % scale by 64).

    scale=2^bin_pt_w;
    if n_bits_w == bin_pt_w+1
      scale=scale-1;
    end

    w=w*scale;
    w=round(w);
    re=mod(2^n_bits_w+real(w),2^n_bits_w);
    im=mod(2^n_bits_w+imag(w),2^n_bits_w);
    w = re * 2^n_bits_w + im;

  end;
