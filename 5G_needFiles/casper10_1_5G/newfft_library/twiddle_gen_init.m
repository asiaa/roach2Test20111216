function [used_bram,depth] = twiddle_gen_init(blk,n_stages,radix, ...
    cur_stage,branch,decimation,n_bits_w,bin_pt_w,use_bram,varargin)
% Configure a twiddle_gen_c or twiddle_gen_ri block
%
% [used_bram,depth] = twiddle_gen_init(blk, n_stages, radix, cur_stage, ...
%                 branch, decimation, n_bits_w, use_bram)
%
% blk = Block to configure
% n_stages = The number of total stages in the FFT.
% radix = Radix of the FFT.  The FFT will have radix^n_stages points.
% cur_stage = The number of the current stage in which blk resides.
%             generate twiddle coefficients.  Valid values are 3 through
%             n_stages, inclusive.  Note that stages are counted from 1 to
%             n_stages for DIT (i.e. cur_stage==1 for the first stage) and
%             n_stages to 1 for DIF (i.e. cur_stage==1 for the last stage).
% branch = The butterfly branch of this twiddle_gen_{c,ri} block.  Valid
%          values are 1 through radix-1, inclusive.
% decimation = The decimation mode of the FFT (1==DIT,2==DIF).
% n_bits_w = Twiddle Coefficient Bitwidth.  Specifies the width of the
%            real/imaginary components of the twiddle coefficients.
%            Assumed equal for both components.
% bin_pt_w = Binary point position in the generated twiddles
% use_bram = Flag to select BRAM (use_bram true) or distributed memory.
%
% used_bram = Flag indicating whether BRAM was used (requests for small
%             BRAMs will be overridden).
% depth = Number of unique twiddle factors.

  % Unlink this block
  set_param(blk,'LinkStatus','none');

  w=twiddle_gen(n_stages,radix,cur_stage,decimation,n_bits_w,bin_pt_w);
  w=w(:,branch);
  depth=length(w);

  % Don't use BRAM for small number of twiddles
  if depth <= 16
    used_bram=0;
  else
    used_bram=use_bram;
  end

  % Bail out if state matches parameters
  if ~save_state(blk,'twiddle_gen_init',n_stages,radix,cur_stage,branch, ...
      decimation,n_bits_w,bin_pt_w,use_bram,varargin{:})
    return
  end

  use_bram=used_bram;

  dist_mem='on';
  if use_bram
    dist_mem='off';
  end

  addr_bits=nextpow2(depth);
  rep_bits=0;
  if decimation == 1
    % This will be added to addr_bits to get counter_bits and it
    % could be done in one step, but having broken out into two
    % steps hopefully makes things a little clearer.
    rep_bits=nextpow2(radix)*(n_stages-1)-addr_bits;
  end

  set_param(find_by_name(blk,'Counter'),'n_bits',num2str(addr_bits+rep_bits));
  set_param(find_by_name(blk,'addr_sel'),'nbits',num2str(addr_bits));

  mems=find_system(blk,'LookUnderMasks','on','FollowLinks','on', ...
    'SearchDepth',1,'RegExp','on','Name','mem_');
  for k=1:length(mems)
    mem=mems{k};
    switch get_param(mem,'Name')
      case 'mem_re'
        init_vec=mat2str(floor(w/2^n_bits_w));
        mem_bits=n_bits_w;
      case 'mem_im'
        init_vec=mat2str(mod(w,2^n_bits_w));
        mem_bits=n_bits_w;
      otherwise
        init_vec=mat2str(w);
        mem_bits=2*n_bits_w;
    end
    set_param(mem,'depth',num2str(depth));
    set_param(mem,'initVector',init_vec);
    set_param(mem,'n_bits',num2str(mem_bits));
    set_param(mem,'distributed_mem',dist_mem);
  end

  ri_to_c=find_system(blk,'LookUnderMasks','on','FollowLinks','on', ...
    'SearchDepth',1,'RegExp','on','Name','ri_to_c');
  for k=1:length(ri_to_c)
    update_block(blk,get_param(ri_to_c{k},'Name'),'ri_to_c', ...
      'ri_to_c_init',varargin{:});
  end

  % Back populate mask parameter values
  mv={};
  mv{1}=num2str(n_stages);
  mv{2}=num2str(radix);
  mv{3}=num2str(cur_stage);
  mv{4}=num2str(branch);
  if decimation == 1
    mv{5}='Time';
  else
    mv{5}='Frequency';
  end
  mv{6}=num2str(n_bits_w);
  mv{7}=num2str(bin_pt_w);
  if used_bram
    mv{8}='on';
    twiddle_delay_type='bram';
  else
    mv{8}='off';
    twiddle_delay_type='dist';
  end
  backpopulate_mask(blk,mv);

  % Set attribute format string (block annotation)
  annotation=sprintf('depth %d\ntwiddle %s',depth,twiddle_delay_type);
  set_param(blk,'AttributesFormatString',annotation);

  % Maybe munge block
  munge_block(blk,varargin{:});
