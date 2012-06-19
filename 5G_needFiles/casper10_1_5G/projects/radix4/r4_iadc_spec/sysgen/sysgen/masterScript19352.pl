
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
    'base_system_period_hardware' => 6.6667,
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
    'coregenPartFamily' => 'virtex5',
    'coregen_part_family' => 'Virtex5',
    'createTestbench' => 0,
    'dbl_ovrd' => -1.0,
    'dcm_input_clock_period' => 100.0,
    'deprecated_control' => 'off',
    'design' => 'r4_iadc_spec',
    'design_full_path' => 'D:\\casper10_1\\projects\\radix4\\r4_iadc_spec.mdl',
    'device' => 'xc5vsx95t-1ff1136',
    'directory' => 'D:/casper10_1/projects/radix4/r4_iadc_spec/sysgen',
    'disregard_netlist_subystem_handles' => [
      58937.00012207031,
      58789.00012207031,
      58641.00012207031,
      58493.00012207031,
      58329.00048828125,
    ],
    'fileDeliveryDefaults' => [
      [
        '(?i)\\.vhd$',
        { 'fileName' => 'D:/casper10_1/projects/radix4/r4_iadc_spec/sysgen/sysgen/perl_results.vhd', },
      ],
      [
        '(?i)\\.v$',
        { 'fileName' => 'D:/casper10_1/projects/radix4/r4_iadc_spec/sysgen/sysgen/perl_results.v', },
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
    'master_sysgen_token_handle' => 47178.00048828125,
    'matlab' => 'C:/Program Files/MATLAB/R2007b',
    'matlabJavaDirectory' => 'C:/Program Files/MATLAB/R2007b/sys/java/jre/win32/jre1.4.2/bin',
    'matlabPerlDirectory' => 'C:/Program Files/MATLAB/R2007b/sys/perl/win32/bin/',
    'mdlHandle' => 47177.00048828125,
    'mdlPath' => 'D:/casper10_1/projects/radix4/r4_iadc_spec.mdl',
    'modelDiagnostics' => [
      {
        'count' => 5911.0,
        'isMask' => 0.0,
        'type' => 'r4_iadc_spec Total blocks',
      },
      {
        'count' => 2.0,
        'isMask' => 0.0,
        'type' => 'Bias',
      },
      {
        'count' => 25.0,
        'isMask' => 0.0,
        'type' => 'Constant',
      },
      {
        'count' => 2.0,
        'isMask' => 0.0,
        'type' => 'DiscretePulseGenerator',
      },
      {
        'count' => 15.0,
        'isMask' => 0.0,
        'type' => 'From',
      },
      {
        'count' => 3.0,
        'isMask' => 0.0,
        'type' => 'Gain',
      },
      {
        'count' => 4.0,
        'isMask' => 0.0,
        'type' => 'Goto',
      },
      {
        'count' => 1324.0,
        'isMask' => 0.0,
        'type' => 'Inport',
      },
      {
        'count' => 4.0,
        'isMask' => 0.0,
        'type' => 'Logic',
      },
      {
        'count' => 1235.0,
        'isMask' => 0.0,
        'type' => 'Outport',
      },
      {
        'count' => 1.0,
        'isMask' => 0.0,
        'type' => 'RandomNumber',
      },
      {
        'count' => 16.0,
        'isMask' => 0.0,
        'type' => 'RelationalOperator',
      },
      {
        'count' => 2546.0,
        'isMask' => 0.0,
        'type' => 'S-Function',
      },
      {
        'count' => 688.0,
        'isMask' => 0.0,
        'type' => 'SubSystem',
      },
      {
        'count' => 46.0,
        'isMask' => 0.0,
        'type' => 'Terminator',
      },
      {
        'count' => 60.0,
        'isMask' => 1.0,
        'type' => 'BRAM Delay',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'Band-Limited White Noise.',
      },
      {
        'count' => 2.0,
        'isMask' => 1.0,
        'type' => 'Biplex Bit Reverse Reorder',
      },
      {
        'count' => 24.0,
        'isMask' => 1.0,
        'type' => 'Biplex Commutator',
      },
      {
        'count' => 2.0,
        'isMask' => 1.0,
        'type' => 'Bit Reversal',
      },
      {
        'count' => 24.0,
        'isMask' => 1.0,
        'type' => 'Coefficient Generator',
      },
      {
        'count' => 16.0,
        'isMask' => 1.0,
        'type' => 'Compare To Constant',
      },
      {
        'count' => 16.0,
        'isMask' => 1.0,
        'type' => 'Complex Delay',
      },
      {
        'count' => 12.0,
        'isMask' => 1.0,
        'type' => 'Complex Multiplier (4 real multipliers)',
      },
      {
        'count' => 140.0,
        'isMask' => 1.0,
        'type' => 'Complex to Real-Imag',
      },
      {
        'count' => 12.0,
        'isMask' => 1.0,
        'type' => 'Downsample',
      },
      {
        'count' => 4.0,
        'isMask' => 1.0,
        'type' => 'FIR Filter',
      },
      {
        'count' => 24.0,
        'isMask' => 1.0,
        'type' => 'FIR Filter Coefficient Generator',
      },
      {
        'count' => 24.0,
        'isMask' => 1.0,
        'type' => 'FIR Filter Core',
      },
      {
        'count' => 4.0,
        'isMask' => 1.0,
        'type' => 'FIR Filter Quantizer',
      },
      {
        'count' => 24.0,
        'isMask' => 1.0,
        'type' => 'FIR Filter Tap (Real Coefficients)',
      },
      {
        'count' => 12.0,
        'isMask' => 1.0,
        'type' => 'Integer Delay',
      },
      {
        'count' => 48.0,
        'isMask' => 1.0,
        'type' => 'Multiply Add Block',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'Quadplex Bit Reverse Reorder',
      },
      {
        'count' => 6.0,
        'isMask' => 1.0,
        'type' => 'Quadplex Commutator',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'Quadplex Radix-4 DIT FFT',
      },
      {
        'count' => 15.0,
        'isMask' => 1.0,
        'type' => 'Radix-2 Butterfly',
      },
      {
        'count' => 5.0,
        'isMask' => 1.0,
        'type' => 'Radix-2 Butterfly with fixed -j twiddle (DIT, twiddle before butterfly)',
      },
      {
        'count' => 5.0,
        'isMask' => 1.0,
        'type' => 'Radix-4 Butterfly',
      },
      {
        'count' => 5.0,
        'isMask' => 1.0,
        'type' => 'Radix-4 DIT FFT Stage',
      },
      {
        'count' => 4.0,
        'isMask' => 1.0,
        'type' => 'Radix-4 General Twiddle Stage',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'Radix-4 Stage-1 Twiddle Stage',
      },
      {
        'count' => 12.0,
        'isMask' => 1.0,
        'type' => 'Radix-R Twiddle Coefficient Generator (complex storage)',
      },
      {
        'count' => 100.0,
        'isMask' => 1.0,
        'type' => 'Real-Imag to Complex',
      },
      {
        'count' => 28.0,
        'isMask' => 1.0,
        'type' => 'SLR16 Delay',
      },
      {
        'count' => 196.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Adder/Subtractor Block',
      },
      {
        'count' => 9.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Arithmetic Relational Operator Block',
      },
      {
        'count' => 5.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Binary Shift Operator Block',
      },
      {
        'count' => 399.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Bit Slice Extractor Block',
      },
      {
        'count' => 111.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Bus Concatenator Block',
      },
      {
        'count' => 64.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Bus Multiplexer Block',
      },
      {
        'count' => 114.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Constant Block Block',
      },
      {
        'count' => 143.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Counter Block',
      },
      {
        'count' => 353.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Delay Block',
      },
      {
        'count' => 5.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Disregard Subsystem For Generation Block',
      },
      {
        'count' => 44.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Gateway In Block',
      },
      {
        'count' => 29.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Gateway Out Block',
      },
      {
        'count' => 80.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Input Scaler Block',
      },
      {
        'count' => 37.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Inverter Block',
      },
      {
        'count' => 30.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Logical Block Block',
      },
      {
        'count' => 92.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Multiplier Block',
      },
      {
        'count' => 11.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Register Block',
      },
      {
        'count' => 77.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Single Port Random Access Memory Block',
      },
      {
        'count' => 36.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Single Port Read-Only Memory Block',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'Xilinx System Generator Block',
      },
      {
        'count' => 184.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Type Converter Block',
      },
      {
        'count' => 503.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Type Reinterpreter Block',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'adc',
      },
      {
        'count' => 4.0,
        'isMask' => 1.0,
        'type' => 'delay_bram',
      },
      {
        'count' => 5.0,
        'isMask' => 1.0,
        'type' => 'freeze_cntr',
      },
      {
        'count' => 2.0,
        'isMask' => 1.0,
        'type' => 'gpio',
      },
      {
        'count' => 6.0,
        'isMask' => 1.0,
        'type' => 'posedge',
      },
      {
        'count' => 4.0,
        'isMask' => 1.0,
        'type' => 'power',
      },
      {
        'count' => 6.0,
        'isMask' => 1.0,
        'type' => 'pulse_ext',
      },
      {
        'count' => 2.0,
        'isMask' => 1.0,
        'type' => 'simple_vacc',
      },
      {
        'count' => 5.0,
        'isMask' => 1.0,
        'type' => 'snap',
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
    'num_sim_cycles' => 2.0,
    'package' => 'ff1136',
    'part' => 'xc5vsx95t',
    'partFamily' => 'virtex5',
    'port_data_types_enabled' => 1.0,
    'preserveHierarchy' => 0.0,
    'preserve_hierarchy' => 0.0,
    'provideGlobalCEClr' => 0.0,
    'report_true_rates' => 0.0,
    'sample_time_colors_enabled' => 0.0,
    'simulation_island_subsystem_handle' => 47177.00048828125,
    'simulation_status' => 0.0,
    'simulink_accelerator_running' => 0.0,
    'simulink_debugger_running' => 0.0,
    'simulink_period' => '1',
    'speed' => '-1',
    'startTime' => '0.0',
    'start_time' => 0.0,
    'stopTime' => '2',
    'synthesisTool' => 'XST',
    'synthesis_language' => 'vhdl',
    'synthesis_tool' => 'XST',
    'sysclk_period' => '6.6667',
    'sysgen' => 'C:/Xilinx/10.1/DSP_Tools/common/bin/../../sysgen',
    'sysgenTokenSettings' => {
      'settings' => {
        'base_system_period_hardware' => 6.6667,
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
        'coregen_part_family' => 'Virtex5',
        'dbl_ovrd' => -1.0,
        'dcm_input_clock_period' => 100.0,
        'deprecated_control' => 'off',
        'directory' => './r4_iadc_spec/sysgen',
        'incr_netlist' => 'off',
        'master_sysgen_token_handle' => 47178.00048828125,
        'ngc_config' => {
          'include_cf' => 0.0,
          'include_clockwrapper' => 1.0,
        },
        'package' => 'ff1136',
        'part' => 'xc5vsx95t',
        'preserve_hierarchy' => 0.0,
        'simulation_island_subsystem_handle' => 47177.00048828125,
        'simulink_period' => '1',
        'speed' => '-1',
        'synthesis_language' => 'vhdl',
        'synthesis_tool' => 'XST',
        'sysclk_period' => '6.6667',
        'testbench' => 0,
        'trim_vbits' => 1.0,
        'xilinx_device' => 'xc5vsx95t-1ff1136',
        'xilinxfamily' => 'Virtex5',
      },
    },
    'systemClockPeriod' => 6.6667,
    'tempdir' => 'C:/DOCUME~1/homin/LOCALS~1/Temp',
    'testbench' => 0,
    'tmpDir' => 'D:/casper10_1/projects/radix4/r4_iadc_spec/sysgen/sysgen',
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
    'vsimtime' => '290.333400 ns',
    'xilinx' => 'C:/Xilinx/10.1/ISE',
    'xilinx_device' => 'xc5vsx95t-1ff1136',
    'xilinxfamily' => 'Virtex5',
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
    'entity_declaration_hash' => 'cf413371dcdfe9d4efb5494a1cecd933',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ccaa3687a143ec021a4c453683b7fd39',
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
    'entity_declaration_hash' => '40e5176899071eb7abd5648ced632f53',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlregister.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '9bee4b026b07cf0cbd1f5109caabe7a0',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((32 - 1) downto 0);
  signal b_1_34: unsigned((32 - 1) downto 0);
  signal result_22_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_22_3_rel <= a_1_31 >= b_1_34;
  op <= boolean_to_vector(result_22_3_rel);
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
      'entity_name' => 'relational_8782e16b67',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '377a9e3ca17e52f05077d5468dcfe8be',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((43 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
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
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 43, 11);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= \'0\';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end',
      'crippled_entity' => 'is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'shift_657b5342cc',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '1df7f4f8d70aef0ab7a9f6671ead43d0',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal rst_1_40: boolean;
  signal count_reg_20_23: unsigned((32 - 1) downto 0) := "00000000000000000000000000000001";
  signal count_reg_20_23_rst: std_logic;
  signal bool_44_4: boolean;
  signal rst_limit_join_44_1: boolean;
  signal count_reg_join_44_1: unsigned((33 - 1) downto 0);
  signal count_reg_join_44_1_rst: std_logic;
begin
  rst_1_40 <= ((rst) = "1");
  proc_count_reg_20_23: process (clk)
  is
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (count_reg_20_23_rst = \'1\')) then
        count_reg_20_23 <= "00000000000000000000000000000001";
      elsif (ce = \'1\') then 
        count_reg_20_23 <= count_reg_20_23 + std_logic_vector_to_unsigned("00000000000000000000000000000001");
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
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'counter_044fafc0c4',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
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
    'entity_declaration_hash' => '4fa462e2fb5d0ed62456f01ce15822e9',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: unsigned((17 - 1) downto 0);
  signal output_port_5_5_force: signed((17 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port_5_5_force <= unsigned_to_signed(input_port_1_40);
  output_port <= signed_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((17 - 1) downto 0);
    output_port : out std_logic_vector((17 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_ea71bb555c',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '3ad4e3866015ec45b754bb83bf30ae0c',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'fddcd8aeef76480fee3654e08fd9f17d',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '8c1b572ebdbb9bd34eb85ca158cae5b6',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: unsigned((9 - 1) downto 0);
  signal in1_1_27: unsigned((9 - 1) downto 0);
  signal y_2_1_concat: unsigned((18 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((9 - 1) downto 0);
    in1 : in std_logic_vector((9 - 1) downto 0);
    y : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_f2f6490a28',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'befc8658e57f736b538f4cce9f003ac6',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: signed((9 - 1) downto 0);
  signal output_port_5_5_force: unsigned((9 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port_5_5_force <= signed_to_unsigned(input_port_1_40);
  output_port <= unsigned_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((9 - 1) downto 0);
    output_port : out std_logic_vector((9 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_de38ef9df5',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '3e9cbedb87d7e8e0ba617a070a22c7fa',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert_pipeline.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  use SgGenerateCores;
  $instrs = [
    'SELECT Binary_Counter Virtex5 Xilinx,_Inc. 10.0',
    '# 10.1.03i',
    'CSET ainit_value = 0',
    'CSET ce = true',
    'CSET count_mode = UP',
    'CSET fb_latency = 0',
    'CSET final_count_value = 1',
    'CSET implementation = Fabric',
    'CSET increment_value = 1',
    'CSET latency = 1',
    'CSET load = false',
    'CSET output_width = 10',
    'CSET restrict_count = false',
    'CSET sclr = false',
    'CSET sinit = true',
    'CSET sinit_value = 0',
    'CSET sset = false',
    'CSET sync_ce_priority = Sync_Overrides_CE',
    'CSET sync_threshold_output = false',
    'CSET syncctrlpriority = Reset_Overrides_Set',
    'CSET component_name = binary_counter_virtex5_10_0_1ee993c8ed57b9ce',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b94199c8e4bf7fef524f28559312ac7b',
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
      'core_name0' => 'binary_counter_virtex5_10_0_1ee993c8ed57b9ce',
      'entity_name.0' => 'xlcounter_limit',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '303744f0225d0f94ee626565a96a47a6',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Block_Memory_Generator Virtex5 Xilinx,_Inc. 2.4',
    '# 10.1.03i',
    'CSET algorithm = Minimum_Area',
    'CSET assume_synchronous_clk = false',
    'CSET byte_size = 9',
    'CSET coe_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET collision_warnings = ALL',
    'CSET disable_collision_warnings = false',
    'CSET enable_a = Use_ENA_Pin',
    'CSET enable_b = Always_Enabled',
    'CSET load_init_file = TRUE',
    'CSET memory_type = Single_Port_ROM',
    'CSET operating_mode_a = WRITE_FIRST',
    'CSET operating_mode_b = WRITE_FIRST',
    'CSET output_reset_value_a = 0',
    'CSET output_reset_value_b = 0',
    'CSET primitive = 8kx2',
    'CSET read_width_a = 9',
    'CSET read_width_b = 9',
    'CSET register_output_of_memory_core = false',
    'CSET register_output_of_memory_primitives = false',
    'CSET remaining_memory_locations = 0',
    'CSET use_byte_write_enable = false',
    'CSET use_regcea_pin = false',
    'CSET use_regceb_pin = false',
    'CSET use_ssra_pin = FALSE',
    'CSET use_ssrb_pin = FALSE',
    'CSET write_depth_a = 1024',
    'CSET write_width_a = 9',
    'CSET write_width_b = 9',
    'CSET component_name = bmg_24_vx5_916edb207080a9d0',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '0d9d623e3c6c2f2c86588443f2b82290',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addra => core_addr,
        clka => clk,
        ena => core_ce,
        douta => core_data_out',
      'core_name0' => 'bmg_24_vx5_916edb207080a9d0',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ccefb93794b36b9f133dc77fcec57bff',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c20be9e604d157bf540874ba0658fea1',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Multiplier Virtex5 Xilinx,_Inc. 10.1',
    '# 10.1.03i',
    'CSET ccmimp = Distributed_Memory',
    'CSET clockenable = true',
    'CSET constvalue = 129',
    'CSET internaluser = 0',
    'CSET multiplier_construction = Use_Mults',
    'CSET multtype = Parallel_Multiplier',
    'CSET optgoal = Speed',
    'CSET outputwidthhigh = 16',
    'CSET outputwidthlow = 0',
    'CSET pipestages = 3',
    'CSET portatype = Signed',
    'CSET portawidth = 8',
    'CSET portbtype = Signed',
    'CSET portbwidth = 9',
    'CSET roundpoint = 0',
    'CSET sclrcepriority = CE_Overrides_SCLR',
    'CSET syncclear = true',
    'CSET use_custom_output_width = false',
    'CSET userounding = false',
    'CSET zerodetect = false',
    'CSET component_name = multiplier_virtex5_10_1_2f77ace24e40581e',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '9f99e3d340ab10e4e2ac74fbebd0f826',
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
      'core_name0' => 'multiplier_virtex5_10_1_2f77ace24e40581e',
      'entity_name.0' => 'xlmult_v9_0',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f203510ae53dbfc75081759a0b38509c',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: unsigned((17 - 1) downto 0);
  signal in1_1_27: unsigned((17 - 1) downto 0);
  signal y_2_1_concat: unsigned((34 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((17 - 1) downto 0);
    in1 : in std_logic_vector((17 - 1) downto 0);
    y : out std_logic_vector((34 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_25b7e1d1f5',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'bfe827a7dcc38271d9b48486b7e0b5b5',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: signed((17 - 1) downto 0);
  signal output_port_5_5_force: unsigned((17 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port_5_5_force <= signed_to_unsigned(input_port_1_40);
  output_port <= unsigned_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((17 - 1) downto 0);
    output_port : out std_logic_vector((17 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_573890e1c0',
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
    'SELECT Binary_Counter Virtex5 Xilinx,_Inc. 10.0',
    '# 10.1.03i',
    'CSET ainit_value = 0',
    'CSET ce = true',
    'CSET count_mode = UP',
    'CSET fb_latency = 0',
    'CSET final_count_value = 1',
    'CSET implementation = Fabric',
    'CSET increment_value = 1',
    'CSET latency = 1',
    'CSET load = false',
    'CSET output_width = 10',
    'CSET restrict_count = false',
    'CSET sclr = false',
    'CSET sinit = true',
    'CSET sinit_value = 0',
    'CSET sset = false',
    'CSET sync_ce_priority = Sync_Overrides_CE',
    'CSET sync_threshold_output = false',
    'CSET syncctrlpriority = Reset_Overrides_Set',
    'CSET component_name = binary_counter_virtex5_10_0_1ee993c8ed57b9ce',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd6b766c2e6a7a5e16ea78e9574068e40',
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
      'core_name0' => 'binary_counter_virtex5_10_0_1ee993c8ed57b9ce',
      'entity_name.0' => 'xlcounter_limit',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Block_Memory_Generator Virtex5 Xilinx,_Inc. 2.4',
    '# 10.1.03i',
    'CSET algorithm = Minimum_Area',
    'CSET assume_synchronous_clk = false',
    'CSET byte_size = 9',
    'CSET coe_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET collision_warnings = ALL',
    'CSET disable_collision_warnings = false',
    'CSET enable_a = Use_ENA_Pin',
    'CSET enable_b = Always_Enabled',
    'CSET load_init_file = TRUE',
    'CSET memory_type = Single_Port_RAM',
    'CSET operating_mode_a = READ_FIRST',
    'CSET operating_mode_b = WRITE_FIRST',
    'CSET output_reset_value_a = 0',
    'CSET output_reset_value_b = 0',
    'CSET primitive = 8kx2',
    'CSET read_width_a = 8',
    'CSET read_width_b = 8',
    'CSET register_output_of_memory_core = false',
    'CSET register_output_of_memory_primitives = false',
    'CSET remaining_memory_locations = 0',
    'CSET use_byte_write_enable = false',
    'CSET use_regcea_pin = false',
    'CSET use_regceb_pin = false',
    'CSET use_ssra_pin = FALSE',
    'CSET use_ssrb_pin = FALSE',
    'CSET write_depth_a = 1024',
    'CSET write_width_a = 8',
    'CSET write_width_b = 8',
    'CSET component_name = bmg_24_vx5_b3a285035a3712ee',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '7bb40c5017b9b75a56602b599c559627',
    'sourceFile' => 'hdl/xlspram.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      dina: in std_logic_vector(c_width - 1 downto 0);
      wea: in std_logic_vector(0 downto 0);
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addra => addr,
        clka => clk,
        dina => data_in,
        wea(0) => core_we,
        ena => core_ce,
        douta => core_data_out',
      'core_name0' => 'bmg_24_vx5_b3a285035a3712ee',
      'entity_name.0' => 'xlspram',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '5923148c2ddd6c77bd5277ee7ae36de1',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b70f209528fc68a2c658d9184ba74222',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '49dec41768df7a8ab35653f024b7b162',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Block_Memory_Generator Virtex5 Xilinx,_Inc. 2.4',
    '# 10.1.03i',
    'CSET algorithm = Minimum_Area',
    'CSET assume_synchronous_clk = false',
    'CSET byte_size = 9',
    'CSET coe_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 1FF, 1FF, 1FF, 1FF, 1FF, 1FE, 1FE, 1FE, 1FE, 1FE, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FC, 1FC, 1FC, 1FC, 1FC, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1F8, 1F8, 1F8, 1F8, 1F8, 1F8, 1F7, 1F7, 1F7, 1F7, 1F7, 1F7, 1F6, 1F6, 1F6, 1F6, 1F6, 1F6, 1F5, 1F5, 1F5, 1F5, 1F5, 1F5, 1F4, 1F4, 1F4, 1F4, 1F4, 1F4, 1F4, 1F3, 1F3, 1F3, 1F3, 1F3, 1F3, 1F3, 1F2, 1F2, 1F2, 1F2, 1F2, 1F2, 1F2, 1F1, 1F1, 1F1, 1F1, 1F1, 1F1, 1F1, 1F0, 1F0, 1F0, 1F0, 1F0, 1F0, 1F0, 1EF, 1EF, 1EF, 1EF, 1EF, 1EF, 1EF, 1EF, 1EE, 1EE, 1EE, 1EE, 1EE, 1EE, 1EE, 1EE, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1EE, 1EE, 1EE, 1EE, 1EE, 1EE, 1EE, 1EE, 1EE, 1EE, 1EE, 1EE, 1EE, 1EE, 1EE, 1EF, 1EF, 1EF, 1EF, 1EF, 1EF, 1EF, 1EF, 1EF, 1EF, 1EF, 1EF, 1EF, 1EF, 1EF, 1F0, 1F0, 1F0, 1F0, 1F0, 1F0, 1F0, 1F0, 1F0, 1F0, 1F0, 1F0, 1F0, 1F0, 1F0, 1F1, 1F1, 1F1, 1F1, 1F1, 1F1, 1F1, 1F1, 1F1, 1F1, 1F1, 1F1, 1F1, 1F1, 1F1, 1F2, 1F2, 1F2, 1F2, 1F2, 1F2, 1F2, 1F2, 1F2, 1F2, 1F2, 1F2, 1F2, 1F2, 1F2, 1F3, 1F3, 1F3, 1F3, 1F3, 1F3, 1F3, 1F3, 1F3, 1F3, 1F3, 1F3, 1F3, 1F3, 1F3, 1F3, 1F4, 1F4, 1F4, 1F4, 1F4, 1F4, 1F4, 1F4, 1F4, 1F4, 1F4, 1F4, 1F4, 1F4, 1F4, 1F4, 1F5, 1F5, 1F5, 1F5, 1F5, 1F5, 1F5, 1F5, 1F5, 1F5, 1F5, 1F5, 1F5, 1F5, 1F5, 1F5, 1F6, 1F6, 1F6, 1F6, 1F6, 1F6, 1F6, 1F6, 1F6, 1F6, 1F6, 1F6, 1F6, 1F6, 1F6, 1F6, 1F7, 1F7, 1F7, 1F7, 1F7, 1F7, 1F7, 1F7, 1F7, 1F7, 1F7, 1F7, 1F7, 1F7, 1F7, 1F7, 1F8, 1F8, 1F8, 1F8, 1F8, 1F8, 1F8, 1F8, 1F8, 1F8, 1F8, 1F8, 1F8, 1F8, 1F8, 1F8, 1F8, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET collision_warnings = ALL',
    'CSET disable_collision_warnings = false',
    'CSET enable_a = Use_ENA_Pin',
    'CSET enable_b = Always_Enabled',
    'CSET load_init_file = TRUE',
    'CSET memory_type = Single_Port_ROM',
    'CSET operating_mode_a = WRITE_FIRST',
    'CSET operating_mode_b = WRITE_FIRST',
    'CSET output_reset_value_a = 0',
    'CSET output_reset_value_b = 0',
    'CSET primitive = 8kx2',
    'CSET read_width_a = 9',
    'CSET read_width_b = 9',
    'CSET register_output_of_memory_core = false',
    'CSET register_output_of_memory_primitives = false',
    'CSET remaining_memory_locations = 0',
    'CSET use_byte_write_enable = false',
    'CSET use_regcea_pin = false',
    'CSET use_regceb_pin = false',
    'CSET use_ssra_pin = FALSE',
    'CSET use_ssrb_pin = FALSE',
    'CSET write_depth_a = 1024',
    'CSET write_width_a = 9',
    'CSET write_width_b = 9',
    'CSET component_name = bmg_24_vx5_17f5cef47a567d97',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '6e3e6c547b0561ff4f31306460f788b0',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addra => core_addr,
        clka => clk,
        ena => core_ce,
        douta => core_data_out',
      'core_name0' => 'bmg_24_vx5_17f5cef47a567d97',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b14cd477ecd3d5092bc45a67eda96658',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f63b80d6b7b0653a795a7bff2e704714',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((17 - 1) downto 0);
  signal b_17_35: signed((17 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((18 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "000000000000000000");
  signal op_mem_91_20_front_din: signed((18 - 1) downto 0);
  signal op_mem_91_20_back: signed((18 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_69_18: signed((18 - 1) downto 0);
  signal cast_69_22: signed((18 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((18 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_69_18 <= s2s_cast(a_17_32, 15, 18, 15);
  cast_69_22 <= s2s_cast(b_17_35, 15, 18, 15);
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
    a : in std_logic_vector((17 - 1) downto 0);
    b : in std_logic_vector((17 - 1) downto 0);
    s : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_bfd97cd167',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'e2de32f3de410707a6a1bce4fd45f32c',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '8118adbbb047b4db24916c22dfc2c085',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'cb899d6fdafbfe414c295b539087e8f7',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '2418e3abee66300b8c0500f3fde8b242',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Block_Memory_Generator Virtex5 Xilinx,_Inc. 2.4',
    '# 10.1.03i',
    'CSET algorithm = Minimum_Area',
    'CSET assume_synchronous_clk = false',
    'CSET byte_size = 9',
    'CSET coe_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, F9, F9, F9, F9, F9, F9, F9, F9, F9, F8, F8, F8, F8, F8, F8, F8, F8, F7, F7, F7, F7, F7, F7, F7, F7, F6, F6, F6, F6, F6, F6, F6, F6, F5, F5, F5, F5, F5, F5, F5, F4, F4, F4, F4, F4, F4, F4, F3, F3, F3, F3, F3, F3, F2, F2, F2, F2, F2, F2, F2, F1, F1, F1, F1, F1, F1, F0, F0, F0, F0, F0, F0, EF, EF, EF, EF, EF, EF, EE, EE, EE, EE, EE, ED, ED, ED, ED, ED, ED, EC, EC, EC, EC, EC, EB, EB, EB, EB, EB, EB, EA, EA, EA, EA, EA, E9, E9, E9, E9, E9, E8, E8, E8, E8, E8, E7, E7, E7, E7, E7, E6, E6, E6, E6, E6, E5, E5, E5, E5, E4, E4, E4, E4, E4, E3, E3, E3, E3, E3, E2, E2, E2, E2, E1, E1, E1, E1, E1, E0, E0, E0, E0, DF, DF, DF, DF, DE, DE, DE, DE, DE, DD, DD, DD, DD, DC, DC, DC, DC, DB, DB, DB, DB, DA, DA, DA, DA, D9, D9, D9, D9, D8, D8, D8, D8, D7, D7, D7, D7, D6, D6, D6, D6, D5, D5, D5, D5, D4, D4, D4, D4, D3, D3, D3, D3, D2, D2, D2, D2, D1, D1, D1, D0, D0, D0, D0, CF, CF, CF, CF, CE, CE, CE, CE, CD, CD, CD, CC, CC, CC, CC, CB, CB, CB, CA, CA, CA, CA, C9, C9, C9, C9, C8, C8, C8, C7, C7, C7, C7, C6, C6, C6, C5, C5, C5, C5, C4, C4, C4, C3, C3, C3, C2, C2, C2, C2, C1, C1, C1, C0, C0, C0, C0, BF, BF, BF, BE, BE, BE, BD, BD, BD, BD, BC, BC, BC, BB, BB, BB, BA, BA, BA, B9, B9, B9, B9, B8, B8, B8, B7, B7, B7, B6, B6, B6, B5, B5, B5, B5, B4, B4, B4, B3, B3, B3, B2, B2, B2, B1, B1, B1, B0, B0, B0, AF, AF, AF, AE, AE, AE, AE, AD, AD, AD, AC, AC, AC, AB, AB, AB, AA, AA, AA, A9, A9, A9, A8, A8, A8, A7, A7, A7, A6, A6, A6, A5, A5, A5, A4, A4, A4, A3, A3, A3, A2, A2, A2, A1, A1, A1, A0, A0, A0, 9F, 9F, 9F, 9E, 9E, 9E, 9D, 9D, 9D, 9C, 9C, 9C, 9B, 9B, 9B, 9A, 9A, 9A, 99, 99, 99, 98, 98, 98, 97, 97, 97, 96, 96, 96, 95, 95, 95, 94, 94, 94, 93, 93, 93, 92, 92, 92, 91, 91, 91, 90, 90, 90, 8F, 8F, 8F, 8E, 8E, 8E, 8D, 8D, 8D, 8C, 8C, 8B, 8B, 8B, 8A, 8A, 8A, 89, 89, 89, 88, 88, 88, 87, 87, 87, 86, 86, 86, 85, 85, 85, 84, 84, 84, 83, 83, 83, 82, 82, 82, 81, 81, 80, 80, 80, 7F, 7F, 7F, 7E, 7E, 7E, 7D, 7D, 7D, 7C, 7C, 7C, 7B, 7B, 7B, 7A, 7A, 7A, 79, 79, 79, 78, 78, 78, 77, 77, 76, 76, 76, 75, 75, 75, 74, 74, 74, 73, 73, 73, 72, 72, 72, 71, 71, 71, 70, 70, 70, 6F, 6F, 6F, 6E, 6E, 6E, 6D, 6D, 6C, 6C, 6C, 6B, 6B, 6B, 6A, 6A, 6A, 69, 69, 69, 68, 68, 68, 67, 67, 67, 66, 66, 66, 65, 65, 65, 64, 64, 64, 63, 63, 63, 62, 62, 62, 61, 61, 61, 60, 60, 60, 5F, 5F, 5F, 5E, 5E, 5E, 5D, 5D, 5C, 5C, 5C, 5B, 5B, 5B, 5A, 5A, 5A, 59, 59, 59, 58, 58, 58, 57, 57, 57, 56, 56, 56, 55, 55, 55, 54, 54, 54, 53, 53, 53, 52, 52, 52, 51, 51, 51, 51, 50, 50, 50, 4F, 4F, 4F, 4E, 4E, 4E, 4D, 4D, 4D, 4C, 4C, 4C, 4B, 4B, 4B, 4A, 4A, 4A, 49, 49, 49, 48, 48, 48, 47, 47, 47, 46, 46, 46, 45, 45, 45, 45, 44, 44, 44, 43, 43, 43, 42, 42, 42, 41, 41, 41, 40, 40, 40, 3F, 3F, 3F, 3F, 3E, 3E, 3E, 3D, 3D, 3D, 3C, 3C, 3C, 3B, 3B, 3B, 3B, 3A, 3A, 3A, 39, 39, 39, 38, 38, 38, 37, 37, 37, 37, 36, 36, 36, 35, 35, 35, 34, 34, 34, 34, 33, 33, 33, 32, 32, 32, 31, 31, 31, 31, 30, 30, 30, 2F, 2F, 2F, 2F, 2E, 2E, 2E, 2D, 2D, 2D, 2D, 2C, 2C, 2C, 2B, 2B, 2B, 2B, 2A, 2A, 2A, 29, 29, 29, 29, 28, 28, 28, 27, 27, 27, 27, 26, 26, 26, 25, 25, 25, 25, 24, 24, 24, 24, 23, 23, 23, 22, 22, 22, 22, 21, 21, 21, 21, 20, 20, 20, 1F, 1F, 1F, 1F, 1E, 1E, 1E, 1E, 1D, 1D, 1D, 1D, 1C, 1C, 1C, 1C, 1B, 1B, 1B, 1A, 1A, 1A, 1A, 19, 19, 19, 19, 18, 18, 18, 18, 17, 17, 17, 17, 16, 16, 16, 16, 15, 15, 15, 15, 14, 14, 14, 14, 13, 13, 13, 13, 13, 12, 12, 12, 12, 11, 11, 11, 11, 10, 10, 10, 10, F, F, F, F, F, E, E, E, E, D, D, D, D, C, C, C, C, C, B, B, B, B, A, A, A, A, A, 9, 9, 9, 9, 8, 8, 8, 8, 8, 7, 7, 7, 7, 7, 6, 6, 6, 6, 6, 5, 5, 5, 5, 4, 4, 4, 4, 4, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 0, 0, 0;',
    '
]',
    'CSET collision_warnings = ALL',
    'CSET disable_collision_warnings = false',
    'CSET enable_a = Use_ENA_Pin',
    'CSET enable_b = Always_Enabled',
    'CSET load_init_file = TRUE',
    'CSET memory_type = Single_Port_ROM',
    'CSET operating_mode_a = WRITE_FIRST',
    'CSET operating_mode_b = WRITE_FIRST',
    'CSET output_reset_value_a = 0',
    'CSET output_reset_value_b = 0',
    'CSET primitive = 8kx2',
    'CSET read_width_a = 9',
    'CSET read_width_b = 9',
    'CSET register_output_of_memory_core = false',
    'CSET register_output_of_memory_primitives = false',
    'CSET remaining_memory_locations = 0',
    'CSET use_byte_write_enable = false',
    'CSET use_regcea_pin = false',
    'CSET use_regceb_pin = false',
    'CSET use_ssra_pin = FALSE',
    'CSET use_ssrb_pin = FALSE',
    'CSET write_depth_a = 1024',
    'CSET write_width_a = 9',
    'CSET write_width_b = 9',
    'CSET component_name = bmg_24_vx5_22468d6827fd0e85',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'e6e574b2cdd8a5a0fce4afc2968dab69',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addra => core_addr,
        clka => clk,
        ena => core_ce,
        douta => core_data_out',
      'core_name0' => 'bmg_24_vx5_22468d6827fd0e85',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Block_Memory_Generator Virtex5 Xilinx,_Inc. 2.4',
    '# 10.1.03i',
    'CSET algorithm = Minimum_Area',
    'CSET assume_synchronous_clk = false',
    'CSET byte_size = 9',
    'CSET coe_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 9, 9, 9, 9, A, A, A, A, A, B, B, B, B, C, C, C, C, C, D, D, D, D, E, E, E, E, F, F, F, F, F, 10, 10, 10, 10, 11, 11, 11, 11, 12, 12, 12, 12, 13, 13, 13, 13, 13, 14, 14, 14, 14, 15, 15, 15, 15, 16, 16, 16, 16, 17, 17, 17, 17, 18, 18, 18, 18, 19, 19, 19, 19, 1A, 1A, 1A, 1A, 1B, 1B, 1B, 1C, 1C, 1C, 1C, 1D, 1D, 1D, 1D, 1E, 1E, 1E, 1E, 1F, 1F, 1F, 1F, 20, 20, 20, 21, 21, 21, 21, 22, 22, 22, 22, 23, 23, 23, 24, 24, 24, 24, 25, 25, 25, 25, 26, 26, 26, 27, 27, 27, 27, 28, 28, 28, 29, 29, 29, 29, 2A, 2A, 2A, 2B, 2B, 2B, 2B, 2C, 2C, 2C, 2D, 2D, 2D, 2D, 2E, 2E, 2E, 2F, 2F, 2F, 2F, 30, 30, 30, 31, 31, 31, 31, 32, 32, 32, 33, 33, 33, 34, 34, 34, 34, 35, 35, 35, 36, 36, 36, 37, 37, 37, 37, 38, 38, 38, 39, 39, 39, 3A, 3A, 3A, 3B, 3B, 3B, 3B, 3C, 3C, 3C, 3D, 3D, 3D, 3E, 3E, 3E, 3F, 3F, 3F, 3F, 40, 40, 40, 41, 41, 41, 42, 42, 42, 43, 43, 43, 44, 44, 44, 45, 45, 45, 45, 46, 46, 46, 47, 47, 47, 48, 48, 48, 49, 49, 49, 4A, 4A, 4A, 4B, 4B, 4B, 4C, 4C, 4C, 4D, 4D, 4D, 4E, 4E, 4E, 4F, 4F, 4F, 50, 50, 50, 51, 51, 51, 51, 52, 52, 52, 53, 53, 53, 54, 54, 54, 55, 55, 55, 56, 56, 56, 57, 57, 57, 58, 58, 58, 59, 59, 59, 5A, 5A, 5A, 5B, 5B, 5B, 5C, 5C, 5C, 5D, 5D, 5E, 5E, 5E, 5F, 5F, 5F, 60, 60, 60, 61, 61, 61, 62, 62, 62, 63, 63, 63, 64, 64, 64, 65, 65, 65, 66, 66, 66, 67, 67, 67, 68, 68, 68, 69, 69, 69, 6A, 6A, 6A, 6B, 6B, 6B, 6C, 6C, 6C, 6D, 6D, 6E, 6E, 6E, 6F, 6F, 6F, 70, 70, 70, 71, 71, 71, 72, 72, 72, 73, 73, 73, 74, 74, 74, 75, 75, 75, 76, 76, 76, 77, 77, 78, 78, 78, 79, 79, 79, 7A, 7A, 7A, 7B, 7B, 7B, 7C, 7C, 7C, 7D, 7D, 7D, 7E, 7E, 7E, 7F, 7F, 7F, 80, 80, 80, 81, 81, 82, 82, 82, 83, 83, 83, 84, 84, 84, 85, 85, 85, 86, 86, 86, 87, 87, 87, 88, 88, 88, 89, 89, 89, 8A, 8A, 8A, 8B, 8B, 8B, 8C, 8C, 8D, 8D, 8D, 8E, 8E, 8E, 8F, 8F, 8F, 90, 90, 90, 91, 91, 91, 92, 92, 92, 93, 93, 93, 94, 94, 94, 95, 95, 95, 96, 96, 96, 97, 97, 97, 98, 98, 98, 99, 99, 99, 9A, 9A, 9A, 9B, 9B, 9B, 9C, 9C, 9C, 9D, 9D, 9D, 9E, 9E, 9E, 9F, 9F, 9F, A0, A0, A0, A1, A1, A1, A2, A2, A2, A3, A3, A3, A4, A4, A4, A5, A5, A5, A6, A6, A6, A7, A7, A7, A8, A8, A8, A9, A9, A9, AA, AA, AA, AB, AB, AB, AC, AC, AC, AD, AD, AD, AE, AE, AE, AE, AF, AF, AF, B0, B0, B0, B1, B1, B1, B2, B2, B2, B3, B3, B3, B4, B4, B4, B5, B5, B5, B5, B6, B6, B6, B7, B7, B7, B8, B8, B8, B9, B9, B9, B9, BA, BA, BA, BB, BB, BB, BC, BC, BC, BD, BD, BD, BD, BE, BE, BE, BF, BF, BF, C0, C0, C0, C0, C1, C1, C1, C2, C2, C2, C2, C3, C3, C3, C4, C4, C4, C5, C5, C5, C5, C6, C6, C6, C7, C7, C7, C7, C8, C8, C8, C9, C9, C9, C9, CA, CA, CA, CA, CB, CB, CB, CC, CC, CC, CC, CD, CD, CD, CE, CE, CE, CE, CF, CF, CF, CF, D0, D0, D0, D0, D1, D1, D1, D2, D2, D2, D2, D3, D3, D3, D3, D4, D4, D4, D4, D5, D5, D5, D5, D6, D6, D6, D6, D7, D7, D7, D7, D8, D8, D8, D8, D9, D9, D9, D9, DA, DA, DA, DA, DB, DB, DB, DB, DC, DC, DC, DC, DD, DD, DD, DD, DE, DE, DE, DE, DE, DF, DF, DF, DF, E0, E0, E0, E0, E1, E1, E1, E1, E1, E2, E2, E2, E2, E3, E3, E3, E3, E3, E4, E4, E4, E4, E4, E5, E5, E5, E5, E6, E6, E6, E6, E6, E7, E7, E7, E7, E7, E8, E8, E8, E8, E8, E9, E9, E9, E9, E9, EA, EA, EA, EA, EA, EB, EB, EB, EB, EB, EB, EC, EC, EC, EC, EC, ED, ED, ED, ED, ED, ED, EE, EE, EE, EE, EE, EF, EF, EF, EF, EF, EF, F0, F0, F0, F0, F0, F0, F1, F1, F1, F1, F1, F1, F2, F2, F2, F2, F2, F2, F2, F3, F3, F3, F3, F3, F3, F4, F4, F4, F4, F4, F4, F4, F5, F5, F5, F5, F5, F5, F5, F6, F6, F6, F6, F6, F6, F6, F6, F7, F7, F7, F7, F7, F7, F7, F7, F8, F8, F8, F8, F8, F8, F8, F8, F9, F9, F9, F9, F9, F9, F9, F9, F9, FA, FA, FA, FA, FA, FA, FA, FA, FA, FA, FB, FB, FB, FB, FB, FB, FB, FB, FB, FB, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FC, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FD, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FE, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF, FF;',
    '
]',
    'CSET collision_warnings = ALL',
    'CSET disable_collision_warnings = false',
    'CSET enable_a = Use_ENA_Pin',
    'CSET enable_b = Always_Enabled',
    'CSET load_init_file = TRUE',
    'CSET memory_type = Single_Port_ROM',
    'CSET operating_mode_a = WRITE_FIRST',
    'CSET operating_mode_b = WRITE_FIRST',
    'CSET output_reset_value_a = 0',
    'CSET output_reset_value_b = 0',
    'CSET primitive = 8kx2',
    'CSET read_width_a = 9',
    'CSET read_width_b = 9',
    'CSET register_output_of_memory_core = false',
    'CSET register_output_of_memory_primitives = false',
    'CSET remaining_memory_locations = 0',
    'CSET use_byte_write_enable = false',
    'CSET use_regcea_pin = false',
    'CSET use_regceb_pin = false',
    'CSET use_ssra_pin = FALSE',
    'CSET use_ssrb_pin = FALSE',
    'CSET write_depth_a = 1024',
    'CSET write_width_a = 9',
    'CSET write_width_b = 9',
    'CSET component_name = bmg_24_vx5_2c89c45c28fef7b6',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '405726f75881316971eb6f84f68b3a7c',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addra => core_addr,
        clka => clk,
        ena => core_ce,
        douta => core_data_out',
      'core_name0' => 'bmg_24_vx5_2c89c45c28fef7b6',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Block_Memory_Generator Virtex5 Xilinx,_Inc. 2.4',
    '# 10.1.03i',
    'CSET algorithm = Minimum_Area',
    'CSET assume_synchronous_clk = false',
    'CSET byte_size = 9',
    'CSET coe_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FF, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FE, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FC, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1F8, 1F8, 1F8, 1F8, 1F8, 1F8, 1F8, 1F8, 1F8, 1F8, 1F8, 1F8, 1F8, 1F8, 1F8, 1F8, 1F8, 1F7, 1F7, 1F7, 1F7, 1F7, 1F7, 1F7, 1F7, 1F7, 1F7, 1F7, 1F7, 1F7, 1F7, 1F7, 1F7, 1F6, 1F6, 1F6, 1F6, 1F6, 1F6, 1F6, 1F6, 1F6, 1F6, 1F6, 1F6, 1F6, 1F6, 1F6, 1F6, 1F5, 1F5, 1F5, 1F5, 1F5, 1F5, 1F5, 1F5, 1F5, 1F5, 1F5, 1F5, 1F5, 1F5, 1F5, 1F5, 1F4, 1F4, 1F4, 1F4, 1F4, 1F4, 1F4, 1F4, 1F4, 1F4, 1F4, 1F4, 1F4, 1F4, 1F4, 1F4, 1F3, 1F3, 1F3, 1F3, 1F3, 1F3, 1F3, 1F3, 1F3, 1F3, 1F3, 1F3, 1F3, 1F3, 1F3, 1F3, 1F2, 1F2, 1F2, 1F2, 1F2, 1F2, 1F2, 1F2, 1F2, 1F2, 1F2, 1F2, 1F2, 1F2, 1F2, 1F1, 1F1, 1F1, 1F1, 1F1, 1F1, 1F1, 1F1, 1F1, 1F1, 1F1, 1F1, 1F1, 1F1, 1F1, 1F0, 1F0, 1F0, 1F0, 1F0, 1F0, 1F0, 1F0, 1F0, 1F0, 1F0, 1F0, 1F0, 1F0, 1F0, 1EF, 1EF, 1EF, 1EF, 1EF, 1EF, 1EF, 1EF, 1EF, 1EF, 1EF, 1EF, 1EF, 1EF, 1EF, 1EE, 1EE, 1EE, 1EE, 1EE, 1EE, 1EE, 1EE, 1EE, 1EE, 1EE, 1EE, 1EE, 1EE, 1EE, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1DF, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E0, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E1, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E2, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E3, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E4, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E5, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E6, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E7, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E8, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1E9, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1EA, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EB, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1EC, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1ED, 1EE, 1EE, 1EE, 1EE, 1EE, 1EE, 1EE, 1EE, 1EF, 1EF, 1EF, 1EF, 1EF, 1EF, 1EF, 1EF, 1F0, 1F0, 1F0, 1F0, 1F0, 1F0, 1F0, 1F1, 1F1, 1F1, 1F1, 1F1, 1F1, 1F1, 1F2, 1F2, 1F2, 1F2, 1F2, 1F2, 1F2, 1F3, 1F3, 1F3, 1F3, 1F3, 1F3, 1F3, 1F4, 1F4, 1F4, 1F4, 1F4, 1F4, 1F4, 1F5, 1F5, 1F5, 1F5, 1F5, 1F5, 1F6, 1F6, 1F6, 1F6, 1F6, 1F6, 1F7, 1F7, 1F7, 1F7, 1F7, 1F7, 1F8, 1F8, 1F8, 1F8, 1F8, 1F8, 1F9, 1F9, 1F9, 1F9, 1F9, 1F9, 1FA, 1FA, 1FA, 1FA, 1FA, 1FA, 1FB, 1FB, 1FB, 1FB, 1FB, 1FB, 1FC, 1FC, 1FC, 1FC, 1FC, 1FD, 1FD, 1FD, 1FD, 1FD, 1FD, 1FE, 1FE, 1FE, 1FE, 1FE, 1FF, 1FF, 1FF, 1FF, 1FF, 0, 0, 0;',
    '
]',
    'CSET collision_warnings = ALL',
    'CSET disable_collision_warnings = false',
    'CSET enable_a = Use_ENA_Pin',
    'CSET enable_b = Always_Enabled',
    'CSET load_init_file = TRUE',
    'CSET memory_type = Single_Port_ROM',
    'CSET operating_mode_a = WRITE_FIRST',
    'CSET operating_mode_b = WRITE_FIRST',
    'CSET output_reset_value_a = 0',
    'CSET output_reset_value_b = 0',
    'CSET primitive = 8kx2',
    'CSET read_width_a = 9',
    'CSET read_width_b = 9',
    'CSET register_output_of_memory_core = false',
    'CSET register_output_of_memory_primitives = false',
    'CSET remaining_memory_locations = 0',
    'CSET use_byte_write_enable = false',
    'CSET use_regcea_pin = false',
    'CSET use_regceb_pin = false',
    'CSET use_ssra_pin = FALSE',
    'CSET use_ssrb_pin = FALSE',
    'CSET write_depth_a = 1024',
    'CSET write_width_a = 9',
    'CSET write_width_b = 9',
    'CSET component_name = bmg_24_vx5_7bc1e03f2e4955ca',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '24839917d996596e64a59f07cbecb9ae',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addra => core_addr,
        clka => clk,
        ena => core_ce,
        douta => core_data_out',
      'core_name0' => 'bmg_24_vx5_7bc1e03f2e4955ca',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Block_Memory_Generator Virtex5 Xilinx,_Inc. 2.4',
    '# 10.1.03i',
    'CSET algorithm = Minimum_Area',
    'CSET assume_synchronous_clk = false',
    'CSET byte_size = 9',
    'CSET coe_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET collision_warnings = ALL',
    'CSET disable_collision_warnings = false',
    'CSET enable_a = Use_ENA_Pin',
    'CSET enable_b = Always_Enabled',
    'CSET load_init_file = TRUE',
    'CSET memory_type = Single_Port_ROM',
    'CSET operating_mode_a = WRITE_FIRST',
    'CSET operating_mode_b = WRITE_FIRST',
    'CSET output_reset_value_a = 0',
    'CSET output_reset_value_b = 0',
    'CSET primitive = 8kx2',
    'CSET read_width_a = 9',
    'CSET read_width_b = 9',
    'CSET register_output_of_memory_core = false',
    'CSET register_output_of_memory_primitives = false',
    'CSET remaining_memory_locations = 0',
    'CSET use_byte_write_enable = false',
    'CSET use_regcea_pin = false',
    'CSET use_regceb_pin = false',
    'CSET use_ssra_pin = FALSE',
    'CSET use_ssrb_pin = FALSE',
    'CSET write_depth_a = 1024',
    'CSET write_width_a = 9',
    'CSET write_width_b = 9',
    'CSET component_name = bmg_24_vx5_8259598782c619da',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '63cf7edb1e5f23978be676d2fae7136e',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addra => core_addr,
        clka => clk,
        ena => core_ce,
        douta => core_data_out',
      'core_name0' => 'bmg_24_vx5_8259598782c619da',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '0607ba63f9c581787d7d79d5afe7d5aa',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '5923e54640bdead338d33f20e5abef28',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "1000000000000000000000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((25 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_2ae71e3b73',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex5 Xilinx,_Inc. 10.0',
    '# 10.1.03i',
    'CSET ainit_value = 0',
    'CSET ce = true',
    'CSET count_mode = UP',
    'CSET fb_latency = 0',
    'CSET final_count_value = 1',
    'CSET implementation = Fabric',
    'CSET increment_value = 1',
    'CSET latency = 1',
    'CSET load = false',
    'CSET output_width = 25',
    'CSET restrict_count = false',
    'CSET sclr = false',
    'CSET sinit = true',
    'CSET sinit_value = 0',
    'CSET sset = false',
    'CSET sync_ce_priority = Sync_Overrides_CE',
    'CSET sync_threshold_output = false',
    'CSET syncctrlpriority = Reset_Overrides_Set',
    'CSET component_name = binary_counter_virtex5_10_0_092422ed79c7db12',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '692bb73661912d2b3df20fe87aaf0175',
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
      'core_name0' => 'binary_counter_virtex5_10_0_092422ed79c7db12',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c8162d745bc1be314673723d54ffe85a',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((25 - 1) downto 0);
  signal b_1_34: unsigned((25 - 1) downto 0);
  signal result_14_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_14_3_rel <= a_1_31 /= b_1_34;
  op <= boolean_to_vector(result_14_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((25 - 1) downto 0);
    b : in std_logic_vector((25 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_487ac75be9',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '5058f3af0f2ac75cd52d265559bf8996',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'e36207d9bd2d966c3759adf5ac0791ad',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '17c36491977bb9efc6c9c4d8236dd019',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd5ecf6be20e3b520601fe6e8639e5759',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '81cca25e49f43612c763376189516477',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '0ce751beccd3e6765453d15adc791874',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '99c5eea6fb0fce2f817c3794e13391e7',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ad69d20baa0e2e5e20874f2b50c7438e',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((1 - 1) downto 0);
  signal in2_1_31: unsigned((1 - 1) downto 0);
  signal in3_1_35: unsigned((1 - 1) downto 0);
  signal in4_1_39: unsigned((1 - 1) downto 0);
  signal in5_1_43: unsigned((1 - 1) downto 0);
  signal in6_1_47: unsigned((1 - 1) downto 0);
  signal in7_1_51: unsigned((1 - 1) downto 0);
  signal y_2_1_concat: unsigned((8 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  in3_1_35 <= std_logic_vector_to_unsigned(in3);
  in4_1_39 <= std_logic_vector_to_unsigned(in4);
  in5_1_43 <= std_logic_vector_to_unsigned(in5);
  in6_1_47 <= std_logic_vector_to_unsigned(in6);
  in7_1_51 <= std_logic_vector_to_unsigned(in7);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31) & unsigned_to_std_logic_vector(in3_1_35) & unsigned_to_std_logic_vector(in4_1_39) & unsigned_to_std_logic_vector(in5_1_43) & unsigned_to_std_logic_vector(in6_1_47) & unsigned_to_std_logic_vector(in7_1_51));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    in2 : in std_logic_vector((1 - 1) downto 0);
    in3 : in std_logic_vector((1 - 1) downto 0);
    in4 : in std_logic_vector((1 - 1) downto 0);
    in5 : in std_logic_vector((1 - 1) downto 0);
    in6 : in std_logic_vector((1 - 1) downto 0);
    in7 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_7673b9b993',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '2eb84ff698244fc551a8f5460673f212',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: unsigned((19 - 1) downto 0);
  signal output_port_5_5_force: signed((19 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port_5_5_force <= unsigned_to_signed(input_port_1_40);
  output_port <= signed_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((19 - 1) downto 0);
    output_port : out std_logic_vector((19 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_63700884f5',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '76d86ee412c87968e61aba6df7d2de99',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '2c9cc065093b3e10add60309f9d6059c',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b9a13b3376d3c3a4058e92e1d218c762',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: unsigned((19 - 1) downto 0);
  signal in1_1_27: unsigned((19 - 1) downto 0);
  signal y_2_1_concat: unsigned((38 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((19 - 1) downto 0);
    in1 : in std_logic_vector((19 - 1) downto 0);
    y : out std_logic_vector((38 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_5a12f8f9be',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'cc9ebeab8a93c50de8297b6e7312881b',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: signed((19 - 1) downto 0);
  signal output_port_5_5_force: unsigned((19 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port_5_5_force <= signed_to_unsigned(input_port_1_40);
  output_port <= unsigned_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((19 - 1) downto 0);
    output_port : out std_logic_vector((19 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_bc4405cd1e',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex5 Xilinx,_Inc. 10.0',
    '# 10.1.03i',
    'CSET ainit_value = 0',
    'CSET ce = true',
    'CSET count_mode = UP',
    'CSET fb_latency = 0',
    'CSET final_count_value = 1',
    'CSET implementation = Fabric',
    'CSET increment_value = 1',
    'CSET latency = 1',
    'CSET load = false',
    'CSET output_width = 8',
    'CSET restrict_count = false',
    'CSET sclr = false',
    'CSET sinit = true',
    'CSET sinit_value = 0',
    'CSET sset = false',
    'CSET sync_ce_priority = Sync_Overrides_CE',
    'CSET sync_threshold_output = false',
    'CSET syncctrlpriority = Reset_Overrides_Set',
    'CSET component_name = binary_counter_virtex5_10_0_01e34ae12479a5e1',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'e8d6be3c96510b63867dc7922f5e1a25',
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
      'core_name0' => 'binary_counter_virtex5_10_0_01e34ae12479a5e1',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '056def5ae08934388fe66bf98cc6275f',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal en_1_45: boolean;
  signal count_reg_20_23: unsigned((1 - 1) downto 0) := "0";
  signal count_reg_20_23_en: std_logic;
  signal count_reg_join_44_1: unsigned((2 - 1) downto 0);
  signal count_reg_join_44_1_en: std_logic;
begin
  en_1_45 <= ((en) = "1");
  proc_count_reg_20_23: process (clk)
  is
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (count_reg_20_23_en = \'1\')) then
        count_reg_20_23 <= count_reg_20_23 + std_logic_vector_to_unsigned("1");
      end if;
    end if;
  end process proc_count_reg_20_23;
  proc_if_44_1: process (count_reg_20_23, en_1_45)
  is
  begin
    if en_1_45 then
      count_reg_join_44_1_en <= \'1\';
    else 
      count_reg_join_44_1_en <= \'0\';
    end if;
  end process proc_if_44_1;
  count_reg_20_23_en <= count_reg_join_44_1_en;
  op <= unsigned_to_std_logic_vector(count_reg_20_23);
end',
      'crippled_entity' => 'is
  port (
    en : in std_logic_vector((1 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'counter_2943023fcf',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b1d1db366ed9c61e4bd3c7540b1c6181',
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
    'entity_declaration_hash' => 'b3b102473d6516f582b7159ee705e9d9',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: signed((1 - 1) downto 0);
  signal b_1_34: signed((8 - 1) downto 0);
  type array_type_op_mem_32_22 is array (0 to (1 - 1)) of boolean;
  signal op_mem_32_22: array_type_op_mem_32_22 := (
    0 => false);
  signal op_mem_32_22_front_din: boolean;
  signal op_mem_32_22_back: boolean;
  signal op_mem_32_22_push_front_pop_back_en: std_logic;
  signal cast_12_12: signed((8 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_signed(a);
  b_1_34 <= std_logic_vector_to_signed(b);
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
  cast_12_12 <= s2s_cast(a_1_31, 0, 8, 0);
  result_12_3_rel <= cast_12_12 = b_1_34;
  op_mem_32_22_front_din <= result_12_3_rel;
  op_mem_32_22_push_front_pop_back_en <= \'1\';
  op <= boolean_to_vector(op_mem_32_22_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((1 - 1) downto 0);
    b : in std_logic_vector((8 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_53c93d0689',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Block_Memory_Generator Virtex5 Xilinx,_Inc. 2.4',
    '# 10.1.03i',
    'CSET algorithm = Minimum_Area',
    'CSET assume_synchronous_clk = false',
    'CSET byte_size = 9',
    'CSET coe_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET collision_warnings = ALL',
    'CSET disable_collision_warnings = false',
    'CSET enable_a = Use_ENA_Pin',
    'CSET enable_b = Always_Enabled',
    'CSET load_init_file = TRUE',
    'CSET memory_type = Single_Port_RAM',
    'CSET operating_mode_a = READ_FIRST',
    'CSET operating_mode_b = WRITE_FIRST',
    'CSET output_reset_value_a = 0',
    'CSET output_reset_value_b = 0',
    'CSET primitive = 8kx2',
    'CSET read_width_a = 19',
    'CSET read_width_b = 19',
    'CSET register_output_of_memory_core = false',
    'CSET register_output_of_memory_primitives = false',
    'CSET remaining_memory_locations = 0',
    'CSET use_byte_write_enable = false',
    'CSET use_regcea_pin = false',
    'CSET use_regceb_pin = false',
    'CSET use_ssra_pin = FALSE',
    'CSET use_ssrb_pin = FALSE',
    'CSET write_depth_a = 256',
    'CSET write_width_a = 19',
    'CSET write_width_b = 19',
    'CSET component_name = bmg_24_vx5_cd3584ee10cade7e',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '2cf8bc8e23527b4622502e20cfcdb436',
    'sourceFile' => 'hdl/xlspram.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      dina: in std_logic_vector(c_width - 1 downto 0);
      wea: in std_logic_vector(0 downto 0);
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addra => addr,
        clka => clk,
        dina => data_in,
        wea(0) => core_we,
        ena => core_ce,
        douta => core_data_out',
      'core_name0' => 'bmg_24_vx5_cd3584ee10cade7e',
      'entity_name.0' => 'xlspram',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex5 Xilinx,_Inc. 10.0',
    '# 10.1.03i',
    'CSET ainit_value = 0',
    'CSET ce = true',
    'CSET count_mode = UP',
    'CSET fb_latency = 0',
    'CSET final_count_value = 1',
    'CSET implementation = Fabric',
    'CSET increment_value = 1',
    'CSET latency = 1',
    'CSET load = false',
    'CSET output_width = 8',
    'CSET restrict_count = false',
    'CSET sclr = false',
    'CSET sinit = true',
    'CSET sinit_value = 0',
    'CSET sset = false',
    'CSET sync_ce_priority = Sync_Overrides_CE',
    'CSET sync_threshold_output = false',
    'CSET syncctrlpriority = Reset_Overrides_Set',
    'CSET component_name = binary_counter_virtex5_10_0_01e34ae12479a5e1',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '3e9e0b620998f3f812b94a75c7afa01d',
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
      'core_name0' => 'binary_counter_virtex5_10_0_01e34ae12479a5e1',
      'entity_name.0' => 'xlcounter_limit',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex5 Xilinx,_Inc. 10.0',
    '# 10.1.03i',
    'CSET ainit_value = 0',
    'CSET ce = true',
    'CSET count_mode = UP',
    'CSET fb_latency = 0',
    'CSET final_count_value = 1',
    'CSET implementation = Fabric',
    'CSET increment_value = 1',
    'CSET latency = 1',
    'CSET load = false',
    'CSET output_width = 9',
    'CSET restrict_count = false',
    'CSET sclr = false',
    'CSET sinit = true',
    'CSET sinit_value = 0',
    'CSET sset = false',
    'CSET sync_ce_priority = Sync_Overrides_CE',
    'CSET sync_threshold_output = false',
    'CSET syncctrlpriority = Reset_Overrides_Set',
    'CSET component_name = binary_counter_virtex5_10_0_1c25d2b550c5fffc',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '7709083f8a890dc0029f50d8d49e8433',
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
      'core_name0' => 'binary_counter_virtex5_10_0_1c25d2b550c5fffc',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '77dd775673805b081cf832b30eac9a3d',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((38 - 1) downto 0);
  signal d1_1_27: std_logic_vector((38 - 1) downto 0);
  type array_type_pipe_16_22 is array (0 to (1 - 1)) of std_logic_vector((38 - 1) downto 0);
  signal pipe_16_22: array_type_pipe_16_22 := (
    0 => "00000000000000000000000000000000000000");
  signal pipe_16_22_front_din: std_logic_vector((38 - 1) downto 0);
  signal pipe_16_22_back: std_logic_vector((38 - 1) downto 0);
  signal pipe_16_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((38 - 1) downto 0);
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
    d0 : in std_logic_vector((38 - 1) downto 0);
    d1 : in std_logic_vector((38 - 1) downto 0);
    y : out std_logic_vector((38 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_79b7e15c26',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'e5fdf464f388655feaa73ce6642e5c47',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'eb97c5ecf8da24c75040c61091453d07',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex5 Xilinx,_Inc. 10.0',
    '# 10.1.03i',
    'CSET ainit_value = 0',
    'CSET ce = true',
    'CSET count_mode = UP',
    'CSET fb_latency = 0',
    'CSET final_count_value = 1',
    'CSET implementation = Fabric',
    'CSET increment_value = 1',
    'CSET latency = 1',
    'CSET load = false',
    'CSET output_width = 9',
    'CSET restrict_count = false',
    'CSET sclr = false',
    'CSET sinit = true',
    'CSET sinit_value = 0',
    'CSET sset = false',
    'CSET sync_ce_priority = Sync_Overrides_CE',
    'CSET sync_threshold_output = false',
    'CSET syncctrlpriority = Reset_Overrides_Set',
    'CSET component_name = binary_counter_virtex5_10_0_1c25d2b550c5fffc',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '787f83e43f40be5559b3e8d2fbb67e69',
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
      'core_name0' => 'binary_counter_virtex5_10_0_1c25d2b550c5fffc',
      'entity_name.0' => 'xlcounter_limit',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Block_Memory_Generator Virtex5 Xilinx,_Inc. 2.4',
    '# 10.1.03i',
    'CSET algorithm = Minimum_Area',
    'CSET assume_synchronous_clk = false',
    'CSET byte_size = 9',
    'CSET coe_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET collision_warnings = ALL',
    'CSET disable_collision_warnings = false',
    'CSET enable_a = Use_ENA_Pin',
    'CSET enable_b = Always_Enabled',
    'CSET load_init_file = TRUE',
    'CSET memory_type = Single_Port_RAM',
    'CSET operating_mode_a = READ_FIRST',
    'CSET operating_mode_b = WRITE_FIRST',
    'CSET output_reset_value_a = 0',
    'CSET output_reset_value_b = 0',
    'CSET primitive = 8kx2',
    'CSET read_width_a = 19',
    'CSET read_width_b = 19',
    'CSET register_output_of_memory_core = false',
    'CSET register_output_of_memory_primitives = false',
    'CSET remaining_memory_locations = 0',
    'CSET use_byte_write_enable = false',
    'CSET use_regcea_pin = false',
    'CSET use_regceb_pin = false',
    'CSET use_ssra_pin = FALSE',
    'CSET use_ssrb_pin = FALSE',
    'CSET write_depth_a = 512',
    'CSET write_width_a = 19',
    'CSET write_width_b = 19',
    'CSET component_name = bmg_24_vx5_941504d2ced01311',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c24d8dfd39f25cb6cc4474f0361e89dc',
    'sourceFile' => 'hdl/xlspram.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      dina: in std_logic_vector(c_width - 1 downto 0);
      wea: in std_logic_vector(0 downto 0);
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addra => addr,
        clka => clk,
        dina => data_in,
        wea(0) => core_we,
        ena => core_ce,
        douta => core_data_out',
      'core_name0' => 'bmg_24_vx5_941504d2ced01311',
      'entity_name.0' => 'xlspram',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex5 Xilinx,_Inc. 10.0',
    '# 10.1.03i',
    'CSET ainit_value = 0',
    'CSET ce = true',
    'CSET count_mode = UP',
    'CSET fb_latency = 0',
    'CSET final_count_value = 1',
    'CSET implementation = Fabric',
    'CSET increment_value = 1',
    'CSET latency = 1',
    'CSET load = false',
    'CSET output_width = 10',
    'CSET restrict_count = false',
    'CSET sclr = false',
    'CSET sinit = true',
    'CSET sinit_value = 0',
    'CSET sset = false',
    'CSET sync_ce_priority = Sync_Overrides_CE',
    'CSET sync_threshold_output = false',
    'CSET syncctrlpriority = Reset_Overrides_Set',
    'CSET component_name = binary_counter_virtex5_10_0_1ee993c8ed57b9ce',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b4f60ca0729199061576197a6459a545',
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
      'core_name0' => 'binary_counter_virtex5_10_0_1ee993c8ed57b9ce',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '9ffad4d3aa86de920f5e69febd8c8964',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '6a73f6296487e47aeb112e309c3556de',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Block_Memory_Generator Virtex5 Xilinx,_Inc. 2.4',
    '# 10.1.03i',
    'CSET algorithm = Minimum_Area',
    'CSET assume_synchronous_clk = false',
    'CSET byte_size = 9',
    'CSET coe_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET collision_warnings = ALL',
    'CSET disable_collision_warnings = false',
    'CSET enable_a = Use_ENA_Pin',
    'CSET enable_b = Always_Enabled',
    'CSET load_init_file = TRUE',
    'CSET memory_type = Single_Port_RAM',
    'CSET operating_mode_a = READ_FIRST',
    'CSET operating_mode_b = WRITE_FIRST',
    'CSET output_reset_value_a = 0',
    'CSET output_reset_value_b = 0',
    'CSET primitive = 8kx2',
    'CSET read_width_a = 18',
    'CSET read_width_b = 18',
    'CSET register_output_of_memory_core = false',
    'CSET register_output_of_memory_primitives = false',
    'CSET remaining_memory_locations = 0',
    'CSET use_byte_write_enable = false',
    'CSET use_regcea_pin = false',
    'CSET use_regceb_pin = false',
    'CSET use_ssra_pin = FALSE',
    'CSET use_ssrb_pin = FALSE',
    'CSET write_depth_a = 256',
    'CSET write_width_a = 18',
    'CSET write_width_b = 18',
    'CSET component_name = bmg_24_vx5_b56a7cdaabc490ac',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '66ce98f860531f9d5cac3643c4c68147',
    'sourceFile' => 'hdl/xlspram.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      dina: in std_logic_vector(c_width - 1 downto 0);
      wea: in std_logic_vector(0 downto 0);
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addra => addr,
        clka => clk,
        dina => data_in,
        wea(0) => core_we,
        ena => core_ce,
        douta => core_data_out',
      'core_name0' => 'bmg_24_vx5_b56a7cdaabc490ac',
      'entity_name.0' => 'xlspram',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '4ea3343259534f2ab735322ff3a76128',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((18 - 1) downto 0);
  signal d1_1_27: std_logic_vector((18 - 1) downto 0);
  type array_type_pipe_16_22 is array (0 to (1 - 1)) of std_logic_vector((18 - 1) downto 0);
  signal pipe_16_22: array_type_pipe_16_22 := (
    0 => "000000000000000000");
  signal pipe_16_22_front_din: std_logic_vector((18 - 1) downto 0);
  signal pipe_16_22_back: std_logic_vector((18 - 1) downto 0);
  signal pipe_16_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((18 - 1) downto 0);
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
    d0 : in std_logic_vector((18 - 1) downto 0);
    d1 : in std_logic_vector((18 - 1) downto 0);
    y : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_181e58d842',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Block_Memory_Generator Virtex5 Xilinx,_Inc. 2.4',
    '# 10.1.03i',
    'CSET algorithm = Minimum_Area',
    'CSET assume_synchronous_clk = false',
    'CSET byte_size = 9',
    'CSET coe_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET collision_warnings = ALL',
    'CSET disable_collision_warnings = false',
    'CSET enable_a = Use_ENA_Pin',
    'CSET enable_b = Always_Enabled',
    'CSET load_init_file = TRUE',
    'CSET memory_type = Single_Port_RAM',
    'CSET operating_mode_a = READ_FIRST',
    'CSET operating_mode_b = WRITE_FIRST',
    'CSET output_reset_value_a = 0',
    'CSET output_reset_value_b = 0',
    'CSET primitive = 8kx2',
    'CSET read_width_a = 18',
    'CSET read_width_b = 18',
    'CSET register_output_of_memory_core = false',
    'CSET register_output_of_memory_primitives = false',
    'CSET remaining_memory_locations = 0',
    'CSET use_byte_write_enable = false',
    'CSET use_regcea_pin = false',
    'CSET use_regceb_pin = false',
    'CSET use_ssra_pin = FALSE',
    'CSET use_ssrb_pin = FALSE',
    'CSET write_depth_a = 512',
    'CSET write_width_a = 18',
    'CSET write_width_b = 18',
    'CSET component_name = bmg_24_vx5_0206823b131149d8',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'bfae52aeafd0dcfbc5c4a8aff3e74098',
    'sourceFile' => 'hdl/xlspram.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      dina: in std_logic_vector(c_width - 1 downto 0);
      wea: in std_logic_vector(0 downto 0);
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addra => addr,
        clka => clk,
        dina => data_in,
        wea(0) => core_we,
        ena => core_ce,
        douta => core_data_out',
      'core_name0' => 'bmg_24_vx5_0206823b131149d8',
      'entity_name.0' => 'xlspram',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '6d96abe9b314d8d22301dd65c15c8786',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: unsigned((9 - 1) downto 0);
  signal output_port_5_5_force: signed((9 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port_5_5_force <= unsigned_to_signed(input_port_1_40);
  output_port <= signed_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((9 - 1) downto 0);
    output_port : out std_logic_vector((9 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_ceef4fc23d',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '5de199eb79967092e9e42a3a82344af6',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '7ac604a43dc6748f08a7e5da59f50f55',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '798de277022ff038420c935e0e6f49c1',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: unsigned((10 - 1) downto 0);
  signal in1_1_27: unsigned((10 - 1) downto 0);
  signal y_2_1_concat: unsigned((20 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((10 - 1) downto 0);
    in1 : in std_logic_vector((10 - 1) downto 0);
    y : out std_logic_vector((20 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_9d608cd669',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '68576e8f1e7b1a2d5262802fe7c23793',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: signed((10 - 1) downto 0);
  signal output_port_5_5_force: unsigned((10 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port_5_5_force <= signed_to_unsigned(input_port_1_40);
  output_port <= unsigned_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((10 - 1) downto 0);
    output_port : out std_logic_vector((10 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_e2e786e1ed',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '90b906c48d7767e302bf5c59d9fc7fc9',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((9 - 1) downto 0);
  signal b_17_35: signed((9 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((10 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "0000000000");
  signal op_mem_91_20_front_din: signed((10 - 1) downto 0);
  signal op_mem_91_20_back: signed((10 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_69_18: signed((10 - 1) downto 0);
  signal cast_69_22: signed((10 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((10 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_69_18 <= s2s_cast(a_17_32, 0, 10, 0);
  cast_69_22 <= s2s_cast(b_17_35, 0, 10, 0);
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
    a : in std_logic_vector((9 - 1) downto 0);
    b : in std_logic_vector((9 - 1) downto 0);
    s : out std_logic_vector((10 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_793ae25d23',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '7c77c01eb00878178ae98e90638546dc',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '136a54ae284c25a72dac40e8fca55415',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal ip_17_23: signed((10 - 1) downto 0);
begin
  ip_17_23 <= std_logic_vector_to_signed(ip);
  op <= signed_to_std_logic_vector(ip_17_23);
end',
      'crippled_entity' => 'is
  port (
    ip : in std_logic_vector((10 - 1) downto 0);
    op : out std_logic_vector((10 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'scale_6d627f2811',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '0da0213e36c9a562eeb2a1a8acc079d0',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((9 - 1) downto 0);
  signal b_17_35: signed((9 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((10 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "0000000000");
  signal op_mem_91_20_front_din: signed((10 - 1) downto 0);
  signal op_mem_91_20_back: signed((10 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_71_18: signed((10 - 1) downto 0);
  signal cast_71_22: signed((10 - 1) downto 0);
  signal internal_s_71_5_addsub: signed((10 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_71_18 <= s2s_cast(a_17_32, 0, 10, 0);
  cast_71_22 <= s2s_cast(b_17_35, 0, 10, 0);
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
    a : in std_logic_vector((9 - 1) downto 0);
    b : in std_logic_vector((9 - 1) downto 0);
    s : out std_logic_vector((10 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_3700bc31ba',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '181f2305f40785a92b7fc7fd2e80e89e',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: unsigned((10 - 1) downto 0);
  signal output_port_5_5_force: signed((10 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port_5_5_force <= unsigned_to_signed(input_port_1_40);
  output_port <= signed_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((10 - 1) downto 0);
    output_port : out std_logic_vector((10 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_a5a2f0dd62',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '41ecc3bbb1c91bdaa6e15933d0cf4a38',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '0e69b3a1f6d985cfd58aca3d5f3bf22d',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '2d3e1fc04c920c1e2088ee7f9c4e6690',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: unsigned((11 - 1) downto 0);
  signal in1_1_27: unsigned((11 - 1) downto 0);
  signal y_2_1_concat: unsigned((22 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((11 - 1) downto 0);
    in1 : in std_logic_vector((11 - 1) downto 0);
    y : out std_logic_vector((22 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_a9f0cfc482',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '9a33572343f5b433037ec9d85337573a',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: signed((11 - 1) downto 0);
  signal output_port_5_5_force: unsigned((11 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port_5_5_force <= signed_to_unsigned(input_port_1_40);
  output_port <= unsigned_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((11 - 1) downto 0);
    output_port : out std_logic_vector((11 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_d517af3309',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'de6e24d305a0ed4076f31de462f8aecf',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((10 - 1) downto 0);
  signal b_17_35: signed((10 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((11 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "00000000000");
  signal op_mem_91_20_front_din: signed((11 - 1) downto 0);
  signal op_mem_91_20_back: signed((11 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_69_18: signed((11 - 1) downto 0);
  signal cast_69_22: signed((11 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((11 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_69_18 <= s2s_cast(a_17_32, 0, 11, 0);
  cast_69_22 <= s2s_cast(b_17_35, 0, 11, 0);
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
    a : in std_logic_vector((10 - 1) downto 0);
    b : in std_logic_vector((10 - 1) downto 0);
    s : out std_logic_vector((11 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_74b65e93f7',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'bb9f9a075b755f28139d993a09ecb941',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '018ec80ad96892cfc17ef1d6fd3c3d86',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal ip_17_23: signed((11 - 1) downto 0);
begin
  ip_17_23 <= std_logic_vector_to_signed(ip);
  op <= signed_to_std_logic_vector(ip_17_23);
end',
      'crippled_entity' => 'is
  port (
    ip : in std_logic_vector((11 - 1) downto 0);
    op : out std_logic_vector((11 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'scale_1a387a5a22',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd855e8888bbe4a969242ccf3a9c62c7b',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((10 - 1) downto 0);
  signal b_17_35: signed((10 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((11 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "00000000000");
  signal op_mem_91_20_front_din: signed((11 - 1) downto 0);
  signal op_mem_91_20_back: signed((11 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_71_18: signed((11 - 1) downto 0);
  signal cast_71_22: signed((11 - 1) downto 0);
  signal internal_s_71_5_addsub: signed((11 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_71_18 <= s2s_cast(a_17_32, 0, 11, 0);
  cast_71_22 <= s2s_cast(b_17_35, 0, 11, 0);
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
    a : in std_logic_vector((10 - 1) downto 0);
    b : in std_logic_vector((10 - 1) downto 0);
    s : out std_logic_vector((11 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_89c5949a28',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '4ec66f71f23aafe35bab5e171111624b',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: unsigned((11 - 1) downto 0);
  signal output_port_5_5_force: signed((11 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port_5_5_force <= unsigned_to_signed(input_port_1_40);
  output_port <= signed_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((11 - 1) downto 0);
    output_port : out std_logic_vector((11 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_41416f6188',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ba4c654fafe8a0e85c792f1cbb86d0a6',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd444149ed72ec035e3464b293a95d90b',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex5 Xilinx,_Inc. 10.0',
    '# 10.1.03i',
    'CSET ainit_value = 0',
    'CSET ce = true',
    'CSET count_mode = UP',
    'CSET fb_latency = 0',
    'CSET final_count_value = 1',
    'CSET implementation = Fabric',
    'CSET increment_value = 1',
    'CSET latency = 1',
    'CSET load = false',
    'CSET output_width = 6',
    'CSET restrict_count = false',
    'CSET sclr = false',
    'CSET sinit = true',
    'CSET sinit_value = 0',
    'CSET sset = false',
    'CSET sync_ce_priority = Sync_Overrides_CE',
    'CSET sync_threshold_output = false',
    'CSET syncctrlpriority = Reset_Overrides_Set',
    'CSET component_name = binary_counter_virtex5_10_0_fe346e03af2452eb',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c687af05cee73630d14717dbb780cb0a',
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
      'core_name0' => 'binary_counter_virtex5_10_0_fe346e03af2452eb',
      'entity_name.0' => 'xlcounter_limit',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Block_Memory_Generator Virtex5 Xilinx,_Inc. 2.4',
    '# 10.1.03i',
    'CSET algorithm = Minimum_Area',
    'CSET assume_synchronous_clk = false',
    'CSET byte_size = 9',
    'CSET coe_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET collision_warnings = ALL',
    'CSET disable_collision_warnings = false',
    'CSET enable_a = Use_ENA_Pin',
    'CSET enable_b = Always_Enabled',
    'CSET load_init_file = TRUE',
    'CSET memory_type = Single_Port_RAM',
    'CSET operating_mode_a = READ_FIRST',
    'CSET operating_mode_b = WRITE_FIRST',
    'CSET output_reset_value_a = 0',
    'CSET output_reset_value_b = 0',
    'CSET primitive = 8kx2',
    'CSET read_width_a = 11',
    'CSET read_width_b = 11',
    'CSET register_output_of_memory_core = false',
    'CSET register_output_of_memory_primitives = false',
    'CSET remaining_memory_locations = 0',
    'CSET use_byte_write_enable = false',
    'CSET use_regcea_pin = false',
    'CSET use_regceb_pin = false',
    'CSET use_ssra_pin = FALSE',
    'CSET use_ssrb_pin = FALSE',
    'CSET write_depth_a = 64',
    'CSET write_width_a = 11',
    'CSET write_width_b = 11',
    'CSET component_name = bmg_24_vx5_94232660d90f6688',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ca2fb2cabc9f5d1404179f6f0862539f',
    'sourceFile' => 'hdl/xlspram.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      dina: in std_logic_vector(c_width - 1 downto 0);
      wea: in std_logic_vector(0 downto 0);
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addra => addr,
        clka => clk,
        dina => data_in,
        wea(0) => core_we,
        ena => core_ce,
        douta => core_data_out',
      'core_name0' => 'bmg_24_vx5_94232660d90f6688',
      'entity_name.0' => 'xlspram',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex5 Xilinx,_Inc. 10.0',
    '# 10.1.03i',
    'CSET ainit_value = 0',
    'CSET ce = true',
    'CSET count_mode = UP',
    'CSET fb_latency = 0',
    'CSET final_count_value = 1',
    'CSET implementation = Fabric',
    'CSET increment_value = 1',
    'CSET latency = 1',
    'CSET load = false',
    'CSET output_width = 7',
    'CSET restrict_count = false',
    'CSET sclr = false',
    'CSET sinit = true',
    'CSET sinit_value = 0',
    'CSET sset = false',
    'CSET sync_ce_priority = Sync_Overrides_CE',
    'CSET sync_threshold_output = false',
    'CSET syncctrlpriority = Reset_Overrides_Set',
    'CSET component_name = binary_counter_virtex5_10_0_722dc5ef3883365e',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '95919f4b080cc9be5830af4333cecc5d',
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
      'core_name0' => 'binary_counter_virtex5_10_0_722dc5ef3883365e',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '0f889cccfd8996a4c7ca66d88e4f7bc1',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((22 - 1) downto 0);
  signal d1_1_27: std_logic_vector((22 - 1) downto 0);
  type array_type_pipe_16_22 is array (0 to (1 - 1)) of std_logic_vector((22 - 1) downto 0);
  signal pipe_16_22: array_type_pipe_16_22 := (
    0 => "0000000000000000000000");
  signal pipe_16_22_front_din: std_logic_vector((22 - 1) downto 0);
  signal pipe_16_22_back: std_logic_vector((22 - 1) downto 0);
  signal pipe_16_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((22 - 1) downto 0);
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
    d0 : in std_logic_vector((22 - 1) downto 0);
    d1 : in std_logic_vector((22 - 1) downto 0);
    y : out std_logic_vector((22 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_c83be1b493',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '52d14bae6c47137d840841f987913027',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'de177e04630d00197c7c90e12c7aede0',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex5 Xilinx,_Inc. 10.0',
    '# 10.1.03i',
    'CSET ainit_value = 0',
    'CSET ce = true',
    'CSET count_mode = UP',
    'CSET fb_latency = 0',
    'CSET final_count_value = 1',
    'CSET implementation = Fabric',
    'CSET increment_value = 1',
    'CSET latency = 1',
    'CSET load = false',
    'CSET output_width = 7',
    'CSET restrict_count = false',
    'CSET sclr = false',
    'CSET sinit = true',
    'CSET sinit_value = 0',
    'CSET sset = false',
    'CSET sync_ce_priority = Sync_Overrides_CE',
    'CSET sync_threshold_output = false',
    'CSET syncctrlpriority = Reset_Overrides_Set',
    'CSET component_name = binary_counter_virtex5_10_0_722dc5ef3883365e',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '350921019b6cb8e58018e1a3b9d2baff',
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
      'core_name0' => 'binary_counter_virtex5_10_0_722dc5ef3883365e',
      'entity_name.0' => 'xlcounter_limit',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Block_Memory_Generator Virtex5 Xilinx,_Inc. 2.4',
    '# 10.1.03i',
    'CSET algorithm = Minimum_Area',
    'CSET assume_synchronous_clk = false',
    'CSET byte_size = 9',
    'CSET coe_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET collision_warnings = ALL',
    'CSET disable_collision_warnings = false',
    'CSET enable_a = Use_ENA_Pin',
    'CSET enable_b = Always_Enabled',
    'CSET load_init_file = TRUE',
    'CSET memory_type = Single_Port_RAM',
    'CSET operating_mode_a = READ_FIRST',
    'CSET operating_mode_b = WRITE_FIRST',
    'CSET output_reset_value_a = 0',
    'CSET output_reset_value_b = 0',
    'CSET primitive = 8kx2',
    'CSET read_width_a = 11',
    'CSET read_width_b = 11',
    'CSET register_output_of_memory_core = false',
    'CSET register_output_of_memory_primitives = false',
    'CSET remaining_memory_locations = 0',
    'CSET use_byte_write_enable = false',
    'CSET use_regcea_pin = false',
    'CSET use_regceb_pin = false',
    'CSET use_ssra_pin = FALSE',
    'CSET use_ssrb_pin = FALSE',
    'CSET write_depth_a = 128',
    'CSET write_width_a = 11',
    'CSET write_width_b = 11',
    'CSET component_name = bmg_24_vx5_491b66ad487fb1cf',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f76482de4f80f5526245b6bcc8a4f0e1',
    'sourceFile' => 'hdl/xlspram.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      dina: in std_logic_vector(c_width - 1 downto 0);
      wea: in std_logic_vector(0 downto 0);
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addra => addr,
        clka => clk,
        dina => data_in,
        wea(0) => core_we,
        ena => core_ce,
        douta => core_data_out',
      'core_name0' => 'bmg_24_vx5_491b66ad487fb1cf',
      'entity_name.0' => 'xlspram',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '92081f9472367a74e46a46f4591fe7b1',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'eccb7832f114042b96704746e7dc3672',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: unsigned((12 - 1) downto 0);
  signal in1_1_27: unsigned((12 - 1) downto 0);
  signal y_2_1_concat: unsigned((24 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((12 - 1) downto 0);
    in1 : in std_logic_vector((12 - 1) downto 0);
    y : out std_logic_vector((24 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_6188124172',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a63d3fec6823d3d8953b8310760e7e98',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: signed((12 - 1) downto 0);
  signal output_port_5_5_force: unsigned((12 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port_5_5_force <= signed_to_unsigned(input_port_1_40);
  output_port <= unsigned_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((12 - 1) downto 0);
    output_port : out std_logic_vector((12 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_a106f99236',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '4a799d4fb98a8a07ba1e78379c0df199',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((11 - 1) downto 0);
  signal b_17_35: signed((11 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((12 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "000000000000");
  signal op_mem_91_20_front_din: signed((12 - 1) downto 0);
  signal op_mem_91_20_back: signed((12 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_69_18: signed((12 - 1) downto 0);
  signal cast_69_22: signed((12 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((12 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_69_18 <= s2s_cast(a_17_32, 0, 12, 0);
  cast_69_22 <= s2s_cast(b_17_35, 0, 12, 0);
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
    a : in std_logic_vector((11 - 1) downto 0);
    b : in std_logic_vector((11 - 1) downto 0);
    s : out std_logic_vector((12 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_470ffe01d4',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '3a9a32a8d9d31cff753140da44dae3c3',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'e8e9d1eef414c2bb73d58eedc1f8e36b',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal ip_17_23: signed((12 - 1) downto 0);
begin
  ip_17_23 <= std_logic_vector_to_signed(ip);
  op <= signed_to_std_logic_vector(ip_17_23);
end',
      'crippled_entity' => 'is
  port (
    ip : in std_logic_vector((12 - 1) downto 0);
    op : out std_logic_vector((12 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'scale_38e99696aa',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '8b4d88b6697b17f77605d60bfc14316d',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((11 - 1) downto 0);
  signal b_17_35: signed((11 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((12 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "000000000000");
  signal op_mem_91_20_front_din: signed((12 - 1) downto 0);
  signal op_mem_91_20_back: signed((12 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_71_18: signed((12 - 1) downto 0);
  signal cast_71_22: signed((12 - 1) downto 0);
  signal internal_s_71_5_addsub: signed((12 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_71_18 <= s2s_cast(a_17_32, 0, 12, 0);
  cast_71_22 <= s2s_cast(b_17_35, 0, 12, 0);
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
    a : in std_logic_vector((11 - 1) downto 0);
    b : in std_logic_vector((11 - 1) downto 0);
    s : out std_logic_vector((12 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_388a97573b',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '3c66ba4b13bf36b801740d538a381084',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: unsigned((12 - 1) downto 0);
  signal output_port_5_5_force: signed((12 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port_5_5_force <= unsigned_to_signed(input_port_1_40);
  output_port <= signed_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((12 - 1) downto 0);
    output_port : out std_logic_vector((12 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_8f5500aea5',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '5cee4997d7b22ceaae4a401caaf60a4e',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '1ea11c42a6b03026a5f36a2659124bf0',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '58e893d253dc22a21c656cc4abde5430',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: unsigned((13 - 1) downto 0);
  signal in1_1_27: unsigned((13 - 1) downto 0);
  signal y_2_1_concat: unsigned((26 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((13 - 1) downto 0);
    in1 : in std_logic_vector((13 - 1) downto 0);
    y : out std_logic_vector((26 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_4720648850',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ffad7aa2d9d5a97e07a31357a822bb00',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: signed((13 - 1) downto 0);
  signal output_port_5_5_force: unsigned((13 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port_5_5_force <= signed_to_unsigned(input_port_1_40);
  output_port <= unsigned_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((13 - 1) downto 0);
    output_port : out std_logic_vector((13 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_18554b6b75',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'fba5481a5221cb0563dbd5ad3c4e96e8',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((12 - 1) downto 0);
  signal b_17_35: signed((12 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((13 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "0000000000000");
  signal op_mem_91_20_front_din: signed((13 - 1) downto 0);
  signal op_mem_91_20_back: signed((13 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_69_18: signed((13 - 1) downto 0);
  signal cast_69_22: signed((13 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((13 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_69_18 <= s2s_cast(a_17_32, 0, 13, 0);
  cast_69_22 <= s2s_cast(b_17_35, 0, 13, 0);
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
    a : in std_logic_vector((12 - 1) downto 0);
    b : in std_logic_vector((12 - 1) downto 0);
    s : out std_logic_vector((13 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_ed74d532a0',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '3f8700a6a54c87894778547f79c5f395',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '979fab83e65e1a25e6e3f7b8cc4825e2',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal ip_17_23: signed((13 - 1) downto 0);
begin
  ip_17_23 <= std_logic_vector_to_signed(ip);
  op <= signed_to_std_logic_vector(ip_17_23);
end',
      'crippled_entity' => 'is
  port (
    ip : in std_logic_vector((13 - 1) downto 0);
    op : out std_logic_vector((13 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'scale_d11c4b5145',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b5aaf93447320882c13effa644df0959',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((12 - 1) downto 0);
  signal b_17_35: signed((12 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((13 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "0000000000000");
  signal op_mem_91_20_front_din: signed((13 - 1) downto 0);
  signal op_mem_91_20_back: signed((13 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_71_18: signed((13 - 1) downto 0);
  signal cast_71_22: signed((13 - 1) downto 0);
  signal internal_s_71_5_addsub: signed((13 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_71_18 <= s2s_cast(a_17_32, 0, 13, 0);
  cast_71_22 <= s2s_cast(b_17_35, 0, 13, 0);
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
    a : in std_logic_vector((12 - 1) downto 0);
    b : in std_logic_vector((12 - 1) downto 0);
    s : out std_logic_vector((13 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_f11535f968',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '6241d85b9a4463f97ff6f15c871f38ce',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f0f3f1d610dc9826fdfc95bcc60a7128',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '74e6cd75faec33b229e49c22e5a3d095',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((11 - 1) downto 0);
  signal b_17_35: signed((11 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((12 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "000000000000");
  signal op_mem_91_20_front_din: signed((12 - 1) downto 0);
  signal op_mem_91_20_back: signed((12 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_69_18: signed((12 - 1) downto 0);
  signal cast_69_22: signed((12 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((12 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_69_18 <= s2s_cast(a_17_32, 10, 12, 10);
  cast_69_22 <= s2s_cast(b_17_35, 10, 12, 10);
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
    a : in std_logic_vector((11 - 1) downto 0);
    b : in std_logic_vector((11 - 1) downto 0);
    s : out std_logic_vector((12 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_d661929060',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '0e85f83c2fddfccebdb28c59243d9f66',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert_pipeline.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Multiplier Virtex5 Xilinx,_Inc. 10.1',
    '# 10.1.03i',
    'CSET ccmimp = Distributed_Memory',
    'CSET clockenable = true',
    'CSET constvalue = 129',
    'CSET internaluser = 0',
    'CSET multiplier_construction = Use_Mults',
    'CSET multtype = Parallel_Multiplier',
    'CSET optgoal = Speed',
    'CSET outputwidthhigh = 19',
    'CSET outputwidthlow = 0',
    'CSET pipestages = 3',
    'CSET portatype = Signed',
    'CSET portawidth = 11',
    'CSET portbtype = Signed',
    'CSET portbwidth = 9',
    'CSET roundpoint = 0',
    'CSET sclrcepriority = CE_Overrides_SCLR',
    'CSET syncclear = true',
    'CSET use_custom_output_width = false',
    'CSET userounding = false',
    'CSET zerodetect = false',
    'CSET component_name = multiplier_virtex5_10_1_b0c844385805a270',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b8b0e61de0b6bce7cc5f9da7c571932a',
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
      'core_name0' => 'multiplier_virtex5_10_1_b0c844385805a270',
      'entity_name.0' => 'xlmult_v9_0',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '84dcc10abaa872dcf0af1e07a7d630bc',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((18 - 1) downto 0);
  signal b_17_35: signed((18 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((18 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "000000000000000000");
  signal op_mem_91_20_front_din: signed((18 - 1) downto 0);
  signal op_mem_91_20_back: signed((18 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
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
  signal cast_internal_s_83_3_convert: signed((18 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_internal_s_83_3_convert <= s2s_cast(internal_s_69_5_addsub, 17, 18, 17);
  op_mem_91_20_front_din <= cast_internal_s_83_3_convert;
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
    s : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_c8df442ec4',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd62c67559561ef098b732a008fecc145',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((18 - 1) downto 0);
  signal b_17_35: signed((18 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (2 - 1)) of signed((18 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    "000000000000000000",
    "000000000000000000");
  signal op_mem_91_20_front_din: signed((18 - 1) downto 0);
  signal op_mem_91_20_back: signed((18 - 1) downto 0);
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
  signal cast_internal_s_83_3_convert: signed((18 - 1) downto 0);
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
  cast_internal_s_83_3_convert <= s2s_cast(internal_s_71_5_addsub, 17, 18, 17);
  op_mem_91_20_front_din <= cast_internal_s_83_3_convert;
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
    s : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_6dd6aca36b',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '708c3e84e63c4bdb47347ba79475cce9',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((18 - 1) downto 0);
  signal b_17_35: signed((18 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((18 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "000000000000000000");
  signal op_mem_91_20_front_din: signed((18 - 1) downto 0);
  signal op_mem_91_20_back: signed((18 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
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
  signal cast_internal_s_83_3_convert: signed((18 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_internal_s_83_3_convert <= s2s_cast(internal_s_71_5_addsub, 17, 18, 17);
  op_mem_91_20_front_din <= cast_internal_s_83_3_convert;
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
    s : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_21a1218bfe',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Multiplier Virtex5 Xilinx,_Inc. 10.1',
    '# 10.1.03i',
    'CSET ccmimp = Distributed_Memory',
    'CSET clockenable = true',
    'CSET constvalue = 129',
    'CSET internaluser = 0',
    'CSET multiplier_construction = Use_Mults',
    'CSET multtype = Parallel_Multiplier',
    'CSET optgoal = Speed',
    'CSET outputwidthhigh = 21',
    'CSET outputwidthlow = 0',
    'CSET pipestages = 3',
    'CSET portatype = Signed',
    'CSET portawidth = 12',
    'CSET portbtype = Signed',
    'CSET portbwidth = 10',
    'CSET roundpoint = 0',
    'CSET sclrcepriority = CE_Overrides_SCLR',
    'CSET syncclear = true',
    'CSET use_custom_output_width = false',
    'CSET userounding = false',
    'CSET zerodetect = false',
    'CSET component_name = multiplier_virtex5_10_1_c90585d1a7e9d3a6',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '00d5146c17a1bdaafffebfdcb240a7e2',
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
      'core_name0' => 'multiplier_virtex5_10_1_c90585d1a7e9d3a6',
      'entity_name.0' => 'xlmult_v9_0',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ba575ccabab78d99e7cde4e4e9245c50',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((9 - 1) downto 0);
  signal b_17_35: signed((9 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((10 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "0000000000");
  signal op_mem_91_20_front_din: signed((10 - 1) downto 0);
  signal op_mem_91_20_back: signed((10 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_69_18: signed((10 - 1) downto 0);
  signal cast_69_22: signed((10 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((10 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_69_18 <= s2s_cast(a_17_32, 7, 10, 7);
  cast_69_22 <= s2s_cast(b_17_35, 7, 10, 7);
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
    a : in std_logic_vector((9 - 1) downto 0);
    b : in std_logic_vector((9 - 1) downto 0);
    s : out std_logic_vector((10 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_bd2bd198b1',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '94ec537d16615f75a75982a197c81c99',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Distributed_Memory_Generator Virtex5 Xilinx,_Inc. 3.3',
    '# 10.1.03i',
    'CSET ce_overrides = sync_controls_overrides_ce',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 10000, B7A5, EDCF, 638A, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET common_output_ce = false',
    'CSET common_output_clk = false',
    'CSET data_width = 18',
    'CSET default_data = 0',
    'CSET default_data_radix = 16',
    'CSET depth = 16',
    'CSET dual_port_address = non_registered',
    'CSET dual_port_output_clock_enable = false',
    'CSET input_clock_enable = false',
    'CSET input_options = non_registered',
    'CSET memory_type = rom',
    'CSET output_options = registered',
    'CSET qualify_we_with_i_ce = false',
    'CSET reset_qdpo = false',
    'CSET reset_qspo = false',
    'CSET single_port_output_clock_enable = true',
    'CSET sync_reset_qdpo = false',
    'CSET sync_reset_qspo = false',
    'CSET component_name = dmg_33_vx5_3b5827b9b9c34c2c',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '1d647b5429b547021eba135c2dfc4ecd',
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
      'core_name0' => 'dmg_33_vx5_3b5827b9b9c34c2c',
      'entity_name.0' => 'xlsprom_dist',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Distributed_Memory_Generator Virtex5 Xilinx,_Inc. 3.3',
    '# 10.1.03i',
    'CSET ce_overrides = sync_controls_overrides_ce',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 10000, 180, B7A5, 34BA5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET common_output_ce = false',
    'CSET common_output_clk = false',
    'CSET data_width = 18',
    'CSET default_data = 0',
    'CSET default_data_radix = 16',
    'CSET depth = 16',
    'CSET dual_port_address = non_registered',
    'CSET dual_port_output_clock_enable = false',
    'CSET input_clock_enable = false',
    'CSET input_options = non_registered',
    'CSET memory_type = rom',
    'CSET output_options = registered',
    'CSET qualify_we_with_i_ce = false',
    'CSET reset_qdpo = false',
    'CSET reset_qspo = false',
    'CSET single_port_output_clock_enable = true',
    'CSET sync_reset_qdpo = false',
    'CSET sync_reset_qspo = false',
    'CSET component_name = dmg_33_vx5_6ab87bec3a8932d3',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '50a50c32f725c78d23b730b0b336b787',
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
      'core_name0' => 'dmg_33_vx5_6ab87bec3a8932d3',
      'entity_name.0' => 'xlsprom_dist',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Distributed_Memory_Generator Virtex5 Xilinx,_Inc. 3.3',
    '# 10.1.03i',
    'CSET ce_overrides = sync_controls_overrides_ce',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 10000, 34BA5, 638A, 31431, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET common_output_ce = false',
    'CSET common_output_clk = false',
    'CSET data_width = 18',
    'CSET default_data = 0',
    'CSET default_data_radix = 16',
    'CSET depth = 16',
    'CSET dual_port_address = non_registered',
    'CSET dual_port_output_clock_enable = false',
    'CSET input_clock_enable = false',
    'CSET input_options = non_registered',
    'CSET memory_type = rom',
    'CSET output_options = registered',
    'CSET qualify_we_with_i_ce = false',
    'CSET reset_qdpo = false',
    'CSET reset_qspo = false',
    'CSET single_port_output_clock_enable = true',
    'CSET sync_reset_qdpo = false',
    'CSET sync_reset_qspo = false',
    'CSET component_name = dmg_33_vx5_af86f8a7a0de7d76',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a4a8fa020883a4b51dbd9b7cdc3637d2',
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
      'core_name0' => 'dmg_33_vx5_af86f8a7a0de7d76',
      'entity_name.0' => 'xlsprom_dist',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '77dd6151e13e9a538d8fdca898d17324',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ed96de2fc1b2c895e07c0e86f1abcaf7',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex5 Xilinx,_Inc. 10.0',
    '# 10.1.03i',
    'CSET ainit_value = 0',
    'CSET ce = true',
    'CSET count_mode = UP',
    'CSET fb_latency = 0',
    'CSET final_count_value = 1',
    'CSET implementation = Fabric',
    'CSET increment_value = 1',
    'CSET latency = 1',
    'CSET load = false',
    'CSET output_width = 5',
    'CSET restrict_count = false',
    'CSET sclr = false',
    'CSET sinit = true',
    'CSET sinit_value = 0',
    'CSET sset = false',
    'CSET sync_ce_priority = Sync_Overrides_CE',
    'CSET sync_threshold_output = false',
    'CSET syncctrlpriority = Reset_Overrides_Set',
    'CSET component_name = binary_counter_virtex5_10_0_ad5bcb1136ed8cf6',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '986ec24be69d35e35c92b8dcfb01ea2e',
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
      'core_name0' => 'binary_counter_virtex5_10_0_ad5bcb1136ed8cf6',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a01ef81af7d4c88c253cf4ee4ad6694d',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((26 - 1) downto 0);
  signal d1_1_27: std_logic_vector((26 - 1) downto 0);
  type array_type_pipe_16_22 is array (0 to (1 - 1)) of std_logic_vector((26 - 1) downto 0);
  signal pipe_16_22: array_type_pipe_16_22 := (
    0 => "00000000000000000000000000");
  signal pipe_16_22_front_din: std_logic_vector((26 - 1) downto 0);
  signal pipe_16_22_back: std_logic_vector((26 - 1) downto 0);
  signal pipe_16_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((26 - 1) downto 0);
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
    d0 : in std_logic_vector((26 - 1) downto 0);
    d1 : in std_logic_vector((26 - 1) downto 0);
    y : out std_logic_vector((26 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_0eccfc7565',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '3f34890d5cccaf9d58f54995d07c0da3',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '65c711f96501a52fca2faaecd31e4bd7',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a7d158b406a112e93791168ca5a1fa41',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex5 Xilinx,_Inc. 10.0',
    '# 10.1.03i',
    'CSET ainit_value = 0',
    'CSET ce = true',
    'CSET count_mode = UP',
    'CSET fb_latency = 0',
    'CSET final_count_value = 1',
    'CSET implementation = Fabric',
    'CSET increment_value = 1',
    'CSET latency = 1',
    'CSET load = false',
    'CSET output_width = 6',
    'CSET restrict_count = false',
    'CSET sclr = false',
    'CSET sinit = true',
    'CSET sinit_value = 0',
    'CSET sset = false',
    'CSET sync_ce_priority = Sync_Overrides_CE',
    'CSET sync_threshold_output = false',
    'CSET syncctrlpriority = Reset_Overrides_Set',
    'CSET component_name = binary_counter_virtex5_10_0_fe346e03af2452eb',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '8510e14431b901f015843d0241923402',
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
      'core_name0' => 'binary_counter_virtex5_10_0_fe346e03af2452eb',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd4f9ce617f3071760314f01ae11f9714',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '63f04e17d42a480d35736b2da4aa301c',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '479a7735baf854a14f5bfe72b08d383f',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: unsigned((13 - 1) downto 0);
  signal output_port_5_5_force: signed((13 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port_5_5_force <= unsigned_to_signed(input_port_1_40);
  output_port <= signed_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((13 - 1) downto 0);
    output_port : out std_logic_vector((13 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_33580846c4',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '470e8d0af8707f096202eb912ddcace9',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c80ea288e1b338e9f2ad75e37ad9bf30',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a64a127b134a76abc349ab9efd32a807',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: unsigned((14 - 1) downto 0);
  signal in1_1_27: unsigned((14 - 1) downto 0);
  signal y_2_1_concat: unsigned((28 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((14 - 1) downto 0);
    in1 : in std_logic_vector((14 - 1) downto 0);
    y : out std_logic_vector((28 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_e5ffcbc394',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c54c2891e598d2dd68e5399c24da4e6b',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: signed((14 - 1) downto 0);
  signal output_port_5_5_force: unsigned((14 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port_5_5_force <= signed_to_unsigned(input_port_1_40);
  output_port <= unsigned_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((14 - 1) downto 0);
    output_port : out std_logic_vector((14 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_eb72d4ea08',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '0864fa9c76fa868f96e26b0e33881627',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((13 - 1) downto 0);
  signal b_17_35: signed((13 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((14 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "00000000000000");
  signal op_mem_91_20_front_din: signed((14 - 1) downto 0);
  signal op_mem_91_20_back: signed((14 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_69_18: signed((14 - 1) downto 0);
  signal cast_69_22: signed((14 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((14 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_69_18 <= s2s_cast(a_17_32, 0, 14, 0);
  cast_69_22 <= s2s_cast(b_17_35, 0, 14, 0);
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
    a : in std_logic_vector((13 - 1) downto 0);
    b : in std_logic_vector((13 - 1) downto 0);
    s : out std_logic_vector((14 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_4a1b074932',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ea7e278e9856ed8d0e83b35ea77bace2',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '39418fc0edb6bd128c1dce4ff599bf06',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal ip_17_23: signed((14 - 1) downto 0);
begin
  ip_17_23 <= std_logic_vector_to_signed(ip);
  op <= signed_to_std_logic_vector(ip_17_23);
end',
      'crippled_entity' => 'is
  port (
    ip : in std_logic_vector((14 - 1) downto 0);
    op : out std_logic_vector((14 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'scale_a1339d14c7',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '554d53444f36d09bce22895329cbac8a',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((13 - 1) downto 0);
  signal b_17_35: signed((13 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((14 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "00000000000000");
  signal op_mem_91_20_front_din: signed((14 - 1) downto 0);
  signal op_mem_91_20_back: signed((14 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_71_18: signed((14 - 1) downto 0);
  signal cast_71_22: signed((14 - 1) downto 0);
  signal internal_s_71_5_addsub: signed((14 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_71_18 <= s2s_cast(a_17_32, 0, 14, 0);
  cast_71_22 <= s2s_cast(b_17_35, 0, 14, 0);
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
    a : in std_logic_vector((13 - 1) downto 0);
    b : in std_logic_vector((13 - 1) downto 0);
    s : out std_logic_vector((14 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_f3687289ea',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '64325d667bb3ab2f4a7eb8da4825d9d2',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: unsigned((14 - 1) downto 0);
  signal output_port_5_5_force: signed((14 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port_5_5_force <= unsigned_to_signed(input_port_1_40);
  output_port <= signed_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((14 - 1) downto 0);
    output_port : out std_logic_vector((14 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_445612bb74',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '0346498f3ab88bc56998763f553278da',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'e2b07e9d9050efa663f314df5813f930',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd658d790d5fb269fdc6de961fbf21378',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: unsigned((15 - 1) downto 0);
  signal in1_1_27: unsigned((15 - 1) downto 0);
  signal y_2_1_concat: unsigned((30 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((15 - 1) downto 0);
    in1 : in std_logic_vector((15 - 1) downto 0);
    y : out std_logic_vector((30 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_22467883b2',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c5e59fcb018637b7e5ce2f223835184e',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: signed((15 - 1) downto 0);
  signal output_port_5_5_force: unsigned((15 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port_5_5_force <= signed_to_unsigned(input_port_1_40);
  output_port <= unsigned_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((15 - 1) downto 0);
    output_port : out std_logic_vector((15 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_0d1490be80',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '7844a8122370844a170f2503007a9048',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((14 - 1) downto 0);
  signal b_17_35: signed((14 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((15 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "000000000000000");
  signal op_mem_91_20_front_din: signed((15 - 1) downto 0);
  signal op_mem_91_20_back: signed((15 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_69_18: signed((15 - 1) downto 0);
  signal cast_69_22: signed((15 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((15 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_69_18 <= s2s_cast(a_17_32, 0, 15, 0);
  cast_69_22 <= s2s_cast(b_17_35, 0, 15, 0);
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
    a : in std_logic_vector((14 - 1) downto 0);
    b : in std_logic_vector((14 - 1) downto 0);
    s : out std_logic_vector((15 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_79dc8835bc',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b43a4327888d1fbf3809f34ed140bf43',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a3ccd13d6b1ac6835a9abb0467b48890',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal ip_17_23: signed((15 - 1) downto 0);
begin
  ip_17_23 <= std_logic_vector_to_signed(ip);
  op <= signed_to_std_logic_vector(ip_17_23);
end',
      'crippled_entity' => 'is
  port (
    ip : in std_logic_vector((15 - 1) downto 0);
    op : out std_logic_vector((15 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'scale_11a6418200',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'de072b73cfdc31d429581f530690fb15',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((14 - 1) downto 0);
  signal b_17_35: signed((14 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((15 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "000000000000000");
  signal op_mem_91_20_front_din: signed((15 - 1) downto 0);
  signal op_mem_91_20_back: signed((15 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_71_18: signed((15 - 1) downto 0);
  signal cast_71_22: signed((15 - 1) downto 0);
  signal internal_s_71_5_addsub: signed((15 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_71_18 <= s2s_cast(a_17_32, 0, 15, 0);
  cast_71_22 <= s2s_cast(b_17_35, 0, 15, 0);
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
    a : in std_logic_vector((14 - 1) downto 0);
    b : in std_logic_vector((14 - 1) downto 0);
    s : out std_logic_vector((15 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_f4e99698eb',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f3542163010d039e2a1f1dd436383806',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'bf84d41cbba827a36cc52814304445b3',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((13 - 1) downto 0);
  signal b_17_35: signed((13 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((14 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "00000000000000");
  signal op_mem_91_20_front_din: signed((14 - 1) downto 0);
  signal op_mem_91_20_back: signed((14 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_69_18: signed((14 - 1) downto 0);
  signal cast_69_22: signed((14 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((14 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_69_18 <= s2s_cast(a_17_32, 12, 14, 12);
  cast_69_22 <= s2s_cast(b_17_35, 12, 14, 12);
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
    a : in std_logic_vector((13 - 1) downto 0);
    b : in std_logic_vector((13 - 1) downto 0);
    s : out std_logic_vector((14 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_c0d1d84d6b',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '2a4e5a78402ab0a2b9f009b0caba007d',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert_pipeline.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Multiplier Virtex5 Xilinx,_Inc. 10.1',
    '# 10.1.03i',
    'CSET ccmimp = Distributed_Memory',
    'CSET clockenable = true',
    'CSET constvalue = 129',
    'CSET internaluser = 0',
    'CSET multiplier_construction = Use_Mults',
    'CSET multtype = Parallel_Multiplier',
    'CSET optgoal = Speed',
    'CSET outputwidthhigh = 21',
    'CSET outputwidthlow = 0',
    'CSET pipestages = 3',
    'CSET portatype = Signed',
    'CSET portawidth = 13',
    'CSET portbtype = Signed',
    'CSET portbwidth = 9',
    'CSET roundpoint = 0',
    'CSET sclrcepriority = CE_Overrides_SCLR',
    'CSET syncclear = true',
    'CSET use_custom_output_width = false',
    'CSET userounding = false',
    'CSET zerodetect = false',
    'CSET component_name = multiplier_virtex5_10_1_845caa9bc89072e0',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '307175358b69935ac47f0160a955c669',
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
      'core_name0' => 'multiplier_virtex5_10_1_845caa9bc89072e0',
      'entity_name.0' => 'xlmult_v9_0',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '624245de9582b5ca9726d2e29f09cd2c',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((20 - 1) downto 0);
  signal b_17_35: signed((20 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((20 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "00000000000000000000");
  signal op_mem_91_20_front_din: signed((20 - 1) downto 0);
  signal op_mem_91_20_back: signed((20 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_69_18: signed((21 - 1) downto 0);
  signal cast_69_22: signed((21 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((21 - 1) downto 0);
  signal cast_internal_s_83_3_convert: signed((20 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_69_18 <= s2s_cast(a_17_32, 19, 21, 19);
  cast_69_22 <= s2s_cast(b_17_35, 19, 21, 19);
  internal_s_69_5_addsub <= cast_69_18 + cast_69_22;
  cast_internal_s_83_3_convert <= s2s_cast(internal_s_69_5_addsub, 19, 20, 19);
  op_mem_91_20_front_din <= cast_internal_s_83_3_convert;
  op_mem_91_20_push_front_pop_back_en <= \'1\';
  cout_mem_92_22_front_din <= std_logic_vector_to_unsigned("0");
  cout_mem_92_22_push_front_pop_back_en <= \'1\';
  prev_mode_93_22_next <= std_logic_vector_to_unsigned("000");
  s <= signed_to_std_logic_vector(op_mem_91_20_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((20 - 1) downto 0);
    b : in std_logic_vector((20 - 1) downto 0);
    s : out std_logic_vector((20 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_a9cdc93774',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a0573a1eac63f1c4c3deb58a13ef17b4',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((20 - 1) downto 0);
  signal b_17_35: signed((20 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (2 - 1)) of signed((20 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    "00000000000000000000",
    "00000000000000000000");
  signal op_mem_91_20_front_din: signed((20 - 1) downto 0);
  signal op_mem_91_20_back: signed((20 - 1) downto 0);
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
  signal cast_71_18: signed((21 - 1) downto 0);
  signal cast_71_22: signed((21 - 1) downto 0);
  signal internal_s_71_5_addsub: signed((21 - 1) downto 0);
  signal cast_internal_s_83_3_convert: signed((20 - 1) downto 0);
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
  cast_71_18 <= s2s_cast(a_17_32, 19, 21, 19);
  cast_71_22 <= s2s_cast(b_17_35, 19, 21, 19);
  internal_s_71_5_addsub <= cast_71_18 - cast_71_22;
  cast_internal_s_83_3_convert <= s2s_cast(internal_s_71_5_addsub, 19, 20, 19);
  op_mem_91_20_front_din <= cast_internal_s_83_3_convert;
  op_mem_91_20_push_front_pop_back_en <= \'1\';
  cout_mem_92_22_front_din <= std_logic_vector_to_unsigned("0");
  cout_mem_92_22_push_front_pop_back_en <= \'1\';
  prev_mode_93_22_next <= std_logic_vector_to_unsigned("000");
  s <= signed_to_std_logic_vector(op_mem_91_20_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((20 - 1) downto 0);
    b : in std_logic_vector((20 - 1) downto 0);
    s : out std_logic_vector((20 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_370c0f2c47',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'dddcc2731a4177a4f2c5d64cddecfaa4',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((20 - 1) downto 0);
  signal b_17_35: signed((20 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((20 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "00000000000000000000");
  signal op_mem_91_20_front_din: signed((20 - 1) downto 0);
  signal op_mem_91_20_back: signed((20 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_71_18: signed((21 - 1) downto 0);
  signal cast_71_22: signed((21 - 1) downto 0);
  signal internal_s_71_5_addsub: signed((21 - 1) downto 0);
  signal cast_internal_s_83_3_convert: signed((20 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_71_18 <= s2s_cast(a_17_32, 19, 21, 19);
  cast_71_22 <= s2s_cast(b_17_35, 19, 21, 19);
  internal_s_71_5_addsub <= cast_71_18 - cast_71_22;
  cast_internal_s_83_3_convert <= s2s_cast(internal_s_71_5_addsub, 19, 20, 19);
  op_mem_91_20_front_din <= cast_internal_s_83_3_convert;
  op_mem_91_20_push_front_pop_back_en <= \'1\';
  cout_mem_92_22_front_din <= std_logic_vector_to_unsigned("0");
  cout_mem_92_22_push_front_pop_back_en <= \'1\';
  prev_mode_93_22_next <= std_logic_vector_to_unsigned("000");
  s <= signed_to_std_logic_vector(op_mem_91_20_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((20 - 1) downto 0);
    b : in std_logic_vector((20 - 1) downto 0);
    s : out std_logic_vector((20 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_5777994232',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Multiplier Virtex5 Xilinx,_Inc. 10.1',
    '# 10.1.03i',
    'CSET ccmimp = Distributed_Memory',
    'CSET clockenable = true',
    'CSET constvalue = 129',
    'CSET internaluser = 0',
    'CSET multiplier_construction = Use_Mults',
    'CSET multtype = Parallel_Multiplier',
    'CSET optgoal = Speed',
    'CSET outputwidthhigh = 23',
    'CSET outputwidthlow = 0',
    'CSET pipestages = 3',
    'CSET portatype = Signed',
    'CSET portawidth = 14',
    'CSET portbtype = Signed',
    'CSET portbwidth = 10',
    'CSET roundpoint = 0',
    'CSET sclrcepriority = CE_Overrides_SCLR',
    'CSET syncclear = true',
    'CSET use_custom_output_width = false',
    'CSET userounding = false',
    'CSET zerodetect = false',
    'CSET component_name = multiplier_virtex5_10_1_35568d5aa6a70475',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '06d5f1f3bec371b6c0fbdf777d36ff2a',
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
      'core_name0' => 'multiplier_virtex5_10_1_35568d5aa6a70475',
      'entity_name.0' => 'xlmult_v9_0',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '350896c65778b0fa95a1d1fa088bff0f',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Distributed_Memory_Generator Virtex5 Xilinx,_Inc. 3.3',
    '# 10.1.03i',
    'CSET ce_overrides = sync_controls_overrides_ce',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 10000, B7A5, EDCF, 638A, FDE7, 8F96, D5B9, 3382, FFF3, A39D, E3C4, 4B86, F5DB, 798F, C7AF, 1B81;',
    '
]',
    'CSET common_output_ce = false',
    'CSET common_output_clk = false',
    'CSET data_width = 18',
    'CSET default_data = 0',
    'CSET default_data_radix = 16',
    'CSET depth = 16',
    'CSET dual_port_address = non_registered',
    'CSET dual_port_output_clock_enable = false',
    'CSET input_clock_enable = false',
    'CSET input_options = non_registered',
    'CSET memory_type = rom',
    'CSET output_options = registered',
    'CSET qualify_we_with_i_ce = false',
    'CSET reset_qdpo = false',
    'CSET reset_qspo = false',
    'CSET single_port_output_clock_enable = true',
    'CSET sync_reset_qdpo = false',
    'CSET sync_reset_qspo = false',
    'CSET component_name = dmg_33_vx5_efe4f2e28a6a56b5',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '44c8f59ee1c7d364a3eba79f4cad9093',
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
      'core_name0' => 'dmg_33_vx5_efe4f2e28a6a56b5',
      'entity_name.0' => 'xlsprom_dist',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Distributed_Memory_Generator Virtex5 Xilinx,_Inc. 3.3',
    '# 10.1.03i',
    'CSET ce_overrides = sync_controls_overrides_ce',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 10000, 180, B7A5, 34BA5, EDCF, 39F8A, 638A, 315CF, FDE7, 3CF82, 8F96, 32DB9, D5B9, 37396, 3382, 305E7;',
    '
]',
    'CSET common_output_ce = false',
    'CSET common_output_clk = false',
    'CSET data_width = 18',
    'CSET default_data = 0',
    'CSET default_data_radix = 16',
    'CSET depth = 16',
    'CSET dual_port_address = non_registered',
    'CSET dual_port_output_clock_enable = false',
    'CSET input_clock_enable = false',
    'CSET input_options = non_registered',
    'CSET memory_type = rom',
    'CSET output_options = registered',
    'CSET qualify_we_with_i_ce = false',
    'CSET reset_qdpo = false',
    'CSET reset_qspo = false',
    'CSET single_port_output_clock_enable = true',
    'CSET sync_reset_qdpo = false',
    'CSET sync_reset_qspo = false',
    'CSET component_name = dmg_33_vx5_47bf930170fd8e60',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '637c7c6a3854ea8304b34b85f136dca3',
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
      'core_name0' => 'dmg_33_vx5_47bf930170fd8e60',
      'entity_name.0' => 'xlsprom_dist',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Distributed_Memory_Generator Virtex5 Xilinx,_Inc. 3.3',
    '# 10.1.03i',
    'CSET ce_overrides = sync_controls_overrides_ce',
    'CSET coefficient_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 10000, 34BA5, 638A, 31431, D5B9, 305E7, 3CF82, 3726A, F5DB, 31FC4, 1B81, 33A51, A39D, 3020D, 3898F, 3B67A;',
    '
]',
    'CSET common_output_ce = false',
    'CSET common_output_clk = false',
    'CSET data_width = 18',
    'CSET default_data = 0',
    'CSET default_data_radix = 16',
    'CSET depth = 16',
    'CSET dual_port_address = non_registered',
    'CSET dual_port_output_clock_enable = false',
    'CSET input_clock_enable = false',
    'CSET input_options = non_registered',
    'CSET memory_type = rom',
    'CSET output_options = registered',
    'CSET qualify_we_with_i_ce = false',
    'CSET reset_qdpo = false',
    'CSET reset_qspo = false',
    'CSET single_port_output_clock_enable = true',
    'CSET sync_reset_qdpo = false',
    'CSET sync_reset_qspo = false',
    'CSET component_name = dmg_33_vx5_27954da46fb8f5d8',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '8ecff4dbcd7a7f7ba008178c3aa04c29',
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
      'core_name0' => 'dmg_33_vx5_27954da46fb8f5d8',
      'entity_name.0' => 'xlsprom_dist',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a400103ad698fdd048d30f7ff8fb9e46',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '69835ad16eb90a13d815bd1c21ad9824',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex5 Xilinx,_Inc. 10.0',
    '# 10.1.03i',
    'CSET ainit_value = 0',
    'CSET ce = true',
    'CSET count_mode = UP',
    'CSET fb_latency = 0',
    'CSET final_count_value = 1',
    'CSET implementation = Fabric',
    'CSET increment_value = 1',
    'CSET latency = 1',
    'CSET load = false',
    'CSET output_width = 3',
    'CSET restrict_count = false',
    'CSET sclr = false',
    'CSET sinit = true',
    'CSET sinit_value = 0',
    'CSET sset = false',
    'CSET sync_ce_priority = Sync_Overrides_CE',
    'CSET sync_threshold_output = false',
    'CSET syncctrlpriority = Reset_Overrides_Set',
    'CSET component_name = binary_counter_virtex5_10_0_924a7f7132ea4004',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '800a193df05e356b1c3fc4b986139b05',
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
      'core_name0' => 'binary_counter_virtex5_10_0_924a7f7132ea4004',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '289a47d46d700ffe65f81325b73dff57',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((30 - 1) downto 0);
  signal d1_1_27: std_logic_vector((30 - 1) downto 0);
  type array_type_pipe_16_22 is array (0 to (1 - 1)) of std_logic_vector((30 - 1) downto 0);
  signal pipe_16_22: array_type_pipe_16_22 := (
    0 => "000000000000000000000000000000");
  signal pipe_16_22_front_din: std_logic_vector((30 - 1) downto 0);
  signal pipe_16_22_back: std_logic_vector((30 - 1) downto 0);
  signal pipe_16_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((30 - 1) downto 0);
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
    d0 : in std_logic_vector((30 - 1) downto 0);
    d1 : in std_logic_vector((30 - 1) downto 0);
    y : out std_logic_vector((30 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_458eaa1690',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '1f58818de7710868ca0bd4e91febb3c4',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '8c954ba43b101ba352a618414cc5e386',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '103342c8523e24b07208e29aeabae997',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex5 Xilinx,_Inc. 10.0',
    '# 10.1.03i',
    'CSET ainit_value = 0',
    'CSET ce = true',
    'CSET count_mode = UP',
    'CSET fb_latency = 0',
    'CSET final_count_value = 1',
    'CSET implementation = Fabric',
    'CSET increment_value = 1',
    'CSET latency = 1',
    'CSET load = false',
    'CSET output_width = 4',
    'CSET restrict_count = false',
    'CSET sclr = false',
    'CSET sinit = true',
    'CSET sinit_value = 0',
    'CSET sset = false',
    'CSET sync_ce_priority = Sync_Overrides_CE',
    'CSET sync_threshold_output = false',
    'CSET syncctrlpriority = Reset_Overrides_Set',
    'CSET component_name = binary_counter_virtex5_10_0_833a35886d0c544c',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '0b03376e85620cbeb2750f26813397ec',
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
      'core_name0' => 'binary_counter_virtex5_10_0_833a35886d0c544c',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '1ffa33aea69eda48e0a7dc90256e4e7a',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '3a5fab0cd01b4f28b64c0cc379e0c9d2',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '0990a0d2a18000705e663687f9d061f9',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: unsigned((15 - 1) downto 0);
  signal output_port_5_5_force: signed((15 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port_5_5_force <= unsigned_to_signed(input_port_1_40);
  output_port <= signed_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((15 - 1) downto 0);
    output_port : out std_logic_vector((15 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_c2430bbd90',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '13c0f6624827532cca05119a5e061252',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '22cae283bc9d190f813235302710f6fa',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
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
    'entity_declaration_hash' => 'e2695c470b8d0ab7b7f7ecc849cd9466',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((15 - 1) downto 0);
  signal b_17_35: signed((15 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((16 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "0000000000000000");
  signal op_mem_91_20_front_din: signed((16 - 1) downto 0);
  signal op_mem_91_20_back: signed((16 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_69_18: signed((16 - 1) downto 0);
  signal cast_69_22: signed((16 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((16 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_69_18 <= s2s_cast(a_17_32, 0, 16, 0);
  cast_69_22 <= s2s_cast(b_17_35, 0, 16, 0);
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
    a : in std_logic_vector((15 - 1) downto 0);
    b : in std_logic_vector((15 - 1) downto 0);
    s : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_e8bb7c4e8b',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a7e9b2fb2c8737fa1b437f809663dc55',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f76c6db6331e130742f6aa1317cdd7be',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal ip_17_23: signed((16 - 1) downto 0);
begin
  ip_17_23 <= std_logic_vector_to_signed(ip);
  op <= signed_to_std_logic_vector(ip_17_23);
end',
      'crippled_entity' => 'is
  port (
    ip : in std_logic_vector((16 - 1) downto 0);
    op : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'scale_fa7c2ab9f6',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '578cdcc41e3f34f7eafa44162740607c',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((15 - 1) downto 0);
  signal b_17_35: signed((15 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((16 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "0000000000000000");
  signal op_mem_91_20_front_din: signed((16 - 1) downto 0);
  signal op_mem_91_20_back: signed((16 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_71_18: signed((16 - 1) downto 0);
  signal cast_71_22: signed((16 - 1) downto 0);
  signal internal_s_71_5_addsub: signed((16 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_71_18 <= s2s_cast(a_17_32, 0, 16, 0);
  cast_71_22 <= s2s_cast(b_17_35, 0, 16, 0);
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
    a : in std_logic_vector((15 - 1) downto 0);
    b : in std_logic_vector((15 - 1) downto 0);
    s : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_81ed09e952',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
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
    'entity_declaration_hash' => '61c7fd5dd8ff42974566fb3fd8acce9b',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '3045fc66f0cdd23f53f3e4269a0cf90e',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd147ba3d426fc5be6d1121555cb3a4fe',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((16 - 1) downto 0);
  signal b_17_35: signed((16 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((17 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "00000000000000000");
  signal op_mem_91_20_front_din: signed((17 - 1) downto 0);
  signal op_mem_91_20_back: signed((17 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_69_18: signed((17 - 1) downto 0);
  signal cast_69_22: signed((17 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((17 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_69_18 <= s2s_cast(a_17_32, 0, 17, 0);
  cast_69_22 <= s2s_cast(b_17_35, 0, 17, 0);
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
    a : in std_logic_vector((16 - 1) downto 0);
    b : in std_logic_vector((16 - 1) downto 0);
    s : out std_logic_vector((17 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_14b004d38d',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '8055e6897cc96bfafbfbe9eb3d10e903',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b43d922b62813073670832f338c4c398',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal ip_17_23: signed((17 - 1) downto 0);
begin
  ip_17_23 <= std_logic_vector_to_signed(ip);
  op <= signed_to_std_logic_vector(ip_17_23);
end',
      'crippled_entity' => 'is
  port (
    ip : in std_logic_vector((17 - 1) downto 0);
    op : out std_logic_vector((17 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'scale_b42effccbc',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '7dee5d5a42e78fb8a3d93c372091319a',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((16 - 1) downto 0);
  signal b_17_35: signed((16 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((17 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "00000000000000000");
  signal op_mem_91_20_front_din: signed((17 - 1) downto 0);
  signal op_mem_91_20_back: signed((17 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_71_18: signed((17 - 1) downto 0);
  signal cast_71_22: signed((17 - 1) downto 0);
  signal internal_s_71_5_addsub: signed((17 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_71_18 <= s2s_cast(a_17_32, 0, 17, 0);
  cast_71_22 <= s2s_cast(b_17_35, 0, 17, 0);
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
    a : in std_logic_vector((16 - 1) downto 0);
    b : in std_logic_vector((16 - 1) downto 0);
    s : out std_logic_vector((17 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_5d0bd43700',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b196fae042623e95ecc10b6d8338f8bd',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((15 - 1) downto 0);
  signal b_17_35: signed((15 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((16 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "0000000000000000");
  signal op_mem_91_20_front_din: signed((16 - 1) downto 0);
  signal op_mem_91_20_back: signed((16 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_69_18: signed((16 - 1) downto 0);
  signal cast_69_22: signed((16 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((16 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_69_18 <= s2s_cast(a_17_32, 14, 16, 14);
  cast_69_22 <= s2s_cast(b_17_35, 14, 16, 14);
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
    a : in std_logic_vector((15 - 1) downto 0);
    b : in std_logic_vector((15 - 1) downto 0);
    s : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_24b2bc78a0',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '7ac600c81708163685480a0fd73c4fdb',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert_pipeline.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Multiplier Virtex5 Xilinx,_Inc. 10.1',
    '# 10.1.03i',
    'CSET ccmimp = Distributed_Memory',
    'CSET clockenable = true',
    'CSET constvalue = 129',
    'CSET internaluser = 0',
    'CSET multiplier_construction = Use_Mults',
    'CSET multtype = Parallel_Multiplier',
    'CSET optgoal = Speed',
    'CSET outputwidthhigh = 23',
    'CSET outputwidthlow = 0',
    'CSET pipestages = 3',
    'CSET portatype = Signed',
    'CSET portawidth = 15',
    'CSET portbtype = Signed',
    'CSET portbwidth = 9',
    'CSET roundpoint = 0',
    'CSET sclrcepriority = CE_Overrides_SCLR',
    'CSET syncclear = true',
    'CSET use_custom_output_width = false',
    'CSET userounding = false',
    'CSET zerodetect = false',
    'CSET component_name = multiplier_virtex5_10_1_9a2572cfdd818f42',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '447ea18ae92490aa8e601f979feea757',
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
      'core_name0' => 'multiplier_virtex5_10_1_9a2572cfdd818f42',
      'entity_name.0' => 'xlmult_v9_0',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'e9abb3dc531c083b0c04c98b69f131fe',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((22 - 1) downto 0);
  signal b_17_35: signed((22 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((22 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "0000000000000000000000");
  signal op_mem_91_20_front_din: signed((22 - 1) downto 0);
  signal op_mem_91_20_back: signed((22 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
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
  signal cast_internal_s_83_3_convert: signed((22 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_69_18 <= s2s_cast(a_17_32, 21, 23, 21);
  cast_69_22 <= s2s_cast(b_17_35, 21, 23, 21);
  internal_s_69_5_addsub <= cast_69_18 + cast_69_22;
  cast_internal_s_83_3_convert <= s2s_cast(internal_s_69_5_addsub, 21, 22, 21);
  op_mem_91_20_front_din <= cast_internal_s_83_3_convert;
  op_mem_91_20_push_front_pop_back_en <= \'1\';
  cout_mem_92_22_front_din <= std_logic_vector_to_unsigned("0");
  cout_mem_92_22_push_front_pop_back_en <= \'1\';
  prev_mode_93_22_next <= std_logic_vector_to_unsigned("000");
  s <= signed_to_std_logic_vector(op_mem_91_20_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((22 - 1) downto 0);
    b : in std_logic_vector((22 - 1) downto 0);
    s : out std_logic_vector((22 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_c7058621d7',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'bb5d2c5a44bbe2406af801466cd390b9',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((22 - 1) downto 0);
  signal b_17_35: signed((22 - 1) downto 0);
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
  signal cast_71_18: signed((23 - 1) downto 0);
  signal cast_71_22: signed((23 - 1) downto 0);
  signal internal_s_71_5_addsub: signed((23 - 1) downto 0);
  signal cast_internal_s_83_3_convert: signed((22 - 1) downto 0);
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
  cast_71_18 <= s2s_cast(a_17_32, 21, 23, 21);
  cast_71_22 <= s2s_cast(b_17_35, 21, 23, 21);
  internal_s_71_5_addsub <= cast_71_18 - cast_71_22;
  cast_internal_s_83_3_convert <= s2s_cast(internal_s_71_5_addsub, 21, 22, 21);
  op_mem_91_20_front_din <= cast_internal_s_83_3_convert;
  op_mem_91_20_push_front_pop_back_en <= \'1\';
  cout_mem_92_22_front_din <= std_logic_vector_to_unsigned("0");
  cout_mem_92_22_push_front_pop_back_en <= \'1\';
  prev_mode_93_22_next <= std_logic_vector_to_unsigned("000");
  s <= signed_to_std_logic_vector(op_mem_91_20_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((22 - 1) downto 0);
    b : in std_logic_vector((22 - 1) downto 0);
    s : out std_logic_vector((22 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_977ed7b8a2',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '3dd3e6a3f6ae22ce2cf3482ec2291a26',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((22 - 1) downto 0);
  signal b_17_35: signed((22 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((22 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "0000000000000000000000");
  signal op_mem_91_20_front_din: signed((22 - 1) downto 0);
  signal op_mem_91_20_back: signed((22 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
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
  signal cast_internal_s_83_3_convert: signed((22 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_71_18 <= s2s_cast(a_17_32, 21, 23, 21);
  cast_71_22 <= s2s_cast(b_17_35, 21, 23, 21);
  internal_s_71_5_addsub <= cast_71_18 - cast_71_22;
  cast_internal_s_83_3_convert <= s2s_cast(internal_s_71_5_addsub, 21, 22, 21);
  op_mem_91_20_front_din <= cast_internal_s_83_3_convert;
  op_mem_91_20_push_front_pop_back_en <= \'1\';
  cout_mem_92_22_front_din <= std_logic_vector_to_unsigned("0");
  cout_mem_92_22_push_front_pop_back_en <= \'1\';
  prev_mode_93_22_next <= std_logic_vector_to_unsigned("000");
  s <= signed_to_std_logic_vector(op_mem_91_20_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((22 - 1) downto 0);
    b : in std_logic_vector((22 - 1) downto 0);
    s : out std_logic_vector((22 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_0f2f4c67a4',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Multiplier Virtex5 Xilinx,_Inc. 10.1',
    '# 10.1.03i',
    'CSET ccmimp = Distributed_Memory',
    'CSET clockenable = true',
    'CSET constvalue = 129',
    'CSET internaluser = 0',
    'CSET multiplier_construction = Use_Mults',
    'CSET multtype = Parallel_Multiplier',
    'CSET optgoal = Speed',
    'CSET outputwidthhigh = 25',
    'CSET outputwidthlow = 0',
    'CSET pipestages = 3',
    'CSET portatype = Signed',
    'CSET portawidth = 16',
    'CSET portbtype = Signed',
    'CSET portbwidth = 10',
    'CSET roundpoint = 0',
    'CSET sclrcepriority = CE_Overrides_SCLR',
    'CSET syncclear = true',
    'CSET use_custom_output_width = false',
    'CSET userounding = false',
    'CSET zerodetect = false',
    'CSET component_name = multiplier_virtex5_10_1_e96fd0f2d7a7d0c5',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c585ae9c8e4b59564efc3a6843a4d669',
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
      'core_name0' => 'multiplier_virtex5_10_1_e96fd0f2d7a7d0c5',
      'entity_name.0' => 'xlmult_v9_0',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '48e9fa097595da07fe8dc075e9697ddf',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Block_Memory_Generator Virtex5 Xilinx,_Inc. 2.4',
    '# 10.1.03i',
    'CSET algorithm = Minimum_Area',
    'CSET assume_synchronous_clk = false',
    'CSET byte_size = 9',
    'CSET coe_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 10000, B7A5, EDCF, 638A, FDE7, 8F96, D5B9, 3382, FFF3, A39D, E3C4, 4B86, F5DB, 798F, C7AF, 1B81, 101FA, ADA1, E9C9, 5787, F9E1, 8592, CFB4, 2781, FFED, 9999, DDBE, 3F84, F3D5, 6F8C, BFAA, D80, 101FD, B1A3, EBCC, 5D89, FBE4, 8994, D3B6, 2D82, FFF0, 9F9B, DFC1, 4585, F5D8, 758E, C3AC, 1380, 101F7, A99F, E5C6, 5186, F7DE, 7F91, CBB1, 2181, FDEA, 9597, D9BC, 3983, EFD2, 698B, BBA8, 780;',
    '
]',
    'CSET collision_warnings = ALL',
    'CSET disable_collision_warnings = false',
    'CSET enable_a = Use_ENA_Pin',
    'CSET enable_b = Always_Enabled',
    'CSET load_init_file = TRUE',
    'CSET memory_type = Single_Port_ROM',
    'CSET operating_mode_a = WRITE_FIRST',
    'CSET operating_mode_b = WRITE_FIRST',
    'CSET output_reset_value_a = 0',
    'CSET output_reset_value_b = 0',
    'CSET primitive = 8kx2',
    'CSET read_width_a = 18',
    'CSET read_width_b = 18',
    'CSET register_output_of_memory_core = false',
    'CSET register_output_of_memory_primitives = false',
    'CSET remaining_memory_locations = 0',
    'CSET use_byte_write_enable = false',
    'CSET use_regcea_pin = false',
    'CSET use_regceb_pin = false',
    'CSET use_ssra_pin = FALSE',
    'CSET use_ssrb_pin = FALSE',
    'CSET write_depth_a = 64',
    'CSET write_width_a = 18',
    'CSET write_width_b = 18',
    'CSET component_name = bmg_24_vx5_e356d8b9149f54d5',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'acdce615ef0cdd058b5ed9ebc0b1034f',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addra => core_addr,
        clka => clk,
        ena => core_ce,
        douta => core_data_out',
      'core_name0' => 'bmg_24_vx5_e356d8b9149f54d5',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Block_Memory_Generator Virtex5 Xilinx,_Inc. 2.4',
    '# 10.1.03i',
    'CSET algorithm = Minimum_Area',
    'CSET assume_synchronous_clk = false',
    'CSET byte_size = 9',
    'CSET coe_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 10000, 180, B7A5, 34BA5, EDCF, 39F8A, 638A, 315CF, FDE7, 3CF82, 8F96, 32DB9, D5B9, 37396, 3382, 305E7, FFF3, 3E781, A39D, 33BAF, E3C4, 3898F, 4B86, 30DDB, F5DB, 3B786, 798F, 31FC4, C7AF, 35F9D, 1B81, 303F3, 101FA, 3F580, ADA1, 343AA, E9C9, 3938C, 5787, 30FD5, F9E1, 3C384, 8592, 325BE, CFB4, 36999, 2781, 303ED, FFED, 3DB81, 9999, 333B4, DDBE, 37D92, 3F84, 309E1, F3D5, 3AB87, 6F8C, 319C9, BFAA, 355A1, D80, 301FA;',
    '
]',
    'CSET collision_warnings = ALL',
    'CSET disable_collision_warnings = false',
    'CSET enable_a = Use_ENA_Pin',
    'CSET enable_b = Always_Enabled',
    'CSET load_init_file = TRUE',
    'CSET memory_type = Single_Port_ROM',
    'CSET operating_mode_a = WRITE_FIRST',
    'CSET operating_mode_b = WRITE_FIRST',
    'CSET output_reset_value_a = 0',
    'CSET output_reset_value_b = 0',
    'CSET primitive = 8kx2',
    'CSET read_width_a = 18',
    'CSET read_width_b = 18',
    'CSET register_output_of_memory_core = false',
    'CSET register_output_of_memory_primitives = false',
    'CSET remaining_memory_locations = 0',
    'CSET use_byte_write_enable = false',
    'CSET use_regcea_pin = false',
    'CSET use_regceb_pin = false',
    'CSET use_ssra_pin = FALSE',
    'CSET use_ssrb_pin = FALSE',
    'CSET write_depth_a = 64',
    'CSET write_width_a = 18',
    'CSET write_width_b = 18',
    'CSET component_name = bmg_24_vx5_c5c136a08dd56dbc',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '1c74655022979a3d362749e61f1c3ade',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addra => core_addr,
        clka => clk,
        ena => core_ce,
        douta => core_data_out',
      'core_name0' => 'bmg_24_vx5_c5c136a08dd56dbc',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Block_Memory_Generator Virtex5 Xilinx,_Inc. 2.4',
    '# 10.1.03i',
    'CSET algorithm = Minimum_Area',
    'CSET assume_synchronous_clk = false',
    'CSET byte_size = 9',
    'CSET coe_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 10000, 34BA5, 638A, 31431, D5B9, 305E7, 3CF82, 3726A, F5DB, 31FC4, 1B81, 33A51, A39D, 3020D, 3898F, 3B67A, FFED, 333B4, 3F84, 32442, BFAA, 301FA, 3AB87, 39274, E9C9, 30FD5, 3F580, 3545F, 8592, 3081F, 36999, 3DA7F, 101F7, 33FAC, 5186, 31C3A, CBB1, 303F0, 3BD85, 3826F, EFD2, 317CC, 780, 34658, 9597, 30416, 37994, 3C87D, FBE4, 329BC, 2D82, 32E4A, B1A3, 30003, 3998B, 3A477, DFC1, 30BDE, 3E181, 36265, 758E, 30C28, 3599F, 3EE80;',
    '
]',
    'CSET collision_warnings = ALL',
    'CSET disable_collision_warnings = false',
    'CSET enable_a = Use_ENA_Pin',
    'CSET enable_b = Always_Enabled',
    'CSET load_init_file = TRUE',
    'CSET memory_type = Single_Port_ROM',
    'CSET operating_mode_a = WRITE_FIRST',
    'CSET operating_mode_b = WRITE_FIRST',
    'CSET output_reset_value_a = 0',
    'CSET output_reset_value_b = 0',
    'CSET primitive = 8kx2',
    'CSET read_width_a = 18',
    'CSET read_width_b = 18',
    'CSET register_output_of_memory_core = false',
    'CSET register_output_of_memory_primitives = false',
    'CSET remaining_memory_locations = 0',
    'CSET use_byte_write_enable = false',
    'CSET use_regcea_pin = false',
    'CSET use_regceb_pin = false',
    'CSET use_ssra_pin = FALSE',
    'CSET use_ssrb_pin = FALSE',
    'CSET write_depth_a = 64',
    'CSET write_width_a = 18',
    'CSET write_width_b = 18',
    'CSET component_name = bmg_24_vx5_9d8577c93c4baa0d',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '5de7398833ebd8eaa7af47132c8c525c',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addra => core_addr,
        clka => clk,
        ena => core_ce,
        douta => core_data_out',
      'core_name0' => 'bmg_24_vx5_9d8577c93c4baa0d',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c509abfb5159fc81caf158a74e19c09d',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
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
    'entity_declaration_hash' => '5abafe699baf0b315ef537b005a13e61',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((34 - 1) downto 0);
  signal d1_1_27: std_logic_vector((34 - 1) downto 0);
  type array_type_pipe_16_22 is array (0 to (1 - 1)) of std_logic_vector((34 - 1) downto 0);
  signal pipe_16_22: array_type_pipe_16_22 := (
    0 => "0000000000000000000000000000000000");
  signal pipe_16_22_front_din: std_logic_vector((34 - 1) downto 0);
  signal pipe_16_22_back: std_logic_vector((34 - 1) downto 0);
  signal pipe_16_22_push_front_pop_back_en: std_logic;
  signal unregy_join_6_1: std_logic_vector((34 - 1) downto 0);
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
    d0 : in std_logic_vector((34 - 1) downto 0);
    d1 : in std_logic_vector((34 - 1) downto 0);
    y : out std_logic_vector((34 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_22ce705a06',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '65c90ac94f7f0eb0d44807c0b04e3840',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '482e6af4080628898aa31a616e33b9d8',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'e2b54d6a2a92e9f08fce1b3ff53a6d05',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex5 Xilinx,_Inc. 10.0',
    '# 10.1.03i',
    'CSET ainit_value = 0',
    'CSET ce = true',
    'CSET count_mode = UP',
    'CSET fb_latency = 0',
    'CSET final_count_value = 1',
    'CSET implementation = Fabric',
    'CSET increment_value = 1',
    'CSET latency = 1',
    'CSET load = false',
    'CSET output_width = 2',
    'CSET restrict_count = false',
    'CSET sclr = false',
    'CSET sinit = true',
    'CSET sinit_value = 0',
    'CSET sset = false',
    'CSET sync_ce_priority = Sync_Overrides_CE',
    'CSET sync_threshold_output = false',
    'CSET syncctrlpriority = Reset_Overrides_Set',
    'CSET component_name = binary_counter_virtex5_10_0_76ea00975735b561',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '3c1ca328e4075b27ff051aba59be2fc4',
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
      'core_name0' => 'binary_counter_virtex5_10_0_76ea00975735b561',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '6bb1dfbbd8c57c5567a0e5f160aac4fc',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
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
    'entity_declaration_hash' => 'f642dd88ca5a3d6dd3a57b80e5ee26fa',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((17 - 1) downto 0);
  signal b_17_35: signed((17 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((18 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "000000000000000000");
  signal op_mem_91_20_front_din: signed((18 - 1) downto 0);
  signal op_mem_91_20_back: signed((18 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_69_18: signed((18 - 1) downto 0);
  signal cast_69_22: signed((18 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((18 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_69_18 <= s2s_cast(a_17_32, 0, 18, 0);
  cast_69_22 <= s2s_cast(b_17_35, 0, 18, 0);
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
    a : in std_logic_vector((17 - 1) downto 0);
    b : in std_logic_vector((17 - 1) downto 0);
    s : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_ed5d62a19c',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '244082a0711bb88a3d5a1dfd11b9895d',
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
    'entity_declaration_hash' => '12839f28f0e2438d85787cfdbec2dc14',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((17 - 1) downto 0);
  signal b_17_35: signed((17 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((18 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "000000000000000000");
  signal op_mem_91_20_front_din: signed((18 - 1) downto 0);
  signal op_mem_91_20_back: signed((18 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_71_18: signed((18 - 1) downto 0);
  signal cast_71_22: signed((18 - 1) downto 0);
  signal internal_s_71_5_addsub: signed((18 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_71_18 <= s2s_cast(a_17_32, 0, 18, 0);
  cast_71_22 <= s2s_cast(b_17_35, 0, 18, 0);
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
    a : in std_logic_vector((17 - 1) downto 0);
    b : in std_logic_vector((17 - 1) downto 0);
    s : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_cc9a7f7bbc',
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
    'entity_declaration_hash' => '5ab1cb4065730df90200f7e09bc079df',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((18 - 1) downto 0);
  signal b_17_35: signed((18 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((19 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "0000000000000000000");
  signal op_mem_91_20_front_din: signed((19 - 1) downto 0);
  signal op_mem_91_20_back: signed((19 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
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
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_69_18 <= s2s_cast(a_17_32, 0, 19, 0);
  cast_69_22 <= s2s_cast(b_17_35, 0, 19, 0);
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
      'entity_name' => 'addsub_f10bd79bfe',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd8d3fa53562b2bc69c7f34e1c6616300',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
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
  $instrs = {
    'entity_declaration_hash' => 'b871d5f0e171ca3fef5fee9dc29e61c9',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((18 - 1) downto 0);
  signal b_17_35: signed((18 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((19 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "0000000000000000000");
  signal op_mem_91_20_front_din: signed((19 - 1) downto 0);
  signal op_mem_91_20_back: signed((19 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
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
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_71_18 <= s2s_cast(a_17_32, 0, 19, 0);
  cast_71_22 <= s2s_cast(b_17_35, 0, 19, 0);
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
      'entity_name' => 'addsub_f5776ffb7e',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'e779a38407633cadf041c6aeccc7883d',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'cc2018ac562d1822ffb29099d548dbd9',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((17 - 1) downto 0);
  signal b_17_35: signed((17 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((18 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "000000000000000000");
  signal op_mem_91_20_front_din: signed((18 - 1) downto 0);
  signal op_mem_91_20_back: signed((18 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_69_18: signed((18 - 1) downto 0);
  signal cast_69_22: signed((18 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((18 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_69_18 <= s2s_cast(a_17_32, 16, 18, 16);
  cast_69_22 <= s2s_cast(b_17_35, 16, 18, 16);
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
    a : in std_logic_vector((17 - 1) downto 0);
    b : in std_logic_vector((17 - 1) downto 0);
    s : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_555b5d0c45',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a844460137c31bc21773766002c521d4',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert_pipeline.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Multiplier Virtex5 Xilinx,_Inc. 10.1',
    '# 10.1.03i',
    'CSET ccmimp = Distributed_Memory',
    'CSET clockenable = true',
    'CSET constvalue = 129',
    'CSET internaluser = 0',
    'CSET multiplier_construction = Use_Mults',
    'CSET multtype = Parallel_Multiplier',
    'CSET optgoal = Speed',
    'CSET outputwidthhigh = 25',
    'CSET outputwidthlow = 0',
    'CSET pipestages = 3',
    'CSET portatype = Signed',
    'CSET portawidth = 17',
    'CSET portbtype = Signed',
    'CSET portbwidth = 9',
    'CSET roundpoint = 0',
    'CSET sclrcepriority = CE_Overrides_SCLR',
    'CSET syncclear = true',
    'CSET use_custom_output_width = false',
    'CSET userounding = false',
    'CSET zerodetect = false',
    'CSET component_name = multiplier_virtex5_10_1_db7246963acedc92',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'dc79403f7b6373aa11c297306032213b',
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
      'core_name0' => 'multiplier_virtex5_10_1_db7246963acedc92',
      'entity_name.0' => 'xlmult_v9_0',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '2eecb2e5de7cedd9352868a47b6c1a07',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((24 - 1) downto 0);
  signal b_17_35: signed((24 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((24 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "000000000000000000000000");
  signal op_mem_91_20_front_din: signed((24 - 1) downto 0);
  signal op_mem_91_20_back: signed((24 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_69_18: signed((25 - 1) downto 0);
  signal cast_69_22: signed((25 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((25 - 1) downto 0);
  signal cast_internal_s_83_3_convert: signed((24 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_69_18 <= s2s_cast(a_17_32, 23, 25, 23);
  cast_69_22 <= s2s_cast(b_17_35, 23, 25, 23);
  internal_s_69_5_addsub <= cast_69_18 + cast_69_22;
  cast_internal_s_83_3_convert <= s2s_cast(internal_s_69_5_addsub, 23, 24, 23);
  op_mem_91_20_front_din <= cast_internal_s_83_3_convert;
  op_mem_91_20_push_front_pop_back_en <= \'1\';
  cout_mem_92_22_front_din <= std_logic_vector_to_unsigned("0");
  cout_mem_92_22_push_front_pop_back_en <= \'1\';
  prev_mode_93_22_next <= std_logic_vector_to_unsigned("000");
  s <= signed_to_std_logic_vector(op_mem_91_20_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((24 - 1) downto 0);
    b : in std_logic_vector((24 - 1) downto 0);
    s : out std_logic_vector((24 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_a90e22f5f3',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '2e00e044be7649398d9aa55d03c984b2',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((24 - 1) downto 0);
  signal b_17_35: signed((24 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (2 - 1)) of signed((24 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    "000000000000000000000000",
    "000000000000000000000000");
  signal op_mem_91_20_front_din: signed((24 - 1) downto 0);
  signal op_mem_91_20_back: signed((24 - 1) downto 0);
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
  signal cast_71_18: signed((25 - 1) downto 0);
  signal cast_71_22: signed((25 - 1) downto 0);
  signal internal_s_71_5_addsub: signed((25 - 1) downto 0);
  signal cast_internal_s_83_3_convert: signed((24 - 1) downto 0);
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
  cast_71_18 <= s2s_cast(a_17_32, 23, 25, 23);
  cast_71_22 <= s2s_cast(b_17_35, 23, 25, 23);
  internal_s_71_5_addsub <= cast_71_18 - cast_71_22;
  cast_internal_s_83_3_convert <= s2s_cast(internal_s_71_5_addsub, 23, 24, 23);
  op_mem_91_20_front_din <= cast_internal_s_83_3_convert;
  op_mem_91_20_push_front_pop_back_en <= \'1\';
  cout_mem_92_22_front_din <= std_logic_vector_to_unsigned("0");
  cout_mem_92_22_push_front_pop_back_en <= \'1\';
  prev_mode_93_22_next <= std_logic_vector_to_unsigned("000");
  s <= signed_to_std_logic_vector(op_mem_91_20_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((24 - 1) downto 0);
    b : in std_logic_vector((24 - 1) downto 0);
    s : out std_logic_vector((24 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_0b3c6c31ef',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '261838314dde9d705697c5868a13cb33',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((24 - 1) downto 0);
  signal b_17_35: signed((24 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((24 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "000000000000000000000000");
  signal op_mem_91_20_front_din: signed((24 - 1) downto 0);
  signal op_mem_91_20_back: signed((24 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_71_18: signed((25 - 1) downto 0);
  signal cast_71_22: signed((25 - 1) downto 0);
  signal internal_s_71_5_addsub: signed((25 - 1) downto 0);
  signal cast_internal_s_83_3_convert: signed((24 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_91_20_push_front_pop_back_en = \'1\')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (cout_mem_92_22_push_front_pop_back_en = \'1\')) then
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
  cast_71_18 <= s2s_cast(a_17_32, 23, 25, 23);
  cast_71_22 <= s2s_cast(b_17_35, 23, 25, 23);
  internal_s_71_5_addsub <= cast_71_18 - cast_71_22;
  cast_internal_s_83_3_convert <= s2s_cast(internal_s_71_5_addsub, 23, 24, 23);
  op_mem_91_20_front_din <= cast_internal_s_83_3_convert;
  op_mem_91_20_push_front_pop_back_en <= \'1\';
  cout_mem_92_22_front_din <= std_logic_vector_to_unsigned("0");
  cout_mem_92_22_push_front_pop_back_en <= \'1\';
  prev_mode_93_22_next <= std_logic_vector_to_unsigned("000");
  s <= signed_to_std_logic_vector(op_mem_91_20_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((24 - 1) downto 0);
    b : in std_logic_vector((24 - 1) downto 0);
    s : out std_logic_vector((24 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_50f49c147d',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Multiplier Virtex5 Xilinx,_Inc. 10.1',
    '# 10.1.03i',
    'CSET ccmimp = Distributed_Memory',
    'CSET clockenable = true',
    'CSET constvalue = 129',
    'CSET internaluser = 0',
    'CSET multiplier_construction = Use_Mults',
    'CSET multtype = Parallel_Multiplier',
    'CSET optgoal = Speed',
    'CSET outputwidthhigh = 27',
    'CSET outputwidthlow = 0',
    'CSET pipestages = 3',
    'CSET portatype = Signed',
    'CSET portawidth = 18',
    'CSET portbtype = Signed',
    'CSET portbwidth = 10',
    'CSET roundpoint = 0',
    'CSET sclrcepriority = CE_Overrides_SCLR',
    'CSET syncclear = true',
    'CSET use_custom_output_width = false',
    'CSET userounding = false',
    'CSET zerodetect = false',
    'CSET component_name = multiplier_virtex5_10_1_34b4d3fe22ca9845',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '0d53f9aac1dfb982fed027fdd87faa32',
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
      'core_name0' => 'multiplier_virtex5_10_1_34b4d3fe22ca9845',
      'entity_name.0' => 'xlmult_v9_0',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Block_Memory_Generator Virtex5 Xilinx,_Inc. 2.4',
    '# 10.1.03i',
    'CSET algorithm = Minimum_Area',
    'CSET assume_synchronous_clk = false',
    'CSET byte_size = 9',
    'CSET coe_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 10000, B7A5, EDCF, 638A, FDE7, 8F96, D5B9, 3382, FFF3, A39D, E3C4, 4B86, F5DB, 798F, C7AF, 1B81, 101FA, ADA1, E9C9, 5787, F9E1, 8592, CFB4, 2781, FFED, 9999, DDBE, 3F84, F3D5, 6F8C, BFAA, D80, 101FD, B1A3, EBCC, 5D89, FBE4, 8994, D3B6, 2D82, FFF0, 9F9B, DFC1, 4585, F5D8, 758E, C3AC, 1380, 101F7, A99F, E5C6, 5186, F7DE, 7F91, CBB1, 2181, FDEA, 9597, D9BC, 3983, EFD2, 698B, BBA8, 780, 101FE, B3A4, EDCE, 6189, FBE5, 8D95, D5B8, 2F82, FFF2, A19C, E1C2, 4985, F5D9, 778E, C5AE, 1780, 101F8, ABA0, E7C8, 5587, F9DF, 8191, CDB2, 2381, FDEC, 9798, DBBD, 3D83, F1D3, 6B8C, BDA9, B80, 101FB, AFA2, E9CB, 5B88, FBE2, 8793, D1B5, 2982, FFEF, 9D9A, DFC0, 4384, F3D6, 718D, C1AB, 1180, 101F5, A59E, E5C5, 4F86, F7DC, 7D90, C9B0, 1D81, FDE9, 9196, D7BA, 3783, EFD0, 658A, B9A7, 580, 101FF, B5A5, EDCE, 6189, FBE6, 8D95, D5B8, 3182, FFF3, A39D, E3C3, 4985, F5DA, 798F, C5AE, 1981, 101F9, ABA1, E7C9, 5587, F9E0, 8392, CDB3, 2581, FDEC, 9999, DBBE, 3D84, F1D4, 6D8C, BDA9, B80, 101FC, B1A3, EBCB, 5B88, FBE3, 8993, D1B6, 2B82, FFF0, 9D9B, DFC0, 4384, F3D7, 738D, C1AC, 1380, 101F6, A79F, E5C6, 4F86, F7DD, 7D90, C9B1, 1F81, FDE9, 9397, D9BB, 3783, EFD1, 678B, B9A7, 580, 101FE, B3A4, EBCD, 5F89, FBE5, 8B94, D3B7, 2F82, FFF1, 9F9C, E1C2, 4785, F5D9, 758E, C3AD, 1580, 101F7, A9A0, E7C7, 5387, F9DF, 8191, CBB2, 2181, FDEB, 9598, DBBC, 3B83, F1D3, 6B8B, BBA8, 980, 101FB, AFA2, E9CA, 5988, F9E2, 8593, CFB4, 2982, FFEE, 9B9A, DDBF, 4184, F3D6, 6F8D, BFAB, F80, FFF4, A59E, E3C4, 4D86, F7DC, 7B8F, C7AF, 1B81, FDE8, 9196, D7BA, 3583, EFD0, 658A, B7A6, 380;',
    '
]',
    'CSET collision_warnings = ALL',
    'CSET disable_collision_warnings = false',
    'CSET enable_a = Use_ENA_Pin',
    'CSET enable_b = Always_Enabled',
    'CSET load_init_file = TRUE',
    'CSET memory_type = Single_Port_ROM',
    'CSET operating_mode_a = WRITE_FIRST',
    'CSET operating_mode_b = WRITE_FIRST',
    'CSET output_reset_value_a = 0',
    'CSET output_reset_value_b = 0',
    'CSET primitive = 8kx2',
    'CSET read_width_a = 18',
    'CSET read_width_b = 18',
    'CSET register_output_of_memory_core = false',
    'CSET register_output_of_memory_primitives = false',
    'CSET remaining_memory_locations = 0',
    'CSET use_byte_write_enable = false',
    'CSET use_regcea_pin = false',
    'CSET use_regceb_pin = false',
    'CSET use_ssra_pin = FALSE',
    'CSET use_ssrb_pin = FALSE',
    'CSET write_depth_a = 256',
    'CSET write_width_a = 18',
    'CSET write_width_b = 18',
    'CSET component_name = bmg_24_vx5_462f2ec6a7a3f012',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '218984dc9aa7fb56a60665c2064ca700',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addra => core_addr,
        clka => clk,
        ena => core_ce,
        douta => core_data_out',
      'core_name0' => 'bmg_24_vx5_462f2ec6a7a3f012',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Block_Memory_Generator Virtex5 Xilinx,_Inc. 2.4',
    '# 10.1.03i',
    'CSET algorithm = Minimum_Area',
    'CSET assume_synchronous_clk = false',
    'CSET byte_size = 9',
    'CSET coe_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 10000, 180, B7A5, 34BA5, EDCF, 39F8A, 638A, 315CF, FDE7, 3CF82, 8F96, 32DB9, D5B9, 37396, 3382, 305E7, FFF3, 3E781, A39D, 33BAF, E3C4, 3898F, 4B86, 30DDB, F5DB, 3B786, 798F, 31FC4, C7AF, 35F9D, 1B81, 303F3, 101FA, 3F580, ADA1, 343AA, E9C9, 3938C, 5787, 30FD5, F9E1, 3C384, 8592, 325BE, CFB4, 36999, 2781, 303ED, FFED, 3DB81, 9999, 333B4, DDBE, 37D92, 3F84, 309E1, F3D5, 3AB87, 6F8C, 319C9, BFAA, 355A1, D80, 301FA, 101FD, 3FB80, B1A3, 347A8, EBCC, 3998B, 5D89, 313D2, FBE4, 3C983, 8994, 329BC, D3B6, 36D97, 2D82, 305EA, FFF0, 3E181, 9F9B, 337B1, DFC1, 38391, 4585, 30BDE, F5D8, 3B186, 758E, 31DC6, C3AC, 3599F, 1380, 301F7, 101F7, 3EF80, A99F, 33FAC, E5C6, 38D8E, 5186, 30DD8, F7DE, 3BD85, 7F91, 323C1, CBB1, 3639B, 2181, 303F0, FDEA, 3D582, 9597, 32FB6, D9BC, 37994, 3983, 307E4, EFD2, 3A589, 698B, 317CC, BBA8, 351A3, 780, 301FD, 101FE, 3FD80, B3A4, 349A7, EDCE, 39D8A, 6189, 313D0, FBE5, 3CB83, 8D95, 32BBA, D5B8, 37196, 2F82, 305E9, FFF2, 3E581, A19C, 339B0, E1C2, 38590, 4985, 30BDC, F5D9, 3B386, 778E, 31DC5, C5AE, 35D9E, 1780, 301F5, 101F8, 3F180, ABA0, 341AB, E7C8, 3918D, 5587, 30FD6, F9DF, 3BF84, 8191, 323C0, CDB2, 3659A, 2381, 303EF, FDEC, 3D982, 9798, 331B5, DBBD, 37B93, 3D83, 307E2, F1D3, 3A788, 6B8C, 319CB, BDA9, 353A2, B80, 301FB, 101FB, 3F780, AFA2, 345A9, E9CB, 3978C, 5B88, 311D3, FBE2, 3C583, 8793, 327BD, D1B5, 36B98, 2982, 305EC, FFEF, 3DF81, 9D9A, 335B2, DFC0, 38191, 4384, 309DF, F3D6, 3AD87, 718D, 31BC8, C1AB, 357A0, 1180, 301F8, 101F5, 3EB80, A59E, 33DAE, E5C5, 38B8E, 4F86, 30DD9, F7DC, 3B985, 7D90, 321C2, C9B0, 3619C, 1D81, 303F2, FDE9, 3D382, 9196, 32DB8, D7BA, 37595, 3783, 307E5, EFD0, 3A189, 658A, 315CE, B9A7, 34FA4, 580, 301FE;',
    '
]',
    'CSET collision_warnings = ALL',
    'CSET disable_collision_warnings = false',
    'CSET enable_a = Use_ENA_Pin',
    'CSET enable_b = Always_Enabled',
    'CSET load_init_file = TRUE',
    'CSET memory_type = Single_Port_ROM',
    'CSET operating_mode_a = WRITE_FIRST',
    'CSET operating_mode_b = WRITE_FIRST',
    'CSET output_reset_value_a = 0',
    'CSET output_reset_value_b = 0',
    'CSET primitive = 8kx2',
    'CSET read_width_a = 18',
    'CSET read_width_b = 18',
    'CSET register_output_of_memory_core = false',
    'CSET register_output_of_memory_primitives = false',
    'CSET remaining_memory_locations = 0',
    'CSET use_byte_write_enable = false',
    'CSET use_regcea_pin = false',
    'CSET use_regceb_pin = false',
    'CSET use_ssra_pin = FALSE',
    'CSET use_ssrb_pin = FALSE',
    'CSET write_depth_a = 256',
    'CSET write_width_a = 18',
    'CSET write_width_b = 18',
    'CSET component_name = bmg_24_vx5_cee1e5321fc14302',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '0ce355b5a08237b7cdada58875d5fb1f',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addra => core_addr,
        clka => clk,
        ena => core_ce,
        douta => core_data_out',
      'core_name0' => 'bmg_24_vx5_cee1e5321fc14302',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Block_Memory_Generator Virtex5 Xilinx,_Inc. 2.4',
    '# 10.1.03i',
    'CSET algorithm = Minimum_Area',
    'CSET assume_synchronous_clk = false',
    'CSET byte_size = 9',
    'CSET coe_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 10000, 34BA5, 638A, 31431, D5B9, 305E7, 3CF82, 3726A, F5DB, 31FC4, 1B81, 33A51, A39D, 3020D, 3898F, 3B67A, FFED, 333B4, 3F84, 32442, BFAA, 301FA, 3AB87, 39274, E9C9, 30FD5, 3F580, 3545F, 8592, 3081F, 36999, 3DA7F, 101F7, 33FAC, 5186, 31C3A, CBB1, 303F0, 3BD85, 3826F, EFD2, 317CC, 780, 34658, 9597, 30416, 37994, 3C87D, FBE4, 329BC, 2D82, 32E4A, B1A3, 30003, 3998B, 3A477, DFC1, 30BDE, 3E181, 36265, 758E, 30C28, 3599F, 3EE80, 101FB, 345A9, 5B88, 31835, D1B5, 305EC, 3C583, 37A6D, F3D6, 31BC8, 1180, 34055, 9D9A, 30211, 38191, 3BE7C, FDE9, 32DB8, 3783, 32A46, B9A7, 301FE, 3A189, 39C76, E5C5, 30DD9, 3EB80, 35C62, 7D90, 30A24, 3619C, 3E47F, FFF2, 339B0, 4985, 3203E, C5AE, 301F5, 3B386, 38A72, EDCE, 313D0, 3FD80, 34E5C, 8D95, 3061B, 37196, 3D27E, F9DF, 323C0, 2381, 3344E, ABA0, 30008, 3918D, 3AC79, DBBD, 307E2, 3D982, 36A68, 6B8C, 3102D, 353A2, 3F680, 101FE, 349A7, 5F89, 31633, D3B7, 305E9, 3CB83, 3766C, F5D9, 31DC6, 1580, 33E53, 9F9C, 3020F, 38590, 3BA7B, FDEB, 331B6, 3B83, 32644, BBA8, 301FC, 3A788, 39675, E7C7, 30FD7, 3EF80, 35860, 8191, 30821, 3659B, 3E07F, FFF4, 33DAE, 4D86, 31E3C, C7AF, 303F3, 3B985, 38671, EFD0, 315CE, 380, 34A5A, 9196, 30418, 37595, 3CC7D, F9E2, 327BE, 2982, 3324C, AFA2, 30005, 3958C, 3A878, DDBF, 309E0, 3DD81, 36666, 6F8D, 30E2A, 357A1, 3F280, 101F9, 343AB, 5587, 31A37, CDB3, 303EE, 3C184, 37E6E, F1D4, 319CA, B80, 34457, 9999, 30414, 37D93, 3C47C, FBE6, 32BBA, 3182, 32C48, B5A5, 30001, 39D8A, 3A077, E3C3, 30BDC, 3E781, 35E63, 798F, 30C26, 35D9E, 3E87F, FFF0, 337B2, 4384, 32240, C1AC, 301F7, 3AF87, 38E73, EBCB, 311D3, 3F980, 3505D, 8993, 3061D, 36D98, 3D67E, F7DD, 321C2, 1F81, 3384F, A79F, 3000A, 38D8E, 3B27A, D9BB, 307E5, 3D382, 36E69, 678B, 3122F, 34FA4, 3FC80;',
    '
]',
    'CSET collision_warnings = ALL',
    'CSET disable_collision_warnings = false',
    'CSET enable_a = Use_ENA_Pin',
    'CSET enable_b = Always_Enabled',
    'CSET load_init_file = TRUE',
    'CSET memory_type = Single_Port_ROM',
    'CSET operating_mode_a = WRITE_FIRST',
    'CSET operating_mode_b = WRITE_FIRST',
    'CSET output_reset_value_a = 0',
    'CSET output_reset_value_b = 0',
    'CSET primitive = 8kx2',
    'CSET read_width_a = 18',
    'CSET read_width_b = 18',
    'CSET register_output_of_memory_core = false',
    'CSET register_output_of_memory_primitives = false',
    'CSET remaining_memory_locations = 0',
    'CSET use_byte_write_enable = false',
    'CSET use_regcea_pin = false',
    'CSET use_regceb_pin = false',
    'CSET use_ssra_pin = FALSE',
    'CSET use_ssrb_pin = FALSE',
    'CSET write_depth_a = 256',
    'CSET write_width_a = 18',
    'CSET write_width_b = 18',
    'CSET component_name = bmg_24_vx5_2c49e6ef11a51d10',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '5673ae3d4776179766c2e65d37ddd111',
    'sourceFile' => 'hdl/xlsprom.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addra => core_addr,
        clka => clk,
        ena => core_ce,
        douta => core_data_out',
      'core_name0' => 'bmg_24_vx5_2c49e6ef11a51d10',
      'entity_name.0' => 'xlsprom',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Multiplier Virtex5 Xilinx,_Inc. 10.1',
    '# 10.1.03i',
    'CSET ccmimp = Distributed_Memory',
    'CSET clockenable = true',
    'CSET constvalue = 129',
    'CSET internaluser = 0',
    'CSET multiplier_construction = Use_Mults',
    'CSET multtype = Parallel_Multiplier',
    'CSET optgoal = Speed',
    'CSET outputwidthhigh = 37',
    'CSET outputwidthlow = 0',
    'CSET pipestages = 4',
    'CSET portatype = Signed',
    'CSET portawidth = 19',
    'CSET portbtype = Signed',
    'CSET portbwidth = 19',
    'CSET roundpoint = 0',
    'CSET sclrcepriority = CE_Overrides_SCLR',
    'CSET syncclear = true',
    'CSET use_custom_output_width = false',
    'CSET userounding = false',
    'CSET zerodetect = false',
    'CSET component_name = multiplier_virtex5_10_1_36b8f4cb731cc5b3',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a752ce8c8b5447752e7ce0253a6c22d8',
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
      'core_name0' => 'multiplier_virtex5_10_1_36b8f4cb731cc5b3',
      'entity_name.0' => 'xlmult_v9_0',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '4edaef67fd75795445cc4f5f40b2c533',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: signed((38 - 1) downto 0);
  signal b_17_35: signed((38 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (2 - 1)) of unsigned((38 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    "00000000000000000000000000000000000000",
    "00000000000000000000000000000000000000");
  signal op_mem_91_20_front_din: unsigned((38 - 1) downto 0);
  signal op_mem_91_20_back: unsigned((38 - 1) downto 0);
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
  signal cast_69_18: signed((39 - 1) downto 0);
  signal cast_69_22: signed((39 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((39 - 1) downto 0);
  signal cast_internal_s_83_3_convert: unsigned((38 - 1) downto 0);
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
  cast_69_18 <= s2s_cast(a_17_32, 32, 39, 32);
  cast_69_22 <= s2s_cast(b_17_35, 32, 39, 32);
  internal_s_69_5_addsub <= cast_69_18 + cast_69_22;
  cast_internal_s_83_3_convert <= s2u_cast(internal_s_69_5_addsub, 32, 38, 36);
  op_mem_91_20_front_din <= cast_internal_s_83_3_convert;
  op_mem_91_20_push_front_pop_back_en <= \'1\';
  cout_mem_92_22_front_din <= std_logic_vector_to_unsigned("0");
  cout_mem_92_22_push_front_pop_back_en <= \'1\';
  prev_mode_93_22_next <= std_logic_vector_to_unsigned("000");
  s <= unsigned_to_std_logic_vector(op_mem_91_20_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((38 - 1) downto 0);
    b : in std_logic_vector((38 - 1) downto 0);
    s : out std_logic_vector((38 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_96d2a7e25e',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '9bff88b469d163a63b7c23d03681840b',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b85449ab34bcfa060273e24696a539c4',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c6fafbceaf097f7e8b68a6338ed735c2',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '376cebdc601af12a1e63c9648e0dbf68',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex5 Xilinx,_Inc. 10.0',
    '# 10.1.03i',
    'CSET ainit_value = 0',
    'CSET ce = true',
    'CSET count_mode = UP',
    'CSET fb_latency = 0',
    'CSET final_count_value = 1',
    'CSET implementation = Fabric',
    'CSET increment_value = 1',
    'CSET latency = 1',
    'CSET load = false',
    'CSET output_width = 11',
    'CSET restrict_count = false',
    'CSET sclr = false',
    'CSET sinit = true',
    'CSET sinit_value = 0',
    'CSET sset = false',
    'CSET sync_ce_priority = Sync_Overrides_CE',
    'CSET sync_threshold_output = false',
    'CSET syncctrlpriority = Reset_Overrides_Set',
    'CSET component_name = binary_counter_virtex5_10_0_ed17144209261f47',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f56e6c401f7dc78ce4a1916a925373d5',
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
      'core_name0' => 'binary_counter_virtex5_10_0_ed17144209261f47',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd4294317a7a77a78e6fa33f0f73ced4c',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '2500e276344d8192ccdc955310a24e3d',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ecb5ea445f624a7b441fbead4cbe1ffc',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic;
begin
  sel_1_20 <= sel(0);
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
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
      'entity_name' => 'mux_d99e59b6d4',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'dd78bec716c306509fee1517525eca0a',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlregister.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '3045ed91267ac73e1c7ea4cdfd46fb2d',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: unsigned((64 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port <= unsigned_to_std_logic_vector(input_port_1_40);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((64 - 1) downto 0);
    output_port : out std_logic_vector((64 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_9a13f6a2a0',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '438fe8130b514476185a8a5e5523b67a',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '5c505bbafaa8086bf5fe079268dd8720',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '88df367b93b27e203e41d0ebd506f4c7',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
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
  $instrs = [
    'SELECT Binary_Counter Virtex5 Xilinx,_Inc. 10.0',
    '# 10.1.03i',
    'CSET ainit_value = 0',
    'CSET ce = true',
    'CSET count_mode = UP',
    'CSET fb_latency = 0',
    'CSET final_count_value = 1',
    'CSET implementation = Fabric',
    'CSET increment_value = 1',
    'CSET latency = 1',
    'CSET load = false',
    'CSET output_width = 10',
    'CSET restrict_count = false',
    'CSET sclr = false',
    'CSET sinit = true',
    'CSET sinit_value = 0',
    'CSET sset = false',
    'CSET sync_ce_priority = Sync_Overrides_CE',
    'CSET sync_threshold_output = false',
    'CSET syncctrlpriority = Reset_Overrides_Set',
    'CSET component_name = binary_counter_virtex5_10_0_1ee993c8ed57b9ce',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f4ef29aea96ffdd6265ceedee63d2328',
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
      'core_name0' => 'binary_counter_virtex5_10_0_1ee993c8ed57b9ce',
      'entity_name.0' => 'xlcounter_limit',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Block_Memory_Generator Virtex5 Xilinx,_Inc. 2.4',
    '# 10.1.03i',
    'CSET algorithm = Minimum_Area',
    'CSET assume_synchronous_clk = false',
    'CSET byte_size = 9',
    'CSET coe_file = [
',
    '  MEMORY_INITIALIZATION_RADIX = 16;',
    '  MEMORY_INITIALIZATION_VECTOR = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;',
    '
]',
    'CSET collision_warnings = ALL',
    'CSET disable_collision_warnings = false',
    'CSET enable_a = Use_ENA_Pin',
    'CSET enable_b = Always_Enabled',
    'CSET load_init_file = TRUE',
    'CSET memory_type = Single_Port_RAM',
    'CSET operating_mode_a = READ_FIRST',
    'CSET operating_mode_b = WRITE_FIRST',
    'CSET output_reset_value_a = 0',
    'CSET output_reset_value_b = 0',
    'CSET primitive = 8kx2',
    'CSET read_width_a = 32',
    'CSET read_width_b = 32',
    'CSET register_output_of_memory_core = false',
    'CSET register_output_of_memory_primitives = true',
    'CSET remaining_memory_locations = 0',
    'CSET use_byte_write_enable = false',
    'CSET use_regcea_pin = false',
    'CSET use_regceb_pin = false',
    'CSET use_ssra_pin = FALSE',
    'CSET use_ssrb_pin = FALSE',
    'CSET write_depth_a = 1024',
    'CSET write_width_a = 32',
    'CSET write_width_b = 32',
    'CSET component_name = bmg_24_vx5_6f3d016421754f60',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '29e18d6a558452bfe3bb8d19593a4d95',
    'sourceFile' => 'hdl/xlspram.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      addra: in std_logic_vector(c_address_width - 1 downto 0);
      clka: in std_logic;
      dina: in std_logic_vector(c_width - 1 downto 0);
      wea: in std_logic_vector(0 downto 0);
      ena: in std_logic;
      douta: out std_logic_vector(c_width - 1 downto 0)',
      'core_instance_text' => '        addra => addr,
        clka => clk,
        dina => data_in,
        wea(0) => core_we,
        ena => core_ce,
        douta => core_data_out',
      'core_name0' => 'bmg_24_vx5_6f3d016421754f60',
      'entity_name.0' => 'xlspram',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
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
  $instrs = {
    'entity_declaration_hash' => '65fe0612ce08442751607301dd310028',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_17_32: unsigned((38 - 1) downto 0);
  signal b_17_35: signed((41 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (2 - 1)) of signed((32 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    "00000000000000000000000000000000",
    "00000000000000000000000000000000");
  signal op_mem_91_20_front_din: signed((32 - 1) downto 0);
  signal op_mem_91_20_back: signed((32 - 1) downto 0);
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
  signal cast_69_18: signed((63 - 1) downto 0);
  signal cast_69_22: signed((63 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((63 - 1) downto 0);
  signal cast_internal_s_83_3_convert: signed((32 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_unsigned(a);
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
  cast_69_18 <= u2s_cast(a_17_32, 36, 63, 36);
  cast_69_22 <= s2s_cast(b_17_35, 15, 63, 36);
  internal_s_69_5_addsub <= cast_69_18 + cast_69_22;
  cast_internal_s_83_3_convert <= s2s_cast(internal_s_69_5_addsub, 36, 32, 15);
  op_mem_91_20_front_din <= cast_internal_s_83_3_convert;
  op_mem_91_20_push_front_pop_back_en <= \'1\';
  cout_mem_92_22_front_din <= std_logic_vector_to_unsigned("0");
  cout_mem_92_22_push_front_pop_back_en <= \'1\';
  prev_mode_93_22_next <= std_logic_vector_to_unsigned("000");
  s <= signed_to_std_logic_vector(op_mem_91_20_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((38 - 1) downto 0);
    b : in std_logic_vector((41 - 1) downto 0);
    s : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'addsub_4238e1a78a',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '3c78ab2999e2c4f58ee1ee7a057cebcb',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic_vector((32 - 1) downto 0);
  signal d1_1_27: std_logic_vector((32 - 1) downto 0);
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((41 - 1) downto 0);
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
        unregy_join_6_1 <= cast(d0_1_24, 15, 41, 15, xlSigned);
      when others =>
        unregy_join_6_1 <= cast(d1_1_27, 6, 41, 15, xlSigned);
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end',
      'crippled_entity' => 'is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((32 - 1) downto 0);
    d1 : in std_logic_vector((32 - 1) downto 0);
    y : out std_logic_vector((41 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_10eb3a1f2d',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c8ac2f8b02c35d537ca2d762269f7a07',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "00000000000000000000000000000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_37567836aa',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b4715cd786ff794c20bd78b38d040dea',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: unsigned((8 - 1) downto 0);
  signal in1_1_27: unsigned((8 - 1) downto 0);
  signal in2_1_31: unsigned((8 - 1) downto 0);
  signal in3_1_35: unsigned((8 - 1) downto 0);
  signal in4_1_39: unsigned((8 - 1) downto 0);
  signal in5_1_43: unsigned((8 - 1) downto 0);
  signal in6_1_47: unsigned((8 - 1) downto 0);
  signal in7_1_51: unsigned((8 - 1) downto 0);
  signal y_2_1_concat: unsigned((64 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  in2_1_31 <= std_logic_vector_to_unsigned(in2);
  in3_1_35 <= std_logic_vector_to_unsigned(in3);
  in4_1_39 <= std_logic_vector_to_unsigned(in4);
  in5_1_43 <= std_logic_vector_to_unsigned(in5);
  in6_1_47 <= std_logic_vector_to_unsigned(in6);
  in7_1_51 <= std_logic_vector_to_unsigned(in7);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27) & unsigned_to_std_logic_vector(in2_1_31) & unsigned_to_std_logic_vector(in3_1_35) & unsigned_to_std_logic_vector(in4_1_39) & unsigned_to_std_logic_vector(in5_1_43) & unsigned_to_std_logic_vector(in6_1_47) & unsigned_to_std_logic_vector(in7_1_51));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((8 - 1) downto 0);
    in1 : in std_logic_vector((8 - 1) downto 0);
    in2 : in std_logic_vector((8 - 1) downto 0);
    in3 : in std_logic_vector((8 - 1) downto 0);
    in4 : in std_logic_vector((8 - 1) downto 0);
    in5 : in std_logic_vector((8 - 1) downto 0);
    in6 : in std_logic_vector((8 - 1) downto 0);
    in7 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((64 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_15d98836ad',
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
    'entity_declaration_hash' => 'fb8e414a27927891e911dc1d8d84d766',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d_1_22: std_logic_vector((8 - 1) downto 0);
  type array_type_op_mem_20_24 is array (0 to (2 - 1)) of std_logic_vector((8 - 1) downto 0);
  signal op_mem_20_24: array_type_op_mem_20_24 := (
    "00000000",
    "00000000");
  signal op_mem_20_24_front_din: std_logic_vector((8 - 1) downto 0);
  signal op_mem_20_24_back: std_logic_vector((8 - 1) downto 0);
  signal op_mem_20_24_push_front_pop_back_en: std_logic;
begin
  d_1_22 <= d;
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
  q <= op_mem_20_24_back;
end',
      'crippled_entity' => 'is
  port (
    d : in std_logic_vector((8 - 1) downto 0);
    q : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'delay_23f848c85b',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd89abdbde1c643f275262d6974ea477e',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d_1_22: std_logic_vector((32 - 1) downto 0);
  type array_type_op_mem_20_24 is array (0 to (2 - 1)) of std_logic_vector((32 - 1) downto 0);
  signal op_mem_20_24: array_type_op_mem_20_24 := (
    "00000000000000000000000000000000",
    "00000000000000000000000000000000");
  signal op_mem_20_24_front_din: std_logic_vector((32 - 1) downto 0);
  signal op_mem_20_24_back: std_logic_vector((32 - 1) downto 0);
  signal op_mem_20_24_push_front_pop_back_en: std_logic;
begin
  d_1_22 <= d;
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
      'entity_name' => 'delay_3f5b23b538',
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
    'entity_declaration_hash' => 'bd81de0c12cd685d6d0877967728ef3f',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d_1_22: std_logic_vector((38 - 1) downto 0);
  type array_type_op_mem_20_24 is array (0 to (2 - 1)) of std_logic_vector((38 - 1) downto 0);
  signal op_mem_20_24: array_type_op_mem_20_24 := (
    "00000000000000000000000000000000000000",
    "00000000000000000000000000000000000000");
  signal op_mem_20_24_front_din: std_logic_vector((38 - 1) downto 0);
  signal op_mem_20_24_back: std_logic_vector((38 - 1) downto 0);
  signal op_mem_20_24_push_front_pop_back_en: std_logic;
begin
  d_1_22 <= d;
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
  q <= op_mem_20_24_back;
end',
      'crippled_entity' => 'is
  port (
    d : in std_logic_vector((38 - 1) downto 0);
    q : out std_logic_vector((38 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'delay_b40a532a7c',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd54d3ff1b293e131b845a8d1200d39c3',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d_1_22: std_logic_vector((38 - 1) downto 0);
  type array_type_op_mem_20_24 is array (0 to (1 - 1)) of std_logic_vector((38 - 1) downto 0);
  signal op_mem_20_24: array_type_op_mem_20_24 := (
    0 => "00000000000000000000000000000000000000");
  signal op_mem_20_24_front_din: std_logic_vector((38 - 1) downto 0);
  signal op_mem_20_24_back: std_logic_vector((38 - 1) downto 0);
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
    d : in std_logic_vector((38 - 1) downto 0);
    q : out std_logic_vector((38 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'delay_d64b27fc5c',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '86807c14219244b800eead1b624aff03',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d_1_22: std_logic;
  type array_type_op_mem_20_24 is array (0 to (3 - 1)) of std_logic;
  signal op_mem_20_24: array_type_op_mem_20_24 := (
    \'0\',
    \'0\',
    \'0\');
  signal op_mem_20_24_front_din: std_logic;
  signal op_mem_20_24_back: std_logic;
  signal op_mem_20_24_push_front_pop_back_en: std_logic;
begin
  d_1_22 <= d(0);
  op_mem_20_24_back <= op_mem_20_24(2);
  proc_op_mem_20_24: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_20_24_push_front_pop_back_en = \'1\')) then
        for i in 2 downto 1 loop 
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
      'entity_name' => 'delay_23d71a76f2',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '853c45a2d305c5c06f510481e8dc92f0',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d_1_22: std_logic_vector((38 - 1) downto 0);
  type array_type_op_mem_20_24 is array (0 to (3 - 1)) of std_logic_vector((38 - 1) downto 0);
  signal op_mem_20_24: array_type_op_mem_20_24 := (
    "00000000000000000000000000000000000000",
    "00000000000000000000000000000000000000",
    "00000000000000000000000000000000000000");
  signal op_mem_20_24_front_din: std_logic_vector((38 - 1) downto 0);
  signal op_mem_20_24_back: std_logic_vector((38 - 1) downto 0);
  signal op_mem_20_24_push_front_pop_back_en: std_logic;
begin
  d_1_22 <= d;
  op_mem_20_24_back <= op_mem_20_24(2);
  proc_op_mem_20_24: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_20_24_push_front_pop_back_en = \'1\')) then
        for i in 2 downto 1 loop 
          op_mem_20_24(i) <= op_mem_20_24(i-1);
        end loop;
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
    d : in std_logic_vector((38 - 1) downto 0);
    q : out std_logic_vector((38 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'delay_29899636e8',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
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
    'entity_declaration_hash' => '40a1a945129e58bf0eb6a88f152f50ce',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: unsigned((8 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port <= unsigned_to_std_logic_vector(input_port_1_40);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((8 - 1) downto 0);
    output_port : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_f21e7f2ddf',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '58e09d49ae4b74675ec2eb79a3572a38',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal ip_1_23: unsigned((18 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (2 - 1)) of unsigned((18 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    "000000000000000000",
    "000000000000000000");
  signal op_mem_46_20_front_din: unsigned((18 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((18 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: unsigned((18 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(1);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_46_20_push_front_pop_back_en = \'1\')) then
        for i in 1 downto 1 loop 
          op_mem_46_20(i) <= op_mem_46_20(i-1);
        end loop;
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= u2u_cast(ip_1_23, 2, 18, 0);
  op_mem_46_20_front_din <= cast_internal_ip_36_3_convert;
  op_mem_46_20_push_front_pop_back_en <= \'1\';
  op <= unsigned_to_std_logic_vector(op_mem_46_20_back);
end',
      'crippled_entity' => 'is
  port (
    ip : in std_logic_vector((18 - 1) downto 0);
    op : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'shift_407d711ee5',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '6360a77f41a38ffc8716a63e9c8d25b6',
    'sourceFile' => 'C:/Xilinx/10.1/DSP_Tools/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex5 Xilinx,_Inc. 10.0',
    '# 10.1.03i',
    'CSET ainit_value = 0',
    'CSET ce = true',
    'CSET count_mode = UP',
    'CSET fb_latency = 0',
    'CSET final_count_value = 1',
    'CSET implementation = Fabric',
    'CSET increment_value = 1',
    'CSET latency = 1',
    'CSET load = false',
    'CSET output_width = 32',
    'CSET restrict_count = false',
    'CSET sclr = false',
    'CSET sinit = true',
    'CSET sinit_value = 0',
    'CSET sset = false',
    'CSET sync_ce_priority = Sync_Overrides_CE',
    'CSET sync_threshold_output = false',
    'CSET syncctrlpriority = Reset_Overrides_Set',
    'CSET component_name = binary_counter_virtex5_10_0_487c95d8131ef26d',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c71d9e2e4a90f95cee14aa7b00e4b2a4',
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
      'core_name0' => 'binary_counter_virtex5_10_0_487c95d8131ef26d',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Binary_Counter Virtex5 Xilinx,_Inc. 10.0',
    '# 10.1.03i',
    'CSET ainit_value = 0',
    'CSET ce = true',
    'CSET count_mode = UP',
    'CSET fb_latency = 0',
    'CSET final_count_value = 1',
    'CSET implementation = Fabric',
    'CSET increment_value = 1',
    'CSET latency = 1',
    'CSET load = false',
    'CSET output_width = 27',
    'CSET restrict_count = false',
    'CSET sclr = false',
    'CSET sinit = true',
    'CSET sinit_value = 0',
    'CSET sset = false',
    'CSET sync_ce_priority = Sync_Overrides_CE',
    'CSET sync_threshold_output = false',
    'CSET syncctrlpriority = Reset_Overrides_Set',
    'CSET component_name = binary_counter_virtex5_10_0_f8c7b661c01eeb1d',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '9307417abe09cf359c2ef53c754c096a',
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
      'core_name0' => 'binary_counter_virtex5_10_0_f8c7b661c01eeb1d',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
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
  open(RESULTS, '> D:/casper10_1/projects/radix4/r4_iadc_spec/sysgen/sysgen/script_results19353') || 
    croak 'couldn\'t open D:/casper10_1/projects/radix4/r4_iadc_spec/sysgen/sysgen/script_results19353';
  binmode(RESULTS);
  print RESULTS &Sg::toString($results) . "\n";
  close(RESULTS) || 
    croak 'trouble writing D:/casper10_1/projects/radix4/r4_iadc_spec/sysgen/sysgen/script_results19353';
};

if ($@) {
  open(RESULTS, '> D:/casper10_1/projects/radix4/r4_iadc_spec/sysgen/sysgen/script_results19353') || 
    croak 'couldn\'t open D:/casper10_1/projects/radix4/r4_iadc_spec/sysgen/sysgen/script_results19353';
  binmode(RESULTS);
  print RESULTS $@ . "\n";
  close(RESULTS) || 
    croak 'trouble writing D:/casper10_1/projects/radix4/r4_iadc_spec/sysgen/sysgen/script_results19353';
  exit(1);
}

exit(0);
