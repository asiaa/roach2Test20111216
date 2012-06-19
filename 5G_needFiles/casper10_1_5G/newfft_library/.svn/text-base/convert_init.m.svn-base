function convert_init(blk,bin_pt_in, ...
    n_bits_out,bin_pt_out,quantization,overflow,latency,varargin)
% Configure a convert block
%
% convert_init(blk, bin_pt_in, ...
%   n_bits_out, bin_pt_out, quantization, overflow, latency)
%
% blk = Block to configure
% bin_pt_in = Specifies the binary point of the real/imag input components.
% n_bits_out = Specifies the width of the real/imaginary output components.
% bin_pt_out = Specifies the binary point of the real/imag output components.
% quantization = Quantization mode
%                1 = 'Truncate'
%                2 = 'Round  (unbiased: +/- Inf)'
%                3 = 'Round  (unbiased: Even Values)'
%                4 = 'Round  (unbiased: Zero)'
%                5 = 'Round  (unbiased: Odd Values)'
%                6 = 'Round  (biased: Up)'
%                7 = 'Round  (biased: Down)'
% overflow = Overflow mode
%            1 = 'Wrap'
%            2 = 'Saturate'
% latency = The latency of the underlying adder block.

  % If bin_pt_out == bin_pt_in, set quantization mode to truncate
  if bin_pt_out == bin_pt_in
    quantization = 1;
  end

  % Unlink this block
  try set_param(blk,'LinkStatus','none'); catch; end;

  % Bail out if state matches parameters
  if ~save_state(blk,'convert_init',bin_pt_in, ...
      n_bits_out,bin_pt_out,quantization,overflow,latency,varargin{:})
    return
  end

  % Calc number of fractional bits that will be chopped
  chop=bin_pt_in-bin_pt_out;

  % Setup some defaults for round to even
  qparam = 'Round  (unbiased: Even Values)';
  qstr='round even';
  slice_base0='LSB of Input';
  slice_bit0=chop;
  tweak_op='AND';
  almost_half=2^chop-1;

  % Override above defaults based on quantization mode
  switch quantization
    case 1
      qparam='Truncate';
      qstr='truncate';
      tweak_op='NOR';
      almost_half=0;
    case 2
      qparam = 'Round  (unbiased: +/- Inf)';
      qstr='round inf';
      slice_base0='MSB of Input';
      slice_bit0=0;
      tweak_op='XOR';
    % case 3
    case 4
      qparam = 'Round  (unbiased: Zero)';
      qstr='round zero';
      slice_base0='MSB of Input';
      slice_bit0=0;
    case 5
      qparam = 'Round  (unbiased: Odd Values)';
      qstr='round odd';
      tweak_op='XOR';
    case 6
      qparam = 'Round  (biased: Up)';
      qstr='round half up';
      tweak_op='OR';
    case 7
      qparam = 'Round  (biased: Down)';
      qstr='round half down';
      tweak_op='NOR';
  end

  % Setup bit slice
  set_param(find_by_name(blk,'bit'), ...
    'base0', slice_base0, ...
    'bit0', num2str(slice_bit0));

  % Setup tweak
  set_param(find_by_name(blk,'tweak_op'), ...
    'logical_function', tweak_op);

  % Setup almost_half
  set_param(find_by_name(blk,'almost_half'), ...
    'const', num2str(almost_half), ...
    'n_bits', num2str(bin_pt_in+1));

  % Setup force blocks
  for name={'force1','force2'}
    set_param(find_by_name(blk,name{1}), ...
      'bin_pt', num2str(bin_pt_in+1));
  end

  switch overflow
    case 1
      oparam='Wrap';
      ostr='wrap';
    otherwise
      oparam = 'Saturate';
      ostr='saturate';
  end

  % Setup adder
  set_param(find_by_name(blk,'adder'), ...
    'n_bits', num2str(n_bits_out), ...
    'bin_pt', num2str(bin_pt_out), ...
    'overflow', oparam, ...
    'latency', num2str(latency));

  % Back populate mask parameter values
  mv={};
  mv{1}=num2str(bin_pt_in);
  mv{2}=num2str(n_bits_out);
  mv{3}=num2str(bin_pt_out);
  mv{4}=qparam;
  mv{5}=oparam;
  mv{6}=num2str(latency);
  backpopulate_mask(blk,mv);

  % Set attribute format string (block annotation)
  annotation=sprintf('N_%d ==> %d_%d\n%s, %s\nlatency = %d', ...
    bin_pt_in,n_bits_out,bin_pt_out,qstr,ostr,latency);
  set_param(blk,'AttributesFormatString',annotation);

  % Maybe munge block
  munge_block(blk,varargin{:});
