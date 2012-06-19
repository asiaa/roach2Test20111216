function delay_bram_init(blk,delay_depth,varargin)
% Configure a delay_bram block
%
% delay_bram_init(blk, delay_depth)
%
% blk = Block to configure
% delay_depth = Depth of the delay

  % Unlink this block
  set_param(blk,'LinkStatus','none');

  % Bail out if state matches parameters
  if ~save_state(blk,'delay_bram_init',delay_depth,varargin{:})
    return
  end

  buffer_latency=1;
  n_bits=nextpow2(delay_depth);
  cnt_to=delay_depth-buffer_latency-1;

  set_param(find_by_name(blk,'Counter'),'cnt_to','1');
  set_param(find_by_name(blk,'Counter'),'n_bits',num2str(n_bits));
  set_param(find_by_name(blk,'Counter'),'cnt_to',num2str(cnt_to));
  set_param(find_by_name(blk,'bram'),'depth',num2str(delay_depth));
  set_param(find_by_name(blk,'bram'),'latency',num2str(buffer_latency));
  

  % Back populate mask parameter values
  mv={};
  mv{1}=num2str(delay_depth);
  backpopulate_mask(blk,mv);

  % Set attribute format string (block annotation)
  annotation=sprintf('bram depth = %d',delay_depth);
  set_param(blk,'AttributesFormatString',annotation);

  % Maybe munge block
  munge_block(blk,varargin{:});
