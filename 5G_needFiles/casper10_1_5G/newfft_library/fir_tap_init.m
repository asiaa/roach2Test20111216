function used_bram = fir_tap_init(blk,delay,coef,n_bits_c,bin_pt_c, ...
  n_bits_d,bin_pt_d,n_bits_s,bin_pt_s,coef_bram,delay_bram, ...
  mult_latency,add_latency,add_bypass,varargin)
% Configure a fir_tap block
%
% used_bram = fir_tap_init(blk, delay, coef, n_bits_c, bin_pt_c, ...
%   n_bits_d,bin_pt_d,n_bits_s,bin_pt_s,coef_bram,delay_bram, ...
%   mult_latency,add_latency,add_bypass )
%
% blk = Block to configure
% delay = The length of the inter-tap delay.
% coef = Scalar (or vector of) real double(s) to use as coefficient(s).
% n_bits_c = Number of bits for coefficient(s).
% bin_pt_c = Binary point for coefficient(s).
% n_bits_d = Number of bits for data.
% bin_pt_d = Binary point for data.
% n_bits_s = Number of bits for output sum (overflow wraps).
% bin_pt_s = Binary point for output sum (quantization truncates).
% coef_bram = Selects BRAM (coef_bram true) or distributed memory for coefs.
% delay_bram = Selects BRAM (delay_bram true) or SLR16 elements for delay.
% mult_latency = Latency to use for the underlying multiplier.
% add_latency = Latency to use for the underlying adder.
% add_bypass = Flag to bypass the tap's adder.
%
% used_bram = Vector of flags indicating whether BRAM was used for
%             coefficient(s) or delay (requests for small BRAMs will be
%             overridden).

  % Unlink this block
  set_param(blk,'LinkStatus','none');

  % Don't use BRAM for small number of coefs
  coef_depth=length(coef);
  if coef_depth <= 16
    used_bram(1)=0;
  else
    used_bram(1)=coef_bram;
  end

  % Don't use BRAM for small delays
  if delay <= 16
    used_bram(2)=0;
  else
    used_bram(2)=delay_bram;
  end

  % Bail out if state matches parameters
  if ~save_state(blk,'fir_tap_init',delay,coef,n_bits_c,bin_pt_c, ...
      n_bits_d,bin_pt_d,n_bits_s,bin_pt_s,coef_bram,delay_bram, ...
      mult_latency,add_latency,add_bypass,varargin{:})
    return
  end

  coef_bram=used_bram(1);
  delay_bram=used_bram(2);

  used_bram(1)=update_block(blk,'fir_coef','fir_coef','fir_coef_init', ...
    coef,n_bits_c,bin_pt_c,coef_bram,varargin{:});

  used_bram(2)=update_block(blk,'fir_core','fir_core','fir_core_init', ...
    delay,n_bits_d,bin_pt_d,n_bits_s,bin_pt_s,delay_bram, ...
    mult_latency,add_latency,add_bypass,varargin{:});

  % Back populate mask parameter values
  mv={};
  mv{1}=num2str(delay);
  mv{2}=mat2str(coef);
  mv{3}=num2str(n_bits_c);
  mv{4}=num2str(bin_pt_c);
  mv{5}=num2str(n_bits_d);
  mv{6}=num2str(bin_pt_d);
  mv{7}=num2str(n_bits_s);
  mv{8}=num2str(bin_pt_s);
  if used_bram(1)
    mv{9}='on';
    coef_type='bram';
  else
    mv{9}='off';
    coef_type='dist';
  end
  if used_bram(2)
    mv{10}='on';
    delay_type='bram';
  else
    mv{10}='off';
    delay_type='slr';
  end
  mv{11}=num2str(mult_latency);
  mv{12}=num2str(add_latency);
  if add_bypass
    mv{13}='on';
    add_type='\nno adder';
  else
    mv{13}='off';
    add_type='';
  end
  backpopulate_mask(blk,mv);

  % Set attribute format string (block annotation)
  annotation=sprintf('delay %d in %s\n%d coefs in %s%s',...
    delay,delay_type,coef_depth,coef_type,add_type);
  set_param(blk,'AttributesFormatString',annotation);

  % Maybe munge block
  munge_block(blk,varargin{:});
