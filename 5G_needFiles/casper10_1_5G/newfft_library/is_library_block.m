function tf=is_library_block(blk)
% Returns true if blk resides in a block diagram library.
%
% tf = is_library_block( blk )
%
% blk - The block whose residency is being checked
%
% tf = True is blk lives in a block diagram library

  % Prevent infinite loops
  limit=25;

  % Find top-level
  top=blk;
  while ~strcmp(get_param(top,'Type'),'block_diagram') && limit > 0
    top=get_param(top,'Parent');
    limit=limit-1;
  end

  % Don't munge if top is a "block_diagram" and
  % and its BlockDiagramType is "library"
  if strcmp(get_param(top,            'Type'),'block_diagram') ...
  && strcmp(get_param(top,'BlockDiagramType'),'library')
    tf=true;
  else
    tf=false;
  end
