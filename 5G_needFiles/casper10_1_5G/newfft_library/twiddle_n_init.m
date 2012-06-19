function used_bram = twiddle_n_init(blk,n_stages,radix,cur_stage,decimation,...
  n_bits,bin_pt,n_bits_w,use_bram,mult_latency,add_latency,varargin)
% Configure a twiddle_n block
%
% used_bram = twiddle_n_init(blk, n_stages, radix, cur_stage, decimation, ...
%                               n_bits, bin_pt, n_bits_w, use_bram, ...
%                               mult_latency, add_latency)
%
% blk = Block to configure
% n_stages = The number of total stages in the FFT.
% radix = The radix of the FFT.  The FFT will have radix^n_stages points.
% cur_stage = The number of the current stage in which blk resides.
%             generate twiddle coefficients.  Valid values are 3 through
%             n_stages, inclusive.  Note that stages are counted from 1 to
%             n_stages for DIT (i.e. cur_stage==1 for the first stage) and
%             n_stages to 1 for DIF (i.e. cur_stage==1 for the last stage).
% decimation = The decimation mode of the FFT (1==DIT,2==DIF).
% n_bits = Number of Bits In/Out.  Specifies the width of the
%          real/imaginary components of ports a_in, b, a_out, bw.  Assumed
%          equal for both components.
% bin_pt = Binary Point In/Out.  Specifies the binary point position of the
%          real/imaginary components of ports a_in, b, a_out, bw.  Assumed
%          equal for both components.
% n_bits_w = Twiddle Coefficient Bitwidth.  Specifies the width of the
%            real/imaginary components of the twiddle coefficients.
%            Assumed equal for both components.
% use_bram = Flag to select BRAM (use_bram true) or distributed memory.
% mult_latency = Latency to use for the underlying real multipliers.
% add_latency = Latency to use for the underlying real adders.
%
% used_bram = Flag indicating whether BRAM was used (requests for small
%             BRAMs will be overridden).

  % Unlink this block
  set_param(blk,'LinkStatus','none');

  % Bail out if state matches parameters
  if ~save_state(blk,'twiddle_n_init',n_stages,radix,cur_stage,decimation,...
      n_bits,bin_pt,n_bits_w,use_bram,mult_latency,add_latency,varargin{:})
    return
  end

  % Select between twiddle_gen_c and twiddle_gen_ri
  if n_bits_w <= 9
    twiddle_gen_blk='twiddle_gen_c';
  else
    twiddle_gen_blk='twiddle_gen_ri';
  end

  % Use cmpy3 unless n_bits is exactly (a multiple of) 18.
  if mod(n_bits,18) == 0
    cmpy='cmpy4';
  else
    cmpy='cmpy3';
  end

  % Specify bin_pt_w.  See discussion in twiddle_gen.m.  May want to
  % expose this as a parameter in the future.
  bin_pt_w = n_bits_w-2;

  for branch=1:radix-1
    [used_bram,depth]=update_block(blk,['twiddle_gen' num2str(branch)], ...
      twiddle_gen_blk,'twiddle_gen_init', ...
      n_stages,radix,cur_stage,branch, ...
      decimation,n_bits_w,bin_pt_w,use_bram,varargin{:});

    update_block(blk,['cmpy' num2str(branch)],cmpy, ...
      [cmpy '_init'], ...
      n_bits,   n_bits-1,   ... % B
      n_bits_w, bin_pt_w,   ... % W
      n_bits,   n_bits-1,   ... % BW
      3, ... % Quantization (TODO paramaterize?)
      1, ... % Overflow     (TODO paramaterize?)
      mult_latency, add_latency,varargin{:});
  end

  % Back populate mask parameter values
  mv={};
  mv{1}=num2str(n_stages);
  mv{2}=num2str(cur_stage);
  if decimation == 1
    mv{3}='Time';
  else
    mv{3}='Frequency';
  end
  mv{4}=num2str(n_bits);
  mv{5}=num2str(bin_pt);
  mv{6}=num2str(n_bits_w);
  if used_bram
    mv{7}='on';
    twiddle_delay_type='bram';
  else
    mv{7}='off';
    twiddle_delay_type='dist';
  end
  mv{8}=num2str(mult_latency);
  mv{9}=num2str(add_latency);
  backpopulate_mask(blk,mv);

  % Set attribute format string (block annotation)
  annotation=sprintf('%d twiddles in %s',depth,twiddle_delay_type);
  set_param(blk,'AttributesFormatString',annotation);

  % Maybe munge block
  munge_block(blk,varargin{:});
