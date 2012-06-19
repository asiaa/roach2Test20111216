function c_to_ri_init(blk,n_bits,bin_pt,varargin)
% Configure a c_to_ri block
%
% c_to_ri_init(blk, n_bits, bin_pt)
%
% blk = Block to configure
% n_bits = Specifies the width of the real/imaginary components.
% bin_pt = Specifies the binary point location in the real/imag components.
%
% n_bits and bin_pt are assumed equal for both components.

  % Unlink this block
  set_param(blk,'LinkStatus','none');

  % Bail out if state matches parameters
  if ~save_state(blk,'c_to_ri_init',n_bits,bin_pt,varargin{:})
    return
  end

  set_param(find_by_name(blk,'slice_re'),'nbits',num2str(n_bits));
  set_param(find_by_name(blk,'force_re'),'bin_pt',num2str(bin_pt));
  set_param(find_by_name(blk,'slice_im'),'nbits',num2str(n_bits));
  set_param(find_by_name(blk,'force_im'),'bin_pt',num2str(bin_pt));

  % Back populate mask parameter values
  mv={};
  mv{1}=num2str(n_bits);
  mv{2}=num2str(bin_pt);
  backpopulate_mask(blk,mv);

  % Set attribute format string (block annotation)
  annotation=sprintf('%d_%d r/i',n_bits,bin_pt);
  set_param(blk,'AttributesFormatString',annotation);

  % Maybe munge block
  munge_block(blk,varargin{:});
