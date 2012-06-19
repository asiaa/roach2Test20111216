function twiddle_1_init(blk,varargin)
% Breaks link to blk
%
% twiddle_1_init(blk)
%

  set_param(blk,'LinkStatus','none');

  % Bail out if state matches parameters
  if ~save_state(blk,'twiddle_1_init',varargin{:})
    return
  end

  % Maybe munge block
  munge_block(blk,varargin{:});
