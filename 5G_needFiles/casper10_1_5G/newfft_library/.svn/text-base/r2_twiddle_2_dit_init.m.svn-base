function r2_twiddle_2_dit_init(blk,n_stages,varargin)
% Configure an r2_twiddle_2_dit block
%
% r2_twiddle_2_dit_init(blk, n_stages)
%
% blk = Block to configure
% n_stages = The number of total stages in the FFT.  The FFT will have
%            2^n_stages points.

  % Unlink this block
  set_param(blk,'LinkStatus','none');

  % Bail out if state matches parameters
  if ~save_state(blk,'r2_twiddle_2_dit_init',n_stages,varargin{:})
    return
  end

  cnt_bits=n_stages-1;
  
  set_param(find_by_name(blk,'Counter'),'n_bits',num2str(cnt_bits));

  % Back populate mask parameter values
  mv={};
  mv{1}=num2str(n_stages);
  backpopulate_mask(blk,mv);

  % Maybe munge block
  munge_block(blk,varargin{:});
