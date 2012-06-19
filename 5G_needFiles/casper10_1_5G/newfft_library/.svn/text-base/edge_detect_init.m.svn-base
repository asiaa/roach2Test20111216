function edge_detect_init(blk,edge,polarity,varargin)
% Configure an edge_detect block
%
% edge_detect(blk, edge, polarity)
%
% blk = Block to configure
% edge = Edge to detect
%                1 = 'Rising'
%                2 = 'Falling'
%                3 = 'Both'
% polarity = Output polarity
%                1 = 'Active High'
%                2 = 'Active Low'

  % Unlink this block
  try set_param(blk,'LinkStatus','none'); catch; end;

  % Bail out if state matches parameters
  if ~save_state(blk,'edge_detect_init',edge,polarity,varargin{:})
    return
  end

  % Setup defaults
  edge_param='Rising';
  edge_str='rising edge';
  polarity_param='Active High';
  edge_op='NOR';
  switch 10*edge+polarity
    %case 11 % Rising/High
    case 12 % Rising/Low
      polarity_param='Active Low';
      edge_op='OR';
    case 21 % Falling/High
      edge_param='Falling';
      edge_str='falling edge';
      edge_op='AND';
    case 22 % Falling/Low
      edge_param='Falling';
      edge_str='falling edge';
      polarity_param='Active Low';
      edge_op='NAND';
    case 31 % Both/High
      edge_param='Both';
      edge_str='both edges';
      edge_op='XNOR';
    case 32 % Both/Low
      edge_param='Both';
      edge_str='both edges';
      polarity_param='Active Low';
      edge_op='XOR';
  end
  
  % Setup edge_op
  set_param(find_by_name(blk,'edge_op'), ...
    'logical_function', edge_op);

  % Back populate mask parameter values
  mv=get_param(blk,'MaskValues');
  mv{1}=edge_param;
  mv{2}=polarity_param;
  backpopulate_mask(blk,mv);

  % Set attribute format string (block annotation)
  annotation=sprintf('%s\n%s', edge_str, lower(polarity_param));
  set_param(blk,'AttributesFormatString',annotation);

  % Maybe munge block
  munge_block(blk,varargin{:});
