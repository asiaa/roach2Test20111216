function r2_twiddle_2_init(blk,n_stages,decimation,n_bits,varargin)
% Configure an r2_twiddle_2 block
%
% r2_twiddle_2_init(blk, n_stages, decimation, n_bits)
%
% blk = Block to configure
% n_stages = The number of total stages in the FFT.  The FFT will have
%            2^n_stages points.
% decimation = The decimation mode of the FFT (1==DIT,2==DIF).
% n_bits = Number of Bits In/Out.  Specifies the width of the
%          real/imaginary components of ports a_in, b, a_out, bw.  Assumed
%          equal for both components.

  % Unlink this block
  set_param(blk,'LinkStatus','none');

  % Bail out if state matches parameters
  if ~save_state(blk,'r2_twiddle_2_init',n_stages,decimation,n_bits,varargin{:})
    return
  end

  cnt_bits=1;
  if decimation == 1
    cnt_bits=n_stages-1;
  end
  set_param(find_by_name(blk,'Counter'),'n_bits',num2str(cnt_bits));
  set_param(find_by_name(blk,'Negate'),'n_bits',num2str(n_bits));

  update_block(blk,'c_to_ri','c_to_ri', ...
    'c_to_ri_init',n_bits,0,varargin{:});

  update_block(blk,'ri_to_c','ri_to_c', ...
    'ri_to_c_init',varargin{:});

  % Back populate mask parameter values
  mv={};
  mv{1}=num2str(n_stages);
  if decimation == 1
    mv{2}='Time';
  else
    mv{2}='Frequency';
  end
  mv{3}=num2str(n_bits);
  backpopulate_mask(blk,mv);

  % Maybe munge block
  munge_block(blk,varargin{:});
