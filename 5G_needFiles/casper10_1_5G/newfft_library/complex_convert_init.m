function complex_convert_init(blk,n_bits_in,bin_pt_in, ...
    n_bits_out,bin_pt_out,quantization,overflow,latency,varargin)
% Configure a complex_convert block
%
% complex_convert_init(blk, n_bits_in, bin_pt_in, ...
%   n_bits_out, bin_pt_out, quantization, overflow, latency)
%
% blk = Block to configure
% n_bits_in = Specifies the width of the real/imaginary input components.
% bin_pt_in = Specifies the binary point of the real/imag input components.
% n_bits_out = Specifies the width of the real/imaginary output components.
% bin_pt_out = Specifies the binary point of the real/imag output components.
% quantization = Quantization mode
%                1 = 'Truncate'
%                2 = 'Round  (unbiased: +/- Inf)'
%                3 = 'Round  (unbiased: Even Values)'
% overflow = Overflow mode
%            1 = 'Wrap'
%            2 = 'Saturate'
% latency = The latency of the underlying convert blocks.
%
% n_bits and bin_pt are assumed equal for both components.

  % Unlink this block
  set_param(blk,'LinkStatus','none');

  % Bail out if state matches parameters
  if ~save_state(blk,'complex_convert_init',n_bits_in,bin_pt_in, ...
      n_bits_out,bin_pt_out,quantization,overflow,latency,varargin{:})
    return
  end

  switch quantization
    case 1
      qparam='Truncate';
      qstr='truncate';
    case 2
      qparam = 'Round  (unbiased: +/- Inf)';
      qstr='round inf';
    otherwise
      qparam = 'Round  (unbiased: Even Values)';
      qstr='round even';
  end

  switch overflow
    case 1
      oparam='Wrap';
      ostr='wrap';
    otherwise
      oparam = 'Saturate';
      ostr='saturate';
  end

  update_block(blk,'c_to_ri','c_to_ri', ...
    'c_to_ri_init',n_bits_in,bin_pt_in,varargin{:});

  for name={'convert_re','convert_im'}
    set_param(find_by_name(blk,name{1}), ...
      'n_bits',       num2str(n_bits_out), ...
      'bin_pt',       num2str(bin_pt_out), ...
      'quantization', qparam, ...
      'overflow',     oparam, ...
      'latency',      num2str(latency));
  end

  update_block(blk,'ri_to_c','ri_to_c', ...
    'ri_to_c_init',varargin{:});

  % Back populate mask parameter values
  mv={};
  mv{1}=num2str(n_bits_in);
  mv{2}=num2str(bin_pt_in);
  mv{3}=num2str(n_bits_out);
  mv{4}=num2str(bin_pt_out);
  mv{5}=qparam;
  mv{6}=oparam;
  mv{7}=num2str(latency);
  backpopulate_mask(blk,mv);

  % Set attribute format string (block annotation)
  annotation=sprintf('%d_%d ==> %d_%d\n%s, %s\nlatency = %d', ...
    n_bits_in,bin_pt_in,n_bits_out,bin_pt_out,qstr,ostr,latency);
  set_param(blk,'AttributesFormatString',annotation);

  % Maybe munge block
  munge_block(blk,varargin{:});
