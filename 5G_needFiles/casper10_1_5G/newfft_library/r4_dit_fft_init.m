function r4_dit_fft_init(sys,n_stages,n_bits,bin_pt,shifts,commutator_bram, ...
  twiddle_bram,n_bits_w,mult_latency,add_latency, ...
  commute_output,output_order,varargin)
% Build a Radix-4 Quadplex FFT within a subsystem.
%
% r4_dit_fft_init(sys, n_stages, n_bits, bin_pt, shifts, commutator_bram, ...
%                 twiddle_bram, n_bits_w, mult_latency, ...
%                 add_latency, commute_output, output_order)
%
% sys = The subsystem to contain the FFT.  Must have 5 inports and 5 outports.
% n_stages = Number of radix-4 stages
% n_bits = Number of Bits In.  Specifies the width of the real/imaginary
%          components of the inputs.  Assumed equal for both components.
% bin_pt = Binary Point In/Out.  Specifies the binary point position of the
%          real/imaginary components of the inputs and outputs.  Assumed
%          equal for both components.
% shifts = A "shifting schedule" vector specifying how many bits to shift by at
%          each stage.  Missing values are assumed to be zero; extra values are
%          ignored.
% commutator_bram = Number of stages that will use BRAM for commutator memory.
% twiddle_bram = Number of stages that will use BRAM for twiddle coefficients.
% n_bits_w = Twiddle Coefficient Bitwidth.  Specifies the width of the
%            real/imaginary components of the twiddle coefficients.
%            Assumed equal for both components.
% mult_latency = Latency to use for the underlying real multipliers.
% add_latency = Latency to use for the underlying real adders.
% commute_output = Flag indicating whether to commute the output (i.e.
%                  follow fft with a biplex_commutator).  See help for
%                  r2_dit_fft block.  1="No", 2="Yes (SLR16)", 3="Yes (BRAM)"
% output_order = Indicates whether to output in bit reversed or normal order.
%              1 = Output in bit reversed order (no extra resources).
%              2 = Output in normal order (uses extra resoruces).

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
  if length(ins) ~= 5
    msg=[sys, ' does not have 5 inports.'];
    error(msg);
  end
  if length(outs) ~= 5
    msg=[sys, ' does not have 5 outports.'];
    error(msg);
  end

  % Bail out if state matches parameters
  if ~save_state(sys,'r4_dit_fft_init',n_stages,n_bits,bin_pt,shifts,...
      commutator_bram,twiddle_bram,n_bits_w,mult_latency,add_latency, ...
      commute_output,output_order,varargin{:})
    return
  end

  % Build string for block annotation before n_bits changes
  annotation=sprintf('%d points\n%d_%d r/i in\n%d_%d twiddles', ...
    4^n_stages,n_bits,bin_pt,n_bits_w,n_bits_w-2);

  % Pad shifts
  shifts=[reshape(shifts,1,[]) zeros(1,n_stages)];

  % Delete all but the ports
  delete_contents(sys,{'Inport','Outport'});
  
  % Init position components
  x=100; y=50;
  w=100; h=80;
  dx=150;
  % Inport/outport positions
  ipp=[25 13 55 27]; dipp=[0 35 0 35];
  opp=[x+dx*n_stages 13 x+dx*n_stages+30 27]; dopp=[0 35 0 35];
  if commute_output > 1
    opp=opp+[dx 0 dx 0];
  end
  if output_order > 1
    opp=opp+[dx 0 dx 0];
  end

  % Rename TODO(and reposition) the ports
  for k=1:5
    switch get_param(ins{k},'Port')
      case '1', set_param(ins{k},'Name','a_in','Position',ipp);
      case '2', set_param(ins{k},'Name','b_in','Position',ipp+dipp);
      case '3', set_param(ins{k},'Name','c_in','Position',ipp+2*dipp);
      case '4', set_param(ins{k},'Name','d_in','Position',ipp+3*dipp);
      case '5', set_param(ins{k},'Name','sync_in','Position',ipp+4*dipp);
    end
    switch get_param(outs{k},'Port')
      case '1', set_param(outs{k},'Name','a_out','Position',opp);
      case '2', set_param(outs{k},'Name','b_out','Position',opp+dopp);
      case '3', set_param(outs{k},'Name','c_out','Position',opp+2*dopp);
      case '4', set_param(outs{k},'Name','d_out','Position',opp+3*dopp);
      case '5', set_param(outs{k},'Name','sync_out','Position',opp+4*dopp);
    end
  end

  % Init connection names
  out_a = 'a_in/1';
  out_b = 'b_in/1';
  out_c = 'c_in/1';
  out_d = 'd_in/1';
  out_s = 'sync_in/1';

  % Add FFT stages
  src=find_by_name('','r4_dit_stage');
  for cur_stage=1:n_stages
    blk=['r4_dit_stage_',num2str(cur_stage)];

    % Add block
    %disp(['Adding stage ' num2str(cur_stage)]);
    add_block(src,[sys,'/',blk],'Position',[x,y,x+w,y+h]);
    %disp(['Added stage ' num2str(cur_stage)]);

    % Figure out whether to use BRAM anywhere in this stage
    cur_commutator_bram=(cur_stage<=commutator_bram);
    cur_twiddle_bram=(n_stages-cur_stage<twiddle_bram);

    % Warn if n_bits exceeds 18
    if n_bits > 18
      msg=sprintf('Stage %d: number of input bits exceeds 18.',cur_stage);
      warning(msg);
    end

    % Init block
    r4_dit_stage_init([sys,'/',blk],n_stages,cur_stage,n_bits,bin_pt, ...
      shifts(cur_stage),cur_commutator_bram,cur_twiddle_bram,n_bits_w, ...
      mult_latency,add_latency,varargin{:});
    %disp(['Inited stage ' num2str(cur_stage)]);

    % Connect inputs
    in_a=[blk,'/1'];
    in_b=[blk,'/2'];
    in_c=[blk,'/3'];
    in_d=[blk,'/4'];
    in_s=[blk,'/5'];
    add_line(sys,out_a,in_a); out_a=in_a;
    add_line(sys,out_b,in_b); out_b=in_b;
    add_line(sys,out_c,in_c); out_c=in_c;
    add_line(sys,out_d,in_d); out_d=in_d;
    add_line(sys,out_s,in_s); out_s=in_s;

    % Increment x and n_bits, decrement bin_pt
    x=x+dx;
    n_bits=n_bits+2-shifts(cur_stage);
    bin_pt=bin_pt-shifts(cur_stage);
  end

  % Setup for a bit-reverse crossover of the four outputs
  tmp=out_c;
  out_c=out_b;
  out_b=tmp;

  % Add quadplex_commutator
  if commute_output > 1
    src=find_by_name('','quadplex_commutator');
    blk='quadplex_commutator';

    % Add block
    add_block(src,[sys,'/',blk],'Position',[x,y,x+w,y+h]);

    % Init block
    quadplex_commutator_init([sys,'/',blk],n_stages,n_bits, ...
      commute_output==3, varargin{:});

    % Connect inputs
    in_a=[blk,'/1'];
    in_b=[blk,'/2'];
    in_c=[blk,'/3'];
    in_d=[blk,'/4'];
    in_s=[blk,'/5'];
    add_line(sys,out_a,in_a); out_a=in_a;
    add_line(sys,out_b,in_b); out_b=in_b;
    add_line(sys,out_c,in_c); out_c=in_c;
    add_line(sys,out_d,in_d); out_d=in_d;
    add_line(sys,out_s,in_s); out_s=in_s;

    % Increment x
    x=x+dx;
  end 

  % Add quadplex_bitrev
  if output_order > 1 && n_stages > 1
    src=find_by_name('','quadplex_bitrev');
    blk='quadplex_bitrev';

    % Add block
    add_block(src,[sys,'/',blk],'Position',[x,y,x+w,y+h]);

    % Init block
    quadplex_bitrev_init([sys,'/',blk],2*(n_stages-1),n_bits,varargin{:});

    % Connect inputs
    in_a=[blk,'/1'];
    in_b=[blk,'/2'];
    in_c=[blk,'/3'];
    in_d=[blk,'/4'];
    in_s=[blk,'/5'];
    add_line(sys,out_a,in_a); out_a=in_a;
    add_line(sys,out_b,in_b); out_b=in_b;
    add_line(sys,out_c,in_c); out_c=in_c;
    add_line(sys,out_d,in_d); out_d=in_d;
    add_line(sys,out_s,in_s); out_s=in_s;

    % Increment x
    x=x+dx;
  end 

  % Connect outports
  add_line(sys,out_a,'a_out/1');
  add_line(sys,out_b,'b_out/1');
  add_line(sys,out_c,'c_out/1');
  add_line(sys,out_d,'d_out/1');
  add_line(sys,out_s,'sync_out/1');

  % Set attribute format string (block annotation)
  set_param(sys,'AttributesFormatString',annotation);
