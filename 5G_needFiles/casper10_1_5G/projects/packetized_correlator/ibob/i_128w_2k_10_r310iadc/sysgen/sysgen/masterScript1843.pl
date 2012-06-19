
open(PIDFILE, '> pidfile.txt') || die 'Couldn\'t write process ID to file.';
print PIDFILE "$$\n";
close(PIDFILE);

eval {
  # Call script(s).
  my $instrs;
  my $results = [];
$ENV{'SYSGEN'} = 'C:/Xilinx/10.1/DSP_Tools/sysgen';
  use Sg;
  $instrs = {
    'HDLCodeGenStatus' => 0.0,
    'base_system_period_hardware' => 5.0,
    'base_system_period_simulink' => 1.0,
    'block_icon_display' => 'Default',
    'ce_clr' => 0.0,
    'clock_loc' => '',
    'clock_wrapper' => 'Clock Enables',
    'clocksGcd' => 1.0,
    'compilation' => 'NGC Netlist',
    'compilation_lut' => {
      'keys' => [
        'HDL Netlist',
        'NGC Netlist',
      ],
      'values' => [
        'target1',
        'target2',
      ],
    },
    'core_generation' => 1.0,
    'coregenPartFamily' => 'virtex2p',
    'coregen_part_family' => 'Virtex2P',
    'createTestbench' => 0,
    'dbl_ovrd' => -1.0,
    'dcm_input_clock_period' => 100.0,
    'deprecated_control' => 'off',
    'design' => 'i_128w_2k_10_r310iadc',
    'design_full_path' => 'D:\\casper10_1\\projects\\packetized_correlator\\ibob\\i_128w_2k_10_r310iadc.mdl',
    'device' => 'xc2vp50-7ff1152',
    'directory' => 'D:/casper10_1/projects/packetized_correlator/ibob/i_128w_2k_10_r310iadc/sysgen',
    'disregard_netlist_subystem_handles' => [
      49821.027587890625,
      49895.027587890625,
    ],
    'fileDeliveryDefaults' => [
      [
        '(?i)\\.vhd$',
        { 'fileName' => 'D:/casper10_1/projects/packetized_correlator/ibob/i_128w_2k_10_r310iadc/sysgen/sysgen/perl_results.vhd', },
      ],
      [
        '(?i)\\.v$',
        { 'fileName' => 'D:/casper10_1/projects/packetized_correlator/ibob/i_128w_2k_10_r310iadc/sysgen/sysgen/perl_results.v', },
      ],
    ],
    'fxdptinstalled' => 0.0,
    'gcc_exe' => 'C:/Xilinx/10.1/ISE/gnu/MinGW/2.0.0-3/nt/bin/gcc.exe',
    'generateUsing71FrontEnd' => 1,
    'hdlDir' => 'C:/Xilinx/10.1/DSP_Tools/common/bin/../../sysgen/hdl',
    'hdlKind' => 'vhdl',
    'incr_netlist' => 'off',
    'ise_full_version' => '10.1.03i',
    'ise_version' => '10.1i',
    'master_sysgen_token_handle' => 35464.86389160156,
    'matlab' => 'C:/Program Files/MATLAB/R2007b',
    'matlabJavaDirectory' => 'C:/Program Files/MATLAB/R2007b/sys/java/jre/win32/jre1.4.2/bin',
    'matlabPerlDirectory' => 'C:/Program Files/MATLAB/R2007b/sys/perl/win32/bin/',
    'mdlHandle' => 35460.5693359375,
    'mdlPath' => 'D:/casper10_1/projects/packetized_correlator/ibob/i_128w_2k_10_r310iadc.mdl',
    'modelDiagnostics' => [
      {
        'count' => 8010.0,
        'isMask' => 0.0,
        'type' => 'i_128w_2k_10_r310iadc Total blocks',
      },
      {
        'count' => 4.0,
        'isMask' => 0.0,
        'type' => 'Bias',
      },
      {
        'count' => 42.0,
        'isMask' => 0.0,
        'type' => 'Constant',
      },
      {
        'count' => 3.0,
        'isMask' => 0.0,
        'type' => 'DiscretePulseGenerator',
      },
      {
        'count' => 151.0,
        'isMask' => 0.0,
        'type' => 'From',
      },
      {
        'count' => 5.0,
        'isMask' => 0.0,
        'type' => 'Gain',
      },
      {
        'count' => 97.0,
        'isMask' => 0.0,
        'type' => 'Goto',
      },
      {
        'count' => 1179.0,
        'isMask' => 0.0,
        'type' => 'Inport',
      },
      {
        'count' => 8.0,
        'isMask' => 0.0,
        'type' => 'Logic',
      },
      {
        'count' => 1320.0,
        'isMask' => 0.0,
        'type' => 'Outport',
      },
      {
        'count' => 1.0,
        'isMask' => 0.0,
        'type' => 'RandomNumber',
      },
      {
        'count' => 32.0,
        'isMask' => 0.0,
        'type' => 'RelationalOperator',
      },
      {
        'count' => 4362.0,
        'isMask' => 0.0,
        'type' => 'S-Function',
      },
      {
        'count' => 7.0,
        'isMask' => 0.0,
        'type' => 'Scope',
      },
      {
        'count' => 772.0,
        'isMask' => 0.0,
        'type' => 'SubSystem',
      },
      {
        'count' => 27.0,
        'isMask' => 0.0,
        'type' => 'Terminator',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'Band-Limited White Noise.',
      },
      {
        'count' => 32.0,
        'isMask' => 1.0,
        'type' => 'Compare To Constant',
      },
      {
        'count' => 24.0,
        'isMask' => 1.0,
        'type' => 'Downsample',
      },
      {
        'count' => 24.0,
        'isMask' => 1.0,
        'type' => 'Integer Delay',
      },
      {
        'count' => 2.0,
        'isMask' => 1.0,
        'type' => 'ModelSim HDL Co-Simulation Interface Block',
      },
      {
        'count' => 8.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Accumulator Block',
      },
      {
        'count' => 210.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Adder/Subtractor Block',
      },
      {
        'count' => 119.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Arithmetic Relational Operator Block',
      },
      {
        'count' => 8.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Binary Shift Operator Block',
      },
      {
        'count' => 787.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Bit Slice Extractor Block',
      },
      {
        'count' => 2.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Black Box Block',
      },
      {
        'count' => 157.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Bus Concatenator Block',
      },
      {
        'count' => 209.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Bus Multiplexer Block',
      },
      {
        'count' => 345.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Constant Block Block',
      },
      {
        'count' => 159.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Counter Block',
      },
      {
        'count' => 313.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Delay Block',
      },
      {
        'count' => 2.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Disregard Subsystem For Generation Block',
      },
      {
        'count' => 4.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Dual Port Random Access Memory Block',
      },
      {
        'count' => 45.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Gateway In Block',
      },
      {
        'count' => 51.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Gateway Out Block',
      },
      {
        'count' => 96.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Input Scaler Block',
      },
      {
        'count' => 418.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Inverter Block',
      },
      {
        'count' => 404.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Logical Block Block',
      },
      {
        'count' => 110.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Multiplier Block',
      },
      {
        'count' => 2.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Negate Block Block',
      },
      {
        'count' => 38.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Register Block',
      },
      {
        'count' => 4.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Simulation Multiplexer Block',
      },
      {
        'count' => 50.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Single Port Random Access Memory Block',
      },
      {
        'count' => 59.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Single Port Read-Only Memory Block',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'Xilinx System Generator Block',
      },
      {
        'count' => 244.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Type Converter Block',
      },
      {
        'count' => 468.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Type Reinterpreter Block',
      },
      {
        'count' => 2.0,
        'isMask' => 1.0,
        'type' => 'adc',
      },
      {
        'count' => 8.0,
        'isMask' => 1.0,
        'type' => 'adder_tree',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'barrel_switcher',
      },
      {
        'count' => 2.0,
        'isMask' => 1.0,
        'type' => 'biplex_core',
      },
      {
        'count' => 22.0,
        'isMask' => 1.0,
        'type' => 'butterfly_direct',
      },
      {
        'count' => 86.0,
        'isMask' => 1.0,
        'type' => 'c_to_ri',
      },
      {
        'count' => 18.0,
        'isMask' => 1.0,
        'type' => 'coeff_gen',
      },
      {
        'count' => 2.0,
        'isMask' => 1.0,
        'type' => 'complex_addsub',
      },
      {
        'count' => 142.0,
        'isMask' => 1.0,
        'type' => 'convert_of',
      },
      {
        'count' => 45.0,
        'isMask' => 1.0,
        'type' => 'delay_bram',
      },
      {
        'count' => 12.0,
        'isMask' => 1.0,
        'type' => 'delay_slr',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'edge',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'edge_detect',
      },
      {
        'count' => 2.0,
        'isMask' => 1.0,
        'type' => 'fft_biplex_real_2x',
      },
      {
        'count' => 22.0,
        'isMask' => 1.0,
        'type' => 'fft_stage_n',
      },
      {
        'count' => 4.0,
        'isMask' => 1.0,
        'type' => 'first_tap',
      },
      {
        'count' => 7.0,
        'isMask' => 1.0,
        'type' => 'gpio',
      },
      {
        'count' => 4.0,
        'isMask' => 1.0,
        'type' => 'last_tap',
      },
      {
        'count' => 4.0,
        'isMask' => 1.0,
        'type' => 'pfb_add_tree',
      },
      {
        'count' => 4.0,
        'isMask' => 1.0,
        'type' => 'pfb_coeff_gen',
      },
      {
        'count' => 4.0,
        'isMask' => 1.0,
        'type' => 'pfb_fir',
      },
      {
        'count' => 5.0,
        'isMask' => 1.0,
        'type' => 'reorder',
      },
      {
        'count' => 76.0,
        'isMask' => 1.0,
        'type' => 'ri_to_c',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'square_transposer',
      },
      {
        'count' => 2.0,
        'isMask' => 1.0,
        'type' => 'sram',
      },
      {
        'count' => 36.0,
        'isMask' => 1.0,
        'type' => 'sync_delay',
      },
      {
        'count' => 5.0,
        'isMask' => 1.0,
        'type' => 'sync_delay_en',
      },
      {
        'count' => 8.0,
        'isMask' => 1.0,
        'type' => 'tap',
      },
      {
        'count' => 18.0,
        'isMask' => 1.0,
        'type' => 'twiddle_general_3mult',
      },
      {
        'count' => 2.0,
        'isMask' => 1.0,
        'type' => 'twiddle_pass_through',
      },
      {
        'count' => 2.0,
        'isMask' => 1.0,
        'type' => 'twiddle_stage_2',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'xaui',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'xsg core config',
      },
    ],
    'myxilinx' => '',
    'ngc_config' => {
      'include_cf' => 0.0,
      'include_clockwrapper' => 1.0,
    },
    'num_sim_cycles' => 1000.0,
    'package' => 'ff1152',
    'part' => 'xc2vp50',
    'partFamily' => 'virtex2p',
    'port_data_types_enabled' => 1.0,
    'preserveHierarchy' => 0.0,
    'preserve_hierarchy' => 0.0,
    'provideGlobalCEClr' => 0.0,
    'report_true_rates' => 0.0,
    'sample_time_colors_enabled' => 0.0,
    'simulation_island_subsystem_handle' => 35460.5693359375,
    'simulation_status' => 0.0,
    'simulink_accelerator_running' => 0.0,
    'simulink_debugger_running' => 0.0,
    'simulink_period' => '1',
    'speed' => '-7',
    'startTime' => '0.0',
    'start_time' => 0.0,
    'stopTime' => '1000',
    'synthesisTool' => 'XST',
    'synthesis_language' => 'vhdl',
    'synthesis_tool' => 'XST',
    'sysclk_period' => '5',
    'sysgen' => 'C:/Xilinx/10.1/DSP_Tools/common/bin/../../sysgen',
    'sysgenTokenSettings' => {
      'settings' => {
        'base_system_period_hardware' => 5.0,
        'base_system_period_simulink' => 1.0,
        'block_icon_display' => 'Default',
        'ce_clr' => 0.0,
        'clock_loc' => '',
        'clock_wrapper' => 'Clock Enables',
        'compilation' => 'NGC Netlist',
        'compilation_lut' => {
          'keys' => [
            'HDL Netlist',
            'NGC Netlist',
          ],
          'values' => [
            'target1',
            'target2',
          ],
        },
        'core_generation' => 1.0,
        'coregen_part_family' => 'Virtex2P',
        'dbl_ovrd' => -1.0,
        'dcm_input_clock_period' => 100.0,
        'deprecated_control' => 'off',
        'directory' => './i_128w_2k_10_r310iadc/sysgen',
        'incr_netlist' => 'off',
        'master_sysgen_token_handle' => 35464.86389160156,
        'ngc_config' => {
          'include_cf' => 0.0,
          'include_clockwrapper' => 1.0,
        },
        'package' => 'ff1152',
        'part' => 'xc2vp50',
        'preserve_hierarchy' => 0.0,
        'simulation_island_subsystem_handle' => 35460.5693359375,
        'simulink_period' => '1',
        'speed' => '-7',
        'synthesis_language' => 'vhdl',
        'synthesis_tool' => 'XST',
        'sysclk_period' => '5',
        'testbench' => 0,
        'trim_vbits' => 1.0,
        'xilinx_device' => 'xc2vp50-7ff1152',
        'xilinxfamily' => 'Virtex2P',
      },
    },
    'systemClockPeriod' => 5.0,
    'tempdir' => 'C:/DOCUME~1/homin/LOCALS~1/Temp',
    'testbench' => 0,
    'tmpDir' => 'D:/casper10_1/projects/packetized_correlator/ibob/i_128w_2k_10_r310iadc/sysgen/sysgen',
    'trim_vbits' => 1.0,
    'use_strict_names' => 1,
    'user_tips_enabled' => 0.0,
    'using71Netlister' => 1,
    'verilog_files' => [
      { 'source' => 'conv_pkg.v', },
      { 'source' => 'synth_reg.v', },
      { 'source' => 'synth_reg_w_init.v', },
      { 'source' => 'convert_type.v', },
      { 'source' => 'xlpersistentdff.ngc', },
    ],
    'version' => '10.1.3.1386',
    'vhdl_files' => [
      { 'source' => 'conv_pkg.vhd', },
      { 'source' => 'synth_reg.vhd', },
      { 'source' => 'synth_reg_w_init.vhd', },
      { 'source' => 'xlpersistentdff.ngc', },
    ],
    'vsimtime' => '5775.000000 ns',
    'xilinx' => 'C:/Xilinx/10.1/ISE',
    'xilinx_device' => 'xc2vp50-7ff1152',
    'xilinxfamily' => 'Virtex2P',
  };
  push(@$results, &Sg::setAttributes($instrs));
  use SgDeliverFile;
  $instrs = {
    'collaborationName' => 'conv_pkg.vhd',
    'sourceFile' => 'hdl/conv_pkg.vhd',
    'templateKeyValues' => {},
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'collaborationName' => 'synth_reg.vhd',
    'sourceFile' => 'hdl/synth_reg.vhd',
    'templateKeyValues' => {},
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'collaborationName' => 'synth_reg_w_init.vhd',
    'sourceFile' => 'hdl/synth_reg_w_init.vhd',
    'templateKeyValues' => {},
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'collaborationName' => 'xlpersistentdff.ngc',
    'sourceFile' => 'hdl/xlpersistentdff.ngc',
    'templateKeyValues' => {},
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '066df1c0506cb30edf9928a4bbb63829',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "00000000000000000010000000000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_be92234dd0',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '298203483c3de52896eed04fd75246a4',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  fully_2_1_bit <= d0_1_24 and d1_1_27;
  y <= std_logic_to_vector(fully_2_1_bit);
end',
      'crippled_entity' => 'is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'logical_80f90b97d0',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '692ad829b84fa8bd4d28dd7486e213c7',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlregister.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '40e5176899071eb7abd5648ced632f53',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlregister.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '8c63a35a8718db5ddcea29667b9e812a',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((32 - 1) downto 0);
  signal b_1_34: unsigned((32 - 1) downto 0);
  type array_type_op_mem_32_22 is array (0 to (1 - 1)) of boolean;
  signal op_mem_32_22: array_type_op_mem_32_22 := (
    0 => false);
  signal op_mem_32_22_front_din: boolean;
  signal op_mem_32_22_back: boolean;
  signal op_mem_32_22_push_front_pop_back_en: std_logic;
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  op_mem_32_22_back <= op_mem_32_22(0);
  proc_op_mem_32_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_32_22_push_front_pop_back_en = \'1\')) then
        op_mem_32_22(0) <= op_mem_32_22_front_din;
      end if;
    end if;
  end process proc_op_mem_32_22;
  result_12_3_rel <= a_1_31 = b_1_34;
  op_mem_32_22_front_din <= result_12_3_rel;
  op_mem_32_22_push_front_pop_back_en <= \'1\';
  op <= boolean_to_vector(op_mem_32_22_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((32 - 1) downto 0);
    b : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_770e12e4ab',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '279d7c3abb8c68b56d73169c0bb4658c',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '0607ba63f9c581787d7d79d5afe7d5aa',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'eef8b84698fc0b42e5c60cada37c3aa3',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'acaceb17ff82c187765a01a7d59ccd63',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '286e11e0b3341e3ba2b8455c43bb3c52',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((7 - 1) downto 0);
  signal y_2_1_concat: unsigned((8 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((7 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_83e473517e',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c57ea3080e26b91e8e84b240574965e7',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal ip_1_26: unsigned((1 - 1) downto 0);
  type array_type_op_mem_22_20 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal op_mem_22_20: array_type_op_mem_22_20 := (
    0 => "0");
  signal op_mem_22_20_front_din: unsigned((1 - 1) downto 0);
  signal op_mem_22_20_back: unsigned((1 - 1) downto 0);
  signal op_mem_22_20_push_front_pop_back_en: std_logic;
  signal internal_ip_12_1_bitnot: unsigned((1 - 1) downto 0);
begin
  ip_1_26 <= std_logic_vector_to_unsigned(ip);
  op_mem_22_20_back <= op_mem_22_20(0);
  proc_op_mem_22_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_22_20_push_front_pop_back_en = \'1\')) then
        op_mem_22_20(0) <= op_mem_22_20_front_din;
      end if;
    end if;
  end process proc_op_mem_22_20;
  internal_ip_12_1_bitnot <= std_logic_vector_to_unsigned(not unsigned_to_std_logic_vector(ip_1_26));
  op_mem_22_20_push_front_pop_back_en <= \'0\';
  op <= unsigned_to_std_logic_vector(internal_ip_12_1_bitnot);
end',
      'crippled_entity' => 'is
  port (
    ip : in std_logic_vector((1 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'inverter_e2b989a05e',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f8bcc339ab1dd4d8c279cce5e794b5e3',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: unsigned((8 - 1) downto 0);
  signal output_port_5_5_force: signed((8 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port_5_5_force <= unsigned_to_signed(input_port_1_40);
  output_port <= signed_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((8 - 1) downto 0);
    output_port : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_4389dc89bf',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c589245b6d5c7d4aaed404fc6e441d83',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '2aeb909e7ad017963bb8c51272bb33e8',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '7c7bb5cd60dc914998f9523db80049d6',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "01111110000000100";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((17 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_75c298d4bc',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  use SgGenerateCores;
  $instrs = [
    'SELECT Multiplier Virtex2P Xilinx,_Inc. 10.1',
    '# 10.1.03i',
    'CSET ccmimp = Distributed_Memory',
    'CSET clockenable = true',
    'CSET constvalue = 129',
    'CSET internaluser = 0',
    'CSET multiplier_construction = Use_Mults',
    'CSET multtype = Parallel_Multiplier',
    'CSET optgoal = Speed',
    'CSET outputwidthhigh = 15',
    'CSET outputwidthlow = 0',
    'CSET pipestages = 3',
    'CSET portatype = Signed',
    'CSET portawidth = 8',
    'CSET portbtype = Signed',
    'CSET portbwidth = 8',
    'CSET roundpoint = 0',
    'CSET sclrcepriority = CE_Overrides_SCLR',
    'CSET syncclear = true',
    'CSET use_custom_output_width = false',
    'CSET userounding = false',
    'CSET zerodetect = false',
    'CSET component_name = multiplier_virtex2p_10_1_9f8f470cd40e41c7',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '6bc9558f53d4939ca4b4c9907eaaa080',
    'sourceFile' => 'hdl/xlmult_v9_0.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      b: in std_logic_vector(c_b_width - 1 downto 0);
      p: out std_logic_vector(c_output_width - 1 downto 0);
      clk: in std_logic;
      ce: in std_logic;
      sclr: in std_logic;
      a: in std_logic_vector(c_a_width - 1 downto 0)',
      'core_instance_text' => '        a => tmp_a,
        clk => clk,
        ce => internal_ce,
        sclr => internal_clr,
        p => tmp_p,
        b => tmp_b',
      'core_name0' => 'multiplier_virtex2p_10_1_9f8f470cd40e41c7',
      'entity_name.0' => 'xlmult_v9_0',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '348af5752e5aeed2aefcaf6e34174de7',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: signed((16 - 1) downto 0);
  signal b_1_34: unsigned((17 - 1) downto 0);
  type array_type_op_mem_32_22 is array (0 to (1 - 1)) of boolean;
  signal op_mem_32_22: array_type_op_mem_32_22 := (
    0 => false);
  signal op_mem_32_22_front_din: boolean;
  signal op_mem_32_22_back: boolean;
  signal op_mem_32_22_push_front_pop_back_en: std_logic;
  signal cast_22_12: signed((18 - 1) downto 0);
  signal cast_22_17: signed((18 - 1) downto 0);
  signal result_22_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_signed(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  op_mem_32_22_back <= op_mem_32_22(0);
  proc_op_mem_32_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_32_22_push_front_pop_back_en = \'1\')) then
        op_mem_32_22(0) <= op_mem_32_22_front_din;
      end if;
    end if;
  end process proc_op_mem_32_22;
  cast_22_12 <= s2s_cast(a_1_31, 14, 18, 16);
  cast_22_17 <= u2s_cast(b_1_34, 16, 18, 16);
  result_22_3_rel <= cast_22_12 >= cast_22_17;
  op_mem_32_22_front_din <= result_22_3_rel;
  op_mem_32_22_push_front_pop_back_en <= \'1\';
  op <= boolean_to_vector(op_mem_32_22_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((16 - 1) downto 0);
    b : in std_logic_vector((17 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_93c11c0f86',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '4d5aaa8114720922c691a73b0ac67516',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "00000000000000000010000000000001";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_49a4ecb7de',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '7278cc6d2681503b42f7a4b4201bd1f5',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: unsigned((18 - 1) downto 0);
  signal output_port_5_5_force: signed((18 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port_5_5_force <= unsigned_to_signed(input_port_1_40);
  output_port <= signed_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((18 - 1) downto 0);
    output_port : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_9a0fa0f632',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a668c902835162fefcfdd1e8a51048b1',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ce6d3f284f8d008ba3a54ba6425c70fd',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '1a073273a11672f7a5b2220727e9df69',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal b_17_24: signed((16 - 1) downto 0);
  signal rst_17_27: boolean;
  signal accum_reg_41_23: signed((32 - 1) downto 0) := "00000000000000000000000000000000";
  signal accum_reg_41_23_rst: std_logic;
  signal cast_51_42: signed((32 - 1) downto 0);
  signal accum_reg_join_47_1: signed((33 - 1) downto 0);
  signal accum_reg_join_47_1_rst: std_logic;
begin
  b_17_24 <= std_logic_vector_to_signed(b);
  rst_17_27 <= ((rst) = "1");
  proc_accum_reg_41_23: process (clk)
  is
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (accum_reg_41_23_rst = \'1\')) then
        accum_reg_41_23 <= "00000000000000000000000000000000";
      elsif (ce = \'1\') then 
        accum_reg_41_23 <= accum_reg_41_23 + cast_51_42;
      end if;
    end if;
  end process proc_accum_reg_41_23;
  cast_51_42 <= s2s_cast(b_17_24, 14, 32, 14);
  proc_if_47_1: process (accum_reg_41_23, cast_51_42, rst_17_27)
  is
  begin
    if rst_17_27 then
      accum_reg_join_47_1_rst <= \'1\';
    else 
      accum_reg_join_47_1_rst <= \'0\';
    end if;
  end process proc_if_47_1;
  accum_reg_41_23_rst <= accum_reg_join_47_1_rst;
  q <= signed_to_std_logic_vector(accum_reg_41_23);
end',
      'crippled_entity' => 'is
  port (
    b : in std_logic_vector((16 - 1) downto 0);
    rst : in std_logic_vector((1 - 1) downto 0);
    q : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'accum_558edb08eb',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '8838f61be367553ed53eed76e191b042',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_22: signed((8 - 1) downto 0);
  signal b_1_25: signed((8 - 1) downto 0);
  type array_type_op_mem_65_20 is array (0 to (2 - 1)) of signed((16 - 1) downto 0);
  signal op_mem_65_20: array_type_op_mem_65_20 := (
    "0000000000000000",
    "0000000000000000");
  signal op_mem_65_20_front_din: signed((16 - 1) downto 0);
  signal op_mem_65_20_back: signed((16 - 1) downto 0);
  signal op_mem_65_20_push_front_pop_back_en: std_logic;
  signal mult_46_56: signed((16 - 1) downto 0);
begin
  a_1_22 <= std_logic_vector_to_signed(a);
  b_1_25 <= std_logic_vector_to_signed(b);
  op_mem_65_20_back <= op_mem_65_20(1);
  proc_op_mem_65_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_65_20_push_front_pop_back_en = \'1\')) then
        for i in 1 downto 1 loop 
          op_mem_65_20(i) <= op_mem_65_20(i-1);
        end loop;
        op_mem_65_20(0) <= op_mem_65_20_front_din;
      end if;
    end if;
  end process proc_op_mem_65_20;
  mult_46_56 <= (a_1_22 * b_1_25);
  op_mem_65_20_front_din <= mult_46_56;
  op_mem_65_20_push_front_pop_back_en <= \'1\';
  p <= signed_to_std_logic_vector(op_mem_65_20_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((8 - 1) downto 0);
    b : in std_logic_vector((8 - 1) downto 0);
    p : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mult_98e3c7048f',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '43606c0df505f8015a7c2e0635acf0a2',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: unsigned((8 - 1) downto 0);
  signal in1_1_27: unsigned((10 - 1) downto 0);
  signal y_2_1_concat: unsigned((18 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((8 - 1) downto 0);
    in1 : in std_logic_vector((10 - 1) downto 0);
    y : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_b27e09722b',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '7a81b0dfb5e759e822e80e508fd93315',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f21f287479650beca8254ace44fb445a',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c1edfa89b38f6059de7d9eb46739e84a',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: unsigned((36 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port <= unsigned_to_std_logic_vector(input_port_1_40);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((36 - 1) downto 0);
    output_port : out std_logic_vector((36 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_86b044698f',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'e41ef0c37dc97e0b73e9267702a3892b',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlpassthrough.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '9967e35e29cf299086dc2348cece743c',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f1670ba1b7813ed350ef98008d2b5141',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '109cd87e2a433dfcc197d10db436f1e1',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '4e5ef021c199111e8c4536f3ac1de1ef',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "0000000000000000001";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((19 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_4709ea49b5',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '297e6db192cdd58710a7b31444668611',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "0000000000000000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((19 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_b366689086',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '0ecc2ed937b522023891bb4240ef44cc',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "1000000000000000100";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((19 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_d32cd47ecf',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '13366d021ddc9f5413827bc05cb9e24f',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "1";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_6293007044',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = TRUE',
    'CSET load = TRUE',
    'CSET load_sense = active_high',
    'CSET operation = down',
    'CSET output_width = 19',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_8b4ef4e135e1e3f1',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ae52ef569cfef36c65c98b3f94e616f9',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      load: in std_logic;
      l: in std_logic_vector(op_width - 1 downto 0);
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        load => load(0),
        l => din,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_8b4ef4e135e1e3f1',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '79cfaf8c15ce6d93b744ee6a4a4e8394',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  fully_2_1_bit <= d0_1_24 or d1_1_27;
  y <= std_logic_to_vector(fully_2_1_bit);
end',
      'crippled_entity' => 'is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'logical_aacf6e1b0e',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '4cbc8f55ab0bdad8c93c57462ba138dc',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal unregy_join_6_1: std_logic;
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= std_logic_to_vector(unregy_join_6_1);
end',
      'crippled_entity' => 'is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_1bef4ba0e4',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '63dd55787284a2bd03845bb4b5f5ae5f',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((19 - 1) downto 0);
  signal b_1_34: unsigned((19 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_12_3_rel <= a_1_31 = b_1_34;
  op <= boolean_to_vector(result_12_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((19 - 1) downto 0);
    b : in std_logic_vector((19 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_0f2716ddb5',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '9000970a8778fd947d40f2de82cd69ef',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((19 - 1) downto 0);
  signal b_1_34: unsigned((19 - 1) downto 0);
  signal result_14_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_14_3_rel <= a_1_31 /= b_1_34;
  op <= boolean_to_vector(result_14_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((19 - 1) downto 0);
    b : in std_logic_vector((19 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_502d6cf7c0',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '1b5c2d34e366adc69489a9582a91305e',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "1111";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((4 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_06590e4008',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = TRUE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 19',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_2ccd4f2322b1fa6a',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '322221dea671d198ef6d942a1c494972',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_2ccd4f2322b1fa6a',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '2418e3abee66300b8c0500f3fde8b242',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b32a0080f8f47e0be7ec44c6ad81b20b',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal ip_1_26: boolean;
  type array_type_op_mem_22_20 is array (0 to (1 - 1)) of boolean;
  signal op_mem_22_20: array_type_op_mem_22_20 := (
    0 => false);
  signal op_mem_22_20_front_din: boolean;
  signal op_mem_22_20_back: boolean;
  signal op_mem_22_20_push_front_pop_back_en: std_logic;
  signal internal_ip_12_1_bitnot: boolean;
begin
  ip_1_26 <= ((ip) = "1");
  op_mem_22_20_back <= op_mem_22_20(0);
  proc_op_mem_22_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_22_20_push_front_pop_back_en = \'1\')) then
        op_mem_22_20(0) <= op_mem_22_20_front_din;
      end if;
    end if;
  end process proc_op_mem_22_20;
  internal_ip_12_1_bitnot <= ((not boolean_to_vector(ip_1_26)) = "1");
  op_mem_22_20_push_front_pop_back_en <= \'0\';
  op <= boolean_to_vector(internal_ip_12_1_bitnot);
end',
      'crippled_entity' => 'is
  port (
    ip : in std_logic_vector((1 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'inverter_e5b38cca3b',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '3bd769a2a0d5fb03dd00e37269cbb560',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic_vector((36 - 1) downto 0);
  signal d1_1_27: std_logic_vector((36 - 1) downto 0);
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((36 - 1) downto 0);
begin
  sel_1_20 <= sel(0);
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  sel_internal_2_1_convert <= cast(std_logic_to_vector(sel_1_20), 0, 1, 0, xlUnsigned);
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_internal_2_1_convert)
  is
  begin
    case sel_internal_2_1_convert is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end',
      'crippled_entity' => 'is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((36 - 1) downto 0);
    d1 : in std_logic_vector((36 - 1) downto 0);
    y : out std_logic_vector((36 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_b75bc1e5be',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'fbad82d5b5ba93c242c7fbe5262f1c35',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic_vector((18 - 1) downto 0);
  signal d1_1_27: std_logic_vector((18 - 1) downto 0);
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((18 - 1) downto 0);
begin
  sel_1_20 <= sel(0);
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  sel_internal_2_1_convert <= cast(std_logic_to_vector(sel_1_20), 0, 1, 0, xlUnsigned);
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_internal_2_1_convert)
  is
  begin
    case sel_internal_2_1_convert is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end',
      'crippled_entity' => 'is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((18 - 1) downto 0);
    d1 : in std_logic_vector((18 - 1) downto 0);
    y : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_42c705c90b',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '8c8eb6723124e24cc810aa7e3da58362',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'bb3cacfe02c1a4d2a36d02f2acd65faa',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd024759694fefc4da2bd34e8f6ae6b85',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ccaa3687a143ec021a4c453683b7fd39',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '90c4aabfe14095dcfb9812719277ad4b',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal bit_2_26: std_logic;
  signal fully_2_1_bitnot: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  bit_2_26 <= d0_1_24 or d1_1_27;
  fully_2_1_bitnot <= not bit_2_26;
  y <= std_logic_to_vector(fully_2_1_bitnot);
end',
      'crippled_entity' => 'is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'logical_dfe2dded7f',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'dbe0d6ba6ebc3411b591546c133f2f7f',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: unsigned((4 - 1) downto 0);
  signal in1_1_27: unsigned((4 - 1) downto 0);
  signal y_2_1_concat: unsigned((8 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((4 - 1) downto 0);
    in1 : in std_logic_vector((4 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_1a070f1f35',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '29e7c28ecd0eafe18c83e5c1ca2d0df4',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: boolean;
  signal in1_1_27: boolean;
  signal y_2_1_concat: unsigned((2 - 1) downto 0);
begin
  in0_1_23 <= ((in0) = "1");
  in1_1_27 <= ((in1) = "1");
  y_2_1_concat <= std_logic_vector_to_unsigned(boolean_to_vector(in0_1_23) & boolean_to_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((2 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_32afb77cd2',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '4aff42a67bfe0e0ca3bca6338e48c312',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "000000000111000000000000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((27 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_3ee5f91fcf',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '3891e293fdffdb78b6fba5bf643ce6a8',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "111111111001000000000000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((27 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_3d1b04c74c',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '406cb546d6894c3e6c851b50085b46d7',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "0111";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((4 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_a3d619979c',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '9b2d5700b1677b273344eff5e9201f4f',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "1001";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((4 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_a629aefb53',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '041221273c5d40949e58ff02c5d6554e',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '18336ef7eeca81d8b9a074c332d802e1',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal d2_1_30: std_logic;
  signal d3_1_33: std_logic;
  type array_type_latency_pipe_5_26 is array (0 to (2 - 1)) of std_logic;
  signal latency_pipe_5_26: array_type_latency_pipe_5_26 := (
    \'0\',
    \'0\');
  signal latency_pipe_5_26_front_din: std_logic;
  signal latency_pipe_5_26_back: std_logic;
  signal latency_pipe_5_26_push_front_pop_back_en: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  d2_1_30 <= d2(0);
  d3_1_33 <= d3(0);
  latency_pipe_5_26_back <= latency_pipe_5_26(1);
  proc_latency_pipe_5_26: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (latency_pipe_5_26_push_front_pop_back_en = \'1\')) then
        for i in 1 downto 1 loop 
          latency_pipe_5_26(i) <= latency_pipe_5_26(i-1);
        end loop;
        latency_pipe_5_26(0) <= latency_pipe_5_26_front_din;
      end if;
    end if;
  end process proc_latency_pipe_5_26;
  fully_2_1_bit <= d0_1_24 or d1_1_27 or d2_1_30 or d3_1_33;
  latency_pipe_5_26_front_din <= fully_2_1_bit;
  latency_pipe_5_26_push_front_pop_back_en <= \'1\';
  y <= std_logic_to_vector(latency_pipe_5_26_back);
end',
      'crippled_entity' => 'is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    d2 : in std_logic_vector((1 - 1) downto 0);
    d3 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'logical_127a315f20',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Multiplier Virtex2P Xilinx,_Inc. 10.1',
    '# 10.1.03i',
    'CSET ccmimp = Distributed_Memory',
    'CSET clockenable = true',
    'CSET constvalue = 129',
    'CSET internaluser = 0',
    'CSET multiplier_construction = Use_Mults',
    'CSET multtype = Parallel_Multiplier',
    'CSET optgoal = Speed',
    'CSET outputwidthhigh = 35',
    'CSET outputwidthlow = 0',
    'CSET pipestages = 2',
    'CSET portatype = Signed',
    'CSET portawidth = 18',
    'CSET portbtype = Unsigned',
    'CSET portbwidth = 18',
    'CSET roundpoint = 0',
    'CSET sclrcepriority = CE_Overrides_SCLR',
    'CSET syncclear = true',
    'CSET use_custom_output_width = false',
    'CSET userounding = false',
    'CSET zerodetect = false',
    'CSET component_name = multiplier_virtex2p_10_1_423ddb9f1e4b69b4',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '9d4a5420c335bd435095a406c7deec3c',
    'sourceFile' => 'hdl/xlmult_v9_0.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      b: in std_logic_vector(c_b_width - 1 downto 0);
      p: out std_logic_vector(c_output_width - 1 downto 0);
      clk: in std_logic;
      ce: in std_logic;
      sclr: in std_logic;
      a: in std_logic_vector(c_a_width - 1 downto 0)',
      'core_instance_text' => '        a => tmp_a,
        clk => clk,
        ce => internal_ce,
        sclr => internal_clr,
        p => tmp_p,
        b => tmp_b',
      'core_name0' => 'multiplier_virtex2p_10_1_423ddb9f1e4b69b4',
      'entity_name.0' => 'xlmult_v9_0',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f873a47b894af642f076187bc4d7fabf',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic_vector((2 - 1) downto 0);
  signal d0_1_24: std_logic_vector((4 - 1) downto 0);
  signal d1_1_27: std_logic_vector((4 - 1) downto 0);
  signal d2_1_30: std_logic_vector((4 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((4 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "00" =>
        unregy_join_6_1 <= d0_1_24;
      when "01" =>
        unregy_join_6_1 <= d1_1_27;
      when others =>
        unregy_join_6_1 <= d2_1_30;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end',
      'crippled_entity' => 'is
  port (
    sel : in std_logic_vector((2 - 1) downto 0);
    d0 : in std_logic_vector((4 - 1) downto 0);
    d1 : in std_logic_vector((4 - 1) downto 0);
    d2 : in std_logic_vector((4 - 1) downto 0);
    y : out std_logic_vector((4 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_9723c3381b',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '4ca650b8745471bb8c2fa594a537dd1a',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: signed((4 - 1) downto 0);
  signal output_port_5_5_force: unsigned((4 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port_5_5_force <= signed_to_unsigned(input_port_1_40);
  output_port <= unsigned_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((4 - 1) downto 0);
    output_port : out std_logic_vector((4 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_df53fd8fe7',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '88ca482e2d9380555af07d738cf31535',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: signed((36 - 1) downto 0);
  signal b_1_34: signed((27 - 1) downto 0);
  type array_type_op_mem_32_22 is array (0 to (2 - 1)) of boolean;
  signal op_mem_32_22: array_type_op_mem_32_22 := (
    false,
    false);
  signal op_mem_32_22_front_din: boolean;
  signal op_mem_32_22_back: boolean;
  signal op_mem_32_22_push_front_pop_back_en: std_logic;
  signal cast_18_12: signed((37 - 1) downto 0);
  signal cast_18_16: signed((37 - 1) downto 0);
  signal result_18_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_signed(a);
  b_1_34 <= std_logic_vector_to_signed(b);
  op_mem_32_22_back <= op_mem_32_22(1);
  proc_op_mem_32_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_32_22_push_front_pop_back_en = \'1\')) then
        for i in 1 downto 1 loop 
          op_mem_32_22(i) <= op_mem_32_22(i-1);
        end loop;
        op_mem_32_22(0) <= op_mem_32_22_front_din;
      end if;
    end if;
  end process proc_op_mem_32_22;
  cast_18_12 <= s2s_cast(a_1_31, 17, 37, 18);
  cast_18_16 <= s2s_cast(b_1_34, 18, 37, 18);
  result_18_3_rel <= cast_18_12 > cast_18_16;
  op_mem_32_22_front_din <= result_18_3_rel;
  op_mem_32_22_push_front_pop_back_en <= \'1\';
  op <= boolean_to_vector(op_mem_32_22_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((36 - 1) downto 0);
    b : in std_logic_vector((27 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_9dd1c0d7bf',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '92e1e19cc5fb5369f7da4b232e27d30f',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: signed((36 - 1) downto 0);
  signal b_1_34: signed((27 - 1) downto 0);
  type array_type_op_mem_32_22 is array (0 to (2 - 1)) of boolean;
  signal op_mem_32_22: array_type_op_mem_32_22 := (
    false,
    false);
  signal op_mem_32_22_front_din: boolean;
  signal op_mem_32_22_back: boolean;
  signal op_mem_32_22_push_front_pop_back_en: std_logic;
  signal cast_16_12: signed((37 - 1) downto 0);
  signal cast_16_16: signed((37 - 1) downto 0);
  signal result_16_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_signed(a);
  b_1_34 <= std_logic_vector_to_signed(b);
  op_mem_32_22_back <= op_mem_32_22(1);
  proc_op_mem_32_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_32_22_push_front_pop_back_en = \'1\')) then
        for i in 1 downto 1 loop 
          op_mem_32_22(i) <= op_mem_32_22(i-1);
        end loop;
        op_mem_32_22(0) <= op_mem_32_22_front_din;
      end if;
    end if;
  end process proc_op_mem_32_22;
  cast_16_12 <= s2s_cast(a_1_31, 17, 37, 18);
  cast_16_16 <= s2s_cast(b_1_34, 18, 37, 18);
  result_16_3_rel <= cast_16_12 < cast_16_16;
  op_mem_32_22_front_din <= result_16_3_rel;
  op_mem_32_22_push_front_pop_back_en <= \'1\';
  op <= boolean_to_vector(op_mem_32_22_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((36 - 1) downto 0);
    b : in std_logic_vector((27 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_069cc8477e',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'aed59262fe2fd3ca0edc89fe9e20065b',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "000000000000000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_95b0f967bc',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '26c90b101ce1ca8b2f28c242a8215ef7',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "0";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_963ed6358a',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = TRUE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 11',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_d0a204b7c881b521',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '61975d150d4542fc2b1fd214877214a5',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_d0a204b7c881b521',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '78ed36e84ece7413d51ca466b3a4dee5',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '8c954ba43b101ba352a618414cc5e386',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Dual_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET configuration_port_a = Read_And_Write',
    'CSET configuration_port_b = Read_And_Write',
    'CSET depth_a = 64',
    'CSET depth_b = 64',
    'CSET global_init_value = 0',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_a_additional_output_pipe_stages = 0',
    'CSET port_a_enable_pin = TRUE',
    'CSET port_a_handshaking_pins = FALSE',
    'CSET port_a_init_pin = FALSE',
    'CSET port_a_init_value = 0',
    'CSET port_a_register_inputs = FALSE',
    'CSET port_b_additional_output_pipe_stages = 0',
    'CSET port_b_enable_pin = TRUE',
    'CSET port_b_handshaking_pins = FALSE',
    'CSET port_b_init_pin = FALSE',
    'CSET port_b_init_value = 0',
    'CSET port_b_register_inputs = FALSE',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET width_a = 18',
    'CSET width_b = 18',
    'CSET write_mode_port_a = Read_After_Write',
    'CSET write_mode_port_b = Read_After_Write',
    'CSET component_name = dual_port_block_memory_virtex2p_6_1_645b5e379b337a9f',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '80d99e00a5fbb02582c1211105513e88',
    'sourceFile' => 'hdl/xldpram.vhd',
    'templateKeyValues' => {
      'core_component_def' => 'addra: in std_logic_vector(c_address_width_a - 1 downto 0);
      addrb: in std_logic_vector(c_address_width_b - 1 downto 0);
      dina: in std_logic_vector(c_width_a - 1 downto 0);
      dinb: in std_logic_vector(c_width_b - 1 downto 0);
      clka: in std_logic;
      clkb: in std_logic;
      wea: in std_logic;
      web: in std_logic;
      ena: in std_logic;
      enb: in std_logic;
      douta: out std_logic_vector(c_width_a - 1 downto 0);
      doutb: out std_logic_vector(c_width_b - 1 downto 0)',
      'core_instance_text' => 'addra => core_addra,
        clka => a_clk,
        addrb => core_addrb,
        clkb => b_clk,
        dina => core_dina,
        wea => core_wea,
        dinb => core_dinb,
        web => core_web,
        ena => core_a_ce,
        enb => core_b_ce,
        douta => core_douta,
        doutb => core_doutb',
      'core_name0' => 'dual_port_block_memory_virtex2p_6_1_645b5e379b337a9f',
      'entity_name.0' => 'xldpram',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '65c2a5a1fe5d8429037a17d249ef04f2',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '564f6ebe0ebd0630716f52b5c489019c',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "00000000000000000000000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((26 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_02482c963a',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '9d0f1ffda2693941297e7ab96cc879fa',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlregister.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '290b297863074736af20b00873671933',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlregister.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f34c3ca612131576832d3ace32c48b1c',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((26 - 1) downto 0);
  signal b_1_34: unsigned((26 - 1) downto 0);
  type array_type_op_mem_32_22 is array (0 to (1 - 1)) of boolean;
  signal op_mem_32_22: array_type_op_mem_32_22 := (
    0 => false);
  signal op_mem_32_22_front_din: boolean;
  signal op_mem_32_22_back: boolean;
  signal op_mem_32_22_push_front_pop_back_en: std_logic;
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  op_mem_32_22_back <= op_mem_32_22(0);
  proc_op_mem_32_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_32_22_push_front_pop_back_en = \'1\')) then
        op_mem_32_22(0) <= op_mem_32_22_front_din;
      end if;
    end if;
  end process proc_op_mem_32_22;
  result_12_3_rel <= a_1_31 = b_1_34;
  op_mem_32_22_front_din <= result_12_3_rel;
  op_mem_32_22_push_front_pop_back_en <= \'1\';
  op <= boolean_to_vector(op_mem_32_22_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((26 - 1) downto 0);
    b : in std_logic_vector((26 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_0c4cc9dc89',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b8d14c0f9722a72f6052ee7dd7f6ec50',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c5f2d808191f5865f9ed4a0d81f3e5ad',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '4a96a22d5854173980f66b4afa9588a3',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "00000000000000000000000001";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((26 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_e3183ab609',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '5799e0d9737301d76ae07afdf877181a',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "00000000000000000000000010";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((26 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_7cfb67ea50',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '5866a9e873b97159f387e2a4c08cd799',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "00000000000000000000000011";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((26 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_4a9dc516dd',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ed9057cdda22f0e298eb638800508a9c',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: unsigned((18 - 1) downto 0);
  signal in1_1_27: unsigned((18 - 1) downto 0);
  signal y_2_1_concat: unsigned((36 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((18 - 1) downto 0);
    in1 : in std_logic_vector((18 - 1) downto 0);
    y : out std_logic_vector((36 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_b198bd62b0',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '6c5ae4ed7a90830b07c3ff2596ce4fc5',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: signed((18 - 1) downto 0);
  signal output_port_5_5_force: unsigned((18 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port_5_5_force <= signed_to_unsigned(input_port_1_40);
  output_port <= unsigned_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((18 - 1) downto 0);
    output_port : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_580feec131',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b6076221ae07fcf1e3f520985e9fed77',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((18 - 1) downto 0);
  signal b_17_35: signed((18 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (2 - 1)) of signed((19 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    "0000000000000000000",
    "0000000000000000000");
  signal op_mem_91_20_front_din: signed((19 - 1) downto 0);
  signal op_mem_91_20_back: signed((19 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (2 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    "0",
    "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_69_18: signed((19 - 1) downto 0);
  signal cast_69_22: signed((19 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((19 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(1);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        for i in 1 downto 1 loop 
          op_mem_91_20(i) <= op_mem_91_20(i-1);
        end loop;
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(1);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
        for i_x_000000 in 1 downto 1 loop 
          cout_mem_92_22(i_x_000000) <= cout_mem_92_22(i_x_000000-1);
        end loop;
        cout_mem_92_22(0) <= cout_mem_92_22_front_din;
      end if;
    end if;
  end process proc_cout_mem_92_22;
  prev_mode_93_22_reg_i <= unsigned_to_std_logic_vector(prev_mode_93_22_next);
  prev_mode_93_22 <= std_logic_vector_to_unsigned(prev_mode_93_22_reg_o);
  prev_mode_93_22_reg_inst: entity work.synth_reg_w_init
    generic map (
      init_index => 2, 
      init_value => b"010", 
      latency => 1, 
      width => 3)
    port map (
      ce => ce, 
      clk => clk, 
      clr => clr, 
      i => prev_mode_93_22_reg_i, 
      o => prev_mode_93_22_reg_o);
  cast_69_18 <= s2s_cast(a_17_32, 17, 19, 17);
  cast_69_22 <= s2s_cast(b_17_35, 17, 19, 17);
  internal_s_69_5_addsub <= cast_69_18 + cast_69_22;
  op_mem_91_20_front_din <= internal_s_69_5_addsub;
  op_mem_91_20_push_front_pop_back_en <= \'1\';
  cout_mem_92_22_front_din <= std_logic_vector_to_unsigned("0");
  cout_mem_92_22_push_front_pop_back_en <= \'1\';
  prev_mode_93_22_next <= std_logic_vector_to_unsigned("000");
  s <= signed_to_std_logic_vector(op_mem_91_20_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((18 - 1) downto 0);
    b : in std_logic_vector((18 - 1) downto 0);
    s : out std_logic_vector((19 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_c7ad41276b',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'fed3c6ea340031a3d37c486071e8d2ce',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((18 - 1) downto 0);
  signal b_17_35: signed((18 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (2 - 1)) of signed((19 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    "0000000000000000000",
    "0000000000000000000");
  signal op_mem_91_20_front_din: signed((19 - 1) downto 0);
  signal op_mem_91_20_back: signed((19 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (2 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    "0",
    "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_71_18: signed((19 - 1) downto 0);
  signal cast_71_22: signed((19 - 1) downto 0);
  signal internal_s_71_5_addsub: signed((19 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(1);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        for i in 1 downto 1 loop 
          op_mem_91_20(i) <= op_mem_91_20(i-1);
        end loop;
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(1);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
        for i_x_000000 in 1 downto 1 loop 
          cout_mem_92_22(i_x_000000) <= cout_mem_92_22(i_x_000000-1);
        end loop;
        cout_mem_92_22(0) <= cout_mem_92_22_front_din;
      end if;
    end if;
  end process proc_cout_mem_92_22;
  prev_mode_93_22_reg_i <= unsigned_to_std_logic_vector(prev_mode_93_22_next);
  prev_mode_93_22 <= std_logic_vector_to_unsigned(prev_mode_93_22_reg_o);
  prev_mode_93_22_reg_inst: entity work.synth_reg_w_init
    generic map (
      init_index => 2, 
      init_value => b"010", 
      latency => 1, 
      width => 3)
    port map (
      ce => ce, 
      clk => clk, 
      clr => clr, 
      i => prev_mode_93_22_reg_i, 
      o => prev_mode_93_22_reg_o);
  cast_71_18 <= s2s_cast(a_17_32, 17, 19, 17);
  cast_71_22 <= s2s_cast(b_17_35, 17, 19, 17);
  internal_s_71_5_addsub <= cast_71_18 - cast_71_22;
  op_mem_91_20_front_din <= internal_s_71_5_addsub;
  op_mem_91_20_push_front_pop_back_en <= \'1\';
  cout_mem_92_22_front_din <= std_logic_vector_to_unsigned("0");
  cout_mem_92_22_push_front_pop_back_en <= \'1\';
  prev_mode_93_22_next <= std_logic_vector_to_unsigned("000");
  s <= signed_to_std_logic_vector(op_mem_91_20_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((18 - 1) downto 0);
    b : in std_logic_vector((18 - 1) downto 0);
    s : out std_logic_vector((19 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_3b890bd063',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '0b1c89a8751ca3e36e8ea54ddc877745',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '3ab7b9e40a113866073132979bd96ad3',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal ip_1_23: signed((19 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((19 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "0000000000000000000");
  signal op_mem_46_20_front_din: signed((19 - 1) downto 0);
  signal op_mem_46_20_back: signed((19 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((19 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_46_20_push_front_pop_back_en = \'1\')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 18, 19, 17);
  op_mem_46_20_push_front_pop_back_en <= \'0\';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end',
      'crippled_entity' => 'is
  port (
    ip : in std_logic_vector((19 - 1) downto 0);
    op : out std_logic_vector((19 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'shift_cc70f4526a',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '1b450bcdb005adf8b7f864caef9a0cc1',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "00000000001";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((11 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_118598964d',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'e771fae83e3ce153cf1c2720e5709fbb',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "00000000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((11 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_a3923dd146',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '66b549abead4ab5509046254029d7863',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "10000000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((11 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_0604807f72',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = TRUE',
    'CSET load = TRUE',
    'CSET load_sense = active_high',
    'CSET operation = down',
    'CSET output_width = 11',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_391d8b1c1f812d67',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '6744856bbdd0b74214943d1a982d9780',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      load: in std_logic;
      l: in std_logic_vector(op_width - 1 downto 0);
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        load => load(0),
        l => din,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_391d8b1c1f812d67',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'dca08c57a49d58b068e6447a87a53acc',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((11 - 1) downto 0);
  signal b_1_34: unsigned((11 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_12_3_rel <= a_1_31 = b_1_34;
  op <= boolean_to_vector(result_12_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((11 - 1) downto 0);
    b : in std_logic_vector((11 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_2147430058',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '77179eb8d1d1c5009f0e60643c384b37',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((11 - 1) downto 0);
  signal b_1_34: unsigned((11 - 1) downto 0);
  signal result_14_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_14_3_rel <= a_1_31 /= b_1_34;
  op <= boolean_to_vector(result_14_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((11 - 1) downto 0);
    b : in std_logic_vector((11 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_b4b277ae0f',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = TRUE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 11',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_d0a204b7c881b521',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '137b968cb9190a4ff4aa4afc26148996',
    'sourceFile' => 'hdl/xlcounter_limit.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_d0a204b7c881b521',
      'entity_name.0' => 'xlcounter_limit',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a16df67c5246f54629ba207a0ad480c7',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((10 - 1) downto 0);
  signal d1_1_27: std_logic_vector((10 - 1) downto 0);
  type array_type_pipe_16_22 is array (0 to (1 - 1)) of std_logic_vector((10 - 1) downto 0);
  signal pipe_16_22: array_type_pipe_16_22 := (
    0 => "0000000000");
  signal pipe_16_22_front_din: std_logic_vector((10 - 1) downto 0);
  signal pipe_16_22_back: std_logic_vector((10 - 1) downto 0);
  signal pipe_16_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((10 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  pipe_16_22_back <= pipe_16_22(0);
  proc_pipe_16_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (pipe_16_22_push_front_pop_back_en = \'1\')) then
        pipe_16_22(0) <= pipe_16_22_front_din;
      end if;
    end if;
  end process proc_pipe_16_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  pipe_16_22_front_din <= unregy_join_6_1;
  pipe_16_22_push_front_pop_back_en <= \'1\';
  y <= pipe_16_22_back;
end',
      'crippled_entity' => 'is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((10 - 1) downto 0);
    d1 : in std_logic_vector((10 - 1) downto 0);
    y : out std_logic_vector((10 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_bdc1db9d7e',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '2500e276344d8192ccdc955310a24e3d',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd4294317a7a77a78e6fa33f0f73ced4c',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET depth = 1024',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_And_Write',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 36',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_Before_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_9cf8efebee3199f6',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '22173489acf830813fa338e0d086ce0a',
    'sourceFile' => 'hdl/xlspram.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      din: in std_logic_vector(c_width - 1 downto 0);
      we: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => addr,
        clk => clk,
        din => data_in,
        we => core_we,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_9cf8efebee3199f6',
      'entity_name.0' => 'xlspram',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '78f1cf42611d4cad3e2d8eb3993eb745',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d_1_22: std_logic_vector((10 - 1) downto 0);
begin
  d_1_22 <= d;
  q <= d_1_22;
end',
      'crippled_entity' => 'is
  port (
    d : in std_logic_vector((10 - 1) downto 0);
    q : out std_logic_vector((10 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'delay_0f6b6badfe',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '6c31451775cebc20de01016c51ce52dd',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d_1_22: std_logic_vector((1 - 1) downto 0);
begin
  d_1_22 <= d;
  q <= d_1_22;
end',
      'crippled_entity' => 'is
  port (
    d : in std_logic_vector((1 - 1) downto 0);
    q : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'delay_21355083c1',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '9b2180a4a44034237c1876cc7f82fd40',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d_1_22: std_logic;
begin
  d_1_22 <= d(0);
  q <= std_logic_to_vector(d_1_22);
end',
      'crippled_entity' => 'is
  port (
    d : in std_logic_vector((1 - 1) downto 0);
    q : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'delay_0341f7be44',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Distributed_Memory Virtex2P Xilinx,_Inc. 7.1',
    '# 10.1.03i',
    'CSET ce_overrides = sync_controls_overrides_ce',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 200, 100, 300, 80, 280, 180, 380, 40, 240, 140, 340, C0, 2C0, 1C0, 3C0, 20, 220, 120, 320, A0, 2A0, 1A0, 3A0, 60, 260, 160, 360, E0, 2E0, 1E0, 3E0, 10, 210, 110, 310, 90, 290, 190, 390, 50, 250, 150, 350, D0, 2D0, 1D0, 3D0, 30, 230, 130, 330, B0, 2B0, 1B0, 3B0, 70, 270, 170, 370, F0, 2F0, 1F0, 3F0, 8, 208, 108, 308, 88, 288, 188, 388, 48, 248, 148, 348, C8, 2C8, 1C8, 3C8, 28, 228, 128, 328, A8, 2A8, 1A8, 3A8, 68, 268, 168, 368, E8, 2E8, 1E8, 3E8, 18, 218, 118, 318, 98, 298, 198, 398, 58, 258, 158, 358, D8, 2D8, 1D8, 3D8, 38, 238, 138, 338, B8, 2B8, 1B8, 3B8, 78, 278, 178, 378, F8, 2F8, 1F8, 3F8, 4, 204, 104, 304, 84, 284, 184, 384, 44, 244, 144, 344, C4, 2C4, 1C4, 3C4, 24, 224, 124, 324, A4, 2A4, 1A4, 3A4, 64, 264, 164, 364, E4, 2E4, 1E4, 3E4, 14, 214, 114, 314, 94, 294, 194, 394, 54, 254, 154, 354, D4, 2D4, 1D4, 3D4, 34, 234, 134, 334, B4, 2B4, 1B4, 3B4, 74, 274, 174, 374, F4, 2F4, 1F4, 3F4, C, 20C, 10C, 30C, 8C, 28C, 18C, 38C, 4C, 24C, 14C, 34C, CC, 2CC, 1CC, 3CC, 2C, 22C, 12C, 32C, AC, 2AC, 1AC, 3AC, 6C, 26C, 16C, 36C, EC, 2EC, 1EC, 3EC, 1C, 21C, 11C, 31C, 9C, 29C, 19C, 39C, 5C, 25C, 15C, 35C, DC, 2DC, 1DC, 3DC, 3C, 23C, 13C, 33C, BC, 2BC, 1BC, 3BC, 7C, 27C, 17C, 37C, FC, 2FC, 1FC, 3FC, 2, 202, 102, 302, 82, 282, 182, 382, 42, 242, 142, 342, C2, 2C2, 1C2, 3C2, 22, 222, 122, 322, A2, 2A2, 1A2, 3A2, 62, 262, 162, 362, E2, 2E2, 1E2, 3E2, 12, 212, 112, 312, 92, 292, 192, 392, 52, 252, 152, 352, D2, 2D2, 1D2, 3D2, 32, 232, 132, 332, B2, 2B2, 1B2, 3B2, 72, 272, 172, 372, F2, 2F2, 1F2, 3F2, A, 20A, 10A, 30A, 8A, 28A, 18A, 38A, 4A, 24A, 14A, 34A, CA, 2CA, 1CA, 3CA, 2A, 22A, 12A, 32A, AA, 2AA, 1AA, 3AA, 6A, 26A, 16A, 36A, EA, 2EA, 1EA, 3EA, 1A, 21A, 11A, 31A, 9A, 29A, 19A, 39A, 5A, 25A, 15A, 35A, DA, 2DA, 1DA, 3DA, 3A, 23A, 13A, 33A, BA, 2BA, 1BA, 3BA, 7A, 27A, 17A, 37A, FA, 2FA, 1FA, 3FA, 6, 206, 106, 306, 86, 286, 186, 386, 46, 246, 146, 346, C6, 2C6, 1C6, 3C6, 26, 226, 126, 326, A6, 2A6, 1A6, 3A6, 66, 266, 166, 366, E6, 2E6, 1E6, 3E6, 16, 216, 116, 316, 96, 296, 196, 396, 56, 256, 156, 356, D6, 2D6, 1D6, 3D6, 36, 236, 136, 336, B6, 2B6, 1B6, 3B6, 76, 276, 176, 376, F6, 2F6, 1F6, 3F6, E, 20E, 10E, 30E, 8E, 28E, 18E, 38E, 4E, 24E, 14E, 34E, CE, 2CE, 1CE, 3CE, 2E, 22E, 12E, 32E, AE, 2AE, 1AE, 3AE, 6E, 26E, 16E, 36E, EE, 2EE, 1EE, 3EE, 1E, 21E, 11E, 31E, 9E, 29E, 19E, 39E, 5E, 25E, 15E, 35E, DE, 2DE, 1DE, 3DE, 3E, 23E, 13E, 33E, BE, 2BE, 1BE, 3BE, 7E, 27E, 17E, 37E, FE, 2FE, 1FE, 3FE, 1, 201, 101, 301, 81, 281, 181, 381, 41, 241, 141, 341, C1, 2C1, 1C1, 3C1, 21, 221, 121, 321, A1, 2A1, 1A1, 3A1, 61, 261, 161, 361, E1, 2E1, 1E1, 3E1, 11, 211, 111, 311, 91, 291, 191, 391, 51, 251, 151, 351, D1, 2D1, 1D1, 3D1, 31, 231, 131, 331, B1, 2B1, 1B1, 3B1, 71, 271, 171, 371, F1, 2F1, 1F1, 3F1, 9, 209, 109, 309, 89, 289, 189, 389, 49, 249, 149, 349, C9, 2C9, 1C9, 3C9, 29, 229, 129, 329, A9, 2A9, 1A9, 3A9, 69, 269, 169, 369, E9, 2E9, 1E9, 3E9, 19, 219, 119, 319, 99, 299, 199, 399, 59, 259, 159, 359, D9, 2D9, 1D9, 3D9, 39, 239, 139, 339, B9, 2B9, 1B9, 3B9, 79, 279, 179, 379, F9, 2F9, 1F9, 3F9, 5, 205, 105, 305, 85, 285, 185, 385, 45, 245, 145, 345, C5, 2C5, 1C5, 3C5, 25, 225, 125, 325, A5, 2A5, 1A5, 3A5, 65, 265, 165, 365, E5, 2E5, 1E5, 3E5, 15, 215, 115, 315, 95, 295, 195, 395, 55, 255, 155, 355, D5, 2D5, 1D5, 3D5, 35, 235, 135, 335, B5, 2B5, 1B5, 3B5, 75, 275, 175, 375, F5, 2F5, 1F5, 3F5, D, 20D, 10D, 30D, 8D, 28D, 18D, 38D, 4D, 24D, 14D, 34D, CD, 2CD, 1CD, 3CD, 2D, 22D, 12D, 32D, AD, 2AD, 1AD, 3AD, 6D, 26D, 16D, 36D, ED, 2ED, 1ED, 3ED, 1D, 21D, 11D, 31D, 9D, 29D, 19D, 39D, 5D, 25D, 15D, 35D, DD, 2DD, 1DD, 3DD, 3D, 23D, 13D, 33D, BD, 2BD, 1BD, 3BD, 7D, 27D, 17D, 37D, FD, 2FD, 1FD, 3FD, 3, 203, 103, 303, 83, 283, 183, 383, 43, 243, 143, 343, C3, 2C3, 1C3, 3C3, 23, 223, 123, 323, A3, 2A3, 1A3, 3A3, 63, 263, 163, 363, E3, 2E3, 1E3, 3E3, 13, 213, 113, 313, 93, 293, 193, 393, 53, 253, 153, 353, D3, 2D3, 1D3, 3D3, 33, 233, 133, 333, B3, 2B3, 1B3, 3B3, 73, 273, 173, 373, F3, 2F3, 1F3, 3F3, B, 20B, 10B, 30B, 8B, 28B, 18B, 38B, 4B, 24B, 14B, 34B, CB, 2CB, 1CB, 3CB, 2B, 22B, 12B, 32B, AB, 2AB, 1AB, 3AB, 6B, 26B, 16B, 36B, EB, 2EB, 1EB, 3EB, 1B, 21B, 11B, 31B, 9B, 29B, 19B, 39B, 5B, 25B, 15B, 35B, DB, 2DB, 1DB, 3DB, 3B, 23B, 13B, 33B, BB, 2BB, 1BB, 3BB, 7B, 27B, 17B, 37B, FB, 2FB, 1FB, 3FB, 7, 207, 107, 307, 87, 287, 187, 387, 47, 247, 147, 347, C7, 2C7, 1C7, 3C7, 27, 227, 127, 327, A7, 2A7, 1A7, 3A7, 67, 267, 167, 367, E7, 2E7, 1E7, 3E7, 17, 217, 117, 317, 97, 297, 197, 397, 57, 257, 157, 357, D7, 2D7, 1D7, 3D7, 37, 237, 137, 337, B7, 2B7, 1B7, 3B7, 77, 277, 177, 377, F7, 2F7, 1F7, 3F7, F, 20F, 10F, 30F, 8F, 28F, 18F, 38F, 4F, 24F, 14F, 34F, CF, 2CF, 1CF, 3CF, 2F, 22F, 12F, 32F, AF, 2AF, 1AF, 3AF, 6F, 26F, 16F, 36F, EF, 2EF, 1EF, 3EF, 1F, 21F, 11F, 31F, 9F, 29F, 19F, 39F, 5F, 25F, 15F, 35F, DF, 2DF, 1DF, 3DF, 3F, 23F, 13F, 33F, BF, 2BF, 1BF, 3BF, 7F, 27F, 17F, 37F, FF, 2FF, 1FF, 3FF;',
    '
]',
    'CSET common_output_ce = false',
    'CSET common_output_clk = false',
    'CSET create_rpm = false',
    'CSET data_width = 10',
    'CSET default_data = 0',
    'CSET default_data_radix = 16',
    'CSET depth = 1024',
    'CSET dual_port_address = non_registered',
    'CSET dual_port_output_clock_enable = false',
    'CSET input_clock_enable = false',
    'CSET input_options = non_registered',
    'CSET latency = 0',
    'CSET memory_type = rom',
    'CSET multiplexer_construction = lut_based',
    'CSET output_options = non_registered',
    'CSET qualify_we_with_i_ce = false',
    'CSET read_enable = false',
    'CSET reset_qdpo = false',
    'CSET reset_qspo = false',
    'CSET single_port_output_clock_enable = false',
    'CSET sync_reset_qdpo = false',
    'CSET sync_reset_qspo = false',
    'CSET component_name = distributed_memory_virtex2p_7_1_47fa87c2abb2be3c',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '2cb9580c15c049c28d4d2da60bf1bca8',
    'sourceFile' => 'hdl/xlsprom_dist.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      a: in std_logic_vector(c_address_width - 1 downto 0);
      spo: out std_logic_vector(c_width - 1 downto 0) ',
      'core_instance_text' => '        a => core_addr,
        spo => core_data_out',
      'core_name0' => 'distributed_memory_virtex2p_7_1_47fa87c2abb2be3c',
      'entity_name.0' => 'xlsprom_dist',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '49dec41768df7a8ab35653f024b7b162',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Distributed_Memory Virtex2P Xilinx,_Inc. 7.1',
    '# 10.1.03i',
    'CSET ce_overrides = sync_controls_overrides_ce',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 3FF, 1FF, 2FF, FF, 37F, 17F, 27F, 7F, 3BF, 1BF, 2BF, BF, 33F, 13F, 23F, 3F, 3DF, 1DF, 2DF, DF, 35F, 15F, 25F, 5F, 39F, 19F, 29F, 9F, 31F, 11F, 21F, 1F, 3EF, 1EF, 2EF, EF, 36F, 16F, 26F, 6F, 3AF, 1AF, 2AF, AF, 32F, 12F, 22F, 2F, 3CF, 1CF, 2CF, CF, 34F, 14F, 24F, 4F, 38F, 18F, 28F, 8F, 30F, 10F, 20F, F, 3F7, 1F7, 2F7, F7, 377, 177, 277, 77, 3B7, 1B7, 2B7, B7, 337, 137, 237, 37, 3D7, 1D7, 2D7, D7, 357, 157, 257, 57, 397, 197, 297, 97, 317, 117, 217, 17, 3E7, 1E7, 2E7, E7, 367, 167, 267, 67, 3A7, 1A7, 2A7, A7, 327, 127, 227, 27, 3C7, 1C7, 2C7, C7, 347, 147, 247, 47, 387, 187, 287, 87, 307, 107, 207, 7, 3FB, 1FB, 2FB, FB, 37B, 17B, 27B, 7B, 3BB, 1BB, 2BB, BB, 33B, 13B, 23B, 3B, 3DB, 1DB, 2DB, DB, 35B, 15B, 25B, 5B, 39B, 19B, 29B, 9B, 31B, 11B, 21B, 1B, 3EB, 1EB, 2EB, EB, 36B, 16B, 26B, 6B, 3AB, 1AB, 2AB, AB, 32B, 12B, 22B, 2B, 3CB, 1CB, 2CB, CB, 34B, 14B, 24B, 4B, 38B, 18B, 28B, 8B, 30B, 10B, 20B, B, 3F3, 1F3, 2F3, F3, 373, 173, 273, 73, 3B3, 1B3, 2B3, B3, 333, 133, 233, 33, 3D3, 1D3, 2D3, D3, 353, 153, 253, 53, 393, 193, 293, 93, 313, 113, 213, 13, 3E3, 1E3, 2E3, E3, 363, 163, 263, 63, 3A3, 1A3, 2A3, A3, 323, 123, 223, 23, 3C3, 1C3, 2C3, C3, 343, 143, 243, 43, 383, 183, 283, 83, 303, 103, 203, 3, 3FD, 1FD, 2FD, FD, 37D, 17D, 27D, 7D, 3BD, 1BD, 2BD, BD, 33D, 13D, 23D, 3D, 3DD, 1DD, 2DD, DD, 35D, 15D, 25D, 5D, 39D, 19D, 29D, 9D, 31D, 11D, 21D, 1D, 3ED, 1ED, 2ED, ED, 36D, 16D, 26D, 6D, 3AD, 1AD, 2AD, AD, 32D, 12D, 22D, 2D, 3CD, 1CD, 2CD, CD, 34D, 14D, 24D, 4D, 38D, 18D, 28D, 8D, 30D, 10D, 20D, D, 3F5, 1F5, 2F5, F5, 375, 175, 275, 75, 3B5, 1B5, 2B5, B5, 335, 135, 235, 35, 3D5, 1D5, 2D5, D5, 355, 155, 255, 55, 395, 195, 295, 95, 315, 115, 215, 15, 3E5, 1E5, 2E5, E5, 365, 165, 265, 65, 3A5, 1A5, 2A5, A5, 325, 125, 225, 25, 3C5, 1C5, 2C5, C5, 345, 145, 245, 45, 385, 185, 285, 85, 305, 105, 205, 5, 3F9, 1F9, 2F9, F9, 379, 179, 279, 79, 3B9, 1B9, 2B9, B9, 339, 139, 239, 39, 3D9, 1D9, 2D9, D9, 359, 159, 259, 59, 399, 199, 299, 99, 319, 119, 219, 19, 3E9, 1E9, 2E9, E9, 369, 169, 269, 69, 3A9, 1A9, 2A9, A9, 329, 129, 229, 29, 3C9, 1C9, 2C9, C9, 349, 149, 249, 49, 389, 189, 289, 89, 309, 109, 209, 9, 3F1, 1F1, 2F1, F1, 371, 171, 271, 71, 3B1, 1B1, 2B1, B1, 331, 131, 231, 31, 3D1, 1D1, 2D1, D1, 351, 151, 251, 51, 391, 191, 291, 91, 311, 111, 211, 11, 3E1, 1E1, 2E1, E1, 361, 161, 261, 61, 3A1, 1A1, 2A1, A1, 321, 121, 221, 21, 3C1, 1C1, 2C1, C1, 341, 141, 241, 41, 381, 181, 281, 81, 301, 101, 201, 1, 3FE, 1FE, 2FE, FE, 37E, 17E, 27E, 7E, 3BE, 1BE, 2BE, BE, 33E, 13E, 23E, 3E, 3DE, 1DE, 2DE, DE, 35E, 15E, 25E, 5E, 39E, 19E, 29E, 9E, 31E, 11E, 21E, 1E, 3EE, 1EE, 2EE, EE, 36E, 16E, 26E, 6E, 3AE, 1AE, 2AE, AE, 32E, 12E, 22E, 2E, 3CE, 1CE, 2CE, CE, 34E, 14E, 24E, 4E, 38E, 18E, 28E, 8E, 30E, 10E, 20E, E, 3F6, 1F6, 2F6, F6, 376, 176, 276, 76, 3B6, 1B6, 2B6, B6, 336, 136, 236, 36, 3D6, 1D6, 2D6, D6, 356, 156, 256, 56, 396, 196, 296, 96, 316, 116, 216, 16, 3E6, 1E6, 2E6, E6, 366, 166, 266, 66, 3A6, 1A6, 2A6, A6, 326, 126, 226, 26, 3C6, 1C6, 2C6, C6, 346, 146, 246, 46, 386, 186, 286, 86, 306, 106, 206, 6, 3FA, 1FA, 2FA, FA, 37A, 17A, 27A, 7A, 3BA, 1BA, 2BA, BA, 33A, 13A, 23A, 3A, 3DA, 1DA, 2DA, DA, 35A, 15A, 25A, 5A, 39A, 19A, 29A, 9A, 31A, 11A, 21A, 1A, 3EA, 1EA, 2EA, EA, 36A, 16A, 26A, 6A, 3AA, 1AA, 2AA, AA, 32A, 12A, 22A, 2A, 3CA, 1CA, 2CA, CA, 34A, 14A, 24A, 4A, 38A, 18A, 28A, 8A, 30A, 10A, 20A, A, 3F2, 1F2, 2F2, F2, 372, 172, 272, 72, 3B2, 1B2, 2B2, B2, 332, 132, 232, 32, 3D2, 1D2, 2D2, D2, 352, 152, 252, 52, 392, 192, 292, 92, 312, 112, 212, 12, 3E2, 1E2, 2E2, E2, 362, 162, 262, 62, 3A2, 1A2, 2A2, A2, 322, 122, 222, 22, 3C2, 1C2, 2C2, C2, 342, 142, 242, 42, 382, 182, 282, 82, 302, 102, 202, 2, 3FC, 1FC, 2FC, FC, 37C, 17C, 27C, 7C, 3BC, 1BC, 2BC, BC, 33C, 13C, 23C, 3C, 3DC, 1DC, 2DC, DC, 35C, 15C, 25C, 5C, 39C, 19C, 29C, 9C, 31C, 11C, 21C, 1C, 3EC, 1EC, 2EC, EC, 36C, 16C, 26C, 6C, 3AC, 1AC, 2AC, AC, 32C, 12C, 22C, 2C, 3CC, 1CC, 2CC, CC, 34C, 14C, 24C, 4C, 38C, 18C, 28C, 8C, 30C, 10C, 20C, C, 3F4, 1F4, 2F4, F4, 374, 174, 274, 74, 3B4, 1B4, 2B4, B4, 334, 134, 234, 34, 3D4, 1D4, 2D4, D4, 354, 154, 254, 54, 394, 194, 294, 94, 314, 114, 214, 14, 3E4, 1E4, 2E4, E4, 364, 164, 264, 64, 3A4, 1A4, 2A4, A4, 324, 124, 224, 24, 3C4, 1C4, 2C4, C4, 344, 144, 244, 44, 384, 184, 284, 84, 304, 104, 204, 4, 3F8, 1F8, 2F8, F8, 378, 178, 278, 78, 3B8, 1B8, 2B8, B8, 338, 138, 238, 38, 3D8, 1D8, 2D8, D8, 358, 158, 258, 58, 398, 198, 298, 98, 318, 118, 218, 18, 3E8, 1E8, 2E8, E8, 368, 168, 268, 68, 3A8, 1A8, 2A8, A8, 328, 128, 228, 28, 3C8, 1C8, 2C8, C8, 348, 148, 248, 48, 388, 188, 288, 88, 308, 108, 208, 8, 3F0, 1F0, 2F0, F0, 370, 170, 270, 70, 3B0, 1B0, 2B0, B0, 330, 130, 230, 30, 3D0, 1D0, 2D0, D0, 350, 150, 250, 50, 390, 190, 290, 90, 310, 110, 210, 10, 3E0, 1E0, 2E0, E0, 360, 160, 260, 60, 3A0, 1A0, 2A0, A0, 320, 120, 220, 20, 3C0, 1C0, 2C0, C0, 340, 140, 240, 40, 380, 180, 280, 80, 300, 100, 200, 0;',
    '
]',
    'CSET common_output_ce = false',
    'CSET common_output_clk = false',
    'CSET create_rpm = false',
    'CSET data_width = 10',
    'CSET default_data = 0',
    'CSET default_data_radix = 16',
    'CSET depth = 1024',
    'CSET dual_port_address = non_registered',
    'CSET dual_port_output_clock_enable = false',
    'CSET input_clock_enable = false',
    'CSET input_options = non_registered',
    'CSET latency = 0',
    'CSET memory_type = rom',
    'CSET multiplexer_construction = lut_based',
    'CSET output_options = non_registered',
    'CSET qualify_we_with_i_ce = false',
    'CSET read_enable = false',
    'CSET reset_qdpo = false',
    'CSET reset_qspo = false',
    'CSET single_port_output_clock_enable = false',
    'CSET sync_reset_qdpo = false',
    'CSET sync_reset_qspo = false',
    'CSET component_name = distributed_memory_virtex2p_7_1_4be7d839ed9b4fda',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '3abb234eb8cc889b4ebd6ea72e9272f9',
    'sourceFile' => 'hdl/xlsprom_dist.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      a: in std_logic_vector(c_address_width - 1 downto 0);
      spo: out std_logic_vector(c_width - 1 downto 0) ',
      'core_instance_text' => '        a => core_addr,
        spo => core_data_out',
      'core_name0' => 'distributed_memory_virtex2p_7_1_4be7d839ed9b4fda',
      'entity_name.0' => 'xlsprom_dist',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '33d0bd4da38e5cae4fc9beffbd0ed266',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "0000000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((10 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_498bc68c14',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = TRUE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 10',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_0260fba4aec82188',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '1eaaa974bce8c12319e83d8e485e2795',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_0260fba4aec82188',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '62bc9f8a3c249b32ba23a34fb1c28724',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((10 - 1) downto 0);
  signal b_1_34: unsigned((10 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_12_3_rel <= a_1_31 = b_1_34;
  op <= boolean_to_vector(result_12_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((10 - 1) downto 0);
    b : in std_logic_vector((10 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_0ffd72e037',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'e60c7f93417c4918cb2226f7ead0aa05',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert_pipeline.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '482e6af4080628898aa31a616e33b9d8',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '44d8d5fbe953f29b602111d7f0c39696',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic_vector((19 - 1) downto 0);
  signal d1_1_27: std_logic_vector((19 - 1) downto 0);
  type array_type_pipe_16_22 is array (0 to (1 - 1)) of std_logic_vector((20 - 1) downto 0);
  signal pipe_16_22: array_type_pipe_16_22 := (
    0 => "00000000000000000000");
  signal pipe_16_22_front_din: std_logic_vector((20 - 1) downto 0);
  signal pipe_16_22_back: std_logic_vector((20 - 1) downto 0);
  signal pipe_16_22_push_front_pop_back_en: std_logic;
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((20 - 1) downto 0);
begin
  sel_1_20 <= sel(0);
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  pipe_16_22_back <= pipe_16_22(0);
  proc_pipe_16_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (pipe_16_22_push_front_pop_back_en = \'1\')) then
        pipe_16_22(0) <= pipe_16_22_front_din;
      end if;
    end if;
  end process proc_pipe_16_22;
  sel_internal_2_1_convert <= cast(std_logic_to_vector(sel_1_20), 0, 1, 0, xlUnsigned);
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_internal_2_1_convert)
  is
  begin
    case sel_internal_2_1_convert is 
      when "0" =>
        unregy_join_6_1 <= cast(d0_1_24, 17, 20, 18, xlSigned);
      when others =>
        unregy_join_6_1 <= cast(d1_1_27, 18, 20, 18, xlSigned);
    end case;
  end process proc_switch_6_1;
  pipe_16_22_front_din <= unregy_join_6_1;
  pipe_16_22_push_front_pop_back_en <= \'1\';
  y <= pipe_16_22_back;
end',
      'crippled_entity' => 'is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((19 - 1) downto 0);
    d1 : in std_logic_vector((19 - 1) downto 0);
    y : out std_logic_vector((20 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_610aab71b1',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '1899a3cb359c4a6df2e0f1f184ab3d7c',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal ip_17_23: signed((19 - 1) downto 0);
begin
  ip_17_23 <= std_logic_vector_to_signed(ip);
  op <= signed_to_std_logic_vector(ip_17_23);
end',
      'crippled_entity' => 'is
  port (
    ip : in std_logic_vector((19 - 1) downto 0);
    op : out std_logic_vector((19 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'scale_9f61027ba4',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = FALSE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 10',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_7c2d447100ca50c7',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f4aca4a868a985058763f1e2e2f4abdc',
    'sourceFile' => 'hdl/xlcounter_limit.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_7c2d447100ca50c7',
      'entity_name.0' => 'xlcounter_limit',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET depth = 1024',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_And_Write',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 36',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_Before_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_7c11f4ba4337f78b',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'bf62576bd687a2a504e5f7d0044dde5a',
    'sourceFile' => 'hdl/xlspram.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      din: in std_logic_vector(c_width - 1 downto 0);
      we: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => addr,
        clk => clk,
        din => data_in,
        we => core_we,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_7c11f4ba4337f78b',
      'entity_name.0' => 'xlspram',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = FALSE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 11',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_78a3dd824f4df0df',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f1a0d2e24f73b3e22f339c7ab69fcdb8',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_78a3dd824f4df0df',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'cb840e412e429ef1dc4193d23739cbd7',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((36 - 1) downto 0);
  signal d1_1_27: std_logic_vector((36 - 1) downto 0);
  type array_type_pipe_16_22 is array (0 to (1 - 1)) of std_logic_vector((36 - 1) downto 0);
  signal pipe_16_22: array_type_pipe_16_22 := (
    0 => "000000000000000000000000000000000000");
  signal pipe_16_22_front_din: std_logic_vector((36 - 1) downto 0);
  signal pipe_16_22_back: std_logic_vector((36 - 1) downto 0);
  signal pipe_16_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((36 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  pipe_16_22_back <= pipe_16_22(0);
  proc_pipe_16_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (pipe_16_22_push_front_pop_back_en = \'1\')) then
        pipe_16_22(0) <= pipe_16_22_front_din;
      end if;
    end if;
  end process proc_pipe_16_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  pipe_16_22_front_din <= unregy_join_6_1;
  pipe_16_22_push_front_pop_back_en <= \'1\';
  y <= pipe_16_22_back;
end',
      'crippled_entity' => 'is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((36 - 1) downto 0);
    d1 : in std_logic_vector((36 - 1) downto 0);
    y : out std_logic_vector((36 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_4bb6f691f7',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd7c50aa76537b48a319c9e5f7a482dfb',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '07408ec940b099bbb8a23dea08bcaff6',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert_pipeline.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = FALSE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 10',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_7c2d447100ca50c7',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '072a633e60fb9b7e5ffaf23714552992',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_7c2d447100ca50c7',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 1FFFF, 0, 16A0A, 295F6, 1D907, 33C11, C3EF, 226F9, 1F629, 39C1D, 11C74, 2564A, 1A9B6, 2E38C, 63E3, 209D7, 1FD89, 3CDD1, 144CF, 27438, 1C38B, 30EA5, 94A0, 2160C, 1E9F4, 36B60, F15B, 23C75, 18BC8, 2BB31, 322F, 20277, 1FF62, 3E6E1, 157D7, 284A2, 1CED8, 32517, AC7D, 21DEE, 1F0A8, 38398, 10738, 248D8, 19B3E, 2CF01, 4B20, 2058B, 1FA75, 3B4E0, 130FF, 264C2, 1B728, 2F8C8, 7C68, 20F58, 1E212, 35383, DAE9, 23128, 17B5E, 2A829, 191F, 2009E, 1FFD9, 3F36F, 1610B, 28D2F, 1D413, 33084, B844, 2224F, 1F38F, 38FD2, 111EB, 24F6F, 1A29A, 2D930, 5788, 2078A, 1FC26, 3C153, 13B00, 26C5E, 1BD7C, 303A3, 888F, 2128C, 1E629, 35F65, E633, 236AB, 183B1, 2B193, 25AA, 20163, 1FE9D, 3DA56, 14E6D, 27C4F, 1C955, 319CD, A09B, 219D7, 1ED74, 37771, FC5D, 24284, 193A2, 2C500, 3EAD, 203DA, 1F876, 3A878, 126D0, 25D66, 1B091, 2EE15, 702E, 20C71, 1DDB1, 347BC, CF7C, 22BED, 172D1, 29EF5, C91, 20027, 1FFF6, 3F9B8, 16592, 2918C, 1D696, 33647, BE1D, 2249B, 1F4E6, 395F5, 11735, 252D4, 1A631, 2DE58, 5DB7, 208A6, 1FCE1, 3C791, 13FEE, 27043, 1C08C, 3091F, 8E9A, 21442, 1E818, 3655F, EBCC, 23987, 187C4, 2B65C, 2BEE, 201E3, 1FF09, 3E09B, 15328, 28071, 1CC1F, 31F6E, A68F, 21BD9, 1EF18, 37D82, 101D0, 245A5, 19778, 2C9FA, 44E8, 204A8, 1F980, 3AEAA, 12BEE, 2610C, 1B3E5, 2F369, 764D, 20DDB, 1DFEB, 34D9C, D536, 22E82, 1771E, 2A388, 12D8, 20059, 1FFA7, 3ED28, 15C78, 288E2, 1D17E, 32ACA, B264, 22015, 1F225, 389B3, 10C97, 24C1B, 19EF4, 2D412, 5156, 20680, 1FB58, 3BB18, 13606, 26888, 1BA5B, 2FE30, 827E, 210E8, 1E427, 35971, E092, 233E1, 17F8F, 2ACD8, 1F65, 200F7, 1FE1D, 3D412, 149A4, 2783C, 1C679, 31434, 9AA1, 217E8, 1EBBE, 37166, F6E1, 23F74, 18FBD, 2C012, 386F, 2031F, 1F75A, 3A249, 121A8, 259CF, 1AD2C, 2E8CB, 6A0B, 20B1A, 1DB65, 341E3, C9B9, 2296A, 16E74, 29A6E, 648, 2000A, 1FFFE, 3FCDC, 167CF, 293BF, 1D7D1, 3392B, C107, 225C8, 1F58A, 39909, 119D6, 2548D, 1A7F6, 2E0F1, 60CE, 2093C, 1FD38, 3CAB1, 14260, 2723C, 1C20E, 30BE1, 919E, 21525, 1E908, 3685F, EE94, 23AFC, 189C8, 2B8C5, 2F0F, 2022B, 1FF38, 3E3BD, 15581, 28288, 1CD7E, 32242, A987, 21CE1, 1EFE2, 3808D, 10485, 2473C, 1995D, 2CC7C, 4804, 20517, 1F9FD, 3B1C5, 12E78, 262E5, 1B589, 2F617, 795B, 20E97, 1E101, 3508F, D810, 22FD3, 17940, 2A5D7, 15FC, 20079, 1FFC2, 3F04B, 15EC3, 28B07, 1D2CB, 32DA6, B555, 22130, 1F2DD, 38CC2, 10F42, 24DC3, 1A0C9, 2D6A0, 546F, 20703, 1FBC1, 3BE35, 13884, 26A71, 1BBED, 300E8, 8587, 211B8, 1E52A, 35C6A, E364, 23544, 181A2, 2AF34, 2288, 2012A, 1FE5F, 3D734, 14C0A, 27A44, 1C7E9, 316FF, 9D9E, 218DE, 1EC9B, 3746B, F9A0, 240FA, 191B1, 2C288, 3B8E, 2037A, 1F7EA, 3A560, 1243D, 25B98, 1AEE0, 2EB6F, 6D1D, 20BC3, 1DC8D, 344CE, CC9C, 22AA9, 170A4, 29CB0, 96D, 20016, 1FFEA, 3F693, 16350, 28F5C, 1D557, 33364, BB32, 22373, 1F43D, 392E3, 11491, 25120, 1A468, 2DBC3, 5AA0, 20816, 1FC86, 3C472, 13D78, 26E4F, 1BF06, 30660, 8B95, 21365, 1E722, 36262, E901, 23817, 185BC, 2B3F6, 28CC, 201A1, 1FED6, 3DD78, 150CC, 27E5E, 1CABC, 31C9C, A396, 21AD6, 1EE48, 37A79, FF18, 24413, 1958F, 2C77C, 41CB, 2043F, 1F8FD, 3AB91, 12960, 25F37, 1B23D, 2F0BE, 733E, 20D23, 1DED0, 34AAB, D25A, 22D35, 174F9, 2A13D, FB5, 2003E, 1FF87, 3EA04, 15A29, 286C0, 1D02D, 327F0, AF71, 21EFF, 1F169, 386A5, 109E9, 24A77, 19D1B, 2D188, 4E3B, 20603, 1FAE9, 3B7FC, 13384, 266A3, 1B8C4, 2FB7B, 7F73, 2101E, 1E31F, 35679, DDBE, 23282, 17D78, 2AA7F, 1C43, 200C8, 1FDD5, 3D0F1, 1473B, 27638, 1C504, 3116C, 97A1, 216F8, 1EADB, 36E62, F41F, 23DF2, 18DC4, 2BDA0, 354F, 202C8, 1F6C4, 39F32, 11F0F, 2580A, 1AB73, 2E62A, 66F7, 20A76, 1DA38, 33EF9, C6D5, 2282F, 16C41, 29831, 324, 20002;',
    '
]',
    'CSET depth = 512',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_pin = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_Only',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 18',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_After_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_189ab7d9865256c9',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '5fbcb6c543cd5cf1856c85d21091e78d',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => core_addr,
        clk => clk,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_189ab7d9865256c9',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 20000, 295F6, 295F6, 33C11, 226F9, 226F9, 33C11, 39C1D, 209D7, 2564A, 2E38C, 2E38C, 2564A, 209D7, 39C1D, 3CDD1, 20277, 27438, 2BB31, 30EA5, 23C75, 2160C, 36B60, 36B60, 2160C, 23C75, 30EA5, 2BB31, 27438, 20277, 3CDD1, 3E6E1, 2009E, 284A2, 2A829, 32517, 23128, 21DEE, 35383, 38398, 20F58, 248D8, 2F8C8, 2CF01, 264C2, 2058B, 3B4E0, 3B4E0, 2058B, 264C2, 2CF01, 2F8C8, 248D8, 20F58, 38398, 35383, 21DEE, 23128, 32517, 2A829, 284A2, 2009E, 3E6E1, 3F36F, 20027, 28D2F, 29EF5, 33084, 22BED, 2224F, 347BC, 38FD2, 20C71, 24F6F, 2EE15, 2D930, 25D66, 2078A, 3A878, 3C153, 203DA, 26C5E, 2C500, 303A3, 24284, 2128C, 37771, 35F65, 219D7, 236AB, 319CD, 2B193, 27C4F, 20163, 3DA56, 3DA56, 20163, 27C4F, 2B193, 319CD, 236AB, 219D7, 35F65, 37771, 2128C, 24284, 303A3, 2C500, 26C5E, 203DA, 3C153, 3A878, 2078A, 25D66, 2D930, 2EE15, 24F6F, 20C71, 38FD2, 347BC, 2224F, 22BED, 33084, 29EF5, 28D2F, 20027, 3F36F, 3F9B8, 2000A, 2918C, 29A6E, 33647, 2296A, 2249B, 341E3, 395F5, 20B1A, 252D4, 2E8CB, 2DE58, 259CF, 208A6, 3A249, 3C791, 2031F, 27043, 2C012, 3091F, 23F74, 21442, 37166, 3655F, 217E8, 23987, 31434, 2B65C, 2783C, 201E3, 3D412, 3E09B, 200F7, 28071, 2ACD8, 31F6E, 233E1, 21BD9, 35971, 37D82, 210E8, 245A5, 2FE30, 2C9FA, 26888, 204A8, 3BB18, 3AEAA, 20680, 2610C, 2D412, 2F369, 24C1B, 20DDB, 389B3, 34D9C, 22015, 22E82, 32ACA, 2A388, 288E2, 20059, 3ED28, 3ED28, 20059, 288E2, 2A388, 32ACA, 22E82, 22015, 34D9C, 389B3, 20DDB, 24C1B, 2F369, 2D412, 2610C, 20680, 3AEAA, 3BB18, 204A8, 26888, 2C9FA, 2FE30, 245A5, 210E8, 37D82, 35971, 21BD9, 233E1, 31F6E, 2ACD8, 28071, 200F7, 3E09B, 3D412, 201E3, 2783C, 2B65C, 31434, 23987, 217E8, 3655F, 37166, 21442, 23F74, 3091F, 2C012, 27043, 2031F, 3C791, 3A249, 208A6, 259CF, 2DE58, 2E8CB, 252D4, 20B1A, 395F5, 341E3, 2249B, 2296A, 33647, 29A6E, 2918C, 2000A, 3F9B8, 3FCDC, 20002, 293BF, 29831, 3392B, 2282F, 225C8, 33EF9, 39909, 20A76, 2548D, 2E62A, 2E0F1, 2580A, 2093C, 39F32, 3CAB1, 202C8, 2723C, 2BDA0, 30BE1, 23DF2, 21525, 36E62, 3685F, 216F8, 23AFC, 3116C, 2B8C5, 27638, 2022B, 3D0F1, 3E3BD, 200C8, 28288, 2AA7F, 32242, 23282, 21CE1, 35679, 3808D, 2101E, 2473C, 2FB7B, 2CC7C, 266A3, 20517, 3B7FC, 3B1C5, 20603, 262E5, 2D188, 2F617, 24A77, 20E97, 386A5, 3508F, 21EFF, 22FD3, 327F0, 2A5D7, 286C0, 20079, 3EA04, 3F04B, 2003E, 28B07, 2A13D, 32DA6, 22D35, 22130, 34AAB, 38CC2, 20D23, 24DC3, 2F0BE, 2D6A0, 25F37, 20703, 3AB91, 3BE35, 2043F, 26A71, 2C77C, 300E8, 24413, 211B8, 37A79, 35C6A, 21AD6, 23544, 31C9C, 2AF34, 27E5E, 2012A, 3DD78, 3D734, 201A1, 27A44, 2B3F6, 316FF, 23817, 218DE, 36262, 3746B, 21365, 240FA, 30660, 2C288, 26E4F, 2037A, 3C472, 3A560, 20816, 25B98, 2DBC3, 2EB6F, 25120, 20BC3, 392E3, 344CE, 22373, 22AA9, 33364, 29CB0, 28F5C, 20016, 3F693, 3F693, 20016, 28F5C, 29CB0, 33364, 22AA9, 22373, 344CE, 392E3, 20BC3, 25120, 2EB6F, 2DBC3, 25B98, 20816, 3A560, 3C472, 2037A, 26E4F, 2C288, 30660, 240FA, 21365, 3746B, 36262, 218DE, 23817, 316FF, 2B3F6, 27A44, 201A1, 3D734, 3DD78, 2012A, 27E5E, 2AF34, 31C9C, 23544, 21AD6, 35C6A, 37A79, 211B8, 24413, 300E8, 2C77C, 26A71, 2043F, 3BE35, 3AB91, 20703, 25F37, 2D6A0, 2F0BE, 24DC3, 20D23, 38CC2, 34AAB, 22130, 22D35, 32DA6, 2A13D, 28B07, 2003E, 3F04B, 3EA04, 20079, 286C0, 2A5D7, 327F0, 22FD3, 21EFF, 3508F, 386A5, 20E97, 24A77, 2F617, 2D188, 262E5, 20603, 3B1C5, 3B7FC, 20517, 266A3, 2CC7C, 2FB7B, 2473C, 2101E, 3808D, 35679, 21CE1, 23282, 32242, 2AA7F, 28288, 200C8, 3E3BD, 3D0F1, 2022B, 27638, 2B8C5, 3116C, 23AFC, 216F8, 3685F, 36E62, 21525, 23DF2, 30BE1, 2BDA0, 2723C, 202C8, 3CAB1, 39F32, 2093C, 2580A, 2E0F1, 2E62A, 2548D, 20A76, 39909, 33EF9, 225C8, 2282F, 3392B, 29831, 293BF, 20002, 3FCDC;',
    '
]',
    'CSET depth = 512',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_pin = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_Only',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 18',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_After_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_a255629948a6346d',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'af39a76f7d7b5e6868a3c18f124b5ca5',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => core_addr,
        clk => clk,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_a255629948a6346d',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '40e19af8fee368381dda7e4cf1f61ecd',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '56dca286730fb8d117bf64ae923f2e72',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert_pipeline.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ef3f8a4e3b04b6a6b6cb7f94f82a927b',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((21 - 1) downto 0);
  signal b_17_35: signed((21 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (2 - 1)) of signed((22 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    "0000000000000000000000",
    "0000000000000000000000");
  signal op_mem_91_20_front_din: signed((22 - 1) downto 0);
  signal op_mem_91_20_back: signed((22 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (2 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    "0",
    "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_71_18: signed((22 - 1) downto 0);
  signal cast_71_22: signed((22 - 1) downto 0);
  signal internal_s_71_5_addsub: signed((22 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(1);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        for i in 1 downto 1 loop 
          op_mem_91_20(i) <= op_mem_91_20(i-1);
        end loop;
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(1);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
        for i_x_000000 in 1 downto 1 loop 
          cout_mem_92_22(i_x_000000) <= cout_mem_92_22(i_x_000000-1);
        end loop;
        cout_mem_92_22(0) <= cout_mem_92_22_front_din;
      end if;
    end if;
  end process proc_cout_mem_92_22;
  prev_mode_93_22_reg_i <= unsigned_to_std_logic_vector(prev_mode_93_22_next);
  prev_mode_93_22 <= std_logic_vector_to_unsigned(prev_mode_93_22_reg_o);
  prev_mode_93_22_reg_inst: entity work.synth_reg_w_init
    generic map (
      init_index => 2, 
      init_value => b"010", 
      latency => 1, 
      width => 3)
    port map (
      ce => ce, 
      clk => clk, 
      clr => clr, 
      i => prev_mode_93_22_reg_i, 
      o => prev_mode_93_22_reg_o);
  cast_71_18 <= s2s_cast(a_17_32, 18, 22, 18);
  cast_71_22 <= s2s_cast(b_17_35, 18, 22, 18);
  internal_s_71_5_addsub <= cast_71_18 - cast_71_22;
  op_mem_91_20_front_din <= internal_s_71_5_addsub;
  op_mem_91_20_push_front_pop_back_en <= \'1\';
  cout_mem_92_22_front_din <= std_logic_vector_to_unsigned("0");
  cout_mem_92_22_push_front_pop_back_en <= \'1\';
  prev_mode_93_22_next <= std_logic_vector_to_unsigned("000");
  s <= signed_to_std_logic_vector(op_mem_91_20_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((21 - 1) downto 0);
    b : in std_logic_vector((21 - 1) downto 0);
    s : out std_logic_vector((22 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_6e32911fe1',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b27eb3c775b335702fff416ef14d60ed',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((21 - 1) downto 0);
  signal b_17_35: signed((21 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (2 - 1)) of signed((22 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    "0000000000000000000000",
    "0000000000000000000000");
  signal op_mem_91_20_front_din: signed((22 - 1) downto 0);
  signal op_mem_91_20_back: signed((22 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (2 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    "0",
    "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_69_18: signed((22 - 1) downto 0);
  signal cast_69_22: signed((22 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((22 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(1);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        for i in 1 downto 1 loop 
          op_mem_91_20(i) <= op_mem_91_20(i-1);
        end loop;
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(1);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
        for i_x_000000 in 1 downto 1 loop 
          cout_mem_92_22(i_x_000000) <= cout_mem_92_22(i_x_000000-1);
        end loop;
        cout_mem_92_22(0) <= cout_mem_92_22_front_din;
      end if;
    end if;
  end process proc_cout_mem_92_22;
  prev_mode_93_22_reg_i <= unsigned_to_std_logic_vector(prev_mode_93_22_next);
  prev_mode_93_22 <= std_logic_vector_to_unsigned(prev_mode_93_22_reg_o);
  prev_mode_93_22_reg_inst: entity work.synth_reg_w_init
    generic map (
      init_index => 2, 
      init_value => b"010", 
      latency => 1, 
      width => 3)
    port map (
      ce => ce, 
      clk => clk, 
      clr => clr, 
      i => prev_mode_93_22_reg_i, 
      o => prev_mode_93_22_reg_o);
  cast_69_18 <= s2s_cast(a_17_32, 18, 22, 18);
  cast_69_22 <= s2s_cast(b_17_35, 18, 22, 18);
  internal_s_69_5_addsub <= cast_69_18 + cast_69_22;
  op_mem_91_20_front_din <= internal_s_69_5_addsub;
  op_mem_91_20_push_front_pop_back_en <= \'1\';
  cout_mem_92_22_front_din <= std_logic_vector_to_unsigned("0");
  cout_mem_92_22_push_front_pop_back_en <= \'1\';
  prev_mode_93_22_next <= std_logic_vector_to_unsigned("000");
  s <= signed_to_std_logic_vector(op_mem_91_20_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((21 - 1) downto 0);
    b : in std_logic_vector((21 - 1) downto 0);
    s : out std_logic_vector((22 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_f6ef4de287',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'dd2d28d42a9c42940857ace1a68cb742',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c0975e60177764f1d928d8c1f19c94e5',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'abf569a1228c9b312b3246831aa16991',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '1ffa33aea69eda48e0a7dc90256e4e7a',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f7c9612e5479b760ad4724b6dc5ced76',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Multiplier Virtex2P Xilinx,_Inc. 10.1',
    '# 10.1.03i',
    'CSET ccmimp = Distributed_Memory',
    'CSET clockenable = true',
    'CSET constvalue = 129',
    'CSET internaluser = 0',
    'CSET multiplier_construction = Use_Mults',
    'CSET multtype = Parallel_Multiplier',
    'CSET optgoal = Speed',
    'CSET outputwidthhigh = 35',
    'CSET outputwidthlow = 0',
    'CSET pipestages = 2',
    'CSET portatype = Signed',
    'CSET portawidth = 18',
    'CSET portbtype = Signed',
    'CSET portbwidth = 18',
    'CSET roundpoint = 0',
    'CSET sclrcepriority = CE_Overrides_SCLR',
    'CSET syncclear = true',
    'CSET use_custom_output_width = false',
    'CSET userounding = false',
    'CSET zerodetect = false',
    'CSET component_name = multiplier_virtex2p_10_1_3ccc2842ec4e2cc9',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '83440f0cbadb95f9071fa9976e6b1ff5',
    'sourceFile' => 'hdl/xlmult_v9_0.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      b: in std_logic_vector(c_b_width - 1 downto 0);
      p: out std_logic_vector(c_output_width - 1 downto 0);
      clk: in std_logic;
      ce: in std_logic;
      sclr: in std_logic;
      a: in std_logic_vector(c_a_width - 1 downto 0)',
      'core_instance_text' => '        a => tmp_a,
        clk => clk,
        ce => internal_ce,
        sclr => internal_clr,
        p => tmp_p,
        b => tmp_b',
      'core_name0' => 'multiplier_virtex2p_10_1_3ccc2842ec4e2cc9',
      'entity_name.0' => 'xlmult_v9_0',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Multiplier Virtex2P Xilinx,_Inc. 10.1',
    '# 10.1.03i',
    'CSET ccmimp = Distributed_Memory',
    'CSET clockenable = true',
    'CSET constvalue = 129',
    'CSET internaluser = 0',
    'CSET multiplier_construction = Use_Mults',
    'CSET multtype = Parallel_Multiplier',
    'CSET optgoal = Speed',
    'CSET outputwidthhigh = 35',
    'CSET outputwidthlow = 0',
    'CSET pipestages = 2',
    'CSET portatype = Signed',
    'CSET portawidth = 18',
    'CSET portbtype = Signed',
    'CSET portbwidth = 18',
    'CSET roundpoint = 0',
    'CSET sclrcepriority = CE_Overrides_SCLR',
    'CSET syncclear = true',
    'CSET use_custom_output_width = false',
    'CSET userounding = false',
    'CSET zerodetect = false',
    'CSET component_name = multiplier_virtex2p_10_1_3ccc2842ec4e2cc9',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '5fb2716e7bfe1b49caf3fe9f631ffc84',
    'sourceFile' => 'hdl/xlmult_v9_0.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      b: in std_logic_vector(c_b_width - 1 downto 0);
      p: out std_logic_vector(c_output_width - 1 downto 0);
      clk: in std_logic;
      ce: in std_logic;
      sclr: in std_logic;
      a: in std_logic_vector(c_a_width - 1 downto 0)',
      'core_instance_text' => '        a => tmp_a,
        clk => clk,
        ce => internal_ce,
        sclr => internal_clr,
        p => tmp_p,
        b => tmp_b',
      'core_name0' => 'multiplier_virtex2p_10_1_3ccc2842ec4e2cc9',
      'entity_name.0' => 'xlmult_v9_0',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '2c2d1172088eefd42a2858d7e0abd91b',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((18 - 1) downto 0);
  signal b_17_35: signed((22 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (2 - 1)) of signed((23 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    "00000000000000000000000",
    "00000000000000000000000");
  signal op_mem_91_20_front_din: signed((23 - 1) downto 0);
  signal op_mem_91_20_back: signed((23 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (2 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    "0",
    "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_69_18: signed((23 - 1) downto 0);
  signal cast_69_22: signed((23 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((23 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(1);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        for i in 1 downto 1 loop 
          op_mem_91_20(i) <= op_mem_91_20(i-1);
        end loop;
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(1);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
        for i_x_000000 in 1 downto 1 loop 
          cout_mem_92_22(i_x_000000) <= cout_mem_92_22(i_x_000000-1);
        end loop;
        cout_mem_92_22(0) <= cout_mem_92_22_front_din;
      end if;
    end if;
  end process proc_cout_mem_92_22;
  prev_mode_93_22_reg_i <= unsigned_to_std_logic_vector(prev_mode_93_22_next);
  prev_mode_93_22 <= std_logic_vector_to_unsigned(prev_mode_93_22_reg_o);
  prev_mode_93_22_reg_inst: entity work.synth_reg_w_init
    generic map (
      init_index => 2, 
      init_value => b"010", 
      latency => 1, 
      width => 3)
    port map (
      ce => ce, 
      clk => clk, 
      clr => clr, 
      i => prev_mode_93_22_reg_i, 
      o => prev_mode_93_22_reg_o);
  cast_69_18 <= s2s_cast(a_17_32, 17, 23, 18);
  cast_69_22 <= s2s_cast(b_17_35, 18, 23, 18);
  internal_s_69_5_addsub <= cast_69_18 + cast_69_22;
  op_mem_91_20_front_din <= internal_s_69_5_addsub;
  op_mem_91_20_push_front_pop_back_en <= \'1\';
  cout_mem_92_22_front_din <= std_logic_vector_to_unsigned("0");
  cout_mem_92_22_push_front_pop_back_en <= \'1\';
  prev_mode_93_22_next <= std_logic_vector_to_unsigned("000");
  s <= signed_to_std_logic_vector(op_mem_91_20_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((18 - 1) downto 0);
    b : in std_logic_vector((22 - 1) downto 0);
    s : out std_logic_vector((23 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_b167d676fa',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '8fa50db4932547c2104fe48329ad2601',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((18 - 1) downto 0);
  signal b_17_35: signed((22 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (2 - 1)) of signed((23 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    "00000000000000000000000",
    "00000000000000000000000");
  signal op_mem_91_20_front_din: signed((23 - 1) downto 0);
  signal op_mem_91_20_back: signed((23 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (2 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    "0",
    "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_71_18: signed((23 - 1) downto 0);
  signal cast_71_22: signed((23 - 1) downto 0);
  signal internal_s_71_5_addsub: signed((23 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(1);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        for i in 1 downto 1 loop 
          op_mem_91_20(i) <= op_mem_91_20(i-1);
        end loop;
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(1);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
        for i_x_000000 in 1 downto 1 loop 
          cout_mem_92_22(i_x_000000) <= cout_mem_92_22(i_x_000000-1);
        end loop;
        cout_mem_92_22(0) <= cout_mem_92_22_front_din;
      end if;
    end if;
  end process proc_cout_mem_92_22;
  prev_mode_93_22_reg_i <= unsigned_to_std_logic_vector(prev_mode_93_22_next);
  prev_mode_93_22 <= std_logic_vector_to_unsigned(prev_mode_93_22_reg_o);
  prev_mode_93_22_reg_inst: entity work.synth_reg_w_init
    generic map (
      init_index => 2, 
      init_value => b"010", 
      latency => 1, 
      width => 3)
    port map (
      ce => ce, 
      clk => clk, 
      clr => clr, 
      i => prev_mode_93_22_reg_i, 
      o => prev_mode_93_22_reg_o);
  cast_71_18 <= s2s_cast(a_17_32, 17, 23, 18);
  cast_71_22 <= s2s_cast(b_17_35, 18, 23, 18);
  internal_s_71_5_addsub <= cast_71_18 - cast_71_22;
  op_mem_91_20_front_din <= internal_s_71_5_addsub;
  op_mem_91_20_push_front_pop_back_en <= \'1\';
  cout_mem_92_22_front_din <= std_logic_vector_to_unsigned("0");
  cout_mem_92_22_push_front_pop_back_en <= \'1\';
  prev_mode_93_22_next <= std_logic_vector_to_unsigned("000");
  s <= signed_to_std_logic_vector(op_mem_91_20_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((18 - 1) downto 0);
    b : in std_logic_vector((22 - 1) downto 0);
    s : out std_logic_vector((23 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_0816bd8680',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'de36a5ad7811157fb5e1366259eef94f',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic_vector((23 - 1) downto 0);
  signal d1_1_27: std_logic_vector((23 - 1) downto 0);
  type array_type_pipe_16_22 is array (0 to (1 - 1)) of std_logic_vector((24 - 1) downto 0);
  signal pipe_16_22: array_type_pipe_16_22 := (
    0 => "000000000000000000000000");
  signal pipe_16_22_front_din: std_logic_vector((24 - 1) downto 0);
  signal pipe_16_22_back: std_logic_vector((24 - 1) downto 0);
  signal pipe_16_22_push_front_pop_back_en: std_logic;
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((24 - 1) downto 0);
begin
  sel_1_20 <= sel(0);
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  pipe_16_22_back <= pipe_16_22(0);
  proc_pipe_16_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (pipe_16_22_push_front_pop_back_en = \'1\')) then
        pipe_16_22(0) <= pipe_16_22_front_din;
      end if;
    end if;
  end process proc_pipe_16_22;
  sel_internal_2_1_convert <= cast(std_logic_to_vector(sel_1_20), 0, 1, 0, xlUnsigned);
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_internal_2_1_convert)
  is
  begin
    case sel_internal_2_1_convert is 
      when "0" =>
        unregy_join_6_1 <= cast(d0_1_24, 18, 24, 19, xlSigned);
      when others =>
        unregy_join_6_1 <= cast(d1_1_27, 19, 24, 19, xlSigned);
    end case;
  end process proc_switch_6_1;
  pipe_16_22_front_din <= unregy_join_6_1;
  pipe_16_22_push_front_pop_back_en <= \'1\';
  y <= pipe_16_22_back;
end',
      'crippled_entity' => 'is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((23 - 1) downto 0);
    d1 : in std_logic_vector((23 - 1) downto 0);
    y : out std_logic_vector((24 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_5f181dc739',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'dae74d78d89571218d665e6f3713eb8f',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal ip_17_23: signed((23 - 1) downto 0);
begin
  ip_17_23 <= std_logic_vector_to_signed(ip);
  op <= signed_to_std_logic_vector(ip_17_23);
end',
      'crippled_entity' => 'is
  port (
    ip : in std_logic_vector((23 - 1) downto 0);
    op : out std_logic_vector((23 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'scale_e5d0b4a1ec',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '5257a0eb5f203098dd35d83136a607ea',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "01";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((2 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_a7e2bb9e12',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '1c15e43b2cb0e2493cbb9c38d1c14235',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "00";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((2 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_cda50df78a',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b1f0ae968b381ba6ab9669a6ba2c3226',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "10";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((2 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_e8ddc079e9',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = TRUE',
    'CSET load = TRUE',
    'CSET load_sense = active_high',
    'CSET operation = down',
    'CSET output_width = 2',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_9673efc18b69cc19',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '43a9d30cd0b1e0c0ea8a390252f359c5',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      load: in std_logic;
      l: in std_logic_vector(op_width - 1 downto 0);
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        load => load(0),
        l => din,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_9673efc18b69cc19',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '3e38df6234de90c5b0953b584276e970',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((2 - 1) downto 0);
  signal b_1_34: unsigned((2 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_12_3_rel <= a_1_31 = b_1_34;
  op <= boolean_to_vector(result_12_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((2 - 1) downto 0);
    b : in std_logic_vector((2 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_5f1eb17108',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '5e85df7ec719ce87aaaf17afb6ac7fb4',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((2 - 1) downto 0);
  signal b_1_34: unsigned((2 - 1) downto 0);
  signal result_14_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_14_3_rel <= a_1_31 /= b_1_34;
  op <= boolean_to_vector(result_14_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((2 - 1) downto 0);
    b : in std_logic_vector((2 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_f9928864ea',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = FALSE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 2',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_d7f3c31b59e52df2',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'abcd1d90c716448d6ba76e32b9e51fe6',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_d7f3c31b59e52df2',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '5752144c51175d991f9cf431b320668b',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '6bb1dfbbd8c57c5567a0e5f160aac4fc',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 1FFFF, 0, 16A0A, 295F6, 1D907, 33C11, C3EF, 226F9, 1F629, 39C1D, 11C74, 2564A, 1A9B6, 2E38C, 63E3, 209D7, 1FD89, 3CDD1, 144CF, 27438, 1C38B, 30EA5, 94A0, 2160C, 1E9F4, 36B60, F15B, 23C75, 18BC8, 2BB31, 322F, 20277, 1FF62, 3E6E1, 157D7, 284A2, 1CED8, 32517, AC7D, 21DEE, 1F0A8, 38398, 10738, 248D8, 19B3E, 2CF01, 4B20, 2058B, 1FA75, 3B4E0, 130FF, 264C2, 1B728, 2F8C8, 7C68, 20F58, 1E212, 35383, DAE9, 23128, 17B5E, 2A829, 191F, 2009E, 1FFD9, 3F36F, 1610B, 28D2F, 1D413, 33084, B844, 2224F, 1F38F, 38FD2, 111EB, 24F6F, 1A29A, 2D930, 5788, 2078A, 1FC26, 3C153, 13B00, 26C5E, 1BD7C, 303A3, 888F, 2128C, 1E629, 35F65, E633, 236AB, 183B1, 2B193, 25AA, 20163, 1FE9D, 3DA56, 14E6D, 27C4F, 1C955, 319CD, A09B, 219D7, 1ED74, 37771, FC5D, 24284, 193A2, 2C500, 3EAD, 203DA, 1F876, 3A878, 126D0, 25D66, 1B091, 2EE15, 702E, 20C71, 1DDB1, 347BC, CF7C, 22BED, 172D1, 29EF5, C91, 20027, 1FFF6, 3F9B8, 16592, 2918C, 1D696, 33647, BE1D, 2249B, 1F4E6, 395F5, 11735, 252D4, 1A631, 2DE58, 5DB7, 208A6, 1FCE1, 3C791, 13FEE, 27043, 1C08C, 3091F, 8E9A, 21442, 1E818, 3655F, EBCC, 23987, 187C4, 2B65C, 2BEE, 201E3, 1FF09, 3E09B, 15328, 28071, 1CC1F, 31F6E, A68F, 21BD9, 1EF18, 37D82, 101D0, 245A5, 19778, 2C9FA, 44E8, 204A8, 1F980, 3AEAA, 12BEE, 2610C, 1B3E5, 2F369, 764D, 20DDB, 1DFEB, 34D9C, D536, 22E82, 1771E, 2A388, 12D8, 20059, 1FFA7, 3ED28, 15C78, 288E2, 1D17E, 32ACA, B264, 22015, 1F225, 389B3, 10C97, 24C1B, 19EF4, 2D412, 5156, 20680, 1FB58, 3BB18, 13606, 26888, 1BA5B, 2FE30, 827E, 210E8, 1E427, 35971, E092, 233E1, 17F8F, 2ACD8, 1F65, 200F7, 1FE1D, 3D412, 149A4, 2783C, 1C679, 31434, 9AA1, 217E8, 1EBBE, 37166, F6E1, 23F74, 18FBD, 2C012, 386F, 2031F, 1F75A, 3A249, 121A8, 259CF, 1AD2C, 2E8CB, 6A0B, 20B1A, 1DB65, 341E3, C9B9, 2296A, 16E74, 29A6E, 648, 2000A, 1FFFE, 3FCDC, 167CF, 293BF, 1D7D1, 3392B, C107, 225C8, 1F58A, 39909, 119D6, 2548D, 1A7F6, 2E0F1, 60CE, 2093C, 1FD38, 3CAB1, 14260, 2723C, 1C20E, 30BE1, 919E, 21525, 1E908, 3685F, EE94, 23AFC, 189C8, 2B8C5, 2F0F, 2022B, 1FF38, 3E3BD, 15581, 28288, 1CD7E, 32242, A987, 21CE1, 1EFE2, 3808D, 10485, 2473C, 1995D, 2CC7C, 4804, 20517, 1F9FD, 3B1C5, 12E78, 262E5, 1B589, 2F617, 795B, 20E97, 1E101, 3508F, D810, 22FD3, 17940, 2A5D7, 15FC, 20079, 1FFC2, 3F04B, 15EC3, 28B07, 1D2CB, 32DA6, B555, 22130, 1F2DD, 38CC2, 10F42, 24DC3, 1A0C9, 2D6A0, 546F, 20703, 1FBC1, 3BE35, 13884, 26A71, 1BBED, 300E8, 8587, 211B8, 1E52A, 35C6A, E364, 23544, 181A2, 2AF34, 2288, 2012A, 1FE5F, 3D734, 14C0A, 27A44, 1C7E9, 316FF, 9D9E, 218DE, 1EC9B, 3746B, F9A0, 240FA, 191B1, 2C288, 3B8E, 2037A, 1F7EA, 3A560, 1243D, 25B98, 1AEE0, 2EB6F, 6D1D, 20BC3, 1DC8D, 344CE, CC9C, 22AA9, 170A4, 29CB0, 96D, 20016, 1FFEA, 3F693, 16350, 28F5C, 1D557, 33364, BB32, 22373, 1F43D, 392E3, 11491, 25120, 1A468, 2DBC3, 5AA0, 20816, 1FC86, 3C472, 13D78, 26E4F, 1BF06, 30660, 8B95, 21365, 1E722, 36262, E901, 23817, 185BC, 2B3F6, 28CC, 201A1, 1FED6, 3DD78, 150CC, 27E5E, 1CABC, 31C9C, A396, 21AD6, 1EE48, 37A79, FF18, 24413, 1958F, 2C77C, 41CB, 2043F, 1F8FD, 3AB91, 12960, 25F37, 1B23D, 2F0BE, 733E, 20D23, 1DED0, 34AAB, D25A, 22D35, 174F9, 2A13D, FB5, 2003E, 1FF87, 3EA04, 15A29, 286C0, 1D02D, 327F0, AF71, 21EFF, 1F169, 386A5, 109E9, 24A77, 19D1B, 2D188, 4E3B, 20603, 1FAE9, 3B7FC, 13384, 266A3, 1B8C4, 2FB7B, 7F73, 2101E, 1E31F, 35679, DDBE, 23282, 17D78, 2AA7F, 1C43, 200C8, 1FDD5, 3D0F1, 1473B, 27638, 1C504, 3116C, 97A1, 216F8, 1EADB, 36E62, F41F, 23DF2, 18DC4, 2BDA0, 354F, 202C8, 1F6C4, 39F32, 11F0F, 2580A, 1AB73, 2E62A, 66F7, 20A76, 1DA38, 33EF9, C6D5, 2282F, 16C41, 29831, 324, 20002, 1FFFF, 3FE6E, 168ED, 294DA, 1D86C, 33A9E, C27B, 22660, 1F5DA, 39A93, 11B25, 2556B, 1A8D6, 2E23E, 6258, 20989, 1FD61, 3CC41, 14398, 27339, 1C2CD, 30D43, 931F, 21598, 1E97F, 369DF, EFF8, 23BB8, 18AC8, 2B9FA, 309F, 20250, 1FF4E, 3E54F, 156AC, 28394, 1CE2B, 323AC, AB02, 21D67, 1F046, 38212, 105DF, 2480A, 19A4E, 2CDBE, 4992, 20550, 1FA3A, 3B352, 12FBC, 263D3, 1B659, 2F76F, 7AE2, 20EF7, 1E18A, 35209, D97D, 2307D, 17A4F, 2A700, 178E, 2008B, 1FFCE, 3F1DD, 15FE8, 28C1B, 1D370, 32F15, B6CD, 221BF, 1F337, 38E4A, 11097, 24E99, 1A1B2, 2D7E7, 55FC, 20746, 1FBF4, 3BFC4, 139C2, 26B67, 1BCB5, 30245, 870B, 21221, 1E5AA, 35DE7, E4CC, 235F7, 182AA, 2B063, 2419, 20146, 1FE7F, 3D8C5, 14D3C, 27B49, 1C89F, 31866, 9F1D, 2195A, 1ED08, 375EE, FAFF, 241BE, 192AA, 2C3C4, 3D1D, 203A9, 1F831, 3A6EC, 12587, 25C7E, 1AFB9, 2ECC1, 6EA6, 20C19, 1DD20, 34645, CE0C, 22B4A, 171BB, 29DD2, AFF, 2001E, 1FFF1, 3F825, 16471, 29073, 1D5F7, 334D5, BCA8, 22406, 1F492, 3946C, 115E3, 251F9, 1A54D, 2DD0D, 5C2C, 2085D, 1FCB4, 3C601, 13EB3, 26F48, 1BFCA, 307BF, 8D18, 213D3, 1E79E, 363E0, EA67, 238CF, 186C1, 2B528, 2A5D, 201C1, 1FEF0, 3DF09, 151FB, 27F67, 1CB6E, 31E05, A513, 21B57, 1EEB0, 37BFE, 10074, 244DB, 19684, 2C8BB, 4359, 20473, 1F93F, 3AD1D, 12AA7, 26021, 1B311, 2F213, 74C6, 20D7F, 1DF5E, 34C23, D3C8, 22DDB, 1760C, 2A262, 1147, 2004B, 1FF98, 3EB96, 15B51, 287D0, 1D0D6, 3295C, B0EB, 21F8A, 1F1C8, 3882C, 10B40, 24B49, 19E08, 2D2CD, 4FC9, 20641, 1FB21, 3B98A, 134C5, 26795, 1B990, 2FCD5, 80F9, 21083, 1E3A3, 357F5, DF29, 23331, 17E84, 2ABAB, 1DD4, 200DF, 1FDFA, 3D282, 14870, 2773A, 1C5BF, 312D0, 9921, 2176F, 1EB4D, 36FE4, F580, 23EB2, 18EC1, 2BED9, 36DF, 202F3, 1F70F, 3A0BD, 1205C, 258EC, 1AC50, 2E77A, 6881, 20AC7, 1DACF, 3406E, C847, 228CC, 16D5B, 2994F, 4B6, 20006, 1FFFA, 3FB4A, 166B1, 292A5, 1D734, 337B9, BF92, 22531, 1F539, 3977F, 11886, 253B0, 1A714, 2DFA4, 5F43, 208F1, 1FD0D, 3C921, 14127, 2713F, 1C14E, 30A80, 901C, 214B3, 1E891, 366DF, ED30, 23A41, 188C6, 2B790, 2D7E, 20206, 1FF21, 3E22C, 15455, 2817C, 1CCCF, 320D7, A80B, 21C5D, 1EF7D, 37F07, 1032B, 24670, 1986B, 2CB3B, 4676, 204DF, 1F9BF, 3B037, 12D33, 261F8, 1B4B7, 2F4C0, 77D4, 20E38, 1E076, 34F15, D6A4, 22F2A, 17830, 2A4AF, 146A, 20068, 1FFB5, 3EEB9, 15D9E, 289F4, 1D225, 32C38, B3DD, 220A2, 1F281, 38B3A, 10DED, 24CEF, 19FDF, 2D559, 52E3, 206C1, 1FB8D, 3BCA7, 13745, 2697C, 1BB25, 2FF8C, 8402, 21150, 1E4A9, 35AED, E1FB, 23492, 18099, 2AE05, 20F7, 20110, 1FE3F, 3D5A3, 14AD8, 2793F, 1C731, 31599, 9C20, 21862, 1EC2D, 372E8, F841, 24036, 190B8, 2C14D, 39FF, 2034C, 1F7A3, 3A3D4, 122F3, 25AB3, 1AE07, 2EA1D, 6B94, 20B6E, 1DBFA, 34358, CB2B, 22A09, 16F8D, 29B8F, 7DB, 2000F, 1FFE2, 3F501, 1622E, 28E45, 1D4B6, 331F4, B9BB, 222E0, 1F3E7, 3915A, 1133F, 25047, 1A382, 2DA79, 5914, 207CF, 1FC57, 3C2E3, 13C3C, 26D56, 1BE42, 30501, 8A12, 212F8, 1E6A6, 360E3, E79A, 23761, 184B7, 2B2C4, 273B, 20181, 1FEBA, 3DBE7, 14F9D, 27D56, 1CA09, 31B34, A219, 21A56, 1EDDF, 378F5, FDBB, 2434B, 19499, 2C63E, 403C, 2040C, 1F8BA, 3AA04, 12819, 25E4E, 1B167, 2EF69, 71B6, 20CC9, 1DE41, 34933, D0EB, 22C90, 173E5, 2A018, E23, 20032, 1FF75, 3E872, 15900, 285B1, 1CF83, 32683, ADF7, 21E76, 1F109, 3851E, 10891, 249A7, 19C2D, 2D044, 4CAE, 205C6, 1FAB0, 3B66E, 13242, 265B2, 1B7F6, 2FA21, 7DEE, 20FBA, 1E299, 354FE, DC54, 231D5, 17C6C, 2A954, 1AB1, 200B2, 1FDB0, 3CF61, 14606, 27538, 1C448, 31008, 9621, 21681, 1EA68, 36CE1, F2BD, 23D33, 18CC7, 2BC68, 33BF, 2029F, 1F677, 39DA8, 11DC2, 2572A, 1AA95, 2E4DB, 656D, 20A26, 1D9A0, 33D85, C562, 22794, 16B26, 29713, 192, 20001;',
    '
]',
    'CSET depth = 1024',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_pin = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_Only',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 18',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_After_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_64284d314c575990',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c98b14e2e2ee41e00ff02eea14e55861',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => core_addr,
        clk => clk,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_64284d314c575990',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 20000, 295F6, 295F6, 33C11, 226F9, 226F9, 33C11, 39C1D, 209D7, 2564A, 2E38C, 2E38C, 2564A, 209D7, 39C1D, 3CDD1, 20277, 27438, 2BB31, 30EA5, 23C75, 2160C, 36B60, 36B60, 2160C, 23C75, 30EA5, 2BB31, 27438, 20277, 3CDD1, 3E6E1, 2009E, 284A2, 2A829, 32517, 23128, 21DEE, 35383, 38398, 20F58, 248D8, 2F8C8, 2CF01, 264C2, 2058B, 3B4E0, 3B4E0, 2058B, 264C2, 2CF01, 2F8C8, 248D8, 20F58, 38398, 35383, 21DEE, 23128, 32517, 2A829, 284A2, 2009E, 3E6E1, 3F36F, 20027, 28D2F, 29EF5, 33084, 22BED, 2224F, 347BC, 38FD2, 20C71, 24F6F, 2EE15, 2D930, 25D66, 2078A, 3A878, 3C153, 203DA, 26C5E, 2C500, 303A3, 24284, 2128C, 37771, 35F65, 219D7, 236AB, 319CD, 2B193, 27C4F, 20163, 3DA56, 3DA56, 20163, 27C4F, 2B193, 319CD, 236AB, 219D7, 35F65, 37771, 2128C, 24284, 303A3, 2C500, 26C5E, 203DA, 3C153, 3A878, 2078A, 25D66, 2D930, 2EE15, 24F6F, 20C71, 38FD2, 347BC, 2224F, 22BED, 33084, 29EF5, 28D2F, 20027, 3F36F, 3F9B8, 2000A, 2918C, 29A6E, 33647, 2296A, 2249B, 341E3, 395F5, 20B1A, 252D4, 2E8CB, 2DE58, 259CF, 208A6, 3A249, 3C791, 2031F, 27043, 2C012, 3091F, 23F74, 21442, 37166, 3655F, 217E8, 23987, 31434, 2B65C, 2783C, 201E3, 3D412, 3E09B, 200F7, 28071, 2ACD8, 31F6E, 233E1, 21BD9, 35971, 37D82, 210E8, 245A5, 2FE30, 2C9FA, 26888, 204A8, 3BB18, 3AEAA, 20680, 2610C, 2D412, 2F369, 24C1B, 20DDB, 389B3, 34D9C, 22015, 22E82, 32ACA, 2A388, 288E2, 20059, 3ED28, 3ED28, 20059, 288E2, 2A388, 32ACA, 22E82, 22015, 34D9C, 389B3, 20DDB, 24C1B, 2F369, 2D412, 2610C, 20680, 3AEAA, 3BB18, 204A8, 26888, 2C9FA, 2FE30, 245A5, 210E8, 37D82, 35971, 21BD9, 233E1, 31F6E, 2ACD8, 28071, 200F7, 3E09B, 3D412, 201E3, 2783C, 2B65C, 31434, 23987, 217E8, 3655F, 37166, 21442, 23F74, 3091F, 2C012, 27043, 2031F, 3C791, 3A249, 208A6, 259CF, 2DE58, 2E8CB, 252D4, 20B1A, 395F5, 341E3, 2249B, 2296A, 33647, 29A6E, 2918C, 2000A, 3F9B8, 3FCDC, 20002, 293BF, 29831, 3392B, 2282F, 225C8, 33EF9, 39909, 20A76, 2548D, 2E62A, 2E0F1, 2580A, 2093C, 39F32, 3CAB1, 202C8, 2723C, 2BDA0, 30BE1, 23DF2, 21525, 36E62, 3685F, 216F8, 23AFC, 3116C, 2B8C5, 27638, 2022B, 3D0F1, 3E3BD, 200C8, 28288, 2AA7F, 32242, 23282, 21CE1, 35679, 3808D, 2101E, 2473C, 2FB7B, 2CC7C, 266A3, 20517, 3B7FC, 3B1C5, 20603, 262E5, 2D188, 2F617, 24A77, 20E97, 386A5, 3508F, 21EFF, 22FD3, 327F0, 2A5D7, 286C0, 20079, 3EA04, 3F04B, 2003E, 28B07, 2A13D, 32DA6, 22D35, 22130, 34AAB, 38CC2, 20D23, 24DC3, 2F0BE, 2D6A0, 25F37, 20703, 3AB91, 3BE35, 2043F, 26A71, 2C77C, 300E8, 24413, 211B8, 37A79, 35C6A, 21AD6, 23544, 31C9C, 2AF34, 27E5E, 2012A, 3DD78, 3D734, 201A1, 27A44, 2B3F6, 316FF, 23817, 218DE, 36262, 3746B, 21365, 240FA, 30660, 2C288, 26E4F, 2037A, 3C472, 3A560, 20816, 25B98, 2DBC3, 2EB6F, 25120, 20BC3, 392E3, 344CE, 22373, 22AA9, 33364, 29CB0, 28F5C, 20016, 3F693, 3F693, 20016, 28F5C, 29CB0, 33364, 22AA9, 22373, 344CE, 392E3, 20BC3, 25120, 2EB6F, 2DBC3, 25B98, 20816, 3A560, 3C472, 2037A, 26E4F, 2C288, 30660, 240FA, 21365, 3746B, 36262, 218DE, 23817, 316FF, 2B3F6, 27A44, 201A1, 3D734, 3DD78, 2012A, 27E5E, 2AF34, 31C9C, 23544, 21AD6, 35C6A, 37A79, 211B8, 24413, 300E8, 2C77C, 26A71, 2043F, 3BE35, 3AB91, 20703, 25F37, 2D6A0, 2F0BE, 24DC3, 20D23, 38CC2, 34AAB, 22130, 22D35, 32DA6, 2A13D, 28B07, 2003E, 3F04B, 3EA04, 20079, 286C0, 2A5D7, 327F0, 22FD3, 21EFF, 3508F, 386A5, 20E97, 24A77, 2F617, 2D188, 262E5, 20603, 3B1C5, 3B7FC, 20517, 266A3, 2CC7C, 2FB7B, 2473C, 2101E, 3808D, 35679, 21CE1, 23282, 32242, 2AA7F, 28288, 200C8, 3E3BD, 3D0F1, 2022B, 27638, 2B8C5, 3116C, 23AFC, 216F8, 3685F, 36E62, 21525, 23DF2, 30BE1, 2BDA0, 2723C, 202C8, 3CAB1, 39F32, 2093C, 2580A, 2E0F1, 2E62A, 2548D, 20A76, 39909, 33EF9, 225C8, 2282F, 3392B, 29831, 293BF, 20002, 3FCDC, 3FE6E, 20001, 294DA, 29713, 33A9E, 22794, 22660, 33D85, 39A93, 20A26, 2556B, 2E4DB, 2E23E, 2572A, 20989, 39DA8, 3CC41, 2029F, 27339, 2BC68, 30D43, 23D33, 21598, 36CE1, 369DF, 21681, 23BB8, 31008, 2B9FA, 27538, 20250, 3CF61, 3E54F, 200B2, 28394, 2A954, 323AC, 231D5, 21D67, 354FE, 38212, 20FBA, 2480A, 2FA21, 2CDBE, 265B2, 20550, 3B66E, 3B352, 205C6, 263D3, 2D044, 2F76F, 249A7, 20EF7, 3851E, 35209, 21E76, 2307D, 32683, 2A700, 285B1, 2008B, 3E872, 3F1DD, 20032, 28C1B, 2A018, 32F15, 22C90, 221BF, 34933, 38E4A, 20CC9, 24E99, 2EF69, 2D7E7, 25E4E, 20746, 3AA04, 3BFC4, 2040C, 26B67, 2C63E, 30245, 2434B, 21221, 378F5, 35DE7, 21A56, 235F7, 31B34, 2B063, 27D56, 20146, 3DBE7, 3D8C5, 20181, 27B49, 2B2C4, 31866, 23761, 2195A, 360E3, 375EE, 212F8, 241BE, 30501, 2C3C4, 26D56, 203A9, 3C2E3, 3A6EC, 207CF, 25C7E, 2DA79, 2ECC1, 25047, 20C19, 3915A, 34645, 222E0, 22B4A, 331F4, 29DD2, 28E45, 2001E, 3F501, 3F825, 2000F, 29073, 29B8F, 334D5, 22A09, 22406, 34358, 3946C, 20B6E, 251F9, 2EA1D, 2DD0D, 25AB3, 2085D, 3A3D4, 3C601, 2034C, 26F48, 2C14D, 307BF, 24036, 213D3, 372E8, 363E0, 21862, 238CF, 31599, 2B528, 2793F, 201C1, 3D5A3, 3DF09, 20110, 27F67, 2AE05, 31E05, 23492, 21B57, 35AED, 37BFE, 21150, 244DB, 2FF8C, 2C8BB, 2697C, 20473, 3BCA7, 3AD1D, 206C1, 26021, 2D559, 2F213, 24CEF, 20D7F, 38B3A, 34C23, 220A2, 22DDB, 32C38, 2A262, 289F4, 2004B, 3EEB9, 3EB96, 20068, 287D0, 2A4AF, 3295C, 22F2A, 21F8A, 34F15, 3882C, 20E38, 24B49, 2F4C0, 2D2CD, 261F8, 20641, 3B037, 3B98A, 204DF, 26795, 2CB3B, 2FCD5, 24670, 21083, 37F07, 357F5, 21C5D, 23331, 320D7, 2ABAB, 2817C, 200DF, 3E22C, 3D282, 20206, 2773A, 2B790, 312D0, 23A41, 2176F, 366DF, 36FE4, 214B3, 23EB2, 30A80, 2BED9, 2713F, 202F3, 3C921, 3A0BD, 208F1, 258EC, 2DFA4, 2E77A, 253B0, 20AC7, 3977F, 3406E, 22531, 228CC, 337B9, 2994F, 292A5, 20006, 3FB4A, 3FB4A, 20006, 292A5, 2994F, 337B9, 228CC, 22531, 3406E, 3977F, 20AC7, 253B0, 2E77A, 2DFA4, 258EC, 208F1, 3A0BD, 3C921, 202F3, 2713F, 2BED9, 30A80, 23EB2, 214B3, 36FE4, 366DF, 2176F, 23A41, 312D0, 2B790, 2773A, 20206, 3D282, 3E22C, 200DF, 2817C, 2ABAB, 320D7, 23331, 21C5D, 357F5, 37F07, 21083, 24670, 2FCD5, 2CB3B, 26795, 204DF, 3B98A, 3B037, 20641, 261F8, 2D2CD, 2F4C0, 24B49, 20E38, 3882C, 34F15, 21F8A, 22F2A, 3295C, 2A4AF, 287D0, 20068, 3EB96, 3EEB9, 2004B, 289F4, 2A262, 32C38, 22DDB, 220A2, 34C23, 38B3A, 20D7F, 24CEF, 2F213, 2D559, 26021, 206C1, 3AD1D, 3BCA7, 20473, 2697C, 2C8BB, 2FF8C, 244DB, 21150, 37BFE, 35AED, 21B57, 23492, 31E05, 2AE05, 27F67, 20110, 3DF09, 3D5A3, 201C1, 2793F, 2B528, 31599, 238CF, 21862, 363E0, 372E8, 213D3, 24036, 307BF, 2C14D, 26F48, 2034C, 3C601, 3A3D4, 2085D, 25AB3, 2DD0D, 2EA1D, 251F9, 20B6E, 3946C, 34358, 22406, 22A09, 334D5, 29B8F, 29073, 2000F, 3F825, 3F501, 2001E, 28E45, 29DD2, 331F4, 22B4A, 222E0, 34645, 3915A, 20C19, 25047, 2ECC1, 2DA79, 25C7E, 207CF, 3A6EC, 3C2E3, 203A9, 26D56, 2C3C4, 30501, 241BE, 212F8, 375EE, 360E3, 2195A, 23761, 31866, 2B2C4, 27B49, 20181, 3D8C5, 3DBE7, 20146, 27D56, 2B063, 31B34, 235F7, 21A56, 35DE7, 378F5, 21221, 2434B, 30245, 2C63E, 26B67, 2040C, 3BFC4, 3AA04, 20746, 25E4E, 2D7E7, 2EF69, 24E99, 20CC9, 38E4A, 34933, 221BF, 22C90, 32F15, 2A018, 28C1B, 20032, 3F1DD, 3E872, 2008B, 285B1, 2A700, 32683, 2307D, 21E76, 35209, 3851E, 20EF7, 249A7, 2F76F, 2D044, 263D3, 205C6, 3B352, 3B66E, 20550, 265B2, 2CDBE, 2FA21, 2480A, 20FBA, 38212, 354FE, 21D67, 231D5, 323AC, 2A954, 28394, 200B2, 3E54F, 3CF61, 20250, 27538, 2B9FA, 31008, 23BB8, 21681, 369DF, 36CE1, 21598, 23D33, 30D43, 2BC68, 27339, 2029F, 3CC41, 39DA8, 20989, 2572A, 2E23E, 2E4DB, 2556B, 20A26, 39A93, 33D85, 22660, 22794, 33A9E, 29713, 294DA, 20001, 3FE6E;',
    '
]',
    'CSET depth = 1024',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_pin = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_Only',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 18',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_After_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_7e236f8fce9276a5',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '38994154f6cb601a045d9213ab12dd12',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => core_addr,
        clk => clk,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_7e236f8fce9276a5',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '303744f0225d0f94ee626565a96a47a6',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '49cb840f1fef3a380c8ba37e565647c7',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal rst_1_40: boolean;
  signal count_reg_20_23: unsigned((1 - 1) downto 0) := "0";
  signal count_reg_20_23_rst: std_logic;
  signal bool_44_4: boolean;
  signal rst_limit_join_44_1: boolean;
  signal count_reg_join_44_1: unsigned((2 - 1) downto 0);
  signal count_reg_join_44_1_rst: std_logic;
begin
  rst_1_40 <= ((rst) = "1");
  proc_count_reg_20_23: process (clk)
  is
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (count_reg_20_23_rst = \'1\')) then
        count_reg_20_23 <= "0";
      elsif (ce = \'1\') then 
        count_reg_20_23 <= count_reg_20_23 + std_logic_vector_to_unsigned("1");
      end if;
    end if;
  end process proc_count_reg_20_23;
  bool_44_4 <= rst_1_40 or false;
  proc_if_44_1: process (bool_44_4, count_reg_20_23)
  is
  begin
    if bool_44_4 then
      count_reg_join_44_1_rst <= \'1\';
    else 
      count_reg_join_44_1_rst <= \'0\';
    end if;
    if bool_44_4 then
      rst_limit_join_44_1 <= false;
    else 
      rst_limit_join_44_1 <= false;
    end if;
  end process proc_if_44_1;
  count_reg_20_23_rst <= count_reg_join_44_1_rst;
  op <= unsigned_to_std_logic_vector(count_reg_20_23);
end',
      'crippled_entity' => 'is
  port (
    rst : in std_logic_vector((1 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'counter_9b03e3d644',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b792f378329a4d8b70d9f888369d5bbd',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '65c90ac94f7f0eb0d44807c0b04e3840',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '8c4c3bed4aef6c32f202d88479730f91',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '57f11be50d15befbe82705c120602f03',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((18 - 1) downto 0);
  signal d1_1_27: std_logic_vector((18 - 1) downto 0);
  type array_type_pipe_16_22 is array (0 to (4 - 1)) of std_logic_vector((18 - 1) downto 0);
  signal pipe_16_22: array_type_pipe_16_22 := (
    "000000000000000000",
    "000000000000000000",
    "000000000000000000",
    "000000000000000000");
  signal pipe_16_22_front_din: std_logic_vector((18 - 1) downto 0);
  signal pipe_16_22_back: std_logic_vector((18 - 1) downto 0);
  signal pipe_16_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((18 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  pipe_16_22_back <= pipe_16_22(3);
  proc_pipe_16_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (pipe_16_22_push_front_pop_back_en = \'1\')) then
        for i in 3 downto 1 loop 
          pipe_16_22(i) <= pipe_16_22(i-1);
        end loop;
        pipe_16_22(0) <= pipe_16_22_front_din;
      end if;
    end if;
  end process proc_pipe_16_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  pipe_16_22_front_din <= unregy_join_6_1;
  pipe_16_22_push_front_pop_back_en <= \'1\';
  y <= pipe_16_22_back;
end',
      'crippled_entity' => 'is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((18 - 1) downto 0);
    d1 : in std_logic_vector((18 - 1) downto 0);
    y : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_74a3397f06',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ad683ef81181ecdedd4b8f4778d099b8',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal ip_18_25: signed((18 - 1) downto 0);
  type array_type_op_mem_42_20 is array (0 to (2 - 1)) of signed((18 - 1) downto 0);
  signal op_mem_42_20: array_type_op_mem_42_20 := (
    "000000000000000000",
    "000000000000000000");
  signal op_mem_42_20_front_din: signed((18 - 1) downto 0);
  signal op_mem_42_20_back: signed((18 - 1) downto 0);
  signal op_mem_42_20_push_front_pop_back_en: std_logic;
  signal cast_30_16: signed((19 - 1) downto 0);
  signal internal_ip_30_1_neg: signed((19 - 1) downto 0);
  signal cast_internal_ip_34_3_convert: signed((18 - 1) downto 0);
begin
  ip_18_25 <= std_logic_vector_to_signed(ip);
  op_mem_42_20_back <= op_mem_42_20(1);
  proc_op_mem_42_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_42_20_push_front_pop_back_en = \'1\')) then
        for i in 1 downto 1 loop 
          op_mem_42_20(i) <= op_mem_42_20(i-1);
        end loop;
        op_mem_42_20(0) <= op_mem_42_20_front_din;
      end if;
    end if;
  end process proc_op_mem_42_20;
  cast_30_16 <= s2s_cast(ip_18_25, 17, 19, 17);
  internal_ip_30_1_neg <=  -cast_30_16;
  cast_internal_ip_34_3_convert <= s2s_cast(internal_ip_30_1_neg, 17, 18, 17);
  op_mem_42_20_front_din <= cast_internal_ip_34_3_convert;
  op_mem_42_20_push_front_pop_back_en <= \'1\';
  op <= signed_to_std_logic_vector(op_mem_42_20_back);
end',
      'crippled_entity' => 'is
  port (
    ip : in std_logic_vector((18 - 1) downto 0);
    op : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'negate_5f0430c69b',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '6a73f6296487e47aeb112e309c3556de',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = FALSE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 9',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_7211a68acc7f4ff7',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '6631992e1d49d31e0dbd6ffd1f126d9e',
    'sourceFile' => 'hdl/xlcounter_limit.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_7211a68acc7f4ff7',
      'entity_name.0' => 'xlcounter_limit',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET depth = 512',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_And_Write',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 36',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_Before_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_8d0734a7cdba160c',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '517a116cb70b85d0a3fe4048ca76ac83',
    'sourceFile' => 'hdl/xlspram.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      din: in std_logic_vector(c_width - 1 downto 0);
      we: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => addr,
        clk => clk,
        din => data_in,
        we => core_we,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_8d0734a7cdba160c',
      'entity_name.0' => 'xlspram',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '823820561dc563133ddef3a7b5a1cee2',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "0000000001";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((10 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_f1ac4bddff',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '2e2fac6b5513f4f7f53f6e95600afecc',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "1000000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((10 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_fbc2f0cce1',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = TRUE',
    'CSET load = TRUE',
    'CSET load_sense = active_high',
    'CSET operation = down',
    'CSET output_width = 10',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_a071675f8d8d72bb',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '731c1110ac74a73814dbb48d9e4089fe',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      load: in std_logic;
      l: in std_logic_vector(op_width - 1 downto 0);
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        load => load(0),
        l => din,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_a071675f8d8d72bb',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '91aa5fe6e672c7518ca04268dcbd48a9',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((10 - 1) downto 0);
  signal b_1_34: unsigned((10 - 1) downto 0);
  signal result_14_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_14_3_rel <= a_1_31 /= b_1_34;
  op <= boolean_to_vector(result_14_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((10 - 1) downto 0);
    b : in std_logic_vector((10 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_f6702ea2f7',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd3609edb80b20596541238ac04b9ef08',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Distributed_Memory Virtex2P Xilinx,_Inc. 7.1',
    '# 10.1.03i',
    'CSET ce_overrides = sync_controls_overrides_ce',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 1FFFF, 0, 16A0A, 295F6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET common_output_ce = false',
    'CSET common_output_clk = false',
    'CSET create_rpm = true',
    'CSET data_width = 18',
    'CSET default_data = 0',
    'CSET default_data_radix = 16',
    'CSET depth = 16',
    'CSET dual_port_address = non_registered',
    'CSET dual_port_output_clock_enable = false',
    'CSET input_clock_enable = false',
    'CSET input_options = non_registered',
    'CSET latency = 1',
    'CSET memory_type = rom',
    'CSET multiplexer_construction = lut_based',
    'CSET output_options = registered',
    'CSET qualify_we_with_i_ce = false',
    'CSET read_enable = false',
    'CSET reset_qdpo = false',
    'CSET reset_qspo = false',
    'CSET single_port_output_clock_enable = true',
    'CSET sync_reset_qdpo = false',
    'CSET sync_reset_qspo = false',
    'CSET component_name = distributed_memory_virtex2p_7_1_24095e62b7dd5149',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '5a818b3c99ae00ad7cadaf803aa8d62d',
    'sourceFile' => 'hdl/xlsprom_dist.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      a: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      qspo_ce: in std_logic;
      qspo: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        a => core_addr,
        clk => clk,
        qspo_ce => core_ce,
        qspo => core_data_out',
      'core_name0' => 'distributed_memory_virtex2p_7_1_24095e62b7dd5149',
      'entity_name.0' => 'xlsprom_dist',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Distributed_Memory Virtex2P Xilinx,_Inc. 7.1',
    '# 10.1.03i',
    'CSET ce_overrides = sync_controls_overrides_ce',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 20000, 295F6, 295F6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET common_output_ce = false',
    'CSET common_output_clk = false',
    'CSET create_rpm = true',
    'CSET data_width = 18',
    'CSET default_data = 0',
    'CSET default_data_radix = 16',
    'CSET depth = 16',
    'CSET dual_port_address = non_registered',
    'CSET dual_port_output_clock_enable = false',
    'CSET input_clock_enable = false',
    'CSET input_options = non_registered',
    'CSET latency = 1',
    'CSET memory_type = rom',
    'CSET multiplexer_construction = lut_based',
    'CSET output_options = registered',
    'CSET qualify_we_with_i_ce = false',
    'CSET read_enable = false',
    'CSET reset_qdpo = false',
    'CSET reset_qspo = false',
    'CSET single_port_output_clock_enable = true',
    'CSET sync_reset_qdpo = false',
    'CSET sync_reset_qspo = false',
    'CSET component_name = distributed_memory_virtex2p_7_1_ff1763ab93720ffc',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '009a421bb4b25f0ac4ffe3517833f9fa',
    'sourceFile' => 'hdl/xlsprom_dist.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      a: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      qspo_ce: in std_logic;
      qspo: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        a => core_addr,
        clk => clk,
        qspo_ce => core_ce,
        qspo => core_data_out',
      'core_name0' => 'distributed_memory_virtex2p_7_1_ff1763ab93720ffc',
      'entity_name.0' => 'xlsprom_dist',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '1ffbc68b9cf9d2196fb7e613a0158872',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = FALSE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 8',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_f458cc5f96972819',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '7bbcc09cbfa7536d9bbdbd71691e18ef',
    'sourceFile' => 'hdl/xlcounter_limit.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_f458cc5f96972819',
      'entity_name.0' => 'xlcounter_limit',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET depth = 256',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_And_Write',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 36',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_Before_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_a0f8113050ab47e7',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'e1d3cc826505774c2adec631a575ff34',
    'sourceFile' => 'hdl/xlspram.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      din: in std_logic_vector(c_width - 1 downto 0);
      we: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => addr,
        clk => clk,
        din => data_in,
        we => core_we,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_a0f8113050ab47e7',
      'entity_name.0' => 'xlspram',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '469d0b121781904ac966646231cd68c5',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "000000001";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((9 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_b4ec9de7d1',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '4ec7211565fb5370885d253fd4556ebc',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "000000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((9 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_fd85eb7067',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '4d54d02eccb7e9661541234c5cb7c5ba',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "100000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((9 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_4a391b9a0e',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = TRUE',
    'CSET load = TRUE',
    'CSET load_sense = active_high',
    'CSET operation = down',
    'CSET output_width = 9',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_715f1205a46a625c',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '856fd21387742392457d807688387f5d',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      load: in std_logic;
      l: in std_logic_vector(op_width - 1 downto 0);
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        load => load(0),
        l => din,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_715f1205a46a625c',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '0a63ec0c3ee5b001c3703d08c6cdfb43',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((9 - 1) downto 0);
  signal b_1_34: unsigned((9 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_12_3_rel <= a_1_31 = b_1_34;
  op <= boolean_to_vector(result_12_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((9 - 1) downto 0);
    b : in std_logic_vector((9 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_6c3ee657fa',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '92622afe276f2073e58b81817cc03bd6',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((9 - 1) downto 0);
  signal b_1_34: unsigned((9 - 1) downto 0);
  signal result_14_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_14_3_rel <= a_1_31 /= b_1_34;
  op <= boolean_to_vector(result_14_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((9 - 1) downto 0);
    b : in std_logic_vector((9 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_78eac2928d',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = FALSE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 9',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_7211a68acc7f4ff7',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b240c73853e2d4d96db35f1aab0a0702',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_7211a68acc7f4ff7',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '10518d8e555417bec04a22e277eb33ca',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'e5fdf464f388655feaa73ce6642e5c47',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 1FFFF, 0, 16A0A, 295F6, 1D907, 33C11, C3EF, 226F9;',
    '
]',
    'CSET depth = 8',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_pin = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_Only',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 18',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_After_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_05a95f2267c44dc1',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '80afe9e79b547338e711676a76c0bc58',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => core_addr,
        clk => clk,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_05a95f2267c44dc1',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 20000, 295F6, 295F6, 33C11, 226F9, 226F9, 33C11;',
    '
]',
    'CSET depth = 8',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_pin = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_Only',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 18',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_After_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_d8668151357aa642',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '59dc304c0223a6f17cebef46504861d6',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => core_addr,
        clk => clk,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_d8668151357aa642',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '916f206efa62667ef77b0b064c8fb06f',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = FALSE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 7',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_045f95c1d8e99a77',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'cd989b322e1132016c22f6b42e814b49',
    'sourceFile' => 'hdl/xlcounter_limit.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_045f95c1d8e99a77',
      'entity_name.0' => 'xlcounter_limit',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET depth = 128',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_And_Write',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 36',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_Before_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_76f23c1003bb9b77',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'dee00ff2354be165525c08cdd30721d0',
    'sourceFile' => 'hdl/xlspram.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      din: in std_logic_vector(c_width - 1 downto 0);
      we: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => addr,
        clk => clk,
        din => data_in,
        we => core_we,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_76f23c1003bb9b77',
      'entity_name.0' => 'xlspram',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd79079c104728231229f8185fe35b4f8',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "00000001";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_b437b02512',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '6881e3e9fe47f0cbdc2e654a4e3326e1',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "00000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_91ef1678ca',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '3357ffe50653e9d14d4f9101dfc712bf',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "10000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_e8aae5d3bb',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = TRUE',
    'CSET load = TRUE',
    'CSET load_sense = active_high',
    'CSET operation = down',
    'CSET output_width = 8',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_2d20805488fc03df',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '586bea2de2cb28c9276a6b3984e2a411',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      load: in std_logic;
      l: in std_logic_vector(op_width - 1 downto 0);
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        load => load(0),
        l => din,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_2d20805488fc03df',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a40234a17f28f2875a29b26c0a65bcc1',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((8 - 1) downto 0);
  signal b_1_34: unsigned((8 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_12_3_rel <= a_1_31 = b_1_34;
  op <= boolean_to_vector(result_12_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((8 - 1) downto 0);
    b : in std_logic_vector((8 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_54048c8b02',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f656afd1eff99591face4c094ec46614',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((8 - 1) downto 0);
  signal b_1_34: unsigned((8 - 1) downto 0);
  signal result_14_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_14_3_rel <= a_1_31 /= b_1_34;
  op <= boolean_to_vector(result_14_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((8 - 1) downto 0);
    b : in std_logic_vector((8 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_16235eb2bf',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = FALSE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 8',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_f458cc5f96972819',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a3a62d2b9ad3d67f56a81c9d6edd8dfb',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_f458cc5f96972819',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a33b12f2e899af81f75c5d15fd410fda',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 1FFFF, 0, 16A0A, 295F6, 1D907, 33C11, C3EF, 226F9, 1F629, 39C1D, 11C74, 2564A, 1A9B6, 2E38C, 63E3, 209D7;',
    '
]',
    'CSET depth = 16',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_pin = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_Only',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 18',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_After_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_3f3ce445ea788123',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '3e29789b0d8452304656bd3841d6b191',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => core_addr,
        clk => clk,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_3f3ce445ea788123',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 20000, 295F6, 295F6, 33C11, 226F9, 226F9, 33C11, 39C1D, 209D7, 2564A, 2E38C, 2E38C, 2564A, 209D7, 39C1D;',
    '
]',
    'CSET depth = 16',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_pin = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_Only',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 18',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_After_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_23fb8628204eb2c1',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '0e917624351f9effbced05590babef6f',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => core_addr,
        clk => clk,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_23fb8628204eb2c1',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '3892f5d934d7c334c911f24f3065288f',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = FALSE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 6',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_52d6d6d99674748f',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '535fcdac80811043c4a82e4982448ef4',
    'sourceFile' => 'hdl/xlcounter_limit.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_52d6d6d99674748f',
      'entity_name.0' => 'xlcounter_limit',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET depth = 64',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_And_Write',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 36',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_Before_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_e603086fb92aeb5e',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '17023cf3132b24a89bed02b9e45c7755',
    'sourceFile' => 'hdl/xlspram.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      din: in std_logic_vector(c_width - 1 downto 0);
      we: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => addr,
        clk => clk,
        din => data_in,
        we => core_we,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_e603086fb92aeb5e',
      'entity_name.0' => 'xlspram',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '538e91b9afa9a360bc51bc0f34c944b6',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "0000001";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((7 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_180df391de',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b5248d3f5b5143ba54a49d01587b0d86',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "0000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((7 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_7244cd602b',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'db61cfd489a472805db2684370ef5f3f',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "1000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((7 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_7b07120b87',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = TRUE',
    'CSET load = TRUE',
    'CSET load_sense = active_high',
    'CSET operation = down',
    'CSET output_width = 7',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_7cce54a04f39ecd8',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '3cc720976c67943066b061e4fe66d5e3',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      load: in std_logic;
      l: in std_logic_vector(op_width - 1 downto 0);
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        load => load(0),
        l => din,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_7cce54a04f39ecd8',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '66dfbca33c2eb8499dfa0680a72e029e',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((7 - 1) downto 0);
  signal b_1_34: unsigned((7 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_12_3_rel <= a_1_31 = b_1_34;
  op <= boolean_to_vector(result_12_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((7 - 1) downto 0);
    b : in std_logic_vector((7 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_9a3978c602',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '9275a22a9596054be859a55eb4c3d6fc',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((7 - 1) downto 0);
  signal b_1_34: unsigned((7 - 1) downto 0);
  signal result_14_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_14_3_rel <= a_1_31 /= b_1_34;
  op <= boolean_to_vector(result_14_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((7 - 1) downto 0);
    b : in std_logic_vector((7 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_23065a6aa3',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = FALSE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 7',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_045f95c1d8e99a77',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c7066fcd44a38cbec9d98264e61e87c9',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_045f95c1d8e99a77',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a4479210e98877b33be792e9416f376f',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '52d14bae6c47137d840841f987913027',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 1FFFF, 0, 16A0A, 295F6, 1D907, 33C11, C3EF, 226F9, 1F629, 39C1D, 11C74, 2564A, 1A9B6, 2E38C, 63E3, 209D7, 1FD89, 3CDD1, 144CF, 27438, 1C38B, 30EA5, 94A0, 2160C, 1E9F4, 36B60, F15B, 23C75, 18BC8, 2BB31, 322F, 20277;',
    '
]',
    'CSET depth = 32',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_pin = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_Only',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 18',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_After_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_5d43f95b93fd9344',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '877ba62cf09ee51d8f89c26362230635',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => core_addr,
        clk => clk,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_5d43f95b93fd9344',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 20000, 295F6, 295F6, 33C11, 226F9, 226F9, 33C11, 39C1D, 209D7, 2564A, 2E38C, 2E38C, 2564A, 209D7, 39C1D, 3CDD1, 20277, 27438, 2BB31, 30EA5, 23C75, 2160C, 36B60, 36B60, 2160C, 23C75, 30EA5, 2BB31, 27438, 20277, 3CDD1;',
    '
]',
    'CSET depth = 32',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_pin = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_Only',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 18',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_After_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_b70993b7b8d8be43',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '5d348b7e784c06744893722fe1a3faca',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => core_addr,
        clk => clk,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_b70993b7b8d8be43',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f443fce2909880e76088ba13638c98e6',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = FALSE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 5',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_dd549111ea74373d',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '72d8dfe75a662d80faa4c6520548e9b4',
    'sourceFile' => 'hdl/xlcounter_limit.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_dd549111ea74373d',
      'entity_name.0' => 'xlcounter_limit',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET depth = 32',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_And_Write',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 36',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_Before_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_7ff232eaea8dc2aa',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'cf18fc05348af05e3199885293878c0a',
    'sourceFile' => 'hdl/xlspram.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      din: in std_logic_vector(c_width - 1 downto 0);
      we: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => addr,
        clk => clk,
        din => data_in,
        we => core_we,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_7ff232eaea8dc2aa',
      'entity_name.0' => 'xlspram',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '4e163d7f31d7f1730f06e420761e0c64',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "000001";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((6 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_a267c870be',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'af2bad13c77b7b041e1467dc41d140d0',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((6 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_7ea0f2fff7',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '64d46ae81054cf988daec38e904bcb92',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "100000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((6 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_961b61f8a1',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = TRUE',
    'CSET load = TRUE',
    'CSET load_sense = active_high',
    'CSET operation = down',
    'CSET output_width = 6',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_880f7c3a3529b3b1',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '37f7c3203b05a2d710c138af2e64e8f9',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      load: in std_logic;
      l: in std_logic_vector(op_width - 1 downto 0);
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        load => load(0),
        l => din,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_880f7c3a3529b3b1',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '9163d19d006ec8f52dad0282d12b679c',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((6 - 1) downto 0);
  signal b_1_34: unsigned((6 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_12_3_rel <= a_1_31 = b_1_34;
  op <= boolean_to_vector(result_12_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((6 - 1) downto 0);
    b : in std_logic_vector((6 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_931d61fb72',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '162cd14d16c67b581f57f28fba5ced10',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((6 - 1) downto 0);
  signal b_1_34: unsigned((6 - 1) downto 0);
  signal result_14_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_14_3_rel <= a_1_31 /= b_1_34;
  op <= boolean_to_vector(result_14_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((6 - 1) downto 0);
    b : in std_logic_vector((6 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_fe487ce1c7',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = FALSE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 6',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_52d6d6d99674748f',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd863d9f545d0e5e22f15f903987a68e2',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_52d6d6d99674748f',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '48d2890cc8802d3762f8c03ea3cf086a',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '63f04e17d42a480d35736b2da4aa301c',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 1FFFF, 0, 16A0A, 295F6, 1D907, 33C11, C3EF, 226F9, 1F629, 39C1D, 11C74, 2564A, 1A9B6, 2E38C, 63E3, 209D7, 1FD89, 3CDD1, 144CF, 27438, 1C38B, 30EA5, 94A0, 2160C, 1E9F4, 36B60, F15B, 23C75, 18BC8, 2BB31, 322F, 20277, 1FF62, 3E6E1, 157D7, 284A2, 1CED8, 32517, AC7D, 21DEE, 1F0A8, 38398, 10738, 248D8, 19B3E, 2CF01, 4B20, 2058B, 1FA75, 3B4E0, 130FF, 264C2, 1B728, 2F8C8, 7C68, 20F58, 1E212, 35383, DAE9, 23128, 17B5E, 2A829, 191F, 2009E;',
    '
]',
    'CSET depth = 64',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_pin = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_Only',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 18',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_After_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_42a5b8ca1bc39b96',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'cbe15fa620dfe6e2c6b02837cc02dd60',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => core_addr,
        clk => clk,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_42a5b8ca1bc39b96',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 20000, 295F6, 295F6, 33C11, 226F9, 226F9, 33C11, 39C1D, 209D7, 2564A, 2E38C, 2E38C, 2564A, 209D7, 39C1D, 3CDD1, 20277, 27438, 2BB31, 30EA5, 23C75, 2160C, 36B60, 36B60, 2160C, 23C75, 30EA5, 2BB31, 27438, 20277, 3CDD1, 3E6E1, 2009E, 284A2, 2A829, 32517, 23128, 21DEE, 35383, 38398, 20F58, 248D8, 2F8C8, 2CF01, 264C2, 2058B, 3B4E0, 3B4E0, 2058B, 264C2, 2CF01, 2F8C8, 248D8, 20F58, 38398, 35383, 21DEE, 23128, 32517, 2A829, 284A2, 2009E, 3E6E1;',
    '
]',
    'CSET depth = 64',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_pin = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_Only',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 18',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_After_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_8f872a02ff02aadb',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '46bd584d464976fcab4f75f339622862',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => core_addr,
        clk => clk,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_8f872a02ff02aadb',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '8226f0ccdddcf46d3d10c2e951a85013',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = FALSE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 4',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_e80093aea990e7ea',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '919ed9239ec6c16811c6c406a9b9c2fe',
    'sourceFile' => 'hdl/xlcounter_limit.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_e80093aea990e7ea',
      'entity_name.0' => 'xlcounter_limit',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET depth = 16',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_And_Write',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 36',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_Before_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_7068db77349ce284',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b695c2b189fec594b6f37e3ef3cd7bca',
    'sourceFile' => 'hdl/xlspram.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      din: in std_logic_vector(c_width - 1 downto 0);
      we: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => addr,
        clk => clk,
        din => data_in,
        we => core_we,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_7068db77349ce284',
      'entity_name.0' => 'xlspram',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ebf68832c148b48ebeed45be1fa6f494',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "00001";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((5 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_582a3706dd',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '4522f477ee817d9344e420e7e82c7ec4',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "00000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((5 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_fe72737ca0',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c6c785c7da534170701dbff999551b5f',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "10000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((5 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_ef0e2e5fc6',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = TRUE',
    'CSET load = TRUE',
    'CSET load_sense = active_high',
    'CSET operation = down',
    'CSET output_width = 5',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_3241d5218ebd61cd',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '2bd7d03b72eb8838a4177d66a94108a4',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      load: in std_logic;
      l: in std_logic_vector(op_width - 1 downto 0);
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        load => load(0),
        l => din,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_3241d5218ebd61cd',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b9b8874384342e8df155cd2fa01f6ece',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((5 - 1) downto 0);
  signal b_1_34: unsigned((5 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_12_3_rel <= a_1_31 = b_1_34;
  op <= boolean_to_vector(result_12_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((5 - 1) downto 0);
    b : in std_logic_vector((5 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_9ece3c8c4e',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '1167186bd3ee0a0898f6e43d489ee960',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((5 - 1) downto 0);
  signal b_1_34: unsigned((5 - 1) downto 0);
  signal result_14_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_14_3_rel <= a_1_31 /= b_1_34;
  op <= boolean_to_vector(result_14_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((5 - 1) downto 0);
    b : in std_logic_vector((5 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_dc5bc996c9',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = FALSE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 5',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_dd549111ea74373d',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a269bced0290de3f8779bc1fc9ac1c0d',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_dd549111ea74373d',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '5148fbfddb3e59c6edabf650be63ee65',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '3f34890d5cccaf9d58f54995d07c0da3',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 1FFFF, 0, 16A0A, 295F6, 1D907, 33C11, C3EF, 226F9, 1F629, 39C1D, 11C74, 2564A, 1A9B6, 2E38C, 63E3, 209D7, 1FD89, 3CDD1, 144CF, 27438, 1C38B, 30EA5, 94A0, 2160C, 1E9F4, 36B60, F15B, 23C75, 18BC8, 2BB31, 322F, 20277, 1FF62, 3E6E1, 157D7, 284A2, 1CED8, 32517, AC7D, 21DEE, 1F0A8, 38398, 10738, 248D8, 19B3E, 2CF01, 4B20, 2058B, 1FA75, 3B4E0, 130FF, 264C2, 1B728, 2F8C8, 7C68, 20F58, 1E212, 35383, DAE9, 23128, 17B5E, 2A829, 191F, 2009E, 1FFD9, 3F36F, 1610B, 28D2F, 1D413, 33084, B844, 2224F, 1F38F, 38FD2, 111EB, 24F6F, 1A29A, 2D930, 5788, 2078A, 1FC26, 3C153, 13B00, 26C5E, 1BD7C, 303A3, 888F, 2128C, 1E629, 35F65, E633, 236AB, 183B1, 2B193, 25AA, 20163, 1FE9D, 3DA56, 14E6D, 27C4F, 1C955, 319CD, A09B, 219D7, 1ED74, 37771, FC5D, 24284, 193A2, 2C500, 3EAD, 203DA, 1F876, 3A878, 126D0, 25D66, 1B091, 2EE15, 702E, 20C71, 1DDB1, 347BC, CF7C, 22BED, 172D1, 29EF5, C91, 20027;',
    '
]',
    'CSET depth = 128',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_pin = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_Only',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 18',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_After_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_baae78c6cf62a88f',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '6b9cf0feb0ed21938c80781b9561056b',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => core_addr,
        clk => clk,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_baae78c6cf62a88f',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 20000, 295F6, 295F6, 33C11, 226F9, 226F9, 33C11, 39C1D, 209D7, 2564A, 2E38C, 2E38C, 2564A, 209D7, 39C1D, 3CDD1, 20277, 27438, 2BB31, 30EA5, 23C75, 2160C, 36B60, 36B60, 2160C, 23C75, 30EA5, 2BB31, 27438, 20277, 3CDD1, 3E6E1, 2009E, 284A2, 2A829, 32517, 23128, 21DEE, 35383, 38398, 20F58, 248D8, 2F8C8, 2CF01, 264C2, 2058B, 3B4E0, 3B4E0, 2058B, 264C2, 2CF01, 2F8C8, 248D8, 20F58, 38398, 35383, 21DEE, 23128, 32517, 2A829, 284A2, 2009E, 3E6E1, 3F36F, 20027, 28D2F, 29EF5, 33084, 22BED, 2224F, 347BC, 38FD2, 20C71, 24F6F, 2EE15, 2D930, 25D66, 2078A, 3A878, 3C153, 203DA, 26C5E, 2C500, 303A3, 24284, 2128C, 37771, 35F65, 219D7, 236AB, 319CD, 2B193, 27C4F, 20163, 3DA56, 3DA56, 20163, 27C4F, 2B193, 319CD, 236AB, 219D7, 35F65, 37771, 2128C, 24284, 303A3, 2C500, 26C5E, 203DA, 3C153, 3A878, 2078A, 25D66, 2D930, 2EE15, 24F6F, 20C71, 38FD2, 347BC, 2224F, 22BED, 33084, 29EF5, 28D2F, 20027, 3F36F;',
    '
]',
    'CSET depth = 128',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_pin = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_Only',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 18',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_After_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_578f4a8fb59b1f38',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '0372143f0e234d846d8197e66e3b7742',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => core_addr,
        clk => clk,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_578f4a8fb59b1f38',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '4cea396f7adba5e3362ca1816fc9572b',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = FALSE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 3',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_b8a3efcc9651e5d3',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '9ca07e274d09536aa4612f930492a459',
    'sourceFile' => 'hdl/xlcounter_limit.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_b8a3efcc9651e5d3',
      'entity_name.0' => 'xlcounter_limit',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET depth = 8',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_And_Write',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 36',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_Before_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_38d4305037783d2c',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'af9ff183e4d50588014570d7d43044ee',
    'sourceFile' => 'hdl/xlspram.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      din: in std_logic_vector(c_width - 1 downto 0);
      we: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => addr,
        clk => clk,
        din => data_in,
        we => core_we,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_38d4305037783d2c',
      'entity_name.0' => 'xlspram',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'bab4e5f03ee70a1f19e04ed8bab64e3b',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "0001";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((4 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_67ad97ca70',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '908c27b641ca752b17d493067e198c76',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "0000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((4 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_4c449dd556',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'fadb300e660d2c903d1fcb082af6b277',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "1000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((4 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_145086465d',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = TRUE',
    'CSET load = TRUE',
    'CSET load_sense = active_high',
    'CSET operation = down',
    'CSET output_width = 4',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_fdd1a28438047006',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '425fc3075568c7d9fcef254e3c7e2bf4',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      load: in std_logic;
      l: in std_logic_vector(op_width - 1 downto 0);
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        load => load(0),
        l => din,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_fdd1a28438047006',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ed6a8def7bf6484a39b73ea223890ecf',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((4 - 1) downto 0);
  signal b_1_34: unsigned((4 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_12_3_rel <= a_1_31 = b_1_34;
  op <= boolean_to_vector(result_12_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((4 - 1) downto 0);
    b : in std_logic_vector((4 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_4d3cfceaf4',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '7281288dfdea268164419c50e848831c',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((4 - 1) downto 0);
  signal b_1_34: unsigned((4 - 1) downto 0);
  signal result_14_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_14_3_rel <= a_1_31 /= b_1_34;
  op <= boolean_to_vector(result_14_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((4 - 1) downto 0);
    b : in std_logic_vector((4 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_d930162434',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = FALSE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 4',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_e80093aea990e7ea',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ea68a41b5e92d0a8fa3b731cfe3109ad',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_e80093aea990e7ea',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c4387878a1ff325e6c33854a11fc4454',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '3a5fab0cd01b4f28b64c0cc379e0c9d2',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 1FFFF, 0, 16A0A, 295F6, 1D907, 33C11, C3EF, 226F9, 1F629, 39C1D, 11C74, 2564A, 1A9B6, 2E38C, 63E3, 209D7, 1FD89, 3CDD1, 144CF, 27438, 1C38B, 30EA5, 94A0, 2160C, 1E9F4, 36B60, F15B, 23C75, 18BC8, 2BB31, 322F, 20277, 1FF62, 3E6E1, 157D7, 284A2, 1CED8, 32517, AC7D, 21DEE, 1F0A8, 38398, 10738, 248D8, 19B3E, 2CF01, 4B20, 2058B, 1FA75, 3B4E0, 130FF, 264C2, 1B728, 2F8C8, 7C68, 20F58, 1E212, 35383, DAE9, 23128, 17B5E, 2A829, 191F, 2009E, 1FFD9, 3F36F, 1610B, 28D2F, 1D413, 33084, B844, 2224F, 1F38F, 38FD2, 111EB, 24F6F, 1A29A, 2D930, 5788, 2078A, 1FC26, 3C153, 13B00, 26C5E, 1BD7C, 303A3, 888F, 2128C, 1E629, 35F65, E633, 236AB, 183B1, 2B193, 25AA, 20163, 1FE9D, 3DA56, 14E6D, 27C4F, 1C955, 319CD, A09B, 219D7, 1ED74, 37771, FC5D, 24284, 193A2, 2C500, 3EAD, 203DA, 1F876, 3A878, 126D0, 25D66, 1B091, 2EE15, 702E, 20C71, 1DDB1, 347BC, CF7C, 22BED, 172D1, 29EF5, C91, 20027, 1FFF6, 3F9B8, 16592, 2918C, 1D696, 33647, BE1D, 2249B, 1F4E6, 395F5, 11735, 252D4, 1A631, 2DE58, 5DB7, 208A6, 1FCE1, 3C791, 13FEE, 27043, 1C08C, 3091F, 8E9A, 21442, 1E818, 3655F, EBCC, 23987, 187C4, 2B65C, 2BEE, 201E3, 1FF09, 3E09B, 15328, 28071, 1CC1F, 31F6E, A68F, 21BD9, 1EF18, 37D82, 101D0, 245A5, 19778, 2C9FA, 44E8, 204A8, 1F980, 3AEAA, 12BEE, 2610C, 1B3E5, 2F369, 764D, 20DDB, 1DFEB, 34D9C, D536, 22E82, 1771E, 2A388, 12D8, 20059, 1FFA7, 3ED28, 15C78, 288E2, 1D17E, 32ACA, B264, 22015, 1F225, 389B3, 10C97, 24C1B, 19EF4, 2D412, 5156, 20680, 1FB58, 3BB18, 13606, 26888, 1BA5B, 2FE30, 827E, 210E8, 1E427, 35971, E092, 233E1, 17F8F, 2ACD8, 1F65, 200F7, 1FE1D, 3D412, 149A4, 2783C, 1C679, 31434, 9AA1, 217E8, 1EBBE, 37166, F6E1, 23F74, 18FBD, 2C012, 386F, 2031F, 1F75A, 3A249, 121A8, 259CF, 1AD2C, 2E8CB, 6A0B, 20B1A, 1DB65, 341E3, C9B9, 2296A, 16E74, 29A6E, 648, 2000A;',
    '
]',
    'CSET depth = 256',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_pin = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_Only',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 18',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_After_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_f9f47a6cb9d2aa15',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '67c92f2e062be4327ff057a56d9b1917',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => core_addr,
        clk => clk,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_f9f47a6cb9d2aa15',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 20000, 295F6, 295F6, 33C11, 226F9, 226F9, 33C11, 39C1D, 209D7, 2564A, 2E38C, 2E38C, 2564A, 209D7, 39C1D, 3CDD1, 20277, 27438, 2BB31, 30EA5, 23C75, 2160C, 36B60, 36B60, 2160C, 23C75, 30EA5, 2BB31, 27438, 20277, 3CDD1, 3E6E1, 2009E, 284A2, 2A829, 32517, 23128, 21DEE, 35383, 38398, 20F58, 248D8, 2F8C8, 2CF01, 264C2, 2058B, 3B4E0, 3B4E0, 2058B, 264C2, 2CF01, 2F8C8, 248D8, 20F58, 38398, 35383, 21DEE, 23128, 32517, 2A829, 284A2, 2009E, 3E6E1, 3F36F, 20027, 28D2F, 29EF5, 33084, 22BED, 2224F, 347BC, 38FD2, 20C71, 24F6F, 2EE15, 2D930, 25D66, 2078A, 3A878, 3C153, 203DA, 26C5E, 2C500, 303A3, 24284, 2128C, 37771, 35F65, 219D7, 236AB, 319CD, 2B193, 27C4F, 20163, 3DA56, 3DA56, 20163, 27C4F, 2B193, 319CD, 236AB, 219D7, 35F65, 37771, 2128C, 24284, 303A3, 2C500, 26C5E, 203DA, 3C153, 3A878, 2078A, 25D66, 2D930, 2EE15, 24F6F, 20C71, 38FD2, 347BC, 2224F, 22BED, 33084, 29EF5, 28D2F, 20027, 3F36F, 3F9B8, 2000A, 2918C, 29A6E, 33647, 2296A, 2249B, 341E3, 395F5, 20B1A, 252D4, 2E8CB, 2DE58, 259CF, 208A6, 3A249, 3C791, 2031F, 27043, 2C012, 3091F, 23F74, 21442, 37166, 3655F, 217E8, 23987, 31434, 2B65C, 2783C, 201E3, 3D412, 3E09B, 200F7, 28071, 2ACD8, 31F6E, 233E1, 21BD9, 35971, 37D82, 210E8, 245A5, 2FE30, 2C9FA, 26888, 204A8, 3BB18, 3AEAA, 20680, 2610C, 2D412, 2F369, 24C1B, 20DDB, 389B3, 34D9C, 22015, 22E82, 32ACA, 2A388, 288E2, 20059, 3ED28, 3ED28, 20059, 288E2, 2A388, 32ACA, 22E82, 22015, 34D9C, 389B3, 20DDB, 24C1B, 2F369, 2D412, 2610C, 20680, 3AEAA, 3BB18, 204A8, 26888, 2C9FA, 2FE30, 245A5, 210E8, 37D82, 35971, 21BD9, 233E1, 31F6E, 2ACD8, 28071, 200F7, 3E09B, 3D412, 201E3, 2783C, 2B65C, 31434, 23987, 217E8, 3655F, 37166, 21442, 23F74, 3091F, 2C012, 27043, 2031F, 3C791, 3A249, 208A6, 259CF, 2DE58, 2E8CB, 252D4, 20B1A, 395F5, 341E3, 2249B, 2296A, 33647, 29A6E, 2918C, 2000A, 3F9B8;',
    '
]',
    'CSET depth = 256',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_pin = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_Only',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 18',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_After_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_6394d46b7454c18a',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '46c207f8b0ec9dd87c4a00a1dda2271b',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => core_addr,
        clk => clk,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_6394d46b7454c18a',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '6dd06e19dedbc09cd425f576ea7847af',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '47b9dac6f3916651ef6518925240b0d7',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '3e32d0c3084ab554ef45ac9172ce46a7',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "001";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((3 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_a1c496ea88',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd8fe814692903faea56ecec2003964cb',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((3 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_822933f89b',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '3cbb4b7449173f2ec4bd2eb1d7435974',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "100";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((3 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_469094441c',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = TRUE',
    'CSET load = TRUE',
    'CSET load_sense = active_high',
    'CSET operation = down',
    'CSET output_width = 3',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_d8ae89720b5de7f6',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'fed3d6b1a3a38c02aebbcaeff284d021',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      load: in std_logic;
      l: in std_logic_vector(op_width - 1 downto 0);
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        load => load(0),
        l => din,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_d8ae89720b5de7f6',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '0d2830fc6f3d63f3fed155175c35a0f2',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((3 - 1) downto 0);
  signal b_1_34: unsigned((3 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_12_3_rel <= a_1_31 = b_1_34;
  op <= boolean_to_vector(result_12_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((3 - 1) downto 0);
    b : in std_logic_vector((3 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_8fc7f5539b',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '91e16f9e52f2fc6ba0a751b004ae0945',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((3 - 1) downto 0);
  signal b_1_34: unsigned((3 - 1) downto 0);
  signal result_14_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_14_3_rel <= a_1_31 /= b_1_34;
  op <= boolean_to_vector(result_14_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((3 - 1) downto 0);
    b : in std_logic_vector((3 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_47b317dab6',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = FALSE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 3',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_b8a3efcc9651e5d3',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c77faa437ebf009e2c461fd25f503487',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_b8a3efcc9651e5d3',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd4893f346b6012f185085efce5fb122c',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '1f58818de7710868ca0bd4e91febb3c4',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = FALSE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 10',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_7c2d447100ca50c7',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '222cce764f556fa7af02e0389c8001d8',
    'sourceFile' => 'hdl/xlcounter_limit.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_7c2d447100ca50c7',
      'entity_name.0' => 'xlcounter_limit',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET depth = 1024',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_And_Write',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 8',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_Before_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_7ea60367d40e0967',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '257b9304ec2eeac9d05be1659be6d962',
    'sourceFile' => 'hdl/xlspram.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      din: in std_logic_vector(c_width - 1 downto 0);
      we: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => addr,
        clk => clk,
        din => data_in,
        we => core_we,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_7ea60367d40e0967',
      'entity_name.0' => 'xlspram',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '97e57aef58f221b08fee5c8bbb4c3d86',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: unsigned((3 - 1) downto 0);
  signal in1_1_27: unsigned((1 - 1) downto 0);
  signal y_2_1_concat: unsigned((4 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((3 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((4 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_d90e7950ae',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ecacdc34b5fae3ec926227d44fb7ee3f',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: unsigned((8 - 1) downto 0);
  signal in1_1_27: unsigned((8 - 1) downto 0);
  signal in2_1_31: unsigned((8 - 1) downto 0);
  signal in3_1_35: unsigned((8 - 1) downto 0);
  signal y_2_1_concat: unsigned((32 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  in3_1_35 <= std_logic_vector_to_unsigned(in3);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31) & unsigned_to_std_logic_vector(in3_1_35));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((8 - 1) downto 0);
    in1 : in std_logic_vector((8 - 1) downto 0);
    in2 : in std_logic_vector((8 - 1) downto 0);
    in3 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_a1e126f11c',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '8f9c75e22a728dc75ff5a38bf145ab70',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: unsigned((6 - 1) downto 0);
  signal in1_1_27: unsigned((10 - 1) downto 0);
  signal y_2_1_concat: unsigned((16 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((6 - 1) downto 0);
    in1 : in std_logic_vector((10 - 1) downto 0);
    y : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_db546eb10e',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '12b332fcd18b574f1acfe0f49306f7a6',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "010";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((3 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_1f5cc32f1e',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '6da224b11349a131e0fcc0396767d627',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "011";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((3 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_0f59f02ba5',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = TRUE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 17',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_b8a5551b3c16b99b',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a1ddda53d0a854a3632612dca085a5c5',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_b8a5551b3c16b99b',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '0aaeaed3751be74d32151e0e91e83c6d',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic_vector((2 - 1) downto 0);
  signal d0_1_24: std_logic_vector((32 - 1) downto 0);
  signal d1_1_27: std_logic_vector((32 - 1) downto 0);
  signal d2_1_30: std_logic_vector((32 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((32 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "00" =>
        unregy_join_6_1 <= d0_1_24;
      when "01" =>
        unregy_join_6_1 <= d1_1_27;
      when others =>
        unregy_join_6_1 <= d2_1_30;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end',
      'crippled_entity' => 'is
  port (
    sel : in std_logic_vector((2 - 1) downto 0);
    d0 : in std_logic_vector((32 - 1) downto 0);
    d1 : in std_logic_vector((32 - 1) downto 0);
    d2 : in std_logic_vector((32 - 1) downto 0);
    y : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_9d682a1165',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '1e0a9d9e7c70d8021f169965ce93b29b',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((8 - 1) downto 0);
  signal d1_1_27: std_logic_vector((8 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((8 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end',
      'crippled_entity' => 'is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((8 - 1) downto 0);
    d1 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_2af8d8c05a',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '4a530bde16b459e3667b19435521125c',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c217a5462226d1eca21226cafa5adefb',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '72be8e5e29a83a88f2d3de1816cd4256',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a3d54b01536fdcf5c58e3efab59f6901',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '08143fb42f512e6ad221681b22a2abeb',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '0da00d934fc749461391a70f9181398c',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '376cebdc601af12a1e63c9648e0dbf68',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '3e1acbba4c99cb0888d2580ffd045867',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  fully_2_1_bit <= d0_1_24 xor d1_1_27;
  y <= std_logic_to_vector(fully_2_1_bit);
end',
      'crippled_entity' => 'is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'logical_e77c53f8bd',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'bf290ef325a9158a3d67c2d8c3d1403c',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: unsigned((32 - 1) downto 0);
  signal in1_1_27: unsigned((32 - 1) downto 0);
  signal y_2_1_concat: unsigned((64 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((32 - 1) downto 0);
    in1 : in std_logic_vector((32 - 1) downto 0);
    y : out std_logic_vector((64 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_62c4475a80',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a70249c1654ad824a44f9199a7b11ec6',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: unsigned((3 - 1) downto 0);
  signal in1_1_27: boolean;
  signal in2_1_31: boolean;
  signal in3_1_35: boolean;
  signal in4_1_39: boolean;
  signal in5_1_43: boolean;
  signal y_2_1_concat: unsigned((8 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= ((in1) = "1");
  in2_1_31 <= ((in2) = "1");
  in3_1_35 <= ((in3) = "1");
  in4_1_39 <= ((in4) = "1");
  in5_1_43 <= ((in5) = "1");
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & boolean_to_vector(in1_1_27) & boolean_to_vector(in2_1_31) & boolean_to_vector(in3_1_35) & boolean_to_vector(in4_1_39) & boolean_to_vector(in5_1_43));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((3 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    in2 : in std_logic_vector((1 - 1) downto 0);
    in3 : in std_logic_vector((1 - 1) downto 0);
    in4 : in std_logic_vector((1 - 1) downto 0);
    in5 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_ce17a02288',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '104848c7bf88f77fa2a15eb4787d0e77',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = TRUE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 14',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_9539f41705559a71',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '9e491bbfa58d1030bc66281d3b60cb09',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_9539f41705559a71',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ff21f86a874caf4a8b3f9e31ddcc1879',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d_1_22: std_logic_vector((3 - 1) downto 0);
  type array_type_op_mem_20_24 is array (0 to (1 - 1)) of std_logic_vector((3 - 1) downto 0);
  signal op_mem_20_24: array_type_op_mem_20_24 := (
    0 => "000");
  signal op_mem_20_24_front_din: std_logic_vector((3 - 1) downto 0);
  signal op_mem_20_24_back: std_logic_vector((3 - 1) downto 0);
  signal op_mem_20_24_push_front_pop_back_en: std_logic;
begin
  d_1_22 <= d;
  op_mem_20_24_back <= op_mem_20_24(0);
  proc_op_mem_20_24: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_20_24_push_front_pop_back_en = \'1\')) then
        op_mem_20_24(0) <= op_mem_20_24_front_din;
      end if;
    end if;
  end process proc_op_mem_20_24;
  op_mem_20_24_front_din <= d_1_22;
  op_mem_20_24_push_front_pop_back_en <= \'1\';
  q <= op_mem_20_24_back;
end',
      'crippled_entity' => 'is
  port (
    d : in std_logic_vector((3 - 1) downto 0);
    q : out std_logic_vector((3 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'delay_54d5af2115',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c757019693f8032fa79ae996578cb9a4',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d_1_22: std_logic;
  type array_type_op_mem_20_24 is array (0 to (2 - 1)) of std_logic;
  signal op_mem_20_24: array_type_op_mem_20_24 := (
    \'0\',
    \'0\');
  signal op_mem_20_24_front_din: std_logic;
  signal op_mem_20_24_back: std_logic;
  signal op_mem_20_24_push_front_pop_back_en: std_logic;
begin
  d_1_22 <= d(0);
  op_mem_20_24_back <= op_mem_20_24(1);
  proc_op_mem_20_24: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_20_24_push_front_pop_back_en = \'1\')) then
        for i in 1 downto 1 loop 
          op_mem_20_24(i) <= op_mem_20_24(i-1);
        end loop;
        op_mem_20_24(0) <= op_mem_20_24_front_din;
      end if;
    end if;
  end process proc_op_mem_20_24;
  op_mem_20_24_front_din <= d_1_22;
  op_mem_20_24_push_front_pop_back_en <= \'1\';
  q <= std_logic_to_vector(op_mem_20_24_back);
end',
      'crippled_entity' => 'is
  port (
    d : in std_logic_vector((1 - 1) downto 0);
    q : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'delay_e18fb31a3d',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'efd075c0353dc2670dad7ba7b1998393',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d_1_22: std_logic;
  type array_type_op_mem_20_24 is array (0 to (1 - 1)) of std_logic;
  signal op_mem_20_24: array_type_op_mem_20_24 := (
    0 => \'0\');
  signal op_mem_20_24_front_din: std_logic;
  signal op_mem_20_24_back: std_logic;
  signal op_mem_20_24_push_front_pop_back_en: std_logic;
begin
  d_1_22 <= d(0);
  op_mem_20_24_back <= op_mem_20_24(0);
  proc_op_mem_20_24: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_20_24_push_front_pop_back_en = \'1\')) then
        op_mem_20_24(0) <= op_mem_20_24_front_din;
      end if;
    end if;
  end process proc_op_mem_20_24;
  op_mem_20_24_front_din <= d_1_22;
  op_mem_20_24_push_front_pop_back_en <= \'1\';
  q <= std_logic_to_vector(op_mem_20_24_back);
end',
      'crippled_entity' => 'is
  port (
    d : in std_logic_vector((1 - 1) downto 0);
    q : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'delay_9f02caa990',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '5e4583fed4a758a73508f67e11ffdd01',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  type array_type_latency_pipe_5_26 is array (0 to (2 - 1)) of std_logic;
  signal latency_pipe_5_26: array_type_latency_pipe_5_26 := (
    \'0\',
    \'0\');
  signal latency_pipe_5_26_front_din: std_logic;
  signal latency_pipe_5_26_back: std_logic;
  signal latency_pipe_5_26_push_front_pop_back_en: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  latency_pipe_5_26_back <= latency_pipe_5_26(1);
  proc_latency_pipe_5_26: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (latency_pipe_5_26_push_front_pop_back_en = \'1\')) then
        for i in 1 downto 1 loop 
          latency_pipe_5_26(i) <= latency_pipe_5_26(i-1);
        end loop;
        latency_pipe_5_26(0) <= latency_pipe_5_26_front_din;
      end if;
    end if;
  end process proc_latency_pipe_5_26;
  fully_2_1_bit <= d0_1_24 and d1_1_27;
  latency_pipe_5_26_front_din <= fully_2_1_bit;
  latency_pipe_5_26_push_front_pop_back_en <= \'1\';
  y <= std_logic_to_vector(latency_pipe_5_26_back);
end',
      'crippled_entity' => 'is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'logical_3927d3238d',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c697fa4acbd2bbcab4329990babd598a',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic_vector((3 - 1) downto 0);
  signal d0_1_24: std_logic_vector((32 - 1) downto 0);
  signal d1_1_27: std_logic_vector((32 - 1) downto 0);
  signal d2_1_30: std_logic_vector((32 - 1) downto 0);
  signal d3_1_33: std_logic_vector((32 - 1) downto 0);
  signal d4_1_36: std_logic_vector((32 - 1) downto 0);
  signal d5_1_39: std_logic_vector((32 - 1) downto 0);
  signal d6_1_42: std_logic_vector((32 - 1) downto 0);
  signal d7_1_45: std_logic_vector((32 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((32 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  d3_1_33 <= d3;
  d4_1_36 <= d4;
  d5_1_39 <= d5;
  d6_1_42 <= d6;
  d7_1_45 <= d7;
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, d3_1_33, d4_1_36, d5_1_39, d6_1_42, d7_1_45, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "000" =>
        unregy_join_6_1 <= d0_1_24;
      when "001" =>
        unregy_join_6_1 <= d1_1_27;
      when "010" =>
        unregy_join_6_1 <= d2_1_30;
      when "011" =>
        unregy_join_6_1 <= d3_1_33;
      when "100" =>
        unregy_join_6_1 <= d4_1_36;
      when "101" =>
        unregy_join_6_1 <= d5_1_39;
      when "110" =>
        unregy_join_6_1 <= d6_1_42;
      when others =>
        unregy_join_6_1 <= d7_1_45;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end',
      'crippled_entity' => 'is
  port (
    sel : in std_logic_vector((3 - 1) downto 0);
    d0 : in std_logic_vector((32 - 1) downto 0);
    d1 : in std_logic_vector((32 - 1) downto 0);
    d2 : in std_logic_vector((32 - 1) downto 0);
    d3 : in std_logic_vector((32 - 1) downto 0);
    d4 : in std_logic_vector((32 - 1) downto 0);
    d5 : in std_logic_vector((32 - 1) downto 0);
    d6 : in std_logic_vector((32 - 1) downto 0);
    d7 : in std_logic_vector((32 - 1) downto 0);
    y : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_e9e9c2e4f6',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '7835a51912bc57ac6a26b0b7c5334a79',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic_vector((64 - 1) downto 0);
  signal d1_1_27: std_logic_vector((64 - 1) downto 0);
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((64 - 1) downto 0);
begin
  sel_1_20 <= sel(0);
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  sel_internal_2_1_convert <= cast(std_logic_to_vector(sel_1_20), 0, 1, 0, xlUnsigned);
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_internal_2_1_convert)
  is
  begin
    case sel_internal_2_1_convert is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end',
      'crippled_entity' => 'is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((64 - 1) downto 0);
    d1 : in std_logic_vector((64 - 1) downto 0);
    y : out std_logic_vector((64 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_66e06093b2',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '25fea6c56910c4d3cf05248d7a4e30be',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '9ead1fe6b165801e072dbfc20af01ab8',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "1000000000000000000000000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((28 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_3afb0a580d',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = TRUE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 28',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_658945f0a80d459a',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '4091adb8c313ae91f72f02567cd5a5ad',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_658945f0a80d459a',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd1ec8a69bce50c7e872157340a5ed466',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((28 - 1) downto 0);
  signal b_1_34: unsigned((28 - 1) downto 0);
  signal result_14_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_14_3_rel <= a_1_31 /= b_1_34;
  op <= boolean_to_vector(result_14_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((28 - 1) downto 0);
    b : in std_logic_vector((28 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_8759749125',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '694703593685b2323ed3451724dbe6e3',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "100000000000000000000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((24 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_bdd7f47790',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = TRUE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 24',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_804522374d9edc41',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '6cbd735757e67312c0ec21b516d0eb57',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_804522374d9edc41',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f8ed025e1bdb85da33dfdb67e9d3d269',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((24 - 1) downto 0);
  signal b_1_34: unsigned((24 - 1) downto 0);
  signal result_14_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_14_3_rel <= a_1_31 /= b_1_34;
  op <= boolean_to_vector(result_14_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((24 - 1) downto 0);
    b : in std_logic_vector((24 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_831189b190',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = FALSE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 10',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_7c2d447100ca50c7',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a9885892a1ab8a8bc2f60fe40258d28d',
    'sourceFile' => 'hdl/xlcounter_limit.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_7c2d447100ca50c7',
      'entity_name.0' => 'xlcounter_limit',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '738143efa6bdd518f8c8df8a7f339b6a',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic_vector((2 - 1) downto 0);
  signal d0_1_24: std_logic_vector((8 - 1) downto 0);
  signal d1_1_27: std_logic_vector((8 - 1) downto 0);
  signal d2_1_30: std_logic_vector((8 - 1) downto 0);
  signal d3_1_33: std_logic_vector((8 - 1) downto 0);
  type array_type_pipe_20_22 is array (0 to (1 - 1)) of std_logic_vector((8 - 1) downto 0);
  signal pipe_20_22: array_type_pipe_20_22 := (
    0 => "00000000");
  signal pipe_20_22_front_din: std_logic_vector((8 - 1) downto 0);
  signal pipe_20_22_back: std_logic_vector((8 - 1) downto 0);
  signal pipe_20_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((8 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  d3_1_33 <= d3;
  pipe_20_22_back <= pipe_20_22(0);
  proc_pipe_20_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (pipe_20_22_push_front_pop_back_en = \'1\')) then
        pipe_20_22(0) <= pipe_20_22_front_din;
      end if;
    end if;
  end process proc_pipe_20_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, d3_1_33, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "00" =>
        unregy_join_6_1 <= d0_1_24;
      when "01" =>
        unregy_join_6_1 <= d1_1_27;
      when "10" =>
        unregy_join_6_1 <= d2_1_30;
      when others =>
        unregy_join_6_1 <= d3_1_33;
    end case;
  end process proc_switch_6_1;
  pipe_20_22_front_din <= unregy_join_6_1;
  pipe_20_22_push_front_pop_back_en <= \'1\';
  y <= pipe_20_22_back;
end',
      'crippled_entity' => 'is
  port (
    sel : in std_logic_vector((2 - 1) downto 0);
    d0 : in std_logic_vector((8 - 1) downto 0);
    d1 : in std_logic_vector((8 - 1) downto 0);
    d2 : in std_logic_vector((8 - 1) downto 0);
    d3 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_81f00cece7',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '98f45f7ee43ed63e7e1300eefa84e159',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET depth = 256',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_And_Write',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 32',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_Before_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_f239e1ef1af0e201',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a684a305b6780c383ff1c89532b53dae',
    'sourceFile' => 'hdl/xlspram.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      din: in std_logic_vector(c_width - 1 downto 0);
      we: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => addr,
        clk => clk,
        din => data_in,
        we => core_we,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_f239e1ef1af0e201',
      'entity_name.0' => 'xlspram',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '55f25515ef042ee7c5e43eb49bd50b23',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '0cfbf8d985326d3ff264a20880a55aed',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'cb899d6fdafbfe414c295b539087e8f7',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '3b02d5242481f326e398b272daba6131',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '294f919e1dc4c0c36bb7f521e11e5975',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d_1_22: std_logic_vector((8 - 1) downto 0);
begin
  d_1_22 <= d;
  q <= d_1_22;
end',
      'crippled_entity' => 'is
  port (
    d : in std_logic_vector((8 - 1) downto 0);
    q : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'delay_423c6c1400',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '1c99762e6802fa8970b9446afacb8f52',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '21e4d5a9fbc59180d1e5bd1a6e93aaf3',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Distributed_Memory Virtex2P Xilinx,_Inc. 7.1',
    '# 10.1.03i',
    'CSET ce_overrides = sync_controls_overrides_ce',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 4, 8, C, 10, 14, 18, 1C, 20, 24, 28, 2C, 30, 34, 38, 3C, 40, 44, 48, 4C, 50, 54, 58, 5C, 60, 64, 68, 6C, 70, 74, 78, 7C, 80, 84, 88, 8C, 90, 94, 98, 9C, A0, A4, A8, AC, B0, B4, B8, BC, C0, C4, C8, CC, D0, D4, D8, DC, E0, E4, E8, EC, F0, F4, F8, FC, 1, 5, 9, D, 11, 15, 19, 1D, 21, 25, 29, 2D, 31, 35, 39, 3D, 41, 45, 49, 4D, 51, 55, 59, 5D, 61, 65, 69, 6D, 71, 75, 79, 7D, 81, 85, 89, 8D, 91, 95, 99, 9D, A1, A5, A9, AD, B1, B5, B9, BD, C1, C5, C9, CD, D1, D5, D9, DD, E1, E5, E9, ED, F1, F5, F9, FD, 2, 6, A, E, 12, 16, 1A, 1E, 22, 26, 2A, 2E, 32, 36, 3A, 3E, 42, 46, 4A, 4E, 52, 56, 5A, 5E, 62, 66, 6A, 6E, 72, 76, 7A, 7E, 82, 86, 8A, 8E, 92, 96, 9A, 9E, A2, A6, AA, AE, B2, B6, BA, BE, C2, C6, CA, CE, D2, D6, DA, DE, E2, E6, EA, EE, F2, F6, FA, FE, 3, 7, B, F, 13, 17, 1B, 1F, 23, 27, 2B, 2F, 33, 37, 3B, 3F, 43, 47, 4B, 4F, 53, 57, 5B, 5F, 63, 67, 6B, 6F, 73, 77, 7B, 7F, 83, 87, 8B, 8F, 93, 97, 9B, 9F, A3, A7, AB, AF, B3, B7, BB, BF, C3, C7, CB, CF, D3, D7, DB, DF, E3, E7, EB, EF, F3, F7, FB, FF;',
    '
]',
    'CSET common_output_ce = false',
    'CSET common_output_clk = false',
    'CSET create_rpm = true',
    'CSET data_width = 8',
    'CSET default_data = 0',
    'CSET default_data_radix = 16',
    'CSET depth = 256',
    'CSET dual_port_address = non_registered',
    'CSET dual_port_output_clock_enable = false',
    'CSET input_clock_enable = false',
    'CSET input_options = non_registered',
    'CSET latency = 1',
    'CSET memory_type = rom',
    'CSET multiplexer_construction = lut_based',
    'CSET output_options = registered',
    'CSET qualify_we_with_i_ce = false',
    'CSET read_enable = false',
    'CSET reset_qdpo = false',
    'CSET reset_qspo = false',
    'CSET single_port_output_clock_enable = true',
    'CSET sync_reset_qdpo = false',
    'CSET sync_reset_qspo = false',
    'CSET component_name = distributed_memory_virtex2p_7_1_17126bf86411dabf',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '6cece88b2c1dae93223cf0a42fa70967',
    'sourceFile' => 'hdl/xlsprom_dist.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      a: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      qspo_ce: in std_logic;
      qspo: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        a => core_addr,
        clk => clk,
        qspo_ce => core_ce,
        qspo => core_data_out',
      'core_name0' => 'distributed_memory_virtex2p_7_1_17126bf86411dabf',
      'entity_name.0' => 'xlsprom_dist',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'fb3e53e1e52b432ca9d4747c16956c99',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '357c8bb411a44a3a151020eb0dda838c',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((8 - 1) downto 0);
  signal d1_1_27: std_logic_vector((8 - 1) downto 0);
  type array_type_pipe_16_22 is array (0 to (1 - 1)) of std_logic_vector((8 - 1) downto 0);
  signal pipe_16_22: array_type_pipe_16_22 := (
    0 => "00000000");
  signal pipe_16_22_front_din: std_logic_vector((8 - 1) downto 0);
  signal pipe_16_22_back: std_logic_vector((8 - 1) downto 0);
  signal pipe_16_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((8 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  pipe_16_22_back <= pipe_16_22(0);
  proc_pipe_16_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (pipe_16_22_push_front_pop_back_en = \'1\')) then
        pipe_16_22(0) <= pipe_16_22_front_din;
      end if;
    end if;
  end process proc_pipe_16_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  pipe_16_22_front_din <= unregy_join_6_1;
  pipe_16_22_push_front_pop_back_en <= \'1\';
  y <= pipe_16_22_back;
end',
      'crippled_entity' => 'is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((8 - 1) downto 0);
    d1 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_7f6b7da686',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'cec11d988085822c041df106ed2b66a7',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b70f209528fc68a2c658d9184ba74222',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ccefb93794b36b9f133dc77fcec57bff',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = TRUE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = down',
    'CSET output_width = 2',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_2b3d5de203345a84',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ec2f604f7c57e7c120deb10d8babb496',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_2b3d5de203345a84',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'df76deaa7693be510eb758bc14bcd920',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '1a94ef3039b662934bf8115d849301e3',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '0c7bd8071898b784c4d9e370edcb4a0c',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '8ed920d3da5daaac13212bc6c3bfef88',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '104ac5e1ef382914ef62fef4c4073593',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: unsigned((48 - 1) downto 0);
  signal in1_1_27: unsigned((14 - 1) downto 0);
  signal in2_1_31: unsigned((2 - 1) downto 0);
  signal y_2_1_concat: unsigned((64 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((48 - 1) downto 0);
    in1 : in std_logic_vector((14 - 1) downto 0);
    in2 : in std_logic_vector((2 - 1) downto 0);
    y : out std_logic_vector((64 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_3d6d010511',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '88830d9c3c6209fe09bc9058d6f00190',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d_1_22: std_logic_vector((32 - 1) downto 0);
  type array_type_op_mem_20_24 is array (0 to (1 - 1)) of std_logic_vector((32 - 1) downto 0);
  signal op_mem_20_24: array_type_op_mem_20_24 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_20_24_front_din: std_logic_vector((32 - 1) downto 0);
  signal op_mem_20_24_back: std_logic_vector((32 - 1) downto 0);
  signal op_mem_20_24_push_front_pop_back_en: std_logic;
begin
  d_1_22 <= d;
  op_mem_20_24_back <= op_mem_20_24(0);
  proc_op_mem_20_24: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_20_24_push_front_pop_back_en = \'1\')) then
        op_mem_20_24(0) <= op_mem_20_24_front_din;
      end if;
    end if;
  end process proc_op_mem_20_24;
  op_mem_20_24_front_din <= d_1_22;
  op_mem_20_24_push_front_pop_back_en <= \'1\';
  q <= op_mem_20_24_back;
end',
      'crippled_entity' => 'is
  port (
    d : in std_logic_vector((32 - 1) downto 0);
    q : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'delay_672d2b8d1e',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd51a0f0211f516501fdee94774efba02',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d_1_22: std_logic_vector((2 - 1) downto 0);
  type array_type_op_mem_20_24 is array (0 to (1 - 1)) of std_logic_vector((2 - 1) downto 0);
  signal op_mem_20_24: array_type_op_mem_20_24 := (
    0 => "00");
  signal op_mem_20_24_front_din: std_logic_vector((2 - 1) downto 0);
  signal op_mem_20_24_back: std_logic_vector((2 - 1) downto 0);
  signal op_mem_20_24_push_front_pop_back_en: std_logic;
begin
  d_1_22 <= d;
  op_mem_20_24_back <= op_mem_20_24(0);
  proc_op_mem_20_24: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_20_24_push_front_pop_back_en = \'1\')) then
        op_mem_20_24(0) <= op_mem_20_24_front_din;
      end if;
    end if;
  end process proc_op_mem_20_24;
  op_mem_20_24_front_din <= d_1_22;
  op_mem_20_24_push_front_pop_back_en <= \'1\';
  q <= op_mem_20_24_back;
end',
      'crippled_entity' => 'is
  port (
    d : in std_logic_vector((2 - 1) downto 0);
    q : out std_logic_vector((2 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'delay_4ce33ca7e7',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '68802171c6d23d92375b73a353a2a10c',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d_1_22: std_logic_vector((48 - 1) downto 0);
  type array_type_op_mem_20_24 is array (0 to (1 - 1)) of std_logic_vector((48 - 1) downto 0);
  signal op_mem_20_24: array_type_op_mem_20_24 := (
    0 => "000000000000000000000000000000000000000000000000");
  signal op_mem_20_24_front_din: std_logic_vector((48 - 1) downto 0);
  signal op_mem_20_24_back: std_logic_vector((48 - 1) downto 0);
  signal op_mem_20_24_push_front_pop_back_en: std_logic;
begin
  d_1_22 <= d;
  op_mem_20_24_back <= op_mem_20_24(0);
  proc_op_mem_20_24: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_20_24_push_front_pop_back_en = \'1\')) then
        op_mem_20_24(0) <= op_mem_20_24_front_din;
      end if;
    end if;
  end process proc_op_mem_20_24;
  op_mem_20_24_front_din <= d_1_22;
  op_mem_20_24_push_front_pop_back_en <= \'1\';
  q <= op_mem_20_24_back;
end',
      'crippled_entity' => 'is
  port (
    d : in std_logic_vector((48 - 1) downto 0);
    q : out std_logic_vector((48 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'delay_d8eaaced1c',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '831deb6122b6afb2cc4d8eb8fa0839f1',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((64 - 1) downto 0);
  signal d1_1_27: std_logic_vector((64 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((64 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end',
      'crippled_entity' => 'is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((64 - 1) downto 0);
    d1 : in std_logic_vector((64 - 1) downto 0);
    y : out std_logic_vector((64 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_dc8b84fd59',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'fb975d6e78dbf7d48ee213332aaf39dc',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '8858a9110b8da395387bb7c53e531938',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '101deb9a65ecd7b2e0710f67fe8418a8',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f241bfae1351eed95fdb47d0c78b6daf',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ae9778152c0e6188b834f943a67d884b',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b537b589d3e74943f80246b790c3de7e',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = TRUE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 56',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_5a07f4bba2e9cb5e',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '23752fbefeca3ac038a706ffc6801925',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_5a07f4bba2e9cb5e',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = FALSE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 11',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_78a3dd824f4df0df',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '4b612bf2d883b1cf56f69b578665e4ae',
    'sourceFile' => 'hdl/xlcounter_limit.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_78a3dd824f4df0df',
      'entity_name.0' => 'xlcounter_limit',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET depth = 2048',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_And_Write',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 16',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_Before_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_287130c77eef8a13',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '81d7041cbab8e64c6f1a902a87a52c16',
    'sourceFile' => 'hdl/xlspram.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      din: in std_logic_vector(c_width - 1 downto 0);
      we: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => addr,
        clk => clk,
        din => data_in,
        we => core_we,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_287130c77eef8a13',
      'entity_name.0' => 'xlspram',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '0eb09ba255e1319e49a55c3063fcdbae',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET depth = 2048',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_pin = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_Only',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 8',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_After_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_c4da1499b2390313',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '41634f9257773720f0faaa32ea3dec0a',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => core_addr,
        clk => clk,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_c4da1499b2390313',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, A, A, A, A, A, A, A, A, A, A, A, A, A, A, A, A, A, A, A, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, C, C, C, C, C, C, C, C, C, C, C, C, C, C, C, C, C, C, D, D, D, D, D, D, D, D, D, D, D, D, D, D, D, D, D, E, E, E, E, E, E, E, E, E, E, E, E, E, E, E, E, E, E, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 1A, 1A, 1A, 1A, 1A, 1A, 1A, 1A, 1A, 1A, 1A, 1A, 1A, 1A, 1A, 1B, 1B, 1B, 1B, 1B, 1B, 1B, 1B, 1B, 1B, 1B, 1B, 1B, 1C, 1C, 1C, 1C, 1C, 1C, 1C, 1C, 1C, 1C, 1C, 1C, 1C, 1C, 1D, 1D, 1D, 1D, 1D, 1D, 1D, 1D, 1D, 1D, 1D, 1D, 1D, 1D, 1E, 1E, 1E, 1E, 1E, 1E, 1E, 1E, 1E, 1E, 1E, 1E, 1E, 1F, 1F, 1F, 1F, 1F, 1F, 1F, 1F, 1F, 1F, 1F, 1F, 1F, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 2A, 2A, 2A, 2A, 2A, 2A, 2A, 2A, 2A, 2A, 2A, 2A, 2B, 2B, 2B, 2B, 2B, 2B, 2B, 2B, 2B, 2B, 2B, 2B, 2C, 2C, 2C, 2C, 2C, 2C, 2C, 2C, 2C, 2C, 2C, 2C, 2D, 2D, 2D, 2D, 2D, 2D, 2D, 2D, 2D, 2D, 2D, 2D, 2E, 2E, 2E, 2E, 2E, 2E, 2E, 2E, 2E, 2E, 2E, 2E, 2F, 2F, 2F, 2F, 2F, 2F, 2F, 2F, 2F, 2F, 2F, 2F, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 3A, 3A, 3A, 3A, 3A, 3A, 3A, 3A, 3A, 3A, 3A, 3A, 3B, 3B, 3B, 3B, 3B, 3B, 3B, 3B, 3B, 3B, 3B, 3C, 3C, 3C, 3C, 3C, 3C, 3C, 3C, 3C, 3C, 3C, 3D, 3D, 3D, 3D, 3D, 3D, 3D, 3D, 3D, 3D, 3D, 3E, 3E, 3E, 3E, 3E, 3E, 3E, 3E, 3E, 3E, 3E, 3E, 3F, 3F, 3F, 3F, 3F, 3F, 3F, 3F, 3F, 3F, 3F, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 47, 47, 47, 47, 47, 47, 47, 47, 47, 47, 47, 47, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 4A, 4A, 4A, 4A, 4A, 4A, 4A, 4A, 4A, 4A, 4A, 4B, 4B, 4B, 4B, 4B, 4B, 4B, 4B, 4B, 4B, 4B, 4B, 4C, 4C, 4C, 4C, 4C, 4C, 4C, 4C, 4C, 4C, 4C, 4D, 4D, 4D, 4D, 4D, 4D, 4D, 4D, 4D, 4D, 4D, 4E, 4E, 4E, 4E, 4E, 4E, 4E, 4E, 4E, 4E, 4E, 4E, 4F, 4F, 4F, 4F, 4F, 4F, 4F, 4F, 4F, 4F, 4F, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 55, 55, 55, 55, 55, 55, 55, 55, 55, 55, 55, 56, 56, 56, 56, 56, 56, 56, 56, 56, 56, 56, 56, 57, 57, 57, 57, 57, 57, 57, 57, 57, 57, 57, 57, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 5A, 5A, 5A, 5A, 5A, 5A, 5A, 5A, 5A, 5A, 5A, 5A, 5B, 5B, 5B, 5B, 5B, 5B, 5B, 5B, 5B, 5B, 5B, 5B, 5C, 5C, 5C, 5C, 5C, 5C, 5C, 5C, 5C, 5C, 5C, 5C, 5D, 5D, 5D, 5D, 5D, 5D, 5D, 5D, 5D, 5D, 5D, 5D, 5D, 5E, 5E, 5E, 5E, 5E, 5E, 5E, 5E, 5E, 5E, 5E, 5E, 5F, 5F, 5F, 5F, 5F, 5F, 5F, 5F, 5F, 5F, 5F, 5F, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 6A, 6A, 6A, 6A, 6A, 6A, 6A, 6A, 6A, 6A, 6A, 6A, 6A, 6A, 6A, 6B, 6B, 6B, 6B, 6B, 6B, 6B, 6B, 6B, 6B, 6B, 6B, 6B, 6B, 6C, 6C, 6C, 6C, 6C, 6C, 6C, 6C, 6C, 6C, 6C, 6C, 6C, 6C, 6C, 6D, 6D, 6D, 6D, 6D, 6D, 6D, 6D, 6D, 6D, 6D, 6D, 6D, 6D, 6D, 6D, 6E, 6E, 6E, 6E, 6E, 6E, 6E, 6E, 6E, 6E, 6E, 6E, 6E, 6E, 6E, 6F, 6F, 6F, 6F, 6F, 6F, 6F, 6F, 6F, 6F, 6F, 6F, 6F, 6F, 6F, 6F, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F;',
    '
]',
    'CSET depth = 2048',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_pin = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_Only',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 8',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_After_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_d13072650a2ab55b',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '752b78251046c6e1b4a195d64bf9d795',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => core_addr,
        clk => clk,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_d13072650a2ab55b',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7F, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7E, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7D, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7C, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7B, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 7A, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 76, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 6F, 6F, 6F, 6F, 6F, 6F, 6F, 6F, 6F, 6F, 6F, 6F, 6F, 6F, 6F, 6F, 6E, 6E, 6E, 6E, 6E, 6E, 6E, 6E, 6E, 6E, 6E, 6E, 6E, 6E, 6E, 6D, 6D, 6D, 6D, 6D, 6D, 6D, 6D, 6D, 6D, 6D, 6D, 6D, 6D, 6D, 6D, 6C, 6C, 6C, 6C, 6C, 6C, 6C, 6C, 6C, 6C, 6C, 6C, 6C, 6C, 6C, 6B, 6B, 6B, 6B, 6B, 6B, 6B, 6B, 6B, 6B, 6B, 6B, 6B, 6B, 6A, 6A, 6A, 6A, 6A, 6A, 6A, 6A, 6A, 6A, 6A, 6A, 6A, 6A, 6A, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 68, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 67, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 5F, 5F, 5F, 5F, 5F, 5F, 5F, 5F, 5F, 5F, 5F, 5F, 5F, 5E, 5E, 5E, 5E, 5E, 5E, 5E, 5E, 5E, 5E, 5E, 5E, 5D, 5D, 5D, 5D, 5D, 5D, 5D, 5D, 5D, 5D, 5D, 5D, 5D, 5C, 5C, 5C, 5C, 5C, 5C, 5C, 5C, 5C, 5C, 5C, 5C, 5B, 5B, 5B, 5B, 5B, 5B, 5B, 5B, 5B, 5B, 5B, 5B, 5A, 5A, 5A, 5A, 5A, 5A, 5A, 5A, 5A, 5A, 5A, 5A, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 57, 57, 57, 57, 57, 57, 57, 57, 57, 57, 57, 57, 56, 56, 56, 56, 56, 56, 56, 56, 56, 56, 56, 55, 55, 55, 55, 55, 55, 55, 55, 55, 55, 55, 55, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 4F, 4F, 4F, 4F, 4F, 4F, 4F, 4F, 4F, 4F, 4F, 4E, 4E, 4E, 4E, 4E, 4E, 4E, 4E, 4E, 4E, 4E, 4E, 4D, 4D, 4D, 4D, 4D, 4D, 4D, 4D, 4D, 4D, 4D, 4C, 4C, 4C, 4C, 4C, 4C, 4C, 4C, 4C, 4C, 4C, 4B, 4B, 4B, 4B, 4B, 4B, 4B, 4B, 4B, 4B, 4B, 4A, 4A, 4A, 4A, 4A, 4A, 4A, 4A, 4A, 4A, 4A, 4A, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 47, 47, 47, 47, 47, 47, 47, 47, 47, 47, 47, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 43, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 3F, 3F, 3F, 3F, 3F, 3F, 3F, 3F, 3F, 3F, 3F, 3E, 3E, 3E, 3E, 3E, 3E, 3E, 3E, 3E, 3E, 3E, 3D, 3D, 3D, 3D, 3D, 3D, 3D, 3D, 3D, 3D, 3D, 3D, 3C, 3C, 3C, 3C, 3C, 3C, 3C, 3C, 3C, 3C, 3C, 3B, 3B, 3B, 3B, 3B, 3B, 3B, 3B, 3B, 3B, 3B, 3A, 3A, 3A, 3A, 3A, 3A, 3A, 3A, 3A, 3A, 3A, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 38, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 2F, 2F, 2F, 2F, 2F, 2F, 2F, 2F, 2F, 2F, 2F, 2F, 2E, 2E, 2E, 2E, 2E, 2E, 2E, 2E, 2E, 2E, 2E, 2E, 2D, 2D, 2D, 2D, 2D, 2D, 2D, 2D, 2D, 2D, 2D, 2D, 2C, 2C, 2C, 2C, 2C, 2C, 2C, 2C, 2C, 2C, 2C, 2C, 2B, 2B, 2B, 2B, 2B, 2B, 2B, 2B, 2B, 2B, 2B, 2B, 2A, 2A, 2A, 2A, 2A, 2A, 2A, 2A, 2A, 2A, 2A, 2A, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 1F, 1F, 1F, 1F, 1F, 1F, 1F, 1F, 1F, 1F, 1F, 1F, 1F, 1E, 1E, 1E, 1E, 1E, 1E, 1E, 1E, 1E, 1E, 1E, 1E, 1E, 1D, 1D, 1D, 1D, 1D, 1D, 1D, 1D, 1D, 1D, 1D, 1D, 1D, 1D, 1C, 1C, 1C, 1C, 1C, 1C, 1C, 1C, 1C, 1C, 1C, 1C, 1C, 1B, 1B, 1B, 1B, 1B, 1B, 1B, 1B, 1B, 1B, 1B, 1B, 1B, 1B, 1A, 1A, 1A, 1A, 1A, 1A, 1A, 1A, 1A, 1A, 1A, 1A, 1A, 1A, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, E, E, E, E, E, E, E, E, E, E, E, E, E, E, E, E, E, D, D, D, D, D, D, D, D, D, D, D, D, D, D, D, D, D, D, C, C, C, C, C, C, C, C, C, C, C, C, C, C, C, C, C, C, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, A, A, A, A, A, A, A, A, A, A, A, A, A, A, A, A, A, A, A, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET depth = 2048',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_pin = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_Only',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 8',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_After_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_ee12ce34adfa5ec2',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b71c759a3e485014625b004ed2f91b47',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => core_addr,
        clk => clk,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_ee12ce34adfa5ec2',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Single_Port_Block_Memory Virtex2P Xilinx,_Inc. 6.1',
    '# 10.1.03i',
    'CSET active_clock_edge = Rising_Edge_Triggered',
    'CSET additional_output_pipe_stages = 1',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F8, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, F9, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET depth = 2048',
    'CSET enable_pin = TRUE',
    'CSET enable_pin_polarity = Active_High',
    'CSET global_init_value = 0',
    'CSET handshaking_pins = FALSE',
    'CSET has_limit_data_pitch = FALSE',
    'CSET init_pin = FALSE',
    'CSET init_value = 0',
    'CSET initialization_pin_polarity = Active_High',
    'CSET limit_data_pitch = 18',
    'CSET load_init_file = TRUE',
    'CSET port_configuration = Read_Only',
    'CSET primitive_selection = Optimize_For_Area',
    'CSET register_inputs = FALSE',
    'CSET width = 8',
    'CSET write_enable_polarity = Active_High',
    'CSET write_mode = Read_After_Write',
    'CSET component_name = single_port_block_memory_virtex2p_6_1_fc890bd72b8e4bff',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '771adcf798472dcef7441478b68ca53d',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addr: in std_logic_vector(c_address_width - 1 downto 0);
      clk: in std_logic;
      en: in std_logic;
      dout: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addr => core_addr,
        clk => clk,
        en => core_ce,
        dout => core_data_out',
      'core_name0' => 'single_port_block_memory_virtex2p_6_1_fc890bd72b8e4bff',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '57f1496f368ca03c45ad4e2bae591da4',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: signed((8 - 1) downto 0);
  signal output_port_5_5_force: unsigned((8 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port_5_5_force <= signed_to_unsigned(input_port_1_40);
  output_port <= unsigned_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((8 - 1) downto 0);
    output_port : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_d51df7ac30',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f6ff3d3c0884b1ea76b53c5d1035ec3e',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: unsigned((16 - 1) downto 0);
  signal in1_1_27: unsigned((16 - 1) downto 0);
  signal y_2_1_concat: unsigned((32 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((16 - 1) downto 0);
    in1 : in std_logic_vector((16 - 1) downto 0);
    y : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_a369e00c6b',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f013ab77c4e010db58e314e4e22146f3',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: signed((16 - 1) downto 0);
  signal output_port_5_5_force: unsigned((16 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port_5_5_force <= signed_to_unsigned(input_port_1_40);
  output_port <= unsigned_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((16 - 1) downto 0);
    output_port : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_7025463ea8',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '9a20ba3c55299d4f5696f7a971675316',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "000000000001";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((12 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_7c91b1b314',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '0c4edbeb504e6c7bd6c55a443b6cbf50',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "000000000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((12 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_fd28b32bf8',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '713d56752ee6c93620a688f34d949cad',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "100000000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((12 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_e054d850c5',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = TRUE',
    'CSET load = TRUE',
    'CSET load_sense = active_high',
    'CSET operation = down',
    'CSET output_width = 12',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_805fe5e395e47402',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '3fc5a22b19ab4c2b0dba2c3bd829905f',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      load: in std_logic;
      l: in std_logic_vector(op_width - 1 downto 0);
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        load => load(0),
        l => din,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_805fe5e395e47402',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '07beef4b6f82356c571a058e3f280ba9',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((12 - 1) downto 0);
  signal b_1_34: unsigned((12 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_12_3_rel <= a_1_31 = b_1_34;
  op <= boolean_to_vector(result_12_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((12 - 1) downto 0);
    b : in std_logic_vector((12 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_d36fe12c1c',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '97d4368f6023048dfa9fc25443ca4262',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((12 - 1) downto 0);
  signal b_1_34: unsigned((12 - 1) downto 0);
  signal result_14_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_14_3_rel <= a_1_31 /= b_1_34;
  op <= boolean_to_vector(result_14_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((12 - 1) downto 0);
    b : in std_logic_vector((12 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_acb3c05dd0',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Multiplier Virtex2P Xilinx,_Inc. 10.1',
    '# 10.1.03i',
    'CSET ccmimp = Distributed_Memory',
    'CSET clockenable = true',
    'CSET constvalue = 129',
    'CSET internaluser = 0',
    'CSET multiplier_construction = Use_Mults',
    'CSET multtype = Parallel_Multiplier',
    'CSET optgoal = Speed',
    'CSET outputwidthhigh = 15',
    'CSET outputwidthlow = 0',
    'CSET pipestages = 2',
    'CSET portatype = Signed',
    'CSET portawidth = 8',
    'CSET portbtype = Signed',
    'CSET portbwidth = 8',
    'CSET roundpoint = 0',
    'CSET sclrcepriority = CE_Overrides_SCLR',
    'CSET syncclear = true',
    'CSET use_custom_output_width = false',
    'CSET userounding = false',
    'CSET zerodetect = false',
    'CSET component_name = multiplier_virtex2p_10_1_26e459ad9aa810bd',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ca0457383b57f7877c4179cb914193a8',
    'sourceFile' => 'hdl/xlmult_v9_0.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      b: in std_logic_vector(c_b_width - 1 downto 0);
      p: out std_logic_vector(c_output_width - 1 downto 0);
      clk: in std_logic;
      ce: in std_logic;
      sclr: in std_logic;
      a: in std_logic_vector(c_a_width - 1 downto 0)',
      'core_instance_text' => '        a => tmp_a,
        clk => clk,
        ce => internal_ce,
        sclr => internal_clr,
        p => tmp_p,
        b => tmp_b',
      'core_name0' => 'multiplier_virtex2p_10_1_26e459ad9aa810bd',
      'entity_name.0' => 'xlmult_v9_0',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f529e9a7cbf68d0060549493a613fae2',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Adder_Subtracter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET bypass = false',
    'CSET bypass_sense = active_high',
    'CSET carry_borrow_input = false',
    'CSET carry_borrow_output = false',
    'CSET ce_override_for_bypass = true',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = true',
    'CSET create_rpm = true',
    'CSET latency = 1',
    'CSET operation = add',
    'CSET output_options = registered',
    'CSET output_width = 17',
    'CSET overflow_output = false',
    'CSET port_a_sign = signed',
    'CSET port_a_width = 17',
    'CSET port_b_constant = false',
    'CSET port_b_constant_value = 0',
    'CSET port_b_sign = signed',
    'CSET port_b_width = 17',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET component_name = adder_subtracter_virtex2p_7_0_9301e8703140ec16',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '4106f49b07e4af8b3bab8f987fc8b90a',
    'sourceFile' => 'hdl/xladdsub.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      a: in std_logic_vector( 17 - 1 downto 0);
      clk: in std_logic:= \'0\';
      ce: in std_logic:= \'0\';
      q: out std_logic_vector(c_output_width - 1 downto 0);
      b: in std_logic_vector(17 - 1 downto 0)',
      'core_instance_text' => '        a => full_a,
        clk => clk,
        ce => internal_ce,
        q => core_s,
        b => full_b',
      'core_name0' => 'adder_subtracter_virtex2p_7_0_9301e8703140ec16',
      'entity_name.0' => 'xladdsub',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Adder_Subtracter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET bypass = false',
    'CSET bypass_sense = active_high',
    'CSET carry_borrow_input = false',
    'CSET carry_borrow_output = false',
    'CSET ce_override_for_bypass = true',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = true',
    'CSET create_rpm = true',
    'CSET latency = 1',
    'CSET operation = add',
    'CSET output_options = registered',
    'CSET output_width = 18',
    'CSET overflow_output = false',
    'CSET port_a_sign = signed',
    'CSET port_a_width = 18',
    'CSET port_b_constant = false',
    'CSET port_b_constant_value = 0',
    'CSET port_b_sign = signed',
    'CSET port_b_width = 18',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET component_name = adder_subtracter_virtex2p_7_0_c5dcd9e7347382cf',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '571d9bafe539af3efddc19c6d5f01680',
    'sourceFile' => 'hdl/xladdsub.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      a: in std_logic_vector( 18 - 1 downto 0);
      clk: in std_logic:= \'0\';
      ce: in std_logic:= \'0\';
      q: out std_logic_vector(c_output_width - 1 downto 0);
      b: in std_logic_vector(18 - 1 downto 0)',
      'core_instance_text' => '        a => full_a,
        clk => clk,
        ce => internal_ce,
        q => core_s,
        b => full_b',
      'core_name0' => 'adder_subtracter_virtex2p_7_0_c5dcd9e7347382cf',
      'entity_name.0' => 'xladdsub',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b7c7ecd4954e87633b88dfca486b21be',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: unsigned((16 - 1) downto 0);
  signal output_port_5_5_force: signed((16 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port_5_5_force <= unsigned_to_signed(input_port_1_40);
  output_port <= signed_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((16 - 1) downto 0);
    output_port : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_151459306d',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'def067416f31600c3d9ce34a35ee36e3',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'cedceb5ac544026591648f6d3e87b21c',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '6c80a36164896588930901f2716da60a',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '1af76f1321159e446ea6bc3177ce798b',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ffca32a620acbd9fe4c2ab4b81db444d',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '1a03a9de2bb6606208384945d678c830',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '6459a273f3a83a61ebe1e0c5df32d7e9',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b6804986552be90211f6492596733198',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'da8a11cfe091a36f76662322129d799a',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert_pipeline.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '9c1b9dc1421515f22cb78a3093d8ea0f',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '5fdecb3a0d591b57c29761c6c6223d93',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal ip_17_23: signed((18 - 1) downto 0);
begin
  ip_17_23 <= std_logic_vector_to_signed(ip);
  op <= signed_to_std_logic_vector(ip_17_23);
end',
      'crippled_entity' => 'is
  port (
    ip : in std_logic_vector((18 - 1) downto 0);
    op : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'scale_1768584a8d',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '75190a6ddf0d8a848c94a550f5fd4760',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: unsigned((32 - 1) downto 0);
  signal in1_1_27: unsigned((96 - 1) downto 0);
  signal y_2_1_concat: unsigned((128 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((32 - 1) downto 0);
    in1 : in std_logic_vector((96 - 1) downto 0);
    y : out std_logic_vector((128 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_65b7cc6f0e',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'fa98385dfcebc997de7afd559fc91a75',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'dae1246b5f0b4eb2de8c76b10e8ec8fd',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '3d520c48142eb1a8d8d12fde02acc9fe',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: unsigned((32 - 1) downto 0);
  signal in1_1_27: unsigned((64 - 1) downto 0);
  signal y_2_1_concat: unsigned((96 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((32 - 1) downto 0);
    in1 : in std_logic_vector((64 - 1) downto 0);
    y : out std_logic_vector((96 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_0e2072f8e1',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'bd416a6df2fde79f69891937b40f2a72',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "1000000000000000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((19 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_b713aad2a7',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'e58ef8f167370b083de134f9b5db3fad',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: unsigned((8 - 1) downto 0);
  signal in1_1_27: unsigned((8 - 1) downto 0);
  signal y_2_1_concat: unsigned((16 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((8 - 1) downto 0);
    in1 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_8e53793314',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = TRUE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 8',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_1fa1686255cc3bb6',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '97ee1ed0c5414a9f7b316bfd569b9f5e',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_1fa1686255cc3bb6',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd75c37d6c1e048825d10856c01338094',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((32 - 1) downto 0);
  signal d1_1_27: std_logic_vector((32 - 1) downto 0);
  type array_type_pipe_16_22 is array (0 to (1 - 1)) of std_logic_vector((32 - 1) downto 0);
  signal pipe_16_22: array_type_pipe_16_22 := (
    0 => "00000000000000000000000000000000");
  signal pipe_16_22_front_din: std_logic_vector((32 - 1) downto 0);
  signal pipe_16_22_back: std_logic_vector((32 - 1) downto 0);
  signal pipe_16_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((32 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  pipe_16_22_back <= pipe_16_22(0);
  proc_pipe_16_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (pipe_16_22_push_front_pop_back_en = \'1\')) then
        pipe_16_22(0) <= pipe_16_22_front_din;
      end if;
    end if;
  end process proc_pipe_16_22;
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  pipe_16_22_front_din <= unregy_join_6_1;
  pipe_16_22_push_front_pop_back_en <= \'1\';
  y <= pipe_16_22_back;
end',
      'crippled_entity' => 'is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((32 - 1) downto 0);
    d1 : in std_logic_vector((32 - 1) downto 0);
    y : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_52ae77d946',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b85de418a5194e999a0fc05a34ce4b19',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "0000000000000000000000000001";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((28 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_c1bd3afa8c',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '848642ea8f5e7d9fdf101b41cd86ff2e',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "0000000000000000000000000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((28 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_98b461a391',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = TRUE',
    'CSET load = TRUE',
    'CSET load_sense = active_high',
    'CSET operation = down',
    'CSET output_width = 28',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_341763362dbc45a2',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '79f0fa85b6a42a6d7b95167dd10ac587',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      load: in std_logic;
      l: in std_logic_vector(op_width - 1 downto 0);
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        load => load(0),
        l => din,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_341763362dbc45a2',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'e0ab518cf84980b84a9cb9ab5e4f252a',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((28 - 1) downto 0);
  signal b_1_34: unsigned((28 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_12_3_rel <= a_1_31 = b_1_34;
  op <= boolean_to_vector(result_12_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((28 - 1) downto 0);
    b : in std_logic_vector((28 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_1ea7543d62',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '5607a4bb802230971b314ec1ac80ea60',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal ip_1_26: boolean;
  type array_type_op_mem_22_20 is array (0 to (2 - 1)) of boolean;
  signal op_mem_22_20: array_type_op_mem_22_20 := (
    false,
    false);
  signal op_mem_22_20_front_din: boolean;
  signal op_mem_22_20_back: boolean;
  signal op_mem_22_20_push_front_pop_back_en: std_logic;
  signal internal_ip_12_1_bitnot: boolean;
begin
  ip_1_26 <= ((ip) = "1");
  op_mem_22_20_back <= op_mem_22_20(1);
  proc_op_mem_22_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_22_20_push_front_pop_back_en = \'1\')) then
        for i in 1 downto 1 loop 
          op_mem_22_20(i) <= op_mem_22_20(i-1);
        end loop;
        op_mem_22_20(0) <= op_mem_22_20_front_din;
      end if;
    end if;
  end process proc_op_mem_22_20;
  internal_ip_12_1_bitnot <= ((not boolean_to_vector(ip_1_26)) = "1");
  op_mem_22_20_front_din <= internal_ip_12_1_bitnot;
  op_mem_22_20_push_front_pop_back_en <= \'1\';
  op <= boolean_to_vector(op_mem_22_20_back);
end',
      'crippled_entity' => 'is
  port (
    ip : in std_logic_vector((1 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'inverter_251f82b86b',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f724d3630736302b7bdfef86c04a573a',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '09d4e834f9731ad786e7a5c879f6d56c',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlregister.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a10b50838e50703d19718624fe43e20d',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = TRUE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 16',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_da21d47bce83ad78',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '7c51bdda82629a3e45b166de90146140',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_da21d47bce83ad78',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd18f0eba42f2b961e1e293bc8967a48d',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d_1_22: std_logic_vector((64 - 1) downto 0);
  type array_type_op_mem_20_24 is array (0 to (1 - 1)) of std_logic_vector((64 - 1) downto 0);
  signal op_mem_20_24: array_type_op_mem_20_24 := (
    0 => "0000000000000000000000000000000000000000000000000000000000000000");
  signal op_mem_20_24_front_din: std_logic_vector((64 - 1) downto 0);
  signal op_mem_20_24_back: std_logic_vector((64 - 1) downto 0);
  signal op_mem_20_24_push_front_pop_back_en: std_logic;
begin
  d_1_22 <= d;
  op_mem_20_24_back <= op_mem_20_24(0);
  proc_op_mem_20_24: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_20_24_push_front_pop_back_en = \'1\')) then
        op_mem_20_24(0) <= op_mem_20_24_front_din;
      end if;
    end if;
  end process proc_op_mem_20_24;
  op_mem_20_24_front_din <= d_1_22;
  op_mem_20_24_push_front_pop_back_en <= \'1\';
  q <= op_mem_20_24_back;
end',
      'crippled_entity' => 'is
  port (
    d : in std_logic_vector((64 - 1) downto 0);
    q : out std_logic_vector((64 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'delay_e2d047c154',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd490a29af779b54a1a7058cbbd4e30a9',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal d2_1_30: std_logic;
  signal d3_1_33: std_logic;
  signal d4_1_36: std_logic;
  signal d5_1_39: std_logic;
  signal d6_1_42: std_logic;
  signal d7_1_45: std_logic;
  type array_type_latency_pipe_5_26 is array (0 to (1 - 1)) of std_logic;
  signal latency_pipe_5_26: array_type_latency_pipe_5_26 := (
    0 => \'0\');
  signal latency_pipe_5_26_front_din: std_logic;
  signal latency_pipe_5_26_back: std_logic;
  signal latency_pipe_5_26_push_front_pop_back_en: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  d2_1_30 <= d2(0);
  d3_1_33 <= d3(0);
  d4_1_36 <= d4(0);
  d5_1_39 <= d5(0);
  d6_1_42 <= d6(0);
  d7_1_45 <= d7(0);
  latency_pipe_5_26_back <= latency_pipe_5_26(0);
  proc_latency_pipe_5_26: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (latency_pipe_5_26_push_front_pop_back_en = \'1\')) then
        latency_pipe_5_26(0) <= latency_pipe_5_26_front_din;
      end if;
    end if;
  end process proc_latency_pipe_5_26;
  fully_2_1_bit <= d0_1_24 or d1_1_27 or d2_1_30 or d3_1_33 or d4_1_36 or d5_1_39 or d6_1_42 or d7_1_45;
  latency_pipe_5_26_front_din <= fully_2_1_bit;
  latency_pipe_5_26_push_front_pop_back_en <= \'1\';
  y <= std_logic_to_vector(latency_pipe_5_26_back);
end',
      'crippled_entity' => 'is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    d2 : in std_logic_vector((1 - 1) downto 0);
    d3 : in std_logic_vector((1 - 1) downto 0);
    d4 : in std_logic_vector((1 - 1) downto 0);
    d5 : in std_logic_vector((1 - 1) downto 0);
    d6 : in std_logic_vector((1 - 1) downto 0);
    d7 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'logical_19a8cd80c8',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'de4543ef2796aec3076335969ebf2eb6',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal d2_1_30: std_logic;
  signal d3_1_33: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  d2_1_30 <= d2(0);
  d3_1_33 <= d3(0);
  fully_2_1_bit <= d0_1_24 or d1_1_27 or d2_1_30 or d3_1_33;
  y <= std_logic_to_vector(fully_2_1_bit);
end',
      'crippled_entity' => 'is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    d2 : in std_logic_vector((1 - 1) downto 0);
    d3 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'logical_a6d07705dd',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '1ab0d3371ee15fcef42635cb10b2835a',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal d2_1_30: std_logic;
  signal d3_1_33: std_logic;
  type array_type_latency_pipe_5_26 is array (0 to (1 - 1)) of std_logic;
  signal latency_pipe_5_26: array_type_latency_pipe_5_26 := (
    0 => \'0\');
  signal latency_pipe_5_26_front_din: std_logic;
  signal latency_pipe_5_26_back: std_logic;
  signal latency_pipe_5_26_push_front_pop_back_en: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  d2_1_30 <= d2(0);
  d3_1_33 <= d3(0);
  latency_pipe_5_26_back <= latency_pipe_5_26(0);
  proc_latency_pipe_5_26: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (latency_pipe_5_26_push_front_pop_back_en = \'1\')) then
        latency_pipe_5_26(0) <= latency_pipe_5_26_front_din;
      end if;
    end if;
  end process proc_latency_pipe_5_26;
  fully_2_1_bit <= d0_1_24 or d1_1_27 or d2_1_30 or d3_1_33;
  latency_pipe_5_26_front_din <= fully_2_1_bit;
  latency_pipe_5_26_push_front_pop_back_en <= \'1\';
  y <= std_logic_to_vector(latency_pipe_5_26_back);
end',
      'crippled_entity' => 'is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    d2 : in std_logic_vector((1 - 1) downto 0);
    d3 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'logical_1cef476837',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'cec7944f20503e5bbd8f6232ce2db6da',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal d2_1_30: std_logic;
  type array_type_latency_pipe_5_26 is array (0 to (1 - 1)) of std_logic;
  signal latency_pipe_5_26: array_type_latency_pipe_5_26 := (
    0 => \'0\');
  signal latency_pipe_5_26_front_din: std_logic;
  signal latency_pipe_5_26_back: std_logic;
  signal latency_pipe_5_26_push_front_pop_back_en: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  d2_1_30 <= d2(0);
  latency_pipe_5_26_back <= latency_pipe_5_26(0);
  proc_latency_pipe_5_26: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (latency_pipe_5_26_push_front_pop_back_en = \'1\')) then
        latency_pipe_5_26(0) <= latency_pipe_5_26_front_din;
      end if;
    end if;
  end process proc_latency_pipe_5_26;
  fully_2_1_bit <= d0_1_24 or d1_1_27 or d2_1_30;
  latency_pipe_5_26_front_din <= fully_2_1_bit;
  latency_pipe_5_26_push_front_pop_back_en <= \'1\';
  y <= std_logic_to_vector(latency_pipe_5_26_back);
end',
      'crippled_entity' => 'is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    d2 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'logical_5773759131',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '9be1bd2671c0324869c450b5268c1efb',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: signed((32 - 1) downto 0);
  signal output_port_5_5_force: unsigned((32 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port_5_5_force <= signed_to_unsigned(input_port_1_40);
  output_port <= unsigned_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((32 - 1) downto 0);
    output_port : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_3f7e3674f6',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '29ef28a347f99aadad9b81baf8ec7166',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '3ecaf0355bd63e4a3eaf3560caf48ae6',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '61c7fd5dd8ff42974566fb3fd8acce9b',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '72ab795e51d5e0068d802cf4a4596ac4',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '2aa5d79a8a58285a8b458b7e052c9622',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '02b036271f7c167354b5945abf0b196e',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '3fc59d0eebe96fd1099cd5c4b0eb94e0',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex2P Xilinx,_Inc. 7.0',
    '# 10.1.03i',
    'CSET async_init_value = 0',
    'CSET asynchronous_settings = none',
    'CSET ce_override_for_load = false',
    'CSET ce_overrides = sync_controls_override_ce',
    'CSET clock_enable = TRUE',
    'CSET count_by_value = 1',
    'CSET count_style = count_by_constant',
    'CSET count_to_value = MAX',
    'CSET create_rpm = FALSE',
    'CSET load = FALSE',
    'CSET load_sense = active_high',
    'CSET operation = up',
    'CSET output_width = 27',
    'CSET restrict_count = FALSE',
    'CSET set_clear_priority = clear_overrides_set',
    'CSET sync_init_value = 0',
    'CSET synchronous_settings = init',
    'CSET threshold_0 = false',
    'CSET threshold_0_value = MAX',
    'CSET threshold_1 = false',
    'CSET threshold_1_value = MAX',
    'CSET threshold_early = true',
    'CSET threshold_options = registered',
    'CSET component_name = binary_counter_virtex2p_7_0_7a138cef7a7cb135',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'dea154f76b6a55aa7726105e418485d6',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT=> core_sinit,
        q => op_net',
      'core_name0' => 'binary_counter_virtex2p_7_0_7a138cef7a7cb135',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '5dd4daf66a970c605bbee0b8f70d6651',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  local *wrapup = $Sg::{'wrapup'};
  push(@$results, &Sg::wrapup())   if (defined(&wrapup));
  local *wrapup = $SgDeliverFile::{'wrapup'};
  push(@$results, &SgDeliverFile::wrapup())   if (defined(&wrapup));
  local *wrapup = $SgGenerateCores::{'wrapup'};
  push(@$results, &SgGenerateCores::wrapup())   if (defined(&wrapup));
  use Carp qw(croak);
  $ENV{'SYSGEN'} = 'C:/Xilinx/10.1/DSP_Tools/sysgen';
  open(RESULTS, '> D:/casper10_1/projects/packetized_correlator/ibob/i_128w_2k_10_r310iadc/sysgen/sysgen/script_results1844') || 
    croak 'couldn\'t open D:/casper10_1/projects/packetized_correlator/ibob/i_128w_2k_10_r310iadc/sysgen/sysgen/script_results1844';
  binmode(RESULTS);
  print RESULTS &Sg::toString($results) . "\n";
  close(RESULTS) || 
    croak 'trouble writing D:/casper10_1/projects/packetized_correlator/ibob/i_128w_2k_10_r310iadc/sysgen/sysgen/script_results1844';
};

if ($@) {
  open(RESULTS, '> D:/casper10_1/projects/packetized_correlator/ibob/i_128w_2k_10_r310iadc/sysgen/sysgen/script_results1844') || 
    croak 'couldn\'t open D:/casper10_1/projects/packetized_correlator/ibob/i_128w_2k_10_r310iadc/sysgen/sysgen/script_results1844';
  binmode(RESULTS);
  print RESULTS $@ . "\n";
  close(RESULTS) || 
    croak 'trouble writing D:/casper10_1/projects/packetized_correlator/ibob/i_128w_2k_10_r310iadc/sysgen/sysgen/script_results1844';
  exit(1);
}

exit(0);
