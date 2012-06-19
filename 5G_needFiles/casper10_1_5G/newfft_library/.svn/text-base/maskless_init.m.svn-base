function maskless_init(blk,varargin)
% Breaks link to blk
%
% maskless_init(blk)
%

  set_param(blk,'LinkStatus','none');

  % Bail out if state matches parameters
  if ~save_state(blk,'maskless_init',varargin{:})
    return
  end

  % Maybe munge block
  munge_block(blk,varargin{:});
