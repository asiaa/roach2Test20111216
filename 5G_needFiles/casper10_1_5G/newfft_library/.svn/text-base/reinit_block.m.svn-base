function [varargout]=reinit_block(blk)
% Reinitializes a block based on the contents of its UserData parameter
%
% [varargout]=reinit_block(blk)
%
% blk = The block to reinitialize.

  varargout=cell(1,nargout);

  ud=get_param(blk,'UserData');

  if ~iscell(ud) || isempty(ud)
    error(['UserData parameter of ' blk ' is not valid.']);
  end

  set_param(blk,'UserData','');

  if nargout
    [varargout{:}]=feval(ud{1},blk,ud{2:end});
  else
    feval(ud{1},blk,ud{2:end});
  end
