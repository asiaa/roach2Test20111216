function r2_butterfly_init(blk,n_bits,shift,quantization,add_latency,varargin)
% Configure an r2_butterfly block
%
% r2_butterfly_init(blk,n_bits,shift,quantization,add_latency)
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
  if ~save_state(blk,'r2_butterfly_init', ...
      n_bits,shift,quantization,add_latency,varargin{:})
    return
  end

  conv_latency=0;
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
        conv_latency=3;
      otherwise
        qparam = 'Round  (unbiased: Even Values)';
        qstr=sprintf('\nround even');
        conv_latency=3;
    end
  end

  set_param(find_by_name(blk,'Delay'),'latency', ...
    num2str(add_latency+conv_latency));

  for subblk={'add_re','add_im','sub_re','sub_im'}
    set_param(find_by_name(blk,subblk{1}),'latency',num2str(add_latency));
  end

  for subblk={'shift0','shift1','shift2','shift3'}
    set_param(find_by_name(blk,subblk{1}),'scale_factor',num2str(-shift));
  end

  for subblk={'requant0','requant1','requant2','requant3'}
    set_param(find_by_name(blk,subblk{1}),'n_bits',num2str(n_bits+1-shift));
    set_param(find_by_name(blk,subblk{1}),'quantization',num2str(qparam));
    set_param(find_by_name(blk,subblk{1}),'latency',num2str(conv_latency));
  end

  update_block(blk,'c_to_ri','c_to_ri', ...
    'c_to_ri_init',n_bits,0,varargin{:});

  update_block(blk,'c_to_ri1','c_to_ri', ...
    'c_to_ri_init',n_bits,0,varargin{:});

  update_block(blk,'ri_to_c','ri_to_c', ...
    'ri_to_c_init',varargin{:});

  update_block(blk,'ri_to_c1','ri_to_c', ...
    'ri_to_c_init',varargin{:});

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
