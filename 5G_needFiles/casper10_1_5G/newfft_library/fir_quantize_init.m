function fir_quantize_init(blk,n_bits_s,bin_pt_s,n_bits_o,bin_pt_o,varargin)
% Configure a fir_quantize block
%
% fir_quantize_init(blk, n_bits_s, bin_pt_s, n_bits_o, bin_pt_o )
%
% blk = Block to configure
% n_bits_s = Number of bits for input sum (overflow wraps).
% bin_pt_s = Binary point for input sum (quantization truncates).
% n_bits_o = Number of bits for output (overflow wraps).
% bin_pt_o = Binary point for output (quantization rounds to even).

  % Unlink this block
  set_param(blk,'LinkStatus','none');

  % Bail out if state matches parameters
  if ~save_state(blk,'fir_quantize_init', ...
      n_bits_s,bin_pt_s,n_bits_o,bin_pt_o,varargin{:})
    return
  end

  if bin_pt_s > bin_pt_o
    qparam='Round  (unbiased: Even Values)';
    qstr='round even';
    latency=3;
  else
    qparam='Truncate';
    qstr='truncate';
    latency=0;
  end

  update_block(blk,'c_to_ri','c_to_ri','c_to_ri_init', ...
    n_bits_s,bin_pt_s,varargin{:});

  for subname={'quantize_re','quantize_im'}
    set_param(find_by_name(blk,subname{1}), ...
        'n_bits',num2str(n_bits_o), ...
        'bin_pt',num2str(bin_pt_o), ...
        'quantization',qparam, ...
        'latency',num2str(latency));
  end

  set_param(find_by_name(blk,'delay'),'latency',num2str(latency));

  % Back populate mask parameter values
  mv={};
  mv{1}=num2str(n_bits_s);
  mv{2}=mat2str(bin_pt_s);
  mv{3}=num2str(n_bits_o);
  mv{4}=mat2str(bin_pt_o);
  backpopulate_mask(blk,mv);

  % Set attribute format string (block annotation)
  annotation=sprintf('%d_%d in\n%d_%d out\n%s',...
    n_bits_s,bin_pt_s,n_bits_o,bin_pt_o,qstr);
  set_param(blk,'AttributesFormatString',annotation);

  % Maybe munge block
  munge_block(blk,varargin{:});
