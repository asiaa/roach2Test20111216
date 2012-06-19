function biplex_bitrev_init(blk,log2_size,n_bits,varargin)
% Configure a biplex_bitrev block
%
% biplex_bitrev_init(blk, log2_size, n_bits)
%
% blk = Block to configure
% log2_size = The base-2 logarithm of the length of one complete input block.
%             This MUST be an integer because the current implementation
%             requires that the input block size MUST be a power of 2.
% n_bits = Specifies the width of the real/imaginary components.
%          Width of each component is assumed equal.

  % Unlink this block
  set_param(blk,'LinkStatus','none');

  % Bail out if state matches parameters
  if ~save_state(blk,'biplex_bitrev_init',log2_size,n_bits,varargin{:})
    return
  end

  depth=2^log2_size;

  set_param(find_by_name(blk,'Counter'),'n_bits',num2str(log2_size));
  set_param(find_by_name(blk,'Delay'),'latency',num2str(depth+2));

  set_param(find_by_name(blk,'ram_a_re'),'depth',num2str(depth));
  set_param(find_by_name(blk,'ram_a_im'),'depth',num2str(depth));
  set_param(find_by_name(blk,'ram_b_re'),'depth',num2str(depth));
  set_param(find_by_name(blk,'ram_b_im'),'depth',num2str(depth));

  update_block(blk,'c_to_ri','c_to_ri', ...
    'c_to_ri_init',n_bits,0,varargin{:});

  update_block(blk,'c_to_ri1','c_to_ri', ...
    'c_to_ri_init',n_bits,0,varargin{:});

  update_block(blk,'bit_reverse','bit_reverse', ...
    'bit_reverse_init',log2_size,varargin{:});

  update_block(blk,'ri_to_c','ri_to_c', ...
    'ri_to_c_init',varargin{:});

  update_block(blk,'ri_to_c1','ri_to_c', ...
    'ri_to_c_init',varargin{:});

  % Back populate mask parameter values
  mv={};
  mv{1}=num2str(log2_size);
  mv{2}=num2str(n_bits);
  backpopulate_mask(blk,mv);

  % Set attribute format string (block annotation)
  annotation=sprintf('size = %d',2^log2_size);
  set_param(blk,'AttributesFormatString',annotation);

  % Maybe munge block
  munge_block(blk,varargin{:});
