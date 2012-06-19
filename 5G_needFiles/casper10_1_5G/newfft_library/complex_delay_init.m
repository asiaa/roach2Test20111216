function complex_delay_init(blk,delay_depth,n_bits,use_bram,varargin)
% Configure a complex_delay block
%
% complex_delay_init(blk, delay_depth, n_bits, use_bram)
%
% blk = Block to configure
% delay_depth = Depth of the delay
% n_bits = Specifies the width of the real/imaginary components.
%          Width of each component is assumed equal.
% use_bram = Flag to select BRAM (use_bram true) or SLR16 (use_bram false)

  % Unlink this block
  set_param(blk,'LinkStatus','none');

  % Bail out if state matches parameters
  if ~save_state(blk,'complex_delay_init', ...
      delay_depth,n_bits,use_bram,varargin{:})
    return
  end

  if use_bram
    delay_type='delay_bram';
    delay_init='delay_bram_init';
  else
    delay_type='delay_slr';
    delay_init='delay_slr_init';
  end

  update_block(blk,'delay_re',delay_type, ...
    delay_init,delay_depth,varargin{:});

  update_block(blk,'delay_im',delay_type, ...
    delay_init,delay_depth,varargin{:});

  update_block(blk,'c_to_ri','c_to_ri', ...
    'c_to_ri_init',n_bits,0,varargin{:});

  update_block(blk,'ri_to_c','ri_to_c', ...
    'ri_to_c_init',varargin{:});

  % Back populate mask parameter values
  mv={};
  mv{1}=num2str(delay_depth);
  mv{2}=num2str(n_bits);
  if use_bram
    mv{3}='on';
  else
    mv{3}='off';
  end
  backpopulate_mask(blk,mv);

  % Set attribute format string (block annotation)
  annotation=sprintf('depth = %d\n%s',delay_depth,strrep(delay_type,'_',' '));
  set_param(blk,'AttributesFormatString',annotation);

  % Maybe munge block
  munge_block(blk,varargin{:});
