function r4_butterfly_init(blk,n_bits,shift,quantization,add_latency,varargin)
% Configure an r4_butterfly block
%
% r4_butterfly_init(blk,n_bits,shift,quantization,add_latency)
%
% blk = Block to configure
% n_bits = Number of bits in.
%          Assumed equal for both components.
% shift = Number of bits to right shift by (to limit bit growth)
% quantization = Quantization mode (used if shift > 0)
%                1 = 'Truncate'
%                2 = 'Round  (unbiased: +/- Inf)'
%                3 = 'Round  (unbiased: Even Values)'
% add_latency = Latency to use for the underlying real adders.

  % Unlink this block
  set_param(blk,'LinkStatus','none');

  % Bail out if state matches parameters
  if ~save_state(blk,'r4_butterfly_init', ...
      n_bits,shift,quantization,add_latency,varargin{:})
    return
  end

  qparam='Truncate';
  qstr='';

  if shift > 0
    switch quantization
      case 1
        qparam='Truncate';
        qstr=sprintf('\ntruncate');
      case 2
        qparam = 'Round  (unbiased: +/- Inf)';
        qstr=sprintf('\nround inf');
      otherwise
        qparam = 'Round  (unbiased: Even Values)';
        qstr=sprintf('\nround even');
    end
  end

  for subblk={'butterfly0','butterfly1'}
    update_block(blk,subblk{1},'r2_butterfly', ...
      'r2_butterfly_init',n_bits,0,1,add_latency,varargin{:});
  end

  update_block(blk,'butterfly2','r2_butterfly', ...
    'r2_butterfly_init',n_bits+1,shift,quantization,add_latency,varargin{:});

  update_block(blk,'butterfly3j','r2_butterfly_dit_j', ...
    'r2_butterfly_init',n_bits+1,shift,quantization,add_latency,varargin{:});

  % Back populate mask parameter values
  mv={};
  mv{1}=num2str(n_bits);
  mv{2}=num2str(shift);
  mv{3}=qparam;
  mv{4}=num2str(add_latency);
  backpopulate_mask(blk,mv);

  % Set attribute format string (block annotation)
  annotation=sprintf('shift %d%s',shift,qstr);
  set_param(blk,'AttributesFormatString',annotation);

  % Maybe munge block
  munge_block(blk,varargin{:});
