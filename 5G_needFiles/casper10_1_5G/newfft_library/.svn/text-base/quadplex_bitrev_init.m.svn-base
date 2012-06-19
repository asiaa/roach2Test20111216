function quadplex_bitrev_init(blk,log2_size,n_bits,varargin)
% Configure a quadplex_bitrev block
%
% quadplex_bitrev_init(blk, log2_size, n_bits)
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
  if ~save_state(blk,'quadplex_bitrev_init',log2_size,n_bits,varargin{:})
    return
  end

  for subblk={'biplex_bitrev0','biplex_bitrev1'}
    update_block(blk,subblk{1},'biplex_bitrev', ...
      'biplex_bitrev_init',log2_size,n_bits,varargin{:});
  end

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
