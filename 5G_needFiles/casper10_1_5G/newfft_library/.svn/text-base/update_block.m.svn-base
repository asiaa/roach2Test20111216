function [varargout]=update_block(sys,dest,src,init,varargin)
% Replaces SYS/DEST with SRC
%
% update_block(sys,dest,src,init,varargin)
%
% sys = system in which dest exists
% dest = destination block
% src = source block
% init = name of initialization function
% varargin = arguments to be passed to initialization function
%
% varargout = outputs from initialization function
%
% This function updates sys/dest with src if and only if the current state
% of sys/dest is different from the desired state (as specified by init and
% varargin).  The current state is taken from sys/dest's UserData parameter
% (using the same_state function).

  varargout=cell(1,nargout);

  blk=find_by_name(sys,dest);
  
  if same_state(blk,init,varargin{:})
    return;
  end

  % If src is not absolute, look it up using find_by_name
  if length(strfind(src,'/')) == 0
    src=find_by_name('',src);
  end

  replace_block(sys,'LookUnderMasks','on','FollowLinks','on', ...
    'SearchDepth',1,'Parent',sys,'Name',dest,src,'noprompt');

  set_param(blk,'MaskInitialization','');

  % Call initialization function
  %varargout=cell(1,nargout);
  %[varargout{:}]=feval(init,blk,varargin{:});
  if nargout
    [varargout{:}]=feval(init,blk,varargin{:});
  else
    feval(init,blk,varargin{:});
  end
