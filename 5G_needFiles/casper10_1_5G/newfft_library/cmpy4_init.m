function cmpy4_init(blk,n_bits_b,bin_pt_b,n_bits_w,bin_pt_w,...
  n_bits_bw,bin_pt_bw,quantization,overflow,mult_latency,add_latency,varargin)
% Configure a cmpy4 block
%
% cmpy4_init(blk, n_bits_b, bin_pt_b, n_bits_w, bin_pt_w, ...
%          n_bits_bw, bin_pt_bw, quantization, overflow, ...
%          mult_latency, add_latency)
%
% blk = Block to configure
% n_bits_X = Number of bits for port X.
%            Assumed equal for both components.
% bin_pt_X = Binary Point for port X.
%            Assumed equal for both components.
% quantization = Quantization mode
%                1 = 'Truncate'
%                2 = 'Round  (unbiased: +/- Inf)'
%                3 = 'Round  (unbiased: Even Values)'
% overflow - Overflow mode
%            1 = 'Wrap'
%            2 = 'Saturate'
% mult_latency = Latency to use for the underlying real multipliers.
% add_latency = Latency to use for the underlying real adders.

  % Unlink this block
  set_param(blk,'LinkStatus','none');

  % Bail out if state matches parameters
  if ~save_state(blk,'cmpy4_init',n_bits_b,bin_pt_b,n_bits_w,bin_pt_w, ...
      n_bits_bw,bin_pt_bw,quantization,overflow, ...
      mult_latency,add_latency,varargin{:})
    return
  end

  conv_latency=0;

  switch quantization
    case 1
      qparam='Truncate';
      qstr='truncate';
    case 2
      qparam = 'Round  (unbiased: +/- Inf)';
      qstr='round inf';
      conv_latency=3;
    otherwise
      qparam = 'Round  (unbiased: Even Values)';
      qstr='round even';
      conv_latency=3;
  end

  switch overflow
    case 1
      oparam='Wrap';
      ostr='wrap';
    otherwise
      oparam = 'Saturate';
      ostr='saturate';
      conv_latency=3;
  end

  latency=mult_latency+add_latency+conv_latency;

  set_param(find_by_name(blk,'Delay'),'latency',num2str(latency));
  set_param(find_by_name(blk,'Delay1'),'latency',num2str(latency));

  % If overflow mode is "wrap", do the wrap for free in the multipliers
  % and post-multiply adders to save bits.
  wrapables={'rere','imim','imre','reim','sub_re','add_im'};
  if overflow == 1
    bin_pt_wrap=bin_pt_b+bin_pt_w;
    n_bits_wrap=(n_bits_bw-bin_pt_bw)+bin_pt_wrap;

    for name=wrapables
      set_param(find_by_name(blk,name{1}), ...
        'precision',    'User Defined', ...
        'arith_type',   'Signed  (2''s comp)', ...
        'n_bits',        num2str(n_bits_wrap), ...
        'bin_pt',        num2str(bin_pt_wrap), ...
        'quantization', 'Truncate', ...
        'overflow',     'Wrap');
    end
  else
    for name=wrapables
      set_param(find_by_name(blk,name{1}),'precision','Full');
    end
  end

  set_param(find_by_name(blk,'rere'),'latency',num2str(mult_latency));
  set_param(find_by_name(blk,'imim'),'latency',num2str(mult_latency));
  set_param(find_by_name(blk,'imre'),'latency',num2str(mult_latency));
  set_param(find_by_name(blk,'reim'),'latency',num2str(mult_latency));

  set_param(find_by_name(blk,'sub_re'),'latency',num2str(add_latency));
  set_param(find_by_name(blk,'add_im'),'latency',num2str(add_latency));

  for name={'convert_re','convert_im'}
    set_param(find_by_name(blk,name{1}), ...
      'n_bits',       num2str(n_bits_bw), ...
      'bin_pt',       num2str(bin_pt_bw), ...
      'quantization', qparam, ...
      'overflow',     oparam, ...
      'latency',      num2str(conv_latency));
  end

  update_block(blk,'c_to_ri','c_to_ri', ...
    'c_to_ri_init',n_bits_b,bin_pt_b,varargin{:});

  update_block(blk,'c_to_ri1','c_to_ri', ...
    'c_to_ri_init',n_bits_w,bin_pt_w,varargin{:});

  update_block(blk,'ri_to_c','ri_to_c', ...
    'ri_to_c_init',varargin{:});

  % Back populate mask parameter values
  mv={};
  mv{1}=num2str(n_bits_b);
  mv{2}=num2str(bin_pt_b);
  mv{3}=num2str(n_bits_w);
  mv{4}=num2str(bin_pt_w);
  mv{5}=num2str(n_bits_bw);
  mv{6}=num2str(bin_pt_bw);
  mv{7}=num2str(qparam);
  mv{8}=num2str(oparam);
  mv{9}=num2str(mult_latency);
  mv{10}=num2str(add_latency);
  backpopulate_mask(blk,mv);

  % Set attribute format string (block annotation)
  annotation=sprintf('%d_%d * %d_%d ==> %d_%d\n%s, %s\n4 mults', ...
    n_bits_b,bin_pt_b,n_bits_w,bin_pt_w,n_bits_bw,bin_pt_bw,qstr,ostr);
  set_param(blk,'AttributesFormatString',annotation);

  % Maybe munge block
  munge_block(blk,varargin{:});
