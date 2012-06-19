function used_bram = quadplex_commutator_init(blk, ...
  log4_size,n_bits,use_bram,varargin)
% Configure a quadplex_commutator block
%
% used_bram = quadplex_commutator_init(blk, log4_size, n_bits, use_bram)
%
% blk = Block to configure
% log4_size = The base-4 logarithm of the length of one complete input block.
%             This MUST be an integer because the current implementation
%             requires that the input block size MUST be a power of 4.
% n_bits = Specifies the width of the real/imaginary components.
%          Width of each component is assumed equal.
% use_bram = Flag to select BRAM (use_bram true) or SLR16 (use_bram false)
%
% used_bram = Count indicating how many underlying biplex_commutators used
%             BRAM (requests for small BRAMs will be overridden).

  % Unlink this block
  set_param(blk,'LinkStatus','none');

  % Bail out if state matches parameters
  if ~save_state(blk,'quadplex_commutator_init',log4_size,n_bits, ...
      use_bram,varargin{:})
    return
  end

  log2_long=2*log4_size;
  log2_short=2*log4_size-1;

  used_bram=0;

  used_bram=used_bram+ ...
    update_block(blk,'biplex_commutator_ac','biplex_commutator', ...
    'biplex_commutator_init',log2_long,n_bits,use_bram,varargin{:});

  used_bram=used_bram+ ...
    update_block(blk,'biplex_commutator_bd','biplex_commutator', ...
    'biplex_commutator_init',log2_long,n_bits,use_bram,varargin{:});

  used_bram=used_bram+ ...
    update_block(blk,'biplex_commutator_01','biplex_commutator', ...
    'biplex_commutator_init',log2_short,n_bits,use_bram,varargin{:});

  used_bram=used_bram+ ...
    update_block(blk,'biplex_commutator_23','biplex_commutator', ...
    'biplex_commutator_init',log2_short,n_bits,use_bram,varargin{:});

  % Back populate mask parameter values
  mv={};
  mv{1}=num2str(log4_size);
  mv{2}=num2str(n_bits);
  if use_bram
    mv{3}='on';
  else
    mv{3}='off';
    used_bram=0;
  end
  backpopulate_mask(blk,mv);

  % Set attribute format string (block annotation)
  annotation=sprintf('size = %d\n%d/4 bram',4^log4_size,used_bram);
  set_param(blk,'AttributesFormatString',annotation);

  % Maybe munge block
  munge_block(blk,varargin{:});
