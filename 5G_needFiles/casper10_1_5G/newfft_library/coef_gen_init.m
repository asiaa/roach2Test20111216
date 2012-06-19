function used_bram=coef_gen_init(blk, ...
  coefs,n_bits,bin_pt,log2_cpc,use_bram,varargin)
% Configure a coef_gen_init block
%
% coef_gen_init(blk, coefs, n_bits, bin_pt, log2_cpc, use_bram )
%
% blk = Block to configure
% coefs = A vector of real doubles to ouput as (signed) fixed point.
% n_bits = Specifies the bit width of the coefficient.
% log2_cpc = Specifies the log2 value of cycles per coefficient.
% bin_pt = Specifies the binary point location in the coefficient.
% use_bram = Flag to select BRAM (use_bram true) or distributed memory.
%
% used_bram = Flag indicating whether BRAM was used (requests for small
%             BRAMs will be overridden).

  % Unlink this block
  set_param(blk,'LinkStatus','none');

  depth=length(coefs);

  % Don't use BRAM for small number of coefs
  if depth <= 16
    used_bram=0;
  else
    used_bram=use_bram;
  end

  % Bail out if state matches parameters
  if ~save_state(blk,'coef_gen_init', ...
      coefs,n_bits,bin_pt,log2_cpc,use_bram,varargin{:})
    return
  end

  use_bram=used_bram;

  dist_mem='on';
  if use_bram
    dist_mem='off';
  end

  addr_bits=nextpow2(depth);
  cnt_to=depth*2^log2_cpc-1;
  cnt_type='Count Limited';
  if 2^addr_bits==nextpow2(depth)
    cnt_type='Free Running';
  end

  cvals=round(coefs*2^bin_pt)/2^bin_pt;
  maxval=(2^(n_bits-1)-1)/(2^bin_pt);
  minval=-(2^(n_bits-1));
  cvals=max(minval,min(cvals,maxval));

  set_param(find_by_name(blk,'Counter'), ...
      'cnt_type',cnt_type, ...
      'cnt_to',num2str(cnt_to), ...
      'n_bits',num2str(addr_bits+log2_cpc));

  set_param(find_by_name(blk,'addr_sel'),'nbits',num2str(addr_bits));

  mems=find_system(blk,'LookUnderMasks','all','FollowLinks','on', ...
    'SearchDepth',1,'RegExp','on','Name','^mem');
  for k=1:length(mems)
    set_param(mems{k}, ...
        'depth',num2str(depth), ...
        'initVector',mat2str(cvals), ...
        'n_bits',num2str(n_bits), ...
        'bin_pt',num2str(bin_pt), ...
        'distributed_mem',dist_mem);
  end

  % Back populate mask parameter values
  mv={};
  mv{1}=mat2str(coefs);
  mv{2}=num2str(n_bits);
  mv{3}=num2str(bin_pt);
  mv{4}=num2str(log2_cpc);
  if used_bram
    mv{5}='on';
    mem_type='bram';
  else
    mv{5}='off';
    mem_type='dist';
  end
  backpopulate_mask(blk,mv);

  % Set attribute format string (block annotation)
  annotation=sprintf('%d coefs in %s\n%d_%d out/%d', ...
      depth,mem_type,n_bits,bin_pt,2^log2_cpc);
  set_param(blk,'AttributesFormatString',annotation);

  % Maybe munge block
  munge_block(blk,varargin{:});
