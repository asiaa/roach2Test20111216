function breakout_box_init(blk,n_bits,bin_pt,varargin)
% Configure an r4_breakout_box
%
% r4_breakout_box_init(blk,n_bits,bin_pt,varargin)
%
% blk = Block to configure
% n_bits = Specifies the width of the real/imaginary components.
% bin_pt = Specifies the binary point location in the real/imag components.
%
% n_bits and bin_pt are assumed equal for both components and both inputs.

  % Unlink this block
  set_param(blk,'LinkStatus','none');

  % Bail out if state matches parameters
  if ~save_state(blk,'breakout_box_init',n_bits,bin_pt,varargin{:})
    return
  end

  c_to_ri_blks=find_system(blk,'LookUnderMasks','on','FollowLinks','on', ...
    'SearchDepth',1,'RegExp','on','Name','c_to_ri');

  for k=1:length(c_to_ri_blks)
    subblk=c_to_ri_blks{k};
    update_block(blk,get_param(subblk,'Name'),'c_to_ri', ...
      'c_to_ri_init',n_bits,bin_pt,varargin{:});
  end

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
