function r4_dit_stage_init(blk,n_stages,cur_stage,n_bits,bin_pt,shift, ...
  commutator_bram,twiddle_bram,n_bits_w,mult_latency,add_latency,varargin)
% Configure an r4_dit_stage block
%
% r4_dit_stage_init(blk, n_stages, cur_stage, n_bits, bin_pt, shift, ...
%                   commutator_bram, twiddle_bram, n_bits_w, ...
%                   mult_latency,add_latency)
%
% blk = Block to configure
% n_stages = The number of total stages in the FFT.  The FFT will have
%            4^n_stages points.
% cur_stage = The number of the current stage in which blk resides.
%             generate twiddle coefficients.  Valid values are 3 through
%             n_stages, inclusive.  Note that stages are counted from 1 to
%             n_stages for DIT (i.e. cur_stage==1 for the first stage) and
%             n_stages to 1 for DIF (i.e. cur_stage==1 for the last stage).
% n_bits = Number of Bits In/Out.  Specifies the width of the
%          real/imaginary components of ports a_in, b, a_out, bw.  Assumed
%          equal for both components.
% bin_pt = Binary Point In  Specifies the binary point position of the
%          real/imaginary components of ports a_in, b_in, c_in, d_in.
%          Assumed equal for both components.
% shift = Number of bits to right shift by (to limit bit growth)
% commutator_bram = Flag to select BRAM (true) for commutator memory.
% twiddle_bram = Flag to select BRAM (true) for twiddle coefficients.
% n_bits_w = Twiddle Coefficient Bitwidth.  Specifies the width of the
%            real/imaginary components of the twiddle coefficients.
%            Assumed equal for both components.
% mult_latency = Latency to use for the underlying real multipliers.
% add_latency = Latency to use for the underlying real adders.

  % Unlink this block
  set_param(blk,'LinkStatus','none');

  % Bail out if state matches parameters
  if ~save_state(blk,'r4_dit_stage_init',n_stages,cur_stage,n_bits,bin_pt, ...
      shift,commutator_bram,twiddle_bram,n_bits_w, ...
      mult_latency,add_latency,varargin{:})
    return
  end

  log4_size=n_stages-cur_stage+1;

  commutator_bram=update_block(blk, ...
    'quadplex_commutator','quadplex_commutator', ...
    'quadplex_commutator_init',log4_size,n_bits,commutator_bram,varargin{:});

  switch cur_stage
    case 1
      update_block(blk,'r4_twiddle','r4_twiddle_1', ...
        'twiddle_1_init',varargin{:});
      twiddle_bram = 0;
    otherwise
      twiddle_bram=update_block(blk,'r4_twiddle','r4_twiddle_n', ...
        'twiddle_n_init',n_stages,4,cur_stage,1,n_bits,bin_pt, ...
        n_bits_w,twiddle_bram,mult_latency,add_latency,varargin{:});
  end

  % TODO Expose butterfly's quantization option?
  update_block(blk,'r4_butterfly','r4_butterfly', ...
    'r4_butterfly_init',n_bits,shift,3,add_latency,varargin{:});

  % Back populate mask parameter values
  mv={};
  mv{1}=num2str(n_stages);
  mv{2}=num2str(cur_stage);
  mv{3}=num2str(n_bits);
  mv{4}=num2str(bin_pt);
  mv{5}=num2str(shift);
  if commutator_bram
    mv{6}='on';
    commutator_delay_type='bram';
  else
    mv{6}='off';
    commutator_delay_type='slr';
  end
  if twiddle_bram
    mv{7}='on';
    twiddle_delay_type='bram';
  else
    mv{7}='off';
    twiddle_delay_type='dist';
  end
  mv{8}=num2str(n_bits_w);
  mv{9}=num2str(mult_latency);
  mv{10}=num2str(add_latency);
  backpopulate_mask(blk,mv);

  % Set attribute format string (block annotation)
  annotation=sprintf('stage %d of %d\ndelay %s\ntwiddle %s\nshift %d', ...
    cur_stage,n_stages,commutator_delay_type,twiddle_delay_type,shift);
  set_param(blk,'AttributesFormatString',annotation);

  % Maybe munge block
  munge_block(blk,varargin{:});
