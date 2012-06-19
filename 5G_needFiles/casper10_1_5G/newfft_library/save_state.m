function saved = save_state(blk,varargin)
% Saves blk's new state if it differs from the current state.
%
% saved = save_state(blk,varargin)
%
% blk = The block to check
% varargin = The things to compare.
%
% The compares the block's UserData parameter with the contents of
% varargin.  If they match, this function returns false.  If they do not
% match, the block's UserData parameter is updated with the contents of
% varargin, the block's UserDataPersistent parameter is set to 'on',
% and this function returns true.

  saved=0;
  match=same_state(blk,varargin{:});

  if ~match
    set_param(blk,'UserData',varargin);
    set_param(blk,'UserDataPersistent','on');
    saved=1;
  end
