function bit_reverse_init(blk,n_bits,varargin)
% Initialize and populate a bit_reverse block.
%
%
% blk = The bit_reverse block
% n_bits = The number of input bits to reverse

  % Unlink this block
  set_param(blk,'LinkStatus','none');

  % Bail out if state matches parameters
  if ~save_state(blk,'bit_reverse_init',n_bits,varargin{:})
    return
  end

  % Delete all but the ports
  delete_contents(blk,{'Inport','Outport'});
  
  if n_bits <= 1,
    add_line(blk,['in/1'],['out/1']);
  else,
    add_block('xbsIndex_r3/Concat',[blk, '/concat'], ...
      'Position',[450 100 500 100+n_bits*20],'num_inputs',num2str(n_bits));  
    %for i=0:n_bits-1,
    for i=n_bits-1:-1:0,
      bitname=['bit' num2str(i)];
      add_block('xbsIndex_r3/Slice', [blk,'/',bitname], ...
        'Position',[100 100+i*40 140 120+i*40], ...
        'mode','Lower Bit Location + Width', ...
        'nbits', '1', 'bit0', num2str(i));
      add_line(blk,['in/1'],[bitname,'/1'],'autorouting','on');
      add_line(blk,[bitname,'/1'],['concat/',num2str(i+1)],'autorouting','on');
    end
    add_line(blk,['concat/1'],['out/1'],'autorouting','on');
  end

  % Back populate mask parameter values
  mv={};
  mv{1}=num2str(n_bits);
  backpopulate_mask(blk,mv);

  % Set attribute format string (block annotation)
  annotation=sprintf('%d bits',n_bits);
  set_param(blk,'AttributesFormatString',annotation);

  % Maybe munge block
  munge_block(blk,varargin{:});
