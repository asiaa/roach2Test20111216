#################################################################
# Makefile generated by Xilinx Platform Studio 
# Project:/home/homin/roach2/model/r2_5g_f01/XPS_ROACH2_base/system.xmp
#
# WARNING : This file will be re-generated every time a command
# to run a make target is invoked. So, any changes made to this  
# file manually, will be lost when make is invoked next. 
#################################################################

XILINX_EDK_DIR = /opt/Xilinx/11.1/EDK
NON_CYG_XILINX_EDK_DIR = /opt/Xilinx/11.1/EDK

SYSTEM = system

MHSFILE = system.mhs

MSSFILE = system.mss

FPGA_ARCH = virtex6

DEVICE = xc6vsx475tff1759-1

LANGUAGE = vhdl

SEARCHPATHOPT = 
GLOBAL_SEARCHPATHOPT = 

SUBMODULE_OPT = 

PLATGEN_OPTIONS = -p $(DEVICE) -lang $(LANGUAGE) $(SEARCHPATHOPT) $(SUBMODULE_OPT) -msg __xps/ise/xmsgprops.lst

LIBGEN_OPTIONS = -mhs $(MHSFILE) -p $(DEVICE) $(SEARCHPATHOPT) -msg __xps/ise/xmsgprops.lst

OBSERVE_PAR_OPTIONS = -error yes

MICROBLAZE_BOOTLOOP = $(XILINX_EDK_DIR)/sw/lib/microblaze/mb_bootloop.elf
PPC405_BOOTLOOP = $(XILINX_EDK_DIR)/sw/lib/ppc405/ppc_bootloop.elf
PPC440_BOOTLOOP = $(XILINX_EDK_DIR)/sw/lib/ppc440/ppc440_bootloop.elf
BOOTLOOP_DIR = bootloops

BRAMINIT_ELF_FILES =  
BRAMINIT_ELF_FILE_ARGS =  

ALL_USER_ELF_FILES = 

SIM_CMD = vsim

BEHAVIORAL_SIM_SCRIPT = simulation/behavioral/$(SYSTEM)_setup.do

STRUCTURAL_SIM_SCRIPT = simulation/structural/$(SYSTEM)_setup.do

TIMING_SIM_SCRIPT = simulation/timing/$(SYSTEM)_setup.do

DEFAULT_SIM_SCRIPT = $(BEHAVIORAL_SIM_SCRIPT)

MIX_LANG_SIM_OPT = -mixed yes

SIMGEN_OPTIONS = -p $(DEVICE) -lang $(LANGUAGE) $(SEARCHPATHOPT) $(BRAMINIT_ELF_FILE_ARGS) $(MIX_LANG_SIM_OPT) -msg __xps/ise/xmsgprops.lst -s mti


LIBRARIES = 

LIBSCLEAN_TARGETS = 

PROGRAMCLEAN_TARGETS = 

CORE_STATE_DEVELOPMENT_FILES = /home/homin/roach2/model/r2_5g_f01/XPS_ROACH2_base/pcores/bram_block_custom_v1_00_a/netlist/dummy.edn \
pcores/opb_adc5g_controller_v1_00_a/hdl/verilog/adc_config_mux.v \
pcores/opb_adc5g_controller_v1_00_a/hdl/vhdl/user_logic.vhd \
pcores/opb_adc5g_controller_v1_00_a/hdl/vhdl/opb_adc5g_controller.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/proc_common_pkg.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/family.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/or_muxcy.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/or_gate.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/counter_bit.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/counter.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/inferred_lut4.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/srl_fifo2.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/pf_counter_bit.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/pf_counter.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/pf_counter_top.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/pf_occ_counter.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/pf_occ_counter_top.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/pf_adder_bit.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/pf_adder.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/pf_dpram_select.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/srl16_fifo.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/pselect.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/valid_be.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/ld_arith_reg.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/mux_onehot.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/down_counter.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/ipif_pkg.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/ipif_steer.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/proc_common_v2_00_a/hdl/vhdl/direct_path_cntr_ai.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/interrupt_control_v1_00_a/hdl/vhdl/interrupt_control.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/wrpfifo_v1_01_b/hdl/vhdl/pf_dly1_mux.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/wrpfifo_v1_01_b/hdl/vhdl/ipif_control_wr.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/wrpfifo_v1_01_b/hdl/vhdl/wrpfifo_dp_cntl.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/wrpfifo_v1_01_b/hdl/vhdl/wrpfifo_top.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/rdpfifo_v1_01_b/hdl/vhdl/ipif_control_rd.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/rdpfifo_v1_01_b/hdl/vhdl/rdpfifo_dp_cntl.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/rdpfifo_v1_01_b/hdl/vhdl/rdpfifo_top.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/opb_ipif_v3_01_a/hdl/vhdl/reset_mir.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/opb_ipif_v3_01_a/hdl/vhdl/brst_addr_cntr.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/opb_ipif_v3_01_a/hdl/vhdl/opb_flex_addr_cntr.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/opb_ipif_v3_01_a/hdl/vhdl/brst_addr_cntr_reg.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/opb_ipif_v3_01_a/hdl/vhdl/opb_be_gen.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/opb_ipif_v3_01_a/hdl/vhdl/srl_fifo3.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/opb_ipif_v3_01_a/hdl/vhdl/write_buffer.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/opb_ipif_v3_01_a/hdl/vhdl/opb_bam.vhd \
/opt/Xilinx/11.1/EDK/hw/XilinxProcessorIPLib/pcores/opb_ipif_v3_01_a/hdl/vhdl/opb_ipif.vhd \
pcores/roach_infrastructure_v1_00_a/hdl/verilog/roach_infrastructure.v \
pcores/reset_block_v1_00_a/hdl/verilog/reset_block.v \
pcores/epb32_opb_bridge_v1_00_a/hdl/verilog/epb32_opb_bridge.v \
pcores/epb_infrastructure_v1_00_a/hdl/verilog/epb_infrastructure.v \
pcores/sys_block_v1_00_a/hdl/verilog/sys_block.v \
pcores/opb_register_ppc2simulink_v1_00_a/hdl/verilog/opb_register_ppc2simulink.v \
pcores/adc5g_dmux1_interface_v1_00_a/hdl/verilog/gc2bin.v \
pcores/adc5g_dmux1_interface_v1_00_a/hdl/vhdl/adc5g_dmux1_interface.vhd \
pcores/bram_block_custom_v1_00_a/hdl/verilog/bram_block_custom.v \
pcores/bram_block_custom_v1_00_a/hdl/verilog/bram.v \
pcores/opb_register_simulink2ppc_v1_00_a/hdl/verilog/opb_register_simulink2ppc.v \
pcores/bram_if_v1_00_a/hdl/vhdl/bram_if.vhd

WRAPPER_NGC_FILES = implementation/opb_adc5g_controller_0_wrapper.ngc \
implementation/infrastructure_inst_wrapper.ngc \
implementation/reset_block_inst_wrapper.ngc \
implementation/opb0_wrapper.ngc \
implementation/epb_opb_bridge_inst_wrapper.ngc \
implementation/epb_infrastructure_inst_wrapper.ngc \
implementation/sys_block_inst_wrapper.ngc \
implementation/r2_5g_f01_acc_len_wrapper.ngc \
implementation/r2_5g_f01_adc5g_wrapper.ngc \
implementation/r2_5g_f01_cnt_rst_wrapper.ngc \
implementation/r2_5g_f01_snap_adc0_bram_ramblk_wrapper.ngc \
implementation/r2_5g_f01_snap_adc0_bram_wrapper.ngc \
implementation/r2_5g_f01_snap_adc0_ctrl_wrapper.ngc \
implementation/r2_5g_f01_snap_adc0_status_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc0_addr_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc0_bram_ramif_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc0_bram_ramblk_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc0_bram_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc0_ctrl_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc1_addr_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc1_bram_ramif_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc1_bram_ramblk_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc1_bram_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc1_ctrl_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc2_addr_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc2_bram_ramif_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc2_bram_ramblk_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc2_bram_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc2_ctrl_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc3_addr_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc3_bram_ramif_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc3_bram_ramblk_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc3_bram_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc3_ctrl_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc4_addr_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc4_bram_ramif_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc4_bram_ramblk_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc4_bram_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc4_ctrl_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc5_addr_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc5_bram_ramif_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc5_bram_ramblk_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc5_bram_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc5_ctrl_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc6_addr_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc6_bram_ramif_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc6_bram_ramblk_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc6_bram_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc6_ctrl_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc7_addr_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc7_bram_ramif_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc7_bram_ramblk_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc7_bram_wrapper.ngc \
implementation/r2_5g_f01_snap_vacc7_ctrl_wrapper.ngc

POSTSYN_NETLIST = implementation/$(SYSTEM).ngc

SYSTEM_BIT = implementation/$(SYSTEM).bit

DOWNLOAD_BIT = implementation/download.bit

SYSTEM_ACE = implementation/$(SYSTEM).ace

UCF_FILE = data/system.ucf

BMM_FILE = implementation/$(SYSTEM).bmm

BITGEN_UT_FILE = etc/bitgen.ut

XFLOW_OPT_FILE = etc/fast_runtime.opt
XFLOW_DEPENDENCY = __xps/xpsxflow.opt $(XFLOW_OPT_FILE)

XPLORER_DEPENDENCY = __xps/xplorer.opt
XPLORER_OPTIONS = -p $(DEVICE) -uc $(SYSTEM).ucf -bm $(SYSTEM).bmm -max_runs 7

FPGA_IMP_DEPENDENCY = $(BMM_FILE) $(POSTSYN_NETLIST) $(UCF_FILE) $(XFLOW_DEPENDENCY)

SDK_EXPORT_DIR = /home/homin/roach2/model/r2_5g_f01/XPS_ROACH2_base/SDK/SDK_Export/hw
SYSTEM_HW_HANDOFF = $(SDK_EXPORT_DIR)/$(SYSTEM).xml
SYSTEM_HW_HANDOFF_BIT = $(SDK_EXPORT_DIR)/$(SYSTEM).bit
SYSTEM_HW_HANDOFF_BMM = $(SDK_EXPORT_DIR)/$(SYSTEM)_bd.bmm
SYSTEM_HW_HANDOFF_DEP = $(SYSTEM_HW_HANDOFF) $(SYSTEM_HW_HANDOFF_BIT) $(SYSTEM_HW_HANDOFF_BMM)
