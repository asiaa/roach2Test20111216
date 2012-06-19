function munge_block(blk,varargin)
% Performs various munges on a block.
%
% munge_block(blk,varargin)
%
% blk - The block whose mask will be dumbed down or turned off
% varargin - A cell array of strings indicating the munges to do.
%
% Supported munges:
%
% 'dumbdown'
%
%   Dumbing down a block's mask makes the block's mask informative only;
%   the mask can no longer be used to configure the subsystem.  Here is
%   a list of what happens to a mask that is dumbed down...
%
%   o MaskInitialization code is deleted.
%   o All mask parameters are marked as disabled, non-tunable, and
%     do-not-evaluate. 
%
% 'unmask'
%
%   Turns off the block's mask.

  % Don't munge if blk lives in a library
  if is_library_block(blk)
    return;
  end

  % Don't munge if varargin is empty or varargin{1} is empty
  if isempty(varargin), return, end
  if isempty(varargin{1}), return, end

  % Loop through varargin and take appropriate actions
  for k=1:length(varargin)
    switch varargin{k}
      case 'dumbdown'
        % Nuke any mask initialization code
        set_param(blk,'MaskInitialization','');
        % Make mask params disabled
        mes=get_param(blk,'MaskEnableString');
        mes=strrep(mes,'on','off');
        set_param(blk,'MaskEnableString',mes);
        % Make mask params non-tunable
        mtvs=get_param(blk,'MaskTunableValueString');
        mtvs=strrep(mtvs,'on','off');
        set_param(blk,'MaskTunableValueString',mtvs);
        % Make mask params literal (non-evaluated)
        mv=get_param(blk,'MaskVariables');
        mv=strrep(mv,'@','&');
        set_param(blk,'MaskVariables',mv);
      case 'unmask'
        set_param(blk,'Mask','off');
    end
  end
