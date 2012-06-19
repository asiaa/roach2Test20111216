function ri_to_c_init(blk,varargin)
% Breaks link to blk
%
% ri_to_c_init(blk)
%

  set_param(blk,'LinkStatus','none');

  % Bail out if state matches parameters
  if ~save_state(blk,'ri_to_c_init',varargin{:})
    return
  end

  % Maybe munge block
  munge_block(blk,varargin{:});
