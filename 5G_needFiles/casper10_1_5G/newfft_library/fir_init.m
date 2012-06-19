function fir_init(sys,coefs,n_bits_c,bin_pt_c,n_bits_d,bin_pt_d, ...
  n_bits_o,bin_pt_o,coef_bram,delay_bram,mult_latency,add_latency,varargin)
% Build a FIR within a subsystem.
%
% fir_init(sys, coefs, n_bits_c, bin_pt_c, n_bits_d, bin_pt_d, ...
%      n_bits_o, bin_pt_o, coef_bram, delay_bram, mult_latency, add_latency )
%
% coefs = Matrix of real double(s) to use as coefficient(s).  One column per
%         tap.  Multiple rows will create a WOLA filter.
% n_bits_c = Number of bits for coefficient(s).
% bin_pt_c = Binary point for coefficient(s).
% n_bits_d = Number of bits for data
% bin_pt_d = Binary point for data
% n_bits_o = Number of bits for output (overflow wraps).
% bin_pt_o = Binary point for output (quantization truncates).
% coef_bram = Selects BRAM (coef_bram true) or distributed memory for coefs.
% delay_bram = Selects BRAM (delay_bram true) or SLR16 elements for delay.
% mult_latency = Latency to use for the underlying multiplier.
% add_latency = Latency to use for the underlying adder.

  load_system('newfft_library');

  % Don't initialize if sys lives in a library
  if is_library_block(sys)
    return;
  end

  % If link status is resolved, disable link
  if strcmp(get_param(sys,'LinkStatus'),'resolved')
    set_param(sys,'LinkStatus','inactive');
  end

  % Get ports
  ins=find_system(sys, ...
    'LookUnderMasks','on', ...
    'FollowLinks','on', ...
    'SearchDepth',1, ...
    'BlockType','Inport');
  outs=find_system(sys, ...
    'LookUnderMasks','on', ...
    'FollowLinks','on', ...
    'SearchDepth',1, ...
    'BlockType','Outport');

  % Sanity check
  if length(ins) ~= 2
    msg=[sys, ' does not have 2 inports.'];
    error(msg);
  end
  if length(outs) ~= 2
    msg=[sys, ' does not have 2 outports.'];
    error(msg);
  end

  % Bail out if state matches parameters
  if ~save_state(sys,'fir_init',coefs,n_bits_c,bin_pt_c,n_bits_d,bin_pt_d, ...
      n_bits_o,bin_pt_o,coef_bram,delay_bram, ...
      mult_latency,add_latency,varargin{:})
    return
  end

  % Get number of taps and delay
  delay=size(coefs,1);
  n_taps=size(coefs,2);

  % Delete all but the ports
  % TODO: Revert delete contents?
  delete_contents(sys,{'Inport','Outport'});
  
  % Init position components
  x=100; y=30;
  w=100; h=50;
  dx=150;
  % Inport/outport positions
  ipp=[25 13 55 27]; dipp=[0 35 0 35];
  %opp=[x+dx*(n_taps+1) 33 x+dx*(n_taps+1)+30 47]; dopp=[0 35 0 35];
  opp=[x+dx*(n_taps+1) 13 x+dx*(n_taps+1)+30 27]; dopp=[0 35 0 35];

  % Rename TODO(and reposition) the ports
  for k=1:2
    switch get_param(ins{k},'Port')
      case '1', set_param(ins{k},'Name','in','Position',ipp);
      case '2', set_param(ins{k},'Name','sync_in','Position',ipp+2*dipp);
    end
    switch get_param(outs{k},'Port')
      case '1', set_param(outs{k},'Name','out','Position',opp);
      case '2', set_param(outs{k},'Name','sync_out','Position',opp+2*dopp);
    end
  end

  % Init connection names
  out_data = 'in/1';
  out_sum=''; % Deferred until after first stage
  out_sync = 'sync_in/1';

  % Calc width and precision of intermediate sums
  % Precision is input precision + coefficient precision
  bin_pt_s=bin_pt_c+bin_pt_d;
  % Sum width is output non-fractional bits + sum fractional bits
  n_bits_s=(n_bits_o-bin_pt_o)+bin_pt_s;

  % Add FIR taps
  src=find_by_name('','fir_tap');
  for cur_tap=1:n_taps
    blk=['fir_tap_',num2str(cur_tap)];

    tap_delay=delay*(cur_tap~=n_taps);
    tap_coefs=coefs(:,cur_tap);
    add_bypass=(cur_tap==1);

    % Add block
    %disp(['Adding tap ' num2str(cur_tap)]);
    add_block(src,[sys,'/',blk],'Position',[x,y,x+w,y+h]);
    %disp(['Added tap ' num2str(cur_tap)]);

    % Init block
    fir_tap_init([sys,'/',blk],tap_delay,tap_coefs,n_bits_c,bin_pt_c, ...
      n_bits_d,bin_pt_d,n_bits_s,bin_pt_s,coef_bram,delay_bram, ...
      mult_latency,add_latency,(cur_tap==1),varargin{:});
    %disp(['Inited tap ' num2str(cur_tap)]);

    % Connect inputs
    in_data=[blk,'/1'];
    in_sum =[blk,'/2'];
    in_sync=[blk,'/3'];
    add_line(sys,out_data,in_data);
    if cur_tap > 1
      add_line(sys,out_sum ,in_sum);
    end
    add_line(sys,out_sync,in_sync);
    out_data=in_data;
    out_sum =in_sum ;
    out_sync=in_sync;

    % Increment x
    x=x+dx;
  end

  % Add fir_quantize block
  src=find_by_name('','fir_quantize');
  blk='fir_quantize';
  add_block(src,[sys,'/',blk],'Position',[x,y,x+w,y+h]);

  % Init fir_quantize block
  fir_quantize_init([sys,'/',blk], ...
    n_bits_s,bin_pt_s,n_bits_o,bin_pt_o,varargin{:});

  % Connect fir_quantize inputs.  If no taps, connect out_data to sum_in
  % Otherwise, connect sum to data out.
  if n_taps == 0
    set_param(find_by_name(sys,'in'),'Position',ipp+dipp);
    add_line(sys,out_data,[blk,'/2']);
  else
    add_line(sys,out_data ,[blk,'/1']);
    add_line(sys,out_sum ,[blk,'/2']);
  end
  add_line(sys,out_sync,[blk,'/3']);

  % Connect outports
  add_line(sys,[blk,'/1'],'out/1');
  add_line(sys,[blk,'/2'],'sync_out/1');

  % Add dummy input sum
  if n_taps>0
    % Use sampled Xilinx Constant instead of built-in Simulink Constant
    opt.SourceWith.Block='xbsIndex_r3/Constant';
    opt.SourceWith.Port='1';
    opt.Source.const='0';
    opt.Source.arith_type='Unsigned';
    opt.Source.n_bits=num2str(2*n_bits_s);
    opt.Source.bin_pt='0';
    opt.Source.explicit_period='on';
  end
  opt.RecurseSubSystems=0;
  xlAddTerms(sys,opt);

  % Build string for block annotation
  annotation=sprintf('%d taps\n%d_%d coefs\n%d_%d in\n%d_%d out', ...
    n_taps,n_bits_c,bin_pt_c,n_bits_d,bin_pt_d,n_bits_o,bin_pt_o);

  % Set attribute format string (block annotation)
  set_param(sys,'AttributesFormatString',annotation);
