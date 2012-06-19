function mult_add_init(blk, mult_latency,add_latency,add_bypass,varargin)
% Configure a mult_add block
%
% mult_add_init(blk, mult_latency, add_latency, add_bypass)
%
% blk = Block to configure
% mult_latency = Latency to use for the underlying real multipliers.
% add_latency = Latency to use for the underlying real adders.
% add_bypass = Flag to bypass the add operation.
%
% Total latency if blk will be mult_latency+add_latency*(add_bypass==0)

  % Unlink this block
  set_param(blk,'LinkStatus','none');

  % Compute latency
  latency=mult_latency+add_latency*(add_bypass==0);

  % Bail out if state matches parameters
  if ~save_state(blk,'mult_add_init', ...
      mult_latency,add_latency,add_bypass,varargin{:})
    return
  end

  % Find terminator (if present it means that adder is currently bypassed.
  term=find_by_name(blk,'Terminator');

  if add_bypass && isempty(term)
    % Bypass adder
    delete_line(blk,'add/1','out/1');
    add_line(blk,'mult/1','out/1','autorouting','on');
    xlAddTerms(blk);
  elseif ~add_bypass && ~isempty(term)
    % Reconnect adder
    delete_line(blk,'mult/1','out/1');
    delete_line(blk,'add/1','Terminator/1');
    delete_block(term);
    add_line(blk,'add/1','out/1','autorouting','on');
  end

  set_param(find_by_name(blk,'mult'),'latency',num2str(mult_latency));
  set_param(find_by_name(blk,'delay'),'latency',num2str(mult_latency));
  set_param(find_by_name(blk,'add'),'latency',num2str(add_latency));

  % Back populate mask parameter values
  mv={};
  mv{1}=num2str(mult_latency);
  mv{2}=num2str(add_latency);
  if add_bypass
    mv{3}='on';
    outstr='a*b';
  else
    mv{3}='off';
    outstr='a*b+c';
  end
  backpopulate_mask(blk,mv);

  % Set attribute format string (block annotation)
  annotation=sprintf('out = %s\nlatency = %d', outstr, latency);
  set_param(blk,'AttributesFormatString',annotation);

  % Maybe munge block
  munge_block(blk,varargin{:});
