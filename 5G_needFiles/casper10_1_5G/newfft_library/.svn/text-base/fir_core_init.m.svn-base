function used_bram = fir_core_init(blk,delay,n_bits_d,bin_pt_d, ...
  n_bits_s,bin_pt_s,use_bram,mult_latency,add_latency,add_bypass,varargin)
% Configure a fir_core block
%
% used_bram = fir_core_init(blk, delay, n_bits_d, bin_pt_d, ...
%   n_bits_s, bin_pt_s, use_bram, mult_latency, add_latency, add_bypass )
%
% blk = Block to configure
% delay = The length of the inter-tap delay.
% n_bits_d = Number of bits for data
% bin_pt_d = Binary point for data
% n_bits_s = Number of bits for output sum (overflow wraps).
% bin_pt_s = Binary point for output sum (quantization truncates).
% use_bram = Selects BRAM (use_bram true) or SLR16 elements for delay.
% mult_latency = Latency to use for the underlying multiplier.
% add_latency = Latency to use for the underlying adder.
% add_bypass = Flag to bypass the tap's adder.
%
% used_bram = Flag indicating whether BRAM was used for delay
%             (requests for small BRAMs will be overridden).

  % Unlink this block
  set_param(blk,'LinkStatus','none');

  % Don't use BRAM for small delays
  if delay <= 16
    used_bram=0;
  else
    used_bram=use_bram;
  end

  % Bail out if state matches parameters
  if ~save_state(blk,'fir_core_init',delay,n_bits_d,bin_pt_d, ...
      n_bits_s,bin_pt_s,use_bram,mult_latency,add_latency, ...
      add_bypass,varargin{:})
    return
  end

  use_bram=used_bram;

  update_block(blk,'c_to_ri_d','c_to_ri','c_to_ri_init', ...
    n_bits_d,bin_pt_d,varargin{:});

  update_block(blk,'c_to_ri_s','c_to_ri','c_to_ri_init', ...
    n_bits_s,bin_pt_s,varargin{:});

  for subname={'mult_add_re','mult_add_im'}
    update_block(blk,subname{1},'mult_add','mult_add_init', ...
      mult_latency,add_latency,add_bypass,varargin{:});
  end

  % Compute mult_add latency
  latency=mult_latency+add_latency*(add_bypass==0);
  set_param(find_by_name(blk,'dout_delay'),'latency',num2str(latency));
  set_param(find_by_name(blk,'sync_delay'),'latency',num2str(latency));

  for subname={'convert_re','convert_im'}
    set_param(find_by_name(blk,subname{1}), ...
      'n_bits',num2str(n_bits_s), ...
      'bin_pt',num2str(bin_pt_s));
  end

  % If using BRAM and 2*n_bits_d exceeds the width of one bram and the delay
  % depth is less than 1024, then use complex delay, which splits the data
  % into two brams.  This prevents BRAMS from being used in 36-bit wide (or
  % wider) mode, which prevents the adjacent multipliers from being used.
  if use_bram && n_bits_d > 9 && delay < 1024
    delay_type='complex_delay';
    delay_init='complex_delay_init';
    delay_args={delay, n_bits_d, use_bram};
  elseif use_bram
    delay_type='delay_bram';
    delay_init='delay_bram_init';
    delay_args={delay};
  else
    delay_type='delay_slr';
    delay_init='delay_slr_init';
    delay_args={delay};
  end

  update_block(blk,'tap_delay',delay_type, ...
    delay_init,delay_args{:},varargin{:});

  % Back populate mask parameter values
  mv={};
  mv{1}=num2str(delay);
  mv{2}=num2str(n_bits_d);
  mv{3}=num2str(bin_pt_d);
  mv{4}=num2str(n_bits_s);
  mv{5}=num2str(bin_pt_s);
  if used_bram
    mv{6}='on';
    delay_type='bram';
  else
    mv{6}='off';
    delay_type='slr';
  end
  mv{7}=num2str(mult_latency);
  mv{8}=num2str(add_latency);
  if add_bypass
    mv{9}='on';
    add_type='\nno adder';
  else
    mv{9}='off';
    add_type='';
  end
  backpopulate_mask(blk,mv);

  % Set attribute format string (block annotation)
  annotation=sprintf('delay %d in %s%s',delay,delay_type,add_type);
  set_param(blk,'AttributesFormatString',annotation);

  % Maybe munge block
  munge_block(blk,varargin{:});
