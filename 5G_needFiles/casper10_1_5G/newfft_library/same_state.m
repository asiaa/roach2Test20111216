function match = same_state(blk,varargin)
% Determines if a block's state matches the arguments.
%
%
% blk = The block to check
% varargin = The things to compare.
%
% The compares the block's UserData parameter with the contents of
% varargin.  If they match, this function returns true.  If they do not
% match, this function returns false.

  % Get block's UserData parameters
  state=get_param(blk,'UserData');

  % Assume match if both zero length
  match=(length(state)==0 && length(varargin)==0);
  
  % If state is a cell of the same length as varargin
  if iscell(state) && length(state) == length(varargin)
    % Assume they do match
    match=1;
    for k=1:length(state)
      if ~strcmp(mat2str(state{k}),mat2str(varargin{k}))
        match=0;
        %disp([mat2str(state{k}) ' != ' mat2str(varargin{k})]);
        break;
      %else
      %  disp([mat2str(state{k}) ' == ' mat2str(varargin{k})]);
      end
    end
  end
