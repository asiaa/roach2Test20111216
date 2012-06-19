function delay_slr_init(blk,delay_depth,varargin)
% Configure a delay_slr block
%
% delay_slr_init(blk, delay_depth)
%
% blk = Block to configure
% delay_depth = Depth of the delay

  % Unlink this block
  set_param(blk,'LinkStatus','none');

  % Bail out if state matches parameters
  if ~save_state(blk,'delay_slr_init',delay_depth,varargin{:})
    return
  end

  set_param(find_by_name(blk,'slr'),'latency',num2str(delay_depth));

  % Back populate mask parameter values
  mv={};
  mv{1}=num2str(delay_depth);
  backpopulate_mask(blk,mv);

  % Set attribute format string (block annotation)
  annotation=sprintf('slr depth = %d',delay_depth);
  set_param(blk,'AttributesFormatString',annotation);

  % Maybe munge block
  munge_block(blk,varargin{:});
