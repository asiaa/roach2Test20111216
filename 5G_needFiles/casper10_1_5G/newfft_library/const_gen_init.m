function const_gen_init(blk,coef,n_bits,bin_pt,varargin)
% Configure a const_gen_init block
%
% const_gen_init(blk, coef, n_bits, bin_pt )
%
% blk = Block to configure
% coef = The double precision value to ouput as (signed) fixed point.
% n_bits = Specifies the bit width of the coefficient.
% bin_pt = Specifies the binary point location in the coefficient.

  % Unlink this block
  set_param(blk,'LinkStatus','none');

  % Bail out if state matches parameters
  if ~save_state(blk,'const_gen_init',coef,n_bits,bin_pt,varargin{:})
    return
  end

  cval=round(coef*2^bin_pt)/2^bin_pt;
  maxval=(2^(n_bits-1)-1)/(2^bin_pt);
  minval=-(2^(n_bits-1));
  cval=max(minval,min(cval,maxval));

  set_param(find_by_name(blk,'constant'), ...
      'const',mat2str(cval), ...
      'n_bits',num2str(n_bits), ...
      'bin_pt',num2str(bin_pt) );

  % Back populate mask parameter values
  mv={};
  mv{1}=mat2str(coef);
  mv{2}=num2str(n_bits);
  mv{3}=num2str(bin_pt);
  backpopulate_mask(blk,mv);

  % Set attribute format string (block annotation)
  annotation=sprintf('coef = %g\n%d_%d out',cval,n_bits,bin_pt);
  set_param(blk,'AttributesFormatString',annotation);

  % Maybe munge block
  munge_block(blk,varargin{:});
