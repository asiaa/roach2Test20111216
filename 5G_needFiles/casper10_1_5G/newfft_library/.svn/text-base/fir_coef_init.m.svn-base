function used_bram = fir_coef_init(blk, ...
  coef,n_bits_c,bin_pt_c,use_bram,varargin)
% Configure a fir_coef block
%
% used_bram = fir_coef_init(blk, coef, n_bits_c, bin_pt_c, use_bram )
%
% blk = Block to configure
% coef = Scalar (or vector of) real double(s) to use as coefficient(s).
% n_bits_c = Number of bits for coefficient(s).
% bin_pt_c = Binary point for coefficient(s).
% use_bram = Selects BRAM (use_bram true) or distributed memory for coefs.
%
% used_bram = Flag indicating whether BRAM was used for coefficients.

  % Unlink this block
  set_param(blk,'LinkStatus','none');

  % Don't use BRAM for small number of coefs
  coef_depth=length(coef);
  if coef_depth <= 16
    used_bram=0;
  else
    used_bram=use_bram;
  end

  % Bail out if state matches parameters
  if ~save_state(blk, ...
      'fir_tap_init',coef,n_bits_c,bin_pt_c,use_bram,varargin{:})
    return
  end

  use_bram=used_bram;

  % Select c_gen block type
  if coef_depth > 1
    % TODO Expose coef_gen's log2cpc?  For now force 1.
    used_bram=update_block(blk,'c_gen','coef_gen','coef_gen_init', ...
      coef,n_bits_c,bin_pt_c,0,use_bram,varargin{:});
    latency=1;
  else
    used_bram=0;
    update_block(blk,'c_gen','const_gen','const_gen_init', ...
      coef,n_bits_c,bin_pt_c,varargin{:});
    latency=0;
  end

  for subname={'data_delay','sum_delay','sync_delay'}
    set_param(find_by_name(blk,subname{1}),'latency',num2str(latency));
  end

  % Back populate mask parameter values
  mv={};
  mv{1}=mat2str(coef);
  mv{2}=num2str(n_bits_c);
  mv{3}=num2str(bin_pt_c);
  if used_bram
    mv{4}='on';
    coef_type='bram';
  else
    mv{4}='off';
    coef_type='dist';
  end
  backpopulate_mask(blk,mv);

  % Set attribute format string (block annotation)
  annotation=sprintf('%d coefs in %s',coef_depth,coef_type);
  set_param(blk,'AttributesFormatString',annotation);

  % Maybe munge block
  munge_block(blk,varargin{:});
