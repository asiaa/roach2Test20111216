function used_bram = biplex_commutator_init(blk, ...
  log2_size,n_bits,use_bram,varargin)
% Configure a biplex_commutator block
%
% used_bram = biplex_commutator_init(blk, log2_size, n_bits, use_bram)
%
% blk = Block to configure
% log2_size = The base-2 logarithm of the length of one complete input block.
%             This MUST be an integer because the current implementation
%             requires that the input block size MUST be a power of 2.
% n_bits = Specifies the width of the real/imaginary components.
%          Width of each component is assumed equal.
% use_bram = Flag to select BRAM (use_bram true) or SLR16 (use_bram false)
%
% used_bram = Flag indicating whether BRAM was used (requests for small
%             BRAMs will be overridden).

  % Unlink this block
  set_param(blk,'LinkStatus','none');

  % For delays of 16 or less (i.e. block sizes of 32 or less), prohibit use
  % of BRAM.
  if log2_size < 6
    use_bram = 0;
  end
  used_bram=use_bram;

  % Bail out if state matches parameters
  if ~save_state(blk,'biplex_commutator_init',log2_size,n_bits, ...
      use_bram,varargin{:})
    return
  end

  delay=2^(log2_size-1);

  set_param(find_by_name(blk,'Counter'),'n_bits',num2str(log2_size));
  set_param(find_by_name(blk,'Delay'),'latency',num2str(delay+1));

  % If using BRAM and 2*n_bits exceeds the width of one bram and the delay
  % depth is less than 1024, then use complex delay, which splits the data
  % into two brams.  This prevents BRAMS from being used in 36-bit wide (or
  % wider) mode, which prevents the adjacent multipliers from being used.
  if use_bram && n_bits > 9 && delay < 1024
    delay_type='complex_delay';
    delay_init='complex_delay_init';
    delay_args={delay n_bits use_bram};
  elseif use_bram
    delay_type='delay_bram';
    delay_init='delay_bram_init';
    delay_args={delay};
  else
    delay_type='delay_slr';
    delay_init='delay_slr_init';
    delay_args={delay};
  end

  update_block(blk,'delay_b',delay_type, ...
    delay_init,delay_args{:},varargin{:});

  update_block(blk,'delay_lo',delay_type, ...
    delay_init,delay_args{:},varargin{:});

  % Back populate mask parameter values
  mv={};
  mv{1}=num2str(log2_size);
  mv{2}=num2str(n_bits);
  if use_bram
    mv{3}='on';
  else
    mv{3}='off';
  end
  backpopulate_mask(blk,mv);

  % Set attribute format string (block annotation)
  annotation=sprintf('size = %d\n%s',2^log2_size,strrep(delay_type,'_',' '));
  set_param(blk,'AttributesFormatString',annotation);

  % Maybe munge block
  munge_block(blk,varargin{:});
