-------------------------------------------------------------------------------
-- system.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity system is
  port (
    bref_clk_bottom_p : in std_logic;
    bref_clk_bottom_n : in std_logic;
    adc0_adc3wire_clk : out std_logic;
    adc0_adc3wire_data : out std_logic;
    adc0_adc3wire_strobe : out std_logic;
    adc0_modepin : out std_logic;
    adc1_adc3wire_clk : out std_logic;
    adc1_adc3wire_data : out std_logic;
    adc1_adc3wire_strobe : out std_logic;
    adc1_modepin : out std_logic;
    rs232_rtsN : out std_logic;
    rs232_rx : in std_logic;
    rs232_tx : out std_logic;
    reset_n : in std_logic;
    sysclk_p : in std_logic;
    sysclk_m : in std_logic;
    phy_slew : out std_logic_vector(1 downto 0);
    phy_reset_n : out std_logic;
    XAUI1_tx_l0_p : out std_logic;
    XAUI1_tx_l0_n : out std_logic;
    XAUI1_tx_l1_p : out std_logic;
    XAUI1_tx_l1_n : out std_logic;
    XAUI1_tx_l2_p : out std_logic;
    XAUI1_tx_l2_n : out std_logic;
    XAUI1_tx_l3_p : out std_logic;
    XAUI1_tx_l3_n : out std_logic;
    XAUI1_rx_l0_p : in std_logic;
    XAUI1_rx_l0_n : in std_logic;
    XAUI1_rx_l1_p : in std_logic;
    XAUI1_rx_l1_n : in std_logic;
    XAUI1_rx_l2_p : in std_logic;
    XAUI1_rx_l2_n : in std_logic;
    XAUI1_rx_l3_p : in std_logic;
    XAUI1_rx_l3_n : in std_logic;
    adc0clk_p : in std_logic;
    adc0clk_n : in std_logic;
    adc0sync_p : in std_logic;
    adc0sync_n : in std_logic;
    adc0outofrangei_p : in std_logic;
    adc0outofrangei_n : in std_logic;
    adc0outofrangeq_p : in std_logic;
    adc0outofrangeq_n : in std_logic;
    adc0dataeveni_p : in std_logic_vector(7 downto 0);
    adc0dataeveni_n : in std_logic_vector(7 downto 0);
    adc0dataoddi_p : in std_logic_vector(7 downto 0);
    adc0dataoddi_n : in std_logic_vector(7 downto 0);
    adc0dataevenq_p : in std_logic_vector(7 downto 0);
    adc0dataevenq_n : in std_logic_vector(7 downto 0);
    adc0dataoddq_p : in std_logic_vector(7 downto 0);
    adc0dataoddq_n : in std_logic_vector(7 downto 0);
    adc0ddrb_p : out std_logic;
    adc0ddrb_n : out std_logic;
    adc1clk_p : in std_logic;
    adc1clk_n : in std_logic;
    adc1sync_p : in std_logic;
    adc1sync_n : in std_logic;
    adc1outofrangei_p : in std_logic;
    adc1outofrangei_n : in std_logic;
    adc1outofrangeq_p : in std_logic;
    adc1outofrangeq_n : in std_logic;
    adc1dataeveni_p : in std_logic_vector(7 downto 0);
    adc1dataeveni_n : in std_logic_vector(7 downto 0);
    adc1dataoddi_p : in std_logic_vector(7 downto 0);
    adc1dataoddi_n : in std_logic_vector(7 downto 0);
    adc1dataevenq_p : in std_logic_vector(7 downto 0);
    adc1dataevenq_n : in std_logic_vector(7 downto 0);
    adc1dataoddq_p : in std_logic_vector(7 downto 0);
    adc1dataoddq_n : in std_logic_vector(7 downto 0);
    adc1ddrb_p : out std_logic;
    adc1ddrb_n : out std_logic;
    sram0_address : out std_logic_vector(18 downto 0);
    sram0_bw_b : out std_logic_vector(3 downto 0);
    sram0_we_b : out std_logic;
    sram0_adv_ld_b : out std_logic;
    sram0_clk : out std_logic;
    sram0_ce : out std_logic;
    sram0_oe_b : out std_logic;
    sram0_cen_b : out std_logic;
    sram0_dq : inout std_logic_vector(35 downto 0);
    sram0_mode : out std_logic;
    sram0_zz : out std_logic;
    sram1_address : out std_logic_vector(18 downto 0);
    sram1_bw_b : out std_logic_vector(3 downto 0);
    sram1_we_b : out std_logic;
    sram1_adv_ld_b : out std_logic;
    sram1_clk : out std_logic;
    sram1_ce : out std_logic;
    sram1_oe_b : out std_logic;
    sram1_cen_b : out std_logic;
    sram1_dq : inout std_logic_vector(35 downto 0);
    sram1_mode : out std_logic;
    sram1_zz : out std_logic;
    i_128w_2k_10_r310iadc_gpio_ext : out std_logic_vector(0 to 0);
    i_128w_2k_10_r310iadc_led1_arm_ext : out std_logic_vector(0 to 0);
    i_128w_2k_10_r310iadc_led2_sync_ext : out std_logic_vector(0 to 0);
    i_128w_2k_10_r310iadc_led4_eq_clip_ext : out std_logic_vector(0 to 0);
    i_128w_2k_10_r310iadc_led5_adc_clip_ext : out std_logic_vector(0 to 0);
    i_128w_2k_10_r310iadc_led6_link_dn_ext : out std_logic_vector(0 to 0);
    i_128w_2k_10_r310iadc_led7_xaui_overlfow_ext : out std_logic_vector(0 to 0)
  );
end system;

architecture STRUCTURE of system is

  component reset_block_wrapper is
    port (
      Slowest_sync_clk : in std_logic;
      Ext_Reset_In : in std_logic;
      Aux_Reset_In : in std_logic;
      Core_Reset_Req : in std_logic;
      Chip_Reset_Req : in std_logic;
      System_Reset_Req : in std_logic;
      Dcm_locked : in std_logic;
      Rstc405resetcore : out std_logic;
      Rstc405resetchip : out std_logic;
      Rstc405resetsys : out std_logic;
      Bus_Struct_Reset : out std_logic_vector(0 to 0);
      Peripheral_Reset : out std_logic_vector(0 to 0)
    );
  end component;

  component dcm_0_wrapper is
    port (
      RST : in std_logic;
      CLKIN : in std_logic;
      CLKFB : in std_logic;
      PSEN : in std_logic;
      PSINCDEC : in std_logic;
      PSCLK : in std_logic;
      DSSEN : in std_logic;
      CLK0 : out std_logic;
      CLK90 : out std_logic;
      CLK180 : out std_logic;
      CLK270 : out std_logic;
      CLKDV : out std_logic;
      CLK2X : out std_logic;
      CLK2X180 : out std_logic;
      CLKFX : out std_logic;
      CLKFX180 : out std_logic;
      STATUS : out std_logic_vector(7 downto 0);
      LOCKED : out std_logic;
      PSDONE : out std_logic
    );
  end component;

  component dcm_1_wrapper is
    port (
      RST : in std_logic;
      CLKIN : in std_logic;
      CLKFB : in std_logic;
      PSEN : in std_logic;
      PSINCDEC : in std_logic;
      PSCLK : in std_logic;
      DSSEN : in std_logic;
      CLK0 : out std_logic;
      CLK90 : out std_logic;
      CLK180 : out std_logic;
      CLK270 : out std_logic;
      CLKDV : out std_logic;
      CLK2X : out std_logic;
      CLK2X180 : out std_logic;
      CLKFX : out std_logic;
      CLKFX180 : out std_logic;
      STATUS : out std_logic_vector(7 downto 0);
      LOCKED : out std_logic;
      PSDONE : out std_logic
    );
  end component;

  component dcm_2_wrapper is
    port (
      RST : in std_logic;
      CLKIN : in std_logic;
      CLKFB : in std_logic;
      PSEN : in std_logic;
      PSINCDEC : in std_logic;
      PSCLK : in std_logic;
      DSSEN : in std_logic;
      CLK0 : out std_logic;
      CLK90 : out std_logic;
      CLK180 : out std_logic;
      CLK270 : out std_logic;
      CLKDV : out std_logic;
      CLK2X : out std_logic;
      CLK2X180 : out std_logic;
      CLKFX : out std_logic;
      CLKFX180 : out std_logic;
      STATUS : out std_logic_vector(7 downto 0);
      LOCKED : out std_logic;
      PSDONE : out std_logic
    );
  end component;

  component dcm_3_wrapper is
    port (
      RST : in std_logic;
      CLKIN : in std_logic;
      CLKFB : in std_logic;
      PSEN : in std_logic;
      PSINCDEC : in std_logic;
      PSCLK : in std_logic;
      DSSEN : in std_logic;
      CLK0 : out std_logic;
      CLK90 : out std_logic;
      CLK180 : out std_logic;
      CLK270 : out std_logic;
      CLKDV : out std_logic;
      CLK2X : out std_logic;
      CLK2X180 : out std_logic;
      CLKFX : out std_logic;
      CLKFX180 : out std_logic;
      STATUS : out std_logic_vector(7 downto 0);
      LOCKED : out std_logic;
      PSDONE : out std_logic
    );
  end component;

  component ppc405_1_wrapper is
    port (
      C405CPMCORESLEEPREQ : out std_logic;
      C405CPMMSRCE : out std_logic;
      C405CPMMSREE : out std_logic;
      C405CPMTIMERIRQ : out std_logic;
      C405CPMTIMERRESETREQ : out std_logic;
      C405XXXMACHINECHECK : out std_logic;
      CPMC405CLOCK : in std_logic;
      CPMC405CORECLKINACTIVE : in std_logic;
      CPMC405CPUCLKEN : in std_logic;
      CPMC405JTAGCLKEN : in std_logic;
      CPMC405TIMERCLKEN : in std_logic;
      CPMC405TIMERTICK : in std_logic;
      MCBCPUCLKEN : in std_logic;
      MCBTIMEREN : in std_logic;
      MCPPCRST : in std_logic;
      PLBCLK : in std_logic;
      DCRCLK : in std_logic;
      C405RSTCHIPRESETREQ : out std_logic;
      C405RSTCORERESETREQ : out std_logic;
      C405RSTSYSRESETREQ : out std_logic;
      RSTC405RESETCHIP : in std_logic;
      RSTC405RESETCORE : in std_logic;
      RSTC405RESETSYS : in std_logic;
      C405PLBICUABUS : out std_logic_vector(0 to 31);
      C405PLBICUBE : out std_logic_vector(0 to 7);
      C405PLBICURNW : out std_logic;
      C405PLBICUABORT : out std_logic;
      C405PLBICUBUSLOCK : out std_logic;
      C405PLBICUU0ATTR : out std_logic;
      C405PLBICUGUARDED : out std_logic;
      C405PLBICULOCKERR : out std_logic;
      C405PLBICUMSIZE : out std_logic_vector(0 to 1);
      C405PLBICUORDERED : out std_logic;
      C405PLBICUPRIORITY : out std_logic_vector(0 to 1);
      C405PLBICURDBURST : out std_logic;
      C405PLBICUREQUEST : out std_logic;
      C405PLBICUSIZE : out std_logic_vector(0 to 3);
      C405PLBICUTYPE : out std_logic_vector(0 to 2);
      C405PLBICUWRBURST : out std_logic;
      C405PLBICUWRDBUS : out std_logic_vector(0 to 63);
      C405PLBICUCACHEABLE : out std_logic;
      PLBC405ICUADDRACK : in std_logic;
      PLBC405ICUBUSY : in std_logic;
      PLBC405ICUERR : in std_logic;
      PLBC405ICURDBTERM : in std_logic;
      PLBC405ICURDDACK : in std_logic;
      PLBC405ICURDDBUS : in std_logic_vector(0 to 63);
      PLBC405ICURDWDADDR : in std_logic_vector(0 to 3);
      PLBC405ICUREARBITRATE : in std_logic;
      PLBC405ICUWRBTERM : in std_logic;
      PLBC405ICUWRDACK : in std_logic;
      PLBC405ICUSSIZE : in std_logic_vector(0 to 1);
      PLBC405ICUSERR : in std_logic;
      PLBC405ICUSBUSYS : in std_logic;
      C405PLBDCUABUS : out std_logic_vector(0 to 31);
      C405PLBDCUBE : out std_logic_vector(0 to 7);
      C405PLBDCURNW : out std_logic;
      C405PLBDCUABORT : out std_logic;
      C405PLBDCUBUSLOCK : out std_logic;
      C405PLBDCUU0ATTR : out std_logic;
      C405PLBDCUGUARDED : out std_logic;
      C405PLBDCULOCKERR : out std_logic;
      C405PLBDCUMSIZE : out std_logic_vector(0 to 1);
      C405PLBDCUORDERED : out std_logic;
      C405PLBDCUPRIORITY : out std_logic_vector(0 to 1);
      C405PLBDCURDBURST : out std_logic;
      C405PLBDCUREQUEST : out std_logic;
      C405PLBDCUSIZE : out std_logic_vector(0 to 3);
      C405PLBDCUTYPE : out std_logic_vector(0 to 2);
      C405PLBDCUWRBURST : out std_logic;
      C405PLBDCUWRDBUS : out std_logic_vector(0 to 63);
      C405PLBDCUCACHEABLE : out std_logic;
      C405PLBDCUWRITETHRU : out std_logic;
      PLBC405DCUADDRACK : in std_logic;
      PLBC405DCUBUSY : in std_logic;
      PLBC405DCUERR : in std_logic;
      PLBC405DCURDBTERM : in std_logic;
      PLBC405DCURDDACK : in std_logic;
      PLBC405DCURDDBUS : in std_logic_vector(0 to 63);
      PLBC405DCURDWDADDR : in std_logic_vector(0 to 3);
      PLBC405DCUREARBITRATE : in std_logic;
      PLBC405DCUWRBTERM : in std_logic;
      PLBC405DCUWRDACK : in std_logic;
      PLBC405DCUSSIZE : in std_logic_vector(0 to 1);
      PLBC405DCUSERR : in std_logic;
      PLBC405DCUSBUSYS : in std_logic;
      BRAMDSOCMCLK : in std_logic;
      BRAMDSOCMRDDBUS : in std_logic_vector(0 to 31);
      DSARCVALUE : in std_logic_vector(0 to 7);
      DSCNTLVALUE : in std_logic_vector(0 to 7);
      DSOCMBRAMABUS : out std_logic_vector(8 to 29);
      DSOCMBRAMBYTEWRITE : out std_logic_vector(0 to 3);
      DSOCMBRAMEN : out std_logic;
      DSOCMBRAMWRDBUS : out std_logic_vector(0 to 31);
      DSOCMBUSY : out std_logic;
      BRAMISOCMCLK : in std_logic;
      BRAMISOCMRDDBUS : in std_logic_vector(0 to 63);
      ISARCVALUE : in std_logic_vector(0 to 7);
      ISCNTLVALUE : in std_logic_vector(0 to 7);
      ISOCMBRAMEN : out std_logic;
      ISOCMBRAMEVENWRITEEN : out std_logic;
      ISOCMBRAMODDWRITEEN : out std_logic;
      ISOCMBRAMRDABUS : out std_logic_vector(8 to 28);
      ISOCMBRAMWRABUS : out std_logic_vector(8 to 28);
      ISOCMBRAMWRDBUS : out std_logic_vector(0 to 31);
      C405DCRABUS : out std_logic_vector(0 to 9);
      C405DCRDBUSOUT : out std_logic_vector(0 to 31);
      C405DCRREAD : out std_logic;
      C405DCRWRITE : out std_logic;
      DCRC405ACK : in std_logic;
      DCRC405DBUSIN : in std_logic_vector(0 to 31);
      EICC405CRITINPUTIRQ : in std_logic;
      EICC405EXTINPUTIRQ : in std_logic;
      C405JTGCAPTUREDR : out std_logic;
      C405JTGEXTEST : out std_logic;
      C405JTGPGMOUT : out std_logic;
      C405JTGSHIFTDR : out std_logic;
      C405JTGTDO : out std_logic;
      C405JTGTDOEN : out std_logic;
      C405JTGUPDATEDR : out std_logic;
      MCBJTAGEN : in std_logic;
      JTGC405BNDSCANTDO : in std_logic;
      JTGC405TCK : in std_logic;
      JTGC405TDI : in std_logic;
      JTGC405TMS : in std_logic;
      JTGC405TRSTNEG : in std_logic;
      C405DBGMSRWE : out std_logic;
      C405DBGSTOPACK : out std_logic;
      C405DBGWBCOMPLETE : out std_logic;
      C405DBGWBFULL : out std_logic;
      C405DBGWBIAR : out std_logic_vector(0 to 29);
      DBGC405DEBUGHALT : in std_logic;
      DBGC405EXTBUSHOLDACK : in std_logic;
      DBGC405UNCONDDEBUGEVENT : in std_logic;
      C405TRCCYCLE : out std_logic;
      C405TRCEVENEXECUTIONSTATUS : out std_logic_vector(0 to 1);
      C405TRCODDEXECUTIONSTATUS : out std_logic_vector(0 to 1);
      C405TRCTRACESTATUS : out std_logic_vector(0 to 3);
      C405TRCTRIGGEREVENTOUT : out std_logic;
      C405TRCTRIGGEREVENTTYPE : out std_logic_vector(0 to 10);
      TRCC405TRACEDISABLE : in std_logic;
      TRCC405TRIGGEREVENTIN : in std_logic
    );
  end component;

  component jtagppc_0_wrapper is
    port (
      TRSTNEG : in std_logic;
      HALTNEG0 : in std_logic;
      DBGC405DEBUGHALT0 : out std_logic;
      HALTNEG1 : in std_logic;
      DBGC405DEBUGHALT1 : out std_logic;
      C405JTGTDO0 : in std_logic;
      C405JTGTDOEN0 : in std_logic;
      JTGC405TCK0 : out std_logic;
      JTGC405TDI0 : out std_logic;
      JTGC405TMS0 : out std_logic;
      JTGC405TRSTNEG0 : out std_logic;
      C405JTGTDO1 : in std_logic;
      C405JTGTDOEN1 : in std_logic;
      JTGC405TCK1 : out std_logic;
      JTGC405TDI1 : out std_logic;
      JTGC405TMS1 : out std_logic;
      JTGC405TRSTNEG1 : out std_logic
    );
  end component;

  component plb_bram_if_cntlr_1_bram_wrapper is
    port (
      BRAM_Rst_A : in std_logic;
      BRAM_Clk_A : in std_logic;
      BRAM_EN_A : in std_logic;
      BRAM_WEN_A : in std_logic_vector(0 to 7);
      BRAM_Addr_A : in std_logic_vector(0 to 31);
      BRAM_Din_A : out std_logic_vector(0 to 63);
      BRAM_Dout_A : in std_logic_vector(0 to 63);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 7);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 63);
      BRAM_Dout_B : in std_logic_vector(0 to 63)
    );
  end component;

  component plb_bram_if_cntlr_1_wrapper is
    port (
      plb_clk : in std_logic;
      plb_rst : in std_logic;
      plb_abort : in std_logic;
      plb_abus : in std_logic_vector(0 to 31);
      plb_be : in std_logic_vector(0 to 7);
      plb_buslock : in std_logic;
      plb_compress : in std_logic;
      plb_guarded : in std_logic;
      plb_lockerr : in std_logic;
      plb_masterid : in std_logic_vector(0 to 0);
      plb_msize : in std_logic_vector(0 to 1);
      plb_ordered : in std_logic;
      plb_pavalid : in std_logic;
      plb_rnw : in std_logic;
      plb_size : in std_logic_vector(0 to 3);
      plb_type : in std_logic_vector(0 to 2);
      sl_addrack : out std_logic;
      sl_mbusy : out std_logic_vector(0 to 1);
      sl_merr : out std_logic_vector(0 to 1);
      sl_rearbitrate : out std_logic;
      sl_ssize : out std_logic_vector(0 to 1);
      sl_wait : out std_logic;
      plb_rdprim : in std_logic;
      plb_savalid : in std_logic;
      plb_wrprim : in std_logic;
      plb_wrburst : in std_logic;
      plb_wrdbus : in std_logic_vector(0 to 63);
      sl_wrbterm : out std_logic;
      sl_wrcomp : out std_logic;
      sl_wrdack : out std_logic;
      plb_rdburst : in std_logic;
      sl_rdbterm : out std_logic;
      sl_rdcomp : out std_logic;
      sl_rddack : out std_logic;
      sl_rddbus : out std_logic_vector(0 to 63);
      sl_rdwdaddr : out std_logic_vector(0 to 3);
      plb_pendreq : in std_logic;
      plb_pendpri : in std_logic_vector(0 to 1);
      plb_reqpri : in std_logic_vector(0 to 1);
      bram_rst : out std_logic;
      bram_clk : out std_logic;
      bram_en : out std_logic;
      bram_wen : out std_logic_vector(0 to 7);
      bram_addr : out std_logic_vector(0 to 31);
      bram_din : in std_logic_vector(0 to 63);
      bram_dout : out std_logic_vector(0 to 63)
    );
  end component;

  component plb2opb_bridge_0_wrapper is
    port (
      PLB_Clk : in std_logic;
      OPB_Clk : in std_logic;
      PLB_Rst : in std_logic;
      OPB_Rst : in std_logic;
      Bus_Error_Det : out std_logic;
      BGI_Trans_Abort : out std_logic;
      BGO_dcrAck : out std_logic;
      BGO_dcrDBus : out std_logic_vector(0 to 31);
      DCR_ABus : in std_logic_vector(0 to 9);
      DCR_DBus : in std_logic_vector(0 to 31);
      DCR_Read : in std_logic;
      DCR_Write : in std_logic;
      BGO_addrAck : out std_logic;
      BGO_MErr : out std_logic_vector(0 to 1);
      BGO_MBusy : out std_logic_vector(0 to 1);
      BGO_rdBTerm : out std_logic;
      BGO_rdComp : out std_logic;
      BGO_rdDAck : out std_logic;
      BGO_rdDBus : out std_logic_vector(0 to 63);
      BGO_rdWdAddr : out std_logic_vector(0 to 3);
      BGO_rearbitrate : out std_logic;
      BGO_SSize : out std_logic_vector(0 to 1);
      BGO_wait : out std_logic;
      BGO_wrBTerm : out std_logic;
      BGO_wrComp : out std_logic;
      BGO_wrDAck : out std_logic;
      PLB_abort : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_BE : in std_logic_vector(0 to 7);
      PLB_busLock : in std_logic;
      PLB_compress : in std_logic;
      PLB_guarded : in std_logic;
      PLB_lockErr : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_ordered : in std_logic;
      PLB_PAValid : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_RNW : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_wrBurst : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to 63);
      PLB_wrPrim : in std_logic;
      PLB2OPB_rearb : out std_logic;
      BGO_ABus : out std_logic_vector(0 to 31);
      BGO_BE : out std_logic_vector(0 to 3);
      BGO_busLock : out std_logic;
      BGO_DBus : out std_logic_vector(0 to 31);
      BGO_request : out std_logic;
      BGO_RNW : out std_logic;
      BGO_select : out std_logic;
      BGO_seqAddr : out std_logic;
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_errAck : in std_logic;
      OPB_MnGrant : in std_logic;
      OPB_retry : in std_logic;
      OPB_timeout : in std_logic;
      OPB_xferAck : in std_logic
    );
  end component;

  component plb_wrapper is
    port (
      PLB_Clk : in std_logic;
      SYS_Rst : in std_logic;
      PLB_Rst : out std_logic;
      PLB_dcrAck : out std_logic;
      PLB_dcrDBus : out std_logic_vector(0 to 31);
      DCR_ABus : in std_logic_vector(0 to 9);
      DCR_DBus : in std_logic_vector(0 to 31);
      DCR_Read : in std_logic;
      DCR_Write : in std_logic;
      M_ABus : in std_logic_vector(0 to 63);
      M_BE : in std_logic_vector(0 to 15);
      M_RNW : in std_logic_vector(0 to 1);
      M_abort : in std_logic_vector(0 to 1);
      M_busLock : in std_logic_vector(0 to 1);
      M_compress : in std_logic_vector(0 to 1);
      M_guarded : in std_logic_vector(0 to 1);
      M_lockErr : in std_logic_vector(0 to 1);
      M_MSize : in std_logic_vector(0 to 3);
      M_ordered : in std_logic_vector(0 to 1);
      M_priority : in std_logic_vector(0 to 3);
      M_rdBurst : in std_logic_vector(0 to 1);
      M_request : in std_logic_vector(0 to 1);
      M_size : in std_logic_vector(0 to 7);
      M_type : in std_logic_vector(0 to 5);
      M_wrBurst : in std_logic_vector(0 to 1);
      M_wrDBus : in std_logic_vector(0 to 127);
      Sl_addrAck : in std_logic_vector(0 to 1);
      Sl_MErr : in std_logic_vector(0 to 3);
      Sl_MBusy : in std_logic_vector(0 to 3);
      Sl_rdBTerm : in std_logic_vector(0 to 1);
      Sl_rdComp : in std_logic_vector(0 to 1);
      Sl_rdDAck : in std_logic_vector(0 to 1);
      Sl_rdDBus : in std_logic_vector(0 to 127);
      Sl_rdWdAddr : in std_logic_vector(0 to 7);
      Sl_rearbitrate : in std_logic_vector(0 to 1);
      Sl_SSize : in std_logic_vector(0 to 3);
      Sl_wait : in std_logic_vector(0 to 1);
      Sl_wrBTerm : in std_logic_vector(0 to 1);
      Sl_wrComp : in std_logic_vector(0 to 1);
      Sl_wrDAck : in std_logic_vector(0 to 1);
      PLB_ABus : out std_logic_vector(0 to 31);
      PLB_BE : out std_logic_vector(0 to 7);
      PLB_MAddrAck : out std_logic_vector(0 to 1);
      PLB_MBusy : out std_logic_vector(0 to 1);
      PLB_MErr : out std_logic_vector(0 to 1);
      PLB_MRdBTerm : out std_logic_vector(0 to 1);
      PLB_MRdDAck : out std_logic_vector(0 to 1);
      PLB_MRdDBus : out std_logic_vector(0 to 127);
      PLB_MRdWdAddr : out std_logic_vector(0 to 7);
      PLB_MRearbitrate : out std_logic_vector(0 to 1);
      PLB_MWrBTerm : out std_logic_vector(0 to 1);
      PLB_MWrDAck : out std_logic_vector(0 to 1);
      PLB_MSSize : out std_logic_vector(0 to 3);
      PLB_PAValid : out std_logic;
      PLB_RNW : out std_logic;
      PLB_SAValid : out std_logic;
      PLB_abort : out std_logic;
      PLB_busLock : out std_logic;
      PLB_compress : out std_logic;
      PLB_guarded : out std_logic;
      PLB_lockErr : out std_logic;
      PLB_masterID : out std_logic_vector(0 to 0);
      PLB_MSize : out std_logic_vector(0 to 1);
      PLB_ordered : out std_logic;
      PLB_pendPri : out std_logic_vector(0 to 1);
      PLB_pendReq : out std_logic;
      PLB_rdBurst : out std_logic;
      PLB_rdPrim : out std_logic;
      PLB_reqPri : out std_logic_vector(0 to 1);
      PLB_size : out std_logic_vector(0 to 3);
      PLB_type : out std_logic_vector(0 to 2);
      PLB_wrBurst : out std_logic;
      PLB_wrDBus : out std_logic_vector(0 to 63);
      PLB_wrPrim : out std_logic;
      PLB_SaddrAck : out std_logic;
      PLB_SMErr : out std_logic_vector(0 to 1);
      PLB_SMBusy : out std_logic_vector(0 to 1);
      PLB_SrdBTerm : out std_logic;
      PLB_SrdComp : out std_logic;
      PLB_SrdDAck : out std_logic;
      PLB_SrdDBus : out std_logic_vector(0 to 63);
      PLB_SrdWdAddr : out std_logic_vector(0 to 3);
      PLB_Srearbitrate : out std_logic;
      PLB_Sssize : out std_logic_vector(0 to 1);
      PLB_Swait : out std_logic;
      PLB_SwrBTerm : out std_logic;
      PLB_SwrComp : out std_logic;
      PLB_SwrDAck : out std_logic;
      PLB2OPB_rearb : in std_logic_vector(0 to 1);
      ArbAddrVldReg : out std_logic;
      Bus_Error_Det : out std_logic
    );
  end component;

  component opb0_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : out std_logic;
      SYS_Rst : in std_logic;
      Debug_SYS_Rst : in std_logic;
      WDT_Rst : in std_logic;
      M_ABus : in std_logic_vector(0 to 31);
      M_BE : in std_logic_vector(0 to 3);
      M_beXfer : in std_logic_vector(0 to 0);
      M_busLock : in std_logic_vector(0 to 0);
      M_DBus : in std_logic_vector(0 to 31);
      M_DBusEn : in std_logic_vector(0 to 0);
      M_DBusEn32_63 : in std_logic_vector(0 to 0);
      M_dwXfer : in std_logic_vector(0 to 0);
      M_fwXfer : in std_logic_vector(0 to 0);
      M_hwXfer : in std_logic_vector(0 to 0);
      M_request : in std_logic_vector(0 to 0);
      M_RNW : in std_logic_vector(0 to 0);
      M_select : in std_logic_vector(0 to 0);
      M_seqAddr : in std_logic_vector(0 to 0);
      Sl_beAck : in std_logic_vector(0 to 2);
      Sl_DBus : in std_logic_vector(0 to 95);
      Sl_DBusEn : in std_logic_vector(0 to 2);
      Sl_DBusEn32_63 : in std_logic_vector(0 to 2);
      Sl_errAck : in std_logic_vector(0 to 2);
      Sl_dwAck : in std_logic_vector(0 to 2);
      Sl_fwAck : in std_logic_vector(0 to 2);
      Sl_hwAck : in std_logic_vector(0 to 2);
      Sl_retry : in std_logic_vector(0 to 2);
      Sl_toutSup : in std_logic_vector(0 to 2);
      Sl_xferAck : in std_logic_vector(0 to 2);
      OPB_MRequest : out std_logic_vector(0 to 0);
      OPB_ABus : out std_logic_vector(0 to 31);
      OPB_BE : out std_logic_vector(0 to 3);
      OPB_beXfer : out std_logic;
      OPB_beAck : out std_logic;
      OPB_busLock : out std_logic;
      OPB_rdDBus : out std_logic_vector(0 to 31);
      OPB_wrDBus : out std_logic_vector(0 to 31);
      OPB_DBus : out std_logic_vector(0 to 31);
      OPB_errAck : out std_logic;
      OPB_dwAck : out std_logic;
      OPB_dwXfer : out std_logic;
      OPB_fwAck : out std_logic;
      OPB_fwXfer : out std_logic;
      OPB_hwAck : out std_logic;
      OPB_hwXfer : out std_logic;
      OPB_MGrant : out std_logic_vector(0 to 0);
      OPB_pendReq : out std_logic_vector(0 to 0);
      OPB_retry : out std_logic;
      OPB_RNW : out std_logic;
      OPB_select : out std_logic;
      OPB_seqAddr : out std_logic;
      OPB_timeout : out std_logic;
      OPB_toutSup : out std_logic;
      OPB_xferAck : out std_logic
    );
  end component;

  component diffclk_buf_0_wrapper is
    port (
      Clkin_p : in std_logic;
      Clkin_m : in std_logic;
      Clkout : out std_logic
    );
  end component;

  component rs232_uart_1_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Interrupt : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      OPB_DBus : in std_logic_vector(0 to 31);
      UART_DBus : out std_logic_vector(0 to 31);
      UART_errAck : out std_logic;
      UART_retry : out std_logic;
      UART_toutSup : out std_logic;
      UART_xferAck : out std_logic;
      RX : in std_logic;
      TX : out std_logic
    );
  end component;

  component opb_clockcontroller_0_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      clk_clk : in std_logic;
      clk_psclk : out std_logic;
      clk_psen : out std_logic;
      clk_psincdec : out std_logic;
      clk_reset : out std_logic
    );
  end component;

  component ppc405_0_wrapper is
    port (
      C405CPMCORESLEEPREQ : out std_logic;
      C405CPMMSRCE : out std_logic;
      C405CPMMSREE : out std_logic;
      C405CPMTIMERIRQ : out std_logic;
      C405CPMTIMERRESETREQ : out std_logic;
      C405XXXMACHINECHECK : out std_logic;
      CPMC405CLOCK : in std_logic;
      CPMC405CORECLKINACTIVE : in std_logic;
      CPMC405CPUCLKEN : in std_logic;
      CPMC405JTAGCLKEN : in std_logic;
      CPMC405TIMERCLKEN : in std_logic;
      CPMC405TIMERTICK : in std_logic;
      MCBCPUCLKEN : in std_logic;
      MCBTIMEREN : in std_logic;
      MCPPCRST : in std_logic;
      PLBCLK : in std_logic;
      DCRCLK : in std_logic;
      C405RSTCHIPRESETREQ : out std_logic;
      C405RSTCORERESETREQ : out std_logic;
      C405RSTSYSRESETREQ : out std_logic;
      RSTC405RESETCHIP : in std_logic;
      RSTC405RESETCORE : in std_logic;
      RSTC405RESETSYS : in std_logic;
      C405PLBICUABUS : out std_logic_vector(0 to 31);
      C405PLBICUBE : out std_logic_vector(0 to 7);
      C405PLBICURNW : out std_logic;
      C405PLBICUABORT : out std_logic;
      C405PLBICUBUSLOCK : out std_logic;
      C405PLBICUU0ATTR : out std_logic;
      C405PLBICUGUARDED : out std_logic;
      C405PLBICULOCKERR : out std_logic;
      C405PLBICUMSIZE : out std_logic_vector(0 to 1);
      C405PLBICUORDERED : out std_logic;
      C405PLBICUPRIORITY : out std_logic_vector(0 to 1);
      C405PLBICURDBURST : out std_logic;
      C405PLBICUREQUEST : out std_logic;
      C405PLBICUSIZE : out std_logic_vector(0 to 3);
      C405PLBICUTYPE : out std_logic_vector(0 to 2);
      C405PLBICUWRBURST : out std_logic;
      C405PLBICUWRDBUS : out std_logic_vector(0 to 63);
      C405PLBICUCACHEABLE : out std_logic;
      PLBC405ICUADDRACK : in std_logic;
      PLBC405ICUBUSY : in std_logic;
      PLBC405ICUERR : in std_logic;
      PLBC405ICURDBTERM : in std_logic;
      PLBC405ICURDDACK : in std_logic;
      PLBC405ICURDDBUS : in std_logic_vector(0 to 63);
      PLBC405ICURDWDADDR : in std_logic_vector(0 to 3);
      PLBC405ICUREARBITRATE : in std_logic;
      PLBC405ICUWRBTERM : in std_logic;
      PLBC405ICUWRDACK : in std_logic;
      PLBC405ICUSSIZE : in std_logic_vector(0 to 1);
      PLBC405ICUSERR : in std_logic;
      PLBC405ICUSBUSYS : in std_logic;
      C405PLBDCUABUS : out std_logic_vector(0 to 31);
      C405PLBDCUBE : out std_logic_vector(0 to 7);
      C405PLBDCURNW : out std_logic;
      C405PLBDCUABORT : out std_logic;
      C405PLBDCUBUSLOCK : out std_logic;
      C405PLBDCUU0ATTR : out std_logic;
      C405PLBDCUGUARDED : out std_logic;
      C405PLBDCULOCKERR : out std_logic;
      C405PLBDCUMSIZE : out std_logic_vector(0 to 1);
      C405PLBDCUORDERED : out std_logic;
      C405PLBDCUPRIORITY : out std_logic_vector(0 to 1);
      C405PLBDCURDBURST : out std_logic;
      C405PLBDCUREQUEST : out std_logic;
      C405PLBDCUSIZE : out std_logic_vector(0 to 3);
      C405PLBDCUTYPE : out std_logic_vector(0 to 2);
      C405PLBDCUWRBURST : out std_logic;
      C405PLBDCUWRDBUS : out std_logic_vector(0 to 63);
      C405PLBDCUCACHEABLE : out std_logic;
      C405PLBDCUWRITETHRU : out std_logic;
      PLBC405DCUADDRACK : in std_logic;
      PLBC405DCUBUSY : in std_logic;
      PLBC405DCUERR : in std_logic;
      PLBC405DCURDBTERM : in std_logic;
      PLBC405DCURDDACK : in std_logic;
      PLBC405DCURDDBUS : in std_logic_vector(0 to 63);
      PLBC405DCURDWDADDR : in std_logic_vector(0 to 3);
      PLBC405DCUREARBITRATE : in std_logic;
      PLBC405DCUWRBTERM : in std_logic;
      PLBC405DCUWRDACK : in std_logic;
      PLBC405DCUSSIZE : in std_logic_vector(0 to 1);
      PLBC405DCUSERR : in std_logic;
      PLBC405DCUSBUSYS : in std_logic;
      BRAMDSOCMCLK : in std_logic;
      BRAMDSOCMRDDBUS : in std_logic_vector(0 to 31);
      DSARCVALUE : in std_logic_vector(0 to 7);
      DSCNTLVALUE : in std_logic_vector(0 to 7);
      DSOCMBRAMABUS : out std_logic_vector(8 to 29);
      DSOCMBRAMBYTEWRITE : out std_logic_vector(0 to 3);
      DSOCMBRAMEN : out std_logic;
      DSOCMBRAMWRDBUS : out std_logic_vector(0 to 31);
      DSOCMBUSY : out std_logic;
      BRAMISOCMCLK : in std_logic;
      BRAMISOCMRDDBUS : in std_logic_vector(0 to 63);
      ISARCVALUE : in std_logic_vector(0 to 7);
      ISCNTLVALUE : in std_logic_vector(0 to 7);
      ISOCMBRAMEN : out std_logic;
      ISOCMBRAMEVENWRITEEN : out std_logic;
      ISOCMBRAMODDWRITEEN : out std_logic;
      ISOCMBRAMRDABUS : out std_logic_vector(8 to 28);
      ISOCMBRAMWRABUS : out std_logic_vector(8 to 28);
      ISOCMBRAMWRDBUS : out std_logic_vector(0 to 31);
      C405DCRABUS : out std_logic_vector(0 to 9);
      C405DCRDBUSOUT : out std_logic_vector(0 to 31);
      C405DCRREAD : out std_logic;
      C405DCRWRITE : out std_logic;
      DCRC405ACK : in std_logic;
      DCRC405DBUSIN : in std_logic_vector(0 to 31);
      EICC405CRITINPUTIRQ : in std_logic;
      EICC405EXTINPUTIRQ : in std_logic;
      C405JTGCAPTUREDR : out std_logic;
      C405JTGEXTEST : out std_logic;
      C405JTGPGMOUT : out std_logic;
      C405JTGSHIFTDR : out std_logic;
      C405JTGTDO : out std_logic;
      C405JTGTDOEN : out std_logic;
      C405JTGUPDATEDR : out std_logic;
      MCBJTAGEN : in std_logic;
      JTGC405BNDSCANTDO : in std_logic;
      JTGC405TCK : in std_logic;
      JTGC405TDI : in std_logic;
      JTGC405TMS : in std_logic;
      JTGC405TRSTNEG : in std_logic;
      C405DBGMSRWE : out std_logic;
      C405DBGSTOPACK : out std_logic;
      C405DBGWBCOMPLETE : out std_logic;
      C405DBGWBFULL : out std_logic;
      C405DBGWBIAR : out std_logic_vector(0 to 29);
      DBGC405DEBUGHALT : in std_logic;
      DBGC405EXTBUSHOLDACK : in std_logic;
      DBGC405UNCONDDEBUGEVENT : in std_logic;
      C405TRCCYCLE : out std_logic;
      C405TRCEVENEXECUTIONSTATUS : out std_logic_vector(0 to 1);
      C405TRCODDEXECUTIONSTATUS : out std_logic_vector(0 to 1);
      C405TRCTRACESTATUS : out std_logic_vector(0 to 3);
      C405TRCTRIGGEREVENTOUT : out std_logic;
      C405TRCTRIGGEREVENTTYPE : out std_logic_vector(0 to 10);
      TRCC405TRACEDISABLE : in std_logic;
      TRCC405TRIGGEREVENTIN : in std_logic
    );
  end component;

  component diffclk_bref_clk_bottom_wrapper is
    port (
      Clkin_p : in std_logic;
      Clkin_m : in std_logic;
      Clkout : out std_logic
    );
  end component;

  component opb_adccontroller_0_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      adc0_adc3wire_clk : out std_logic;
      adc0_adc3wire_data : out std_logic;
      adc0_adc3wire_strobe : out std_logic;
      adc0_modepin : out std_logic;
      adc0_ddrb : out std_logic;
      adc0_psclk : out std_logic;
      adc0_psen : out std_logic;
      adc0_psincdec : out std_logic;
      adc0_clk : in std_logic;
      adc1_adc3wire_clk : out std_logic;
      adc1_adc3wire_data : out std_logic;
      adc1_adc3wire_strobe : out std_logic;
      adc1_modepin : out std_logic;
      adc1_ddrb : out std_logic;
      adc1_psclk : out std_logic;
      adc1_psen : out std_logic;
      adc1_psincdec : out std_logic;
      adc1_clk : in std_logic
    );
  end component;

  component i_128w_2k_10_r310iadc_xsg_core_config_wrapper is
    port (
      clk : in std_logic;
      i_128w_2k_10_r310iadc_XAUI0_rx_almost_full : in std_logic;
      i_128w_2k_10_r310iadc_XAUI0_rx_data : in std_logic_vector(63 downto 0);
      i_128w_2k_10_r310iadc_XAUI0_rx_empty : in std_logic;
      i_128w_2k_10_r310iadc_XAUI0_rx_linkdown : in std_logic;
      i_128w_2k_10_r310iadc_XAUI0_rx_outofband : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_XAUI0_rx_valid : in std_logic;
      i_128w_2k_10_r310iadc_XAUI0_tx_full : in std_logic;
      i_128w_2k_10_r310iadc_XAUI0_rx_get : out std_logic;
      i_128w_2k_10_r310iadc_XAUI0_rx_reset : out std_logic;
      i_128w_2k_10_r310iadc_XAUI0_tx_data : out std_logic_vector(63 downto 0);
      i_128w_2k_10_r310iadc_XAUI0_tx_outofband : out std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_XAUI0_tx_valid : out std_logic;
      i_128w_2k_10_r310iadc_adc0_user_data_valid : in std_logic;
      i_128w_2k_10_r310iadc_adc0_user_datai0 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc0_user_datai1 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc0_user_datai2 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc0_user_datai3 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc0_user_dataq0 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc0_user_dataq1 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc0_user_dataq2 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc0_user_dataq3 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc0_user_outofrangei0 : in std_logic;
      i_128w_2k_10_r310iadc_adc0_user_outofrangei1 : in std_logic;
      i_128w_2k_10_r310iadc_adc0_user_outofrangeq0 : in std_logic;
      i_128w_2k_10_r310iadc_adc0_user_outofrangeq1 : in std_logic;
      i_128w_2k_10_r310iadc_adc0_user_sync0 : in std_logic;
      i_128w_2k_10_r310iadc_adc0_user_sync1 : in std_logic;
      i_128w_2k_10_r310iadc_adc0_user_sync2 : in std_logic;
      i_128w_2k_10_r310iadc_adc0_user_sync3 : in std_logic;
      i_128w_2k_10_r310iadc_adc1_user_data_valid : in std_logic;
      i_128w_2k_10_r310iadc_adc1_user_datai0 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc1_user_datai1 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc1_user_datai2 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc1_user_datai3 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc1_user_dataq0 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc1_user_dataq1 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc1_user_dataq2 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc1_user_dataq3 : in std_logic_vector(7 downto 0);
      i_128w_2k_10_r310iadc_adc1_user_outofrangei0 : in std_logic;
      i_128w_2k_10_r310iadc_adc1_user_outofrangei1 : in std_logic;
      i_128w_2k_10_r310iadc_adc1_user_outofrangeq0 : in std_logic;
      i_128w_2k_10_r310iadc_adc1_user_outofrangeq1 : in std_logic;
      i_128w_2k_10_r310iadc_adc1_user_sync0 : in std_logic;
      i_128w_2k_10_r310iadc_adc1_user_sync1 : in std_logic;
      i_128w_2k_10_r310iadc_adc1_user_sync2 : in std_logic;
      i_128w_2k_10_r310iadc_adc1_user_sync3 : in std_logic;
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out : in std_logic_vector(35 downto 0);
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_valid : in std_logic;
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_address : out std_logic_vector(18 downto 0);
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_be : out std_logic_vector(3 downto 0);
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_in : out std_logic_vector(35 downto 0);
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_we : out std_logic;
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out : in std_logic_vector(35 downto 0);
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_valid : in std_logic;
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_address : out std_logic_vector(18 downto 0);
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_be : out std_logic_vector(3 downto 0);
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_in : out std_logic_vector(35 downto 0);
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_we : out std_logic;
      i_128w_2k_10_r310iadc_gpio_gateway : out std_logic;
      i_128w_2k_10_r310iadc_led1_arm_gateway : out std_logic;
      i_128w_2k_10_r310iadc_led2_sync_gateway : out std_logic;
      i_128w_2k_10_r310iadc_led4_eq_clip_gateway : out std_logic;
      i_128w_2k_10_r310iadc_led5_adc_clip_gateway : out std_logic;
      i_128w_2k_10_r310iadc_led6_link_dn_gateway : out std_logic;
      i_128w_2k_10_r310iadc_led7_xaui_overlfow_gateway : out std_logic
    );
  end component;

  component i_128w_2k_10_r310iadc_xaui0_wrapper is
    port (
      app_clk : in std_logic;
      rx_data : out std_logic_vector(63 downto 0);
      rx_outofband : out std_logic_vector(7 downto 0);
      rx_get : in std_logic;
      rx_almost_full : out std_logic;
      rx_empty : out std_logic;
      rx_reset : in std_logic;
      rx_linkdown : out std_logic;
      rx_valid : out std_logic;
      tx_data : in std_logic_vector(63 downto 0);
      tx_outofband : in std_logic_vector(7 downto 0);
      tx_valid : in std_logic;
      tx_full : out std_logic;
      mgt_tx_l0_p : out std_logic;
      mgt_tx_l0_n : out std_logic;
      mgt_tx_l1_p : out std_logic;
      mgt_tx_l1_n : out std_logic;
      mgt_tx_l2_p : out std_logic;
      mgt_tx_l2_n : out std_logic;
      mgt_tx_l3_p : out std_logic;
      mgt_tx_l3_n : out std_logic;
      mgt_rx_l0_p : in std_logic;
      mgt_rx_l0_n : in std_logic;
      mgt_rx_l1_p : in std_logic;
      mgt_rx_l1_n : in std_logic;
      mgt_rx_l2_p : in std_logic;
      mgt_rx_l2_n : in std_logic;
      mgt_rx_l3_p : in std_logic;
      mgt_rx_l3_n : in std_logic;
      mgt_clk : in std_logic
    );
  end component;

  component i_128w_2k_10_r310iadc_adc0_wrapper is
    port (
      adc_clk_p : in std_logic;
      adc_clk_n : in std_logic;
      adc_sync_p : in std_logic;
      adc_sync_n : in std_logic;
      adc_outofrangei_p : in std_logic;
      adc_outofrangei_n : in std_logic;
      adc_outofrangeq_p : in std_logic;
      adc_outofrangeq_n : in std_logic;
      adc_dataeveni_p : in std_logic_vector(7 downto 0);
      adc_dataeveni_n : in std_logic_vector(7 downto 0);
      adc_dataoddi_p : in std_logic_vector(7 downto 0);
      adc_dataoddi_n : in std_logic_vector(7 downto 0);
      adc_dataevenq_p : in std_logic_vector(7 downto 0);
      adc_dataevenq_n : in std_logic_vector(7 downto 0);
      adc_dataoddq_p : in std_logic_vector(7 downto 0);
      adc_dataoddq_n : in std_logic_vector(7 downto 0);
      adc_ddrb_p : out std_logic;
      adc_ddrb_n : out std_logic;
      user_datai0 : out std_logic_vector(7 downto 0);
      user_datai1 : out std_logic_vector(7 downto 0);
      user_datai2 : out std_logic_vector(7 downto 0);
      user_datai3 : out std_logic_vector(7 downto 0);
      user_dataq0 : out std_logic_vector(7 downto 0);
      user_dataq1 : out std_logic_vector(7 downto 0);
      user_dataq2 : out std_logic_vector(7 downto 0);
      user_dataq3 : out std_logic_vector(7 downto 0);
      user_outofrangei0 : out std_logic;
      user_outofrangei1 : out std_logic;
      user_outofrangeq0 : out std_logic;
      user_outofrangeq1 : out std_logic;
      user_sync0 : out std_logic;
      user_sync1 : out std_logic;
      user_sync2 : out std_logic;
      user_sync3 : out std_logic;
      user_data_valid : out std_logic;
      ctrl_reset : in std_logic;
      ctrl_clk_in : in std_logic;
      ctrl_clk_out : out std_logic;
      ctrl_clk90_out : out std_logic;
      ctrl_dcm_locked : out std_logic;
      dcm_psclk : in std_logic;
      dcm_psen : in std_logic;
      dcm_psincdec : in std_logic
    );
  end component;

  component i_128w_2k_10_r310iadc_adc1_wrapper is
    port (
      adc_clk_p : in std_logic;
      adc_clk_n : in std_logic;
      adc_sync_p : in std_logic;
      adc_sync_n : in std_logic;
      adc_outofrangei_p : in std_logic;
      adc_outofrangei_n : in std_logic;
      adc_outofrangeq_p : in std_logic;
      adc_outofrangeq_n : in std_logic;
      adc_dataeveni_p : in std_logic_vector(7 downto 0);
      adc_dataeveni_n : in std_logic_vector(7 downto 0);
      adc_dataoddi_p : in std_logic_vector(7 downto 0);
      adc_dataoddi_n : in std_logic_vector(7 downto 0);
      adc_dataevenq_p : in std_logic_vector(7 downto 0);
      adc_dataevenq_n : in std_logic_vector(7 downto 0);
      adc_dataoddq_p : in std_logic_vector(7 downto 0);
      adc_dataoddq_n : in std_logic_vector(7 downto 0);
      adc_ddrb_p : out std_logic;
      adc_ddrb_n : out std_logic;
      user_datai0 : out std_logic_vector(7 downto 0);
      user_datai1 : out std_logic_vector(7 downto 0);
      user_datai2 : out std_logic_vector(7 downto 0);
      user_datai3 : out std_logic_vector(7 downto 0);
      user_dataq0 : out std_logic_vector(7 downto 0);
      user_dataq1 : out std_logic_vector(7 downto 0);
      user_dataq2 : out std_logic_vector(7 downto 0);
      user_dataq3 : out std_logic_vector(7 downto 0);
      user_outofrangei0 : out std_logic;
      user_outofrangei1 : out std_logic;
      user_outofrangeq0 : out std_logic;
      user_outofrangeq1 : out std_logic;
      user_sync0 : out std_logic;
      user_sync1 : out std_logic;
      user_sync2 : out std_logic;
      user_sync3 : out std_logic;
      user_data_valid : out std_logic;
      ctrl_reset : in std_logic;
      ctrl_clk_in : in std_logic;
      ctrl_clk_out : out std_logic;
      ctrl_clk90_out : out std_logic;
      ctrl_dcm_locked : out std_logic;
      dcm_psclk : in std_logic;
      dcm_psen : in std_logic;
      dcm_psincdec : in std_logic
    );
  end component;

  component i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_wrapper is
    port (
      clk : in std_logic;
      we : in std_logic;
      be : in std_logic_vector(3 downto 0);
      address : in std_logic_vector(18 downto 0);
      data_in : in std_logic_vector(35 downto 0);
      data_out : out std_logic_vector(35 downto 0);
      data_valid : out std_logic;
      pads_address : out std_logic_vector(18 downto 0);
      pads_bw_b : out std_logic_vector(3 downto 0);
      pads_we_b : out std_logic;
      pads_adv_ld_b : out std_logic;
      pads_clk : out std_logic;
      pads_ce : out std_logic;
      pads_oe_b : out std_logic;
      pads_cen_b : out std_logic;
      pads_mode : out std_logic;
      pads_zz : out std_logic;
      pads_dq_I : in std_logic_vector(35 downto 0);
      pads_dq_O : out std_logic_vector(35 downto 0);
      pads_dq_T : out std_logic_vector(35 downto 0)
    );
  end component;

  component i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_wrapper is
    port (
      clk : in std_logic;
      we : in std_logic;
      be : in std_logic_vector(3 downto 0);
      address : in std_logic_vector(18 downto 0);
      data_in : in std_logic_vector(35 downto 0);
      data_out : out std_logic_vector(35 downto 0);
      data_valid : out std_logic;
      pads_address : out std_logic_vector(18 downto 0);
      pads_bw_b : out std_logic_vector(3 downto 0);
      pads_we_b : out std_logic;
      pads_adv_ld_b : out std_logic;
      pads_clk : out std_logic;
      pads_ce : out std_logic;
      pads_oe_b : out std_logic;
      pads_cen_b : out std_logic;
      pads_mode : out std_logic;
      pads_zz : out std_logic;
      pads_dq_I : in std_logic_vector(35 downto 0);
      pads_dq_O : out std_logic_vector(35 downto 0);
      pads_dq_T : out std_logic_vector(35 downto 0)
    );
  end component;

  component i_128w_2k_10_r310iadc_gpio_wrapper is
    port (
      gateway : in std_logic_vector(0 to 0);
      io_pad : out std_logic_vector(0 to 0);
      clk : in std_logic;
      clk90 : in std_logic
    );
  end component;

  component i_128w_2k_10_r310iadc_led1_arm_wrapper is
    port (
      gateway : in std_logic_vector(0 to 0);
      io_pad : out std_logic_vector(0 to 0);
      clk : in std_logic;
      clk90 : in std_logic
    );
  end component;

  component i_128w_2k_10_r310iadc_led2_sync_wrapper is
    port (
      gateway : in std_logic_vector(0 to 0);
      io_pad : out std_logic_vector(0 to 0);
      clk : in std_logic;
      clk90 : in std_logic
    );
  end component;

  component i_128w_2k_10_r310iadc_led4_eq_clip_wrapper is
    port (
      gateway : in std_logic_vector(0 to 0);
      io_pad : out std_logic_vector(0 to 0);
      clk : in std_logic;
      clk90 : in std_logic
    );
  end component;

  component i_128w_2k_10_r310iadc_led5_adc_clip_wrapper is
    port (
      gateway : in std_logic_vector(0 to 0);
      io_pad : out std_logic_vector(0 to 0);
      clk : in std_logic;
      clk90 : in std_logic
    );
  end component;

  component i_128w_2k_10_r310iadc_led6_link_dn_wrapper is
    port (
      gateway : in std_logic_vector(0 to 0);
      io_pad : out std_logic_vector(0 to 0);
      clk : in std_logic;
      clk90 : in std_logic
    );
  end component;

  component i_128w_2k_10_r310iadc_led7_xaui_overlfow_wrapper is
    port (
      gateway : in std_logic_vector(0 to 0);
      io_pad : out std_logic_vector(0 to 0);
      clk : in std_logic;
      clk90 : in std_logic
    );
  end component;

  component IOBUF is
    port (
      I : in std_logic;
      IO : inout std_logic;
      O : out std_logic;
      T : in std_logic
    );
  end component;

  -- Internal signals

  signal C405RSTCHIPRESETREQ : std_logic;
  signal C405RSTCORERESETREQ : std_logic;
  signal C405RSTSYSRESETREQ : std_logic;
  signal RSTC405RESETCHIP : std_logic;
  signal RSTC405RESETCORE : std_logic;
  signal RSTC405RESETSYS : std_logic;
  signal adc0_clk : std_logic;
  signal adc0_clk90 : std_logic;
  signal adc0_ddrb : std_logic;
  signal adc0_psclk : std_logic;
  signal adc0_psen : std_logic;
  signal adc0_psincdec : std_logic;
  signal adc1_clk : std_logic;
  signal adc1_ddrb : std_logic;
  signal adc1_psclk : std_logic;
  signal adc1_psen : std_logic;
  signal adc1_psincdec : std_logic;
  signal bref_clk_bottom : std_logic;
  signal dcm_0_lock : std_logic;
  signal dcm_2_lock : std_logic;
  signal dcm_clk_s : std_logic;
  signal i_128w_2k_10_r310iadc_XAUI0_rx_almost_full : std_logic;
  signal i_128w_2k_10_r310iadc_XAUI0_rx_data : std_logic_vector(63 downto 0);
  signal i_128w_2k_10_r310iadc_XAUI0_rx_empty : std_logic;
  signal i_128w_2k_10_r310iadc_XAUI0_rx_get : std_logic;
  signal i_128w_2k_10_r310iadc_XAUI0_rx_linkdown : std_logic;
  signal i_128w_2k_10_r310iadc_XAUI0_rx_outofband : std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_XAUI0_rx_reset : std_logic;
  signal i_128w_2k_10_r310iadc_XAUI0_rx_valid : std_logic;
  signal i_128w_2k_10_r310iadc_XAUI0_tx_data : std_logic_vector(63 downto 0);
  signal i_128w_2k_10_r310iadc_XAUI0_tx_full : std_logic;
  signal i_128w_2k_10_r310iadc_XAUI0_tx_outofband : std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_XAUI0_tx_valid : std_logic;
  signal i_128w_2k_10_r310iadc_adc0_user_data_valid : std_logic;
  signal i_128w_2k_10_r310iadc_adc0_user_datai0 : std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc0_user_datai1 : std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc0_user_datai2 : std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc0_user_datai3 : std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc0_user_dataq0 : std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc0_user_dataq1 : std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc0_user_dataq2 : std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc0_user_dataq3 : std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc0_user_outofrangei0 : std_logic;
  signal i_128w_2k_10_r310iadc_adc0_user_outofrangei1 : std_logic;
  signal i_128w_2k_10_r310iadc_adc0_user_outofrangeq0 : std_logic;
  signal i_128w_2k_10_r310iadc_adc0_user_outofrangeq1 : std_logic;
  signal i_128w_2k_10_r310iadc_adc0_user_sync0 : std_logic;
  signal i_128w_2k_10_r310iadc_adc0_user_sync1 : std_logic;
  signal i_128w_2k_10_r310iadc_adc0_user_sync2 : std_logic;
  signal i_128w_2k_10_r310iadc_adc0_user_sync3 : std_logic;
  signal i_128w_2k_10_r310iadc_adc1_user_data_valid : std_logic;
  signal i_128w_2k_10_r310iadc_adc1_user_datai0 : std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc1_user_datai1 : std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc1_user_datai2 : std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc1_user_datai3 : std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc1_user_dataq0 : std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc1_user_dataq1 : std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc1_user_dataq2 : std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc1_user_dataq3 : std_logic_vector(7 downto 0);
  signal i_128w_2k_10_r310iadc_adc1_user_outofrangei0 : std_logic;
  signal i_128w_2k_10_r310iadc_adc1_user_outofrangei1 : std_logic;
  signal i_128w_2k_10_r310iadc_adc1_user_outofrangeq0 : std_logic;
  signal i_128w_2k_10_r310iadc_adc1_user_outofrangeq1 : std_logic;
  signal i_128w_2k_10_r310iadc_adc1_user_sync0 : std_logic;
  signal i_128w_2k_10_r310iadc_adc1_user_sync1 : std_logic;
  signal i_128w_2k_10_r310iadc_adc1_user_sync2 : std_logic;
  signal i_128w_2k_10_r310iadc_adc1_user_sync3 : std_logic;
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_address : std_logic_vector(18 downto 0);
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_be : std_logic_vector(3 downto 0);
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_in : std_logic_vector(35 downto 0);
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out : std_logic_vector(35 downto 0);
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_valid : std_logic;
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_we : std_logic;
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_address : std_logic_vector(18 downto 0);
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_be : std_logic_vector(3 downto 0);
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_in : std_logic_vector(35 downto 0);
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out : std_logic_vector(35 downto 0);
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_valid : std_logic;
  signal i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_we : std_logic;
  signal i_128w_2k_10_r310iadc_gpio_gateway : std_logic_vector(0 to 0);
  signal i_128w_2k_10_r310iadc_led1_arm_gateway : std_logic_vector(0 to 0);
  signal i_128w_2k_10_r310iadc_led2_sync_gateway : std_logic_vector(0 to 0);
  signal i_128w_2k_10_r310iadc_led4_eq_clip_gateway : std_logic_vector(0 to 0);
  signal i_128w_2k_10_r310iadc_led5_adc_clip_gateway : std_logic_vector(0 to 0);
  signal i_128w_2k_10_r310iadc_led6_link_dn_gateway : std_logic_vector(0 to 0);
  signal i_128w_2k_10_r310iadc_led7_xaui_overlfow_gateway : std_logic_vector(0 to 0);
  signal jtagppc_0_0_C405JTGTDO : std_logic;
  signal jtagppc_0_0_C405JTGTDOEN : std_logic;
  signal jtagppc_0_0_JTGC405TCK : std_logic;
  signal jtagppc_0_0_JTGC405TDI : std_logic;
  signal jtagppc_0_0_JTGC405TMS : std_logic;
  signal jtagppc_0_0_JTGC405TRSTNEG : std_logic;
  signal jtagppc_0_1_C405JTGTDO : std_logic;
  signal jtagppc_0_1_C405JTGTDOEN : std_logic;
  signal jtagppc_0_1_JTGC405TCK : std_logic;
  signal jtagppc_0_1_JTGC405TDI : std_logic;
  signal jtagppc_0_1_JTGC405TMS : std_logic;
  signal jtagppc_0_1_JTGC405TRSTNEG : std_logic;
  signal net_gnd0 : std_logic;
  signal net_gnd1 : std_logic_vector(0 to 0);
  signal net_gnd2 : std_logic_vector(0 to 1);
  signal net_gnd3 : std_logic_vector(0 to 2);
  signal net_gnd4 : std_logic_vector(0 to 3);
  signal net_gnd8 : std_logic_vector(0 to 7);
  signal net_gnd10 : std_logic_vector(0 to 9);
  signal net_gnd32 : std_logic_vector(0 to 31);
  signal net_gnd64 : std_logic_vector(0 to 63);
  signal net_vcc0 : std_logic;
  signal net_vcc1 : std_logic_vector(0 to 0);
  signal net_vcc2 : std_logic_vector(1 downto 0);
  signal net_vcc3 : std_logic_vector(0 to 2);
  signal opb0_M_ABus : std_logic_vector(0 to 31);
  signal opb0_M_BE : std_logic_vector(0 to 3);
  signal opb0_M_DBus : std_logic_vector(0 to 31);
  signal opb0_M_RNW : std_logic_vector(0 to 0);
  signal opb0_M_busLock : std_logic_vector(0 to 0);
  signal opb0_M_request : std_logic_vector(0 to 0);
  signal opb0_M_select : std_logic_vector(0 to 0);
  signal opb0_M_seqAddr : std_logic_vector(0 to 0);
  signal opb0_OPB_ABus : std_logic_vector(0 to 31);
  signal opb0_OPB_BE : std_logic_vector(0 to 3);
  signal opb0_OPB_DBus : std_logic_vector(0 to 31);
  signal opb0_OPB_MGrant : std_logic_vector(0 to 0);
  signal opb0_OPB_RNW : std_logic;
  signal opb0_OPB_Rst : std_logic;
  signal opb0_OPB_errAck : std_logic;
  signal opb0_OPB_retry : std_logic;
  signal opb0_OPB_select : std_logic;
  signal opb0_OPB_seqAddr : std_logic;
  signal opb0_OPB_timeout : std_logic;
  signal opb0_OPB_xferAck : std_logic;
  signal opb0_Sl_DBus : std_logic_vector(0 to 95);
  signal opb0_Sl_errAck : std_logic_vector(0 to 2);
  signal opb0_Sl_retry : std_logic_vector(0 to 2);
  signal opb0_Sl_toutSup : std_logic_vector(0 to 2);
  signal opb0_Sl_xferAck : std_logic_vector(0 to 2);
  signal plb_M_ABus : std_logic_vector(0 to 63);
  signal plb_M_BE : std_logic_vector(0 to 15);
  signal plb_M_MSize : std_logic_vector(0 to 3);
  signal plb_M_RNW : std_logic_vector(0 to 1);
  signal plb_M_abort : std_logic_vector(0 to 1);
  signal plb_M_busLock : std_logic_vector(0 to 1);
  signal plb_M_compress : std_logic_vector(0 to 1);
  signal plb_M_guarded : std_logic_vector(0 to 1);
  signal plb_M_lockErr : std_logic_vector(0 to 1);
  signal plb_M_ordered : std_logic_vector(0 to 1);
  signal plb_M_priority : std_logic_vector(0 to 3);
  signal plb_M_rdBurst : std_logic_vector(0 to 1);
  signal plb_M_request : std_logic_vector(0 to 1);
  signal plb_M_size : std_logic_vector(0 to 7);
  signal plb_M_type : std_logic_vector(0 to 5);
  signal plb_M_wrBurst : std_logic_vector(0 to 1);
  signal plb_M_wrDBus : std_logic_vector(0 to 127);
  signal plb_PLB2OPB_rearb : std_logic_vector(0 to 1);
  signal plb_PLB_ABus : std_logic_vector(0 to 31);
  signal plb_PLB_BE : std_logic_vector(0 to 7);
  signal plb_PLB_MAddrAck : std_logic_vector(0 to 1);
  signal plb_PLB_MBusy : std_logic_vector(0 to 1);
  signal plb_PLB_MErr : std_logic_vector(0 to 1);
  signal plb_PLB_MRdBTerm : std_logic_vector(0 to 1);
  signal plb_PLB_MRdDAck : std_logic_vector(0 to 1);
  signal plb_PLB_MRdDBus : std_logic_vector(0 to 127);
  signal plb_PLB_MRdWdAddr : std_logic_vector(0 to 7);
  signal plb_PLB_MRearbitrate : std_logic_vector(0 to 1);
  signal plb_PLB_MSSize : std_logic_vector(0 to 3);
  signal plb_PLB_MSize : std_logic_vector(0 to 1);
  signal plb_PLB_MWrBTerm : std_logic_vector(0 to 1);
  signal plb_PLB_MWrDAck : std_logic_vector(0 to 1);
  signal plb_PLB_PAValid : std_logic;
  signal plb_PLB_RNW : std_logic;
  signal plb_PLB_Rst : std_logic;
  signal plb_PLB_SAValid : std_logic;
  signal plb_PLB_SMBusy : std_logic_vector(0 to 1);
  signal plb_PLB_SMErr : std_logic_vector(0 to 1);
  signal plb_PLB_abort : std_logic;
  signal plb_PLB_busLock : std_logic;
  signal plb_PLB_compress : std_logic;
  signal plb_PLB_guarded : std_logic;
  signal plb_PLB_lockErr : std_logic;
  signal plb_PLB_masterID : std_logic_vector(0 to 0);
  signal plb_PLB_ordered : std_logic;
  signal plb_PLB_pendPri : std_logic_vector(0 to 1);
  signal plb_PLB_pendReq : std_logic;
  signal plb_PLB_rdBurst : std_logic;
  signal plb_PLB_rdPrim : std_logic;
  signal plb_PLB_reqPri : std_logic_vector(0 to 1);
  signal plb_PLB_size : std_logic_vector(0 to 3);
  signal plb_PLB_type : std_logic_vector(0 to 2);
  signal plb_PLB_wrBurst : std_logic;
  signal plb_PLB_wrDBus : std_logic_vector(0 to 63);
  signal plb_PLB_wrPrim : std_logic;
  signal plb_Sl_MBusy : std_logic_vector(0 to 3);
  signal plb_Sl_MErr : std_logic_vector(0 to 3);
  signal plb_Sl_SSize : std_logic_vector(0 to 3);
  signal plb_Sl_addrAck : std_logic_vector(0 to 1);
  signal plb_Sl_rdBTerm : std_logic_vector(0 to 1);
  signal plb_Sl_rdComp : std_logic_vector(0 to 1);
  signal plb_Sl_rdDAck : std_logic_vector(0 to 1);
  signal plb_Sl_rdDBus : std_logic_vector(0 to 127);
  signal plb_Sl_rdWdAddr : std_logic_vector(0 to 7);
  signal plb_Sl_rearbitrate : std_logic_vector(0 to 1);
  signal plb_Sl_wait : std_logic_vector(0 to 1);
  signal plb_Sl_wrBTerm : std_logic_vector(0 to 1);
  signal plb_Sl_wrComp : std_logic_vector(0 to 1);
  signal plb_Sl_wrDAck : std_logic_vector(0 to 1);
  signal plb_bram_BRAM_Addr : std_logic_vector(0 to 31);
  signal plb_bram_BRAM_Clk : std_logic;
  signal plb_bram_BRAM_Din : std_logic_vector(0 to 63);
  signal plb_bram_BRAM_Dout : std_logic_vector(0 to 63);
  signal plb_bram_BRAM_EN : std_logic;
  signal plb_bram_BRAM_Rst : std_logic;
  signal plb_bram_BRAM_WEN : std_logic_vector(0 to 7);
  signal rs232tsh_rx : std_logic;
  signal rs232tsh_tx : std_logic;
  signal sram0_dq_I : std_logic_vector(35 downto 0);
  signal sram0_dq_O : std_logic_vector(35 downto 0);
  signal sram0_dq_T : std_logic_vector(35 downto 0);
  signal sram1_dq_I : std_logic_vector(35 downto 0);
  signal sram1_dq_O : std_logic_vector(35 downto 0);
  signal sram1_dq_T : std_logic_vector(35 downto 0);
  signal sys_bus_reset : std_logic_vector(0 to 0);
  signal sys_clk : std_logic;
  signal sys_clk2x : std_logic;
  signal sys_clk2x_dcm : std_logic;
  signal sys_rst_s : std_logic;
  signal usr_clk : std_logic;
  signal usr_clk2x : std_logic;
  signal usr_clk2x_dcm : std_logic;
  signal usrclk_psclk : std_logic;
  signal usrclk_psen : std_logic;
  signal usrclk_psincdec : std_logic;
  signal usrclk_reset : std_logic;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of reset_block_wrapper : component is "black_box";
  attribute BOX_TYPE of dcm_0_wrapper : component is "black_box";
  attribute BOX_TYPE of dcm_1_wrapper : component is "black_box";
  attribute BOX_TYPE of dcm_2_wrapper : component is "black_box";
  attribute BOX_TYPE of dcm_3_wrapper : component is "black_box";
  attribute BOX_TYPE of ppc405_1_wrapper : component is "black_box";
  attribute BOX_TYPE of jtagppc_0_wrapper : component is "black_box";
  attribute BOX_TYPE of plb_bram_if_cntlr_1_bram_wrapper : component is "black_box";
  attribute BOX_TYPE of plb_bram_if_cntlr_1_wrapper : component is "black_box";
  attribute BOX_TYPE of plb2opb_bridge_0_wrapper : component is "black_box";
  attribute BOX_TYPE of plb_wrapper : component is "black_box";
  attribute BOX_TYPE of opb0_wrapper : component is "black_box";
  attribute BOX_TYPE of diffclk_buf_0_wrapper : component is "black_box";
  attribute BOX_TYPE of rs232_uart_1_wrapper : component is "black_box";
  attribute BOX_TYPE of opb_clockcontroller_0_wrapper : component is "black_box";
  attribute BOX_TYPE of ppc405_0_wrapper : component is "black_box";
  attribute BOX_TYPE of diffclk_bref_clk_bottom_wrapper : component is "black_box";
  attribute BOX_TYPE of opb_adccontroller_0_wrapper : component is "black_box";
  attribute BOX_TYPE of i_128w_2k_10_r310iadc_xsg_core_config_wrapper : component is "black_box";
  attribute BOX_TYPE of i_128w_2k_10_r310iadc_xaui0_wrapper : component is "black_box";
  attribute BOX_TYPE of i_128w_2k_10_r310iadc_adc0_wrapper : component is "black_box";
  attribute BOX_TYPE of i_128w_2k_10_r310iadc_adc1_wrapper : component is "black_box";
  attribute BOX_TYPE of i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_wrapper : component is "black_box";
  attribute BOX_TYPE of i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_wrapper : component is "black_box";
  attribute BOX_TYPE of i_128w_2k_10_r310iadc_gpio_wrapper : component is "black_box";
  attribute BOX_TYPE of i_128w_2k_10_r310iadc_led1_arm_wrapper : component is "black_box";
  attribute BOX_TYPE of i_128w_2k_10_r310iadc_led2_sync_wrapper : component is "black_box";
  attribute BOX_TYPE of i_128w_2k_10_r310iadc_led4_eq_clip_wrapper : component is "black_box";
  attribute BOX_TYPE of i_128w_2k_10_r310iadc_led5_adc_clip_wrapper : component is "black_box";
  attribute BOX_TYPE of i_128w_2k_10_r310iadc_led6_link_dn_wrapper : component is "black_box";
  attribute BOX_TYPE of i_128w_2k_10_r310iadc_led7_xaui_overlfow_wrapper : component is "black_box";

begin

  -- Internal assignments

  rs232tsh_rx <= rs232_rx;
  rs232_tx <= rs232tsh_tx;
  sys_rst_s <= reset_n;
  plb_PLB2OPB_rearb(0 to 0) <= B"0";
  net_gnd0 <= '0';
  net_gnd1(0 to 0) <= B"0";
  net_gnd10(0 to 9) <= B"0000000000";
  net_gnd2(0 to 1) <= B"00";
  net_gnd3(0 to 2) <= B"000";
  net_gnd32(0 to 31) <= B"00000000000000000000000000000000";
  net_gnd4(0 to 3) <= B"0000";
  net_gnd64(0 to 63) <= B"0000000000000000000000000000000000000000000000000000000000000000";
  net_gnd8(0 to 7) <= B"00000000";
  net_vcc0 <= '1';
  rs232_rtsN <= net_vcc0;
  phy_reset_n <= net_vcc0;
  net_vcc1(0 to 0) <= B"1";
  net_vcc2(1 downto 0) <= B"11";
  phy_slew <= net_vcc2;
  net_vcc3(0 to 2) <= B"111";

  reset_block : reset_block_wrapper
    port map (
      Slowest_sync_clk => sys_clk,
      Ext_Reset_In => sys_rst_s,
      Aux_Reset_In => net_gnd0,
      Core_Reset_Req => C405RSTCORERESETREQ,
      Chip_Reset_Req => C405RSTCHIPRESETREQ,
      System_Reset_Req => C405RSTSYSRESETREQ,
      Dcm_locked => dcm_0_lock,
      Rstc405resetcore => RSTC405RESETCORE,
      Rstc405resetchip => RSTC405RESETCHIP,
      Rstc405resetsys => RSTC405RESETSYS,
      Bus_Struct_Reset => sys_bus_reset(0 to 0),
      Peripheral_Reset => open
    );

  dcm_0 : dcm_0_wrapper
    port map (
      RST => net_gnd0,
      CLKIN => dcm_clk_s,
      CLKFB => sys_clk,
      PSEN => net_gnd0,
      PSINCDEC => net_gnd0,
      PSCLK => net_gnd0,
      DSSEN => net_gnd0,
      CLK0 => sys_clk,
      CLK90 => open,
      CLK180 => open,
      CLK270 => open,
      CLKDV => open,
      CLK2X => sys_clk2x_dcm,
      CLK2X180 => open,
      CLKFX => open,
      CLKFX180 => open,
      STATUS => open,
      LOCKED => dcm_0_lock,
      PSDONE => open
    );

  dcm_1 : dcm_1_wrapper
    port map (
      RST => dcm_0_lock,
      CLKIN => sys_clk2x_dcm,
      CLKFB => sys_clk2x,
      PSEN => net_gnd0,
      PSINCDEC => net_gnd0,
      PSCLK => net_gnd0,
      DSSEN => net_gnd0,
      CLK0 => sys_clk2x,
      CLK90 => open,
      CLK180 => open,
      CLK270 => open,
      CLKDV => open,
      CLK2X => open,
      CLK2X180 => open,
      CLKFX => open,
      CLKFX180 => open,
      STATUS => open,
      LOCKED => open,
      PSDONE => open
    );

  dcm_2 : dcm_2_wrapper
    port map (
      RST => usrclk_reset,
      CLKIN => net_gnd0,
      CLKFB => usr_clk,
      PSEN => usrclk_psen,
      PSINCDEC => usrclk_psincdec,
      PSCLK => usrclk_psclk,
      DSSEN => net_gnd0,
      CLK0 => usr_clk,
      CLK90 => open,
      CLK180 => open,
      CLK270 => open,
      CLKDV => open,
      CLK2X => usr_clk2x_dcm,
      CLK2X180 => open,
      CLKFX => open,
      CLKFX180 => open,
      STATUS => open,
      LOCKED => dcm_2_lock,
      PSDONE => open
    );

  dcm_3 : dcm_3_wrapper
    port map (
      RST => dcm_2_lock,
      CLKIN => usr_clk2x_dcm,
      CLKFB => usr_clk2x,
      PSEN => net_gnd0,
      PSINCDEC => net_gnd0,
      PSCLK => net_gnd0,
      DSSEN => net_gnd0,
      CLK0 => usr_clk2x,
      CLK90 => open,
      CLK180 => open,
      CLK270 => open,
      CLKDV => open,
      CLK2X => open,
      CLK2X180 => open,
      CLKFX => open,
      CLKFX180 => open,
      STATUS => open,
      LOCKED => open,
      PSDONE => open
    );

  ppc405_1 : ppc405_1_wrapper
    port map (
      C405CPMCORESLEEPREQ => open,
      C405CPMMSRCE => open,
      C405CPMMSREE => open,
      C405CPMTIMERIRQ => open,
      C405CPMTIMERRESETREQ => open,
      C405XXXMACHINECHECK => open,
      CPMC405CLOCK => sys_clk,
      CPMC405CORECLKINACTIVE => net_gnd0,
      CPMC405CPUCLKEN => net_vcc0,
      CPMC405JTAGCLKEN => net_vcc0,
      CPMC405TIMERCLKEN => net_vcc0,
      CPMC405TIMERTICK => net_vcc0,
      MCBCPUCLKEN => net_vcc0,
      MCBTIMEREN => net_vcc0,
      MCPPCRST => net_vcc0,
      PLBCLK => sys_clk,
      DCRCLK => net_gnd0,
      C405RSTCHIPRESETREQ => C405RSTCHIPRESETREQ,
      C405RSTCORERESETREQ => C405RSTCORERESETREQ,
      C405RSTSYSRESETREQ => C405RSTSYSRESETREQ,
      RSTC405RESETCHIP => RSTC405RESETCHIP,
      RSTC405RESETCORE => RSTC405RESETCORE,
      RSTC405RESETSYS => RSTC405RESETSYS,
      C405PLBICUABUS => plb_M_ABus(32 to 63),
      C405PLBICUBE => plb_M_BE(8 to 15),
      C405PLBICURNW => plb_M_RNW(1),
      C405PLBICUABORT => plb_M_abort(1),
      C405PLBICUBUSLOCK => plb_M_busLock(1),
      C405PLBICUU0ATTR => plb_M_compress(1),
      C405PLBICUGUARDED => plb_M_guarded(1),
      C405PLBICULOCKERR => plb_M_lockErr(1),
      C405PLBICUMSIZE => plb_M_MSize(2 to 3),
      C405PLBICUORDERED => plb_M_ordered(1),
      C405PLBICUPRIORITY => plb_M_priority(2 to 3),
      C405PLBICURDBURST => plb_M_rdBurst(1),
      C405PLBICUREQUEST => plb_M_request(1),
      C405PLBICUSIZE => plb_M_size(4 to 7),
      C405PLBICUTYPE => plb_M_type(3 to 5),
      C405PLBICUWRBURST => plb_M_wrBurst(1),
      C405PLBICUWRDBUS => plb_M_wrDBus(64 to 127),
      C405PLBICUCACHEABLE => open,
      PLBC405ICUADDRACK => plb_PLB_MAddrAck(1),
      PLBC405ICUBUSY => plb_PLB_MBusy(1),
      PLBC405ICUERR => plb_PLB_MErr(1),
      PLBC405ICURDBTERM => plb_PLB_MRdBTerm(1),
      PLBC405ICURDDACK => plb_PLB_MRdDAck(1),
      PLBC405ICURDDBUS => plb_PLB_MRdDBus(64 to 127),
      PLBC405ICURDWDADDR => plb_PLB_MRdWdAddr(4 to 7),
      PLBC405ICUREARBITRATE => plb_PLB_MRearbitrate(1),
      PLBC405ICUWRBTERM => plb_PLB_MWrBTerm(1),
      PLBC405ICUWRDACK => plb_PLB_MWrDAck(1),
      PLBC405ICUSSIZE => plb_PLB_MSSize(2 to 3),
      PLBC405ICUSERR => plb_PLB_SMErr(1),
      PLBC405ICUSBUSYS => plb_PLB_SMBusy(1),
      C405PLBDCUABUS => plb_M_ABus(0 to 31),
      C405PLBDCUBE => plb_M_BE(0 to 7),
      C405PLBDCURNW => plb_M_RNW(0),
      C405PLBDCUABORT => plb_M_abort(0),
      C405PLBDCUBUSLOCK => plb_M_busLock(0),
      C405PLBDCUU0ATTR => plb_M_compress(0),
      C405PLBDCUGUARDED => plb_M_guarded(0),
      C405PLBDCULOCKERR => plb_M_lockErr(0),
      C405PLBDCUMSIZE => plb_M_MSize(0 to 1),
      C405PLBDCUORDERED => plb_M_ordered(0),
      C405PLBDCUPRIORITY => plb_M_priority(0 to 1),
      C405PLBDCURDBURST => plb_M_rdBurst(0),
      C405PLBDCUREQUEST => plb_M_request(0),
      C405PLBDCUSIZE => plb_M_size(0 to 3),
      C405PLBDCUTYPE => plb_M_type(0 to 2),
      C405PLBDCUWRBURST => plb_M_wrBurst(0),
      C405PLBDCUWRDBUS => plb_M_wrDBus(0 to 63),
      C405PLBDCUCACHEABLE => open,
      C405PLBDCUWRITETHRU => open,
      PLBC405DCUADDRACK => plb_PLB_MAddrAck(0),
      PLBC405DCUBUSY => plb_PLB_MBusy(0),
      PLBC405DCUERR => plb_PLB_MErr(0),
      PLBC405DCURDBTERM => plb_PLB_MRdBTerm(0),
      PLBC405DCURDDACK => plb_PLB_MRdDAck(0),
      PLBC405DCURDDBUS => plb_PLB_MRdDBus(0 to 63),
      PLBC405DCURDWDADDR => plb_PLB_MRdWdAddr(0 to 3),
      PLBC405DCUREARBITRATE => plb_PLB_MRearbitrate(0),
      PLBC405DCUWRBTERM => plb_PLB_MWrBTerm(0),
      PLBC405DCUWRDACK => plb_PLB_MWrDAck(0),
      PLBC405DCUSSIZE => plb_PLB_MSSize(0 to 1),
      PLBC405DCUSERR => plb_PLB_SMErr(0),
      PLBC405DCUSBUSYS => plb_PLB_SMBusy(0),
      BRAMDSOCMCLK => net_gnd0,
      BRAMDSOCMRDDBUS => net_gnd32,
      DSARCVALUE => net_gnd8,
      DSCNTLVALUE => net_gnd8,
      DSOCMBRAMABUS => open,
      DSOCMBRAMBYTEWRITE => open,
      DSOCMBRAMEN => open,
      DSOCMBRAMWRDBUS => open,
      DSOCMBUSY => open,
      BRAMISOCMCLK => net_gnd0,
      BRAMISOCMRDDBUS => net_gnd64,
      ISARCVALUE => net_gnd8,
      ISCNTLVALUE => net_gnd8,
      ISOCMBRAMEN => open,
      ISOCMBRAMEVENWRITEEN => open,
      ISOCMBRAMODDWRITEEN => open,
      ISOCMBRAMRDABUS => open,
      ISOCMBRAMWRABUS => open,
      ISOCMBRAMWRDBUS => open,
      C405DCRABUS => open,
      C405DCRDBUSOUT => open,
      C405DCRREAD => open,
      C405DCRWRITE => open,
      DCRC405ACK => net_gnd0,
      DCRC405DBUSIN => net_gnd32,
      EICC405CRITINPUTIRQ => net_gnd0,
      EICC405EXTINPUTIRQ => net_gnd0,
      C405JTGCAPTUREDR => open,
      C405JTGEXTEST => open,
      C405JTGPGMOUT => open,
      C405JTGSHIFTDR => open,
      C405JTGTDO => jtagppc_0_1_C405JTGTDO,
      C405JTGTDOEN => jtagppc_0_1_C405JTGTDOEN,
      C405JTGUPDATEDR => open,
      MCBJTAGEN => net_vcc0,
      JTGC405BNDSCANTDO => net_gnd0,
      JTGC405TCK => jtagppc_0_1_JTGC405TCK,
      JTGC405TDI => jtagppc_0_1_JTGC405TDI,
      JTGC405TMS => jtagppc_0_1_JTGC405TMS,
      JTGC405TRSTNEG => jtagppc_0_1_JTGC405TRSTNEG,
      C405DBGMSRWE => open,
      C405DBGSTOPACK => open,
      C405DBGWBCOMPLETE => open,
      C405DBGWBFULL => open,
      C405DBGWBIAR => open,
      DBGC405DEBUGHALT => net_gnd0,
      DBGC405EXTBUSHOLDACK => net_gnd0,
      DBGC405UNCONDDEBUGEVENT => net_gnd0,
      C405TRCCYCLE => open,
      C405TRCEVENEXECUTIONSTATUS => open,
      C405TRCODDEXECUTIONSTATUS => open,
      C405TRCTRACESTATUS => open,
      C405TRCTRIGGEREVENTOUT => open,
      C405TRCTRIGGEREVENTTYPE => open,
      TRCC405TRACEDISABLE => net_gnd0,
      TRCC405TRIGGEREVENTIN => net_gnd0
    );

  jtagppc_0 : jtagppc_0_wrapper
    port map (
      TRSTNEG => net_vcc0,
      HALTNEG0 => net_vcc0,
      DBGC405DEBUGHALT0 => open,
      HALTNEG1 => net_vcc0,
      DBGC405DEBUGHALT1 => open,
      C405JTGTDO0 => jtagppc_0_0_C405JTGTDO,
      C405JTGTDOEN0 => jtagppc_0_0_C405JTGTDOEN,
      JTGC405TCK0 => jtagppc_0_0_JTGC405TCK,
      JTGC405TDI0 => jtagppc_0_0_JTGC405TDI,
      JTGC405TMS0 => jtagppc_0_0_JTGC405TMS,
      JTGC405TRSTNEG0 => jtagppc_0_0_JTGC405TRSTNEG,
      C405JTGTDO1 => jtagppc_0_1_C405JTGTDO,
      C405JTGTDOEN1 => jtagppc_0_1_C405JTGTDOEN,
      JTGC405TCK1 => jtagppc_0_1_JTGC405TCK,
      JTGC405TDI1 => jtagppc_0_1_JTGC405TDI,
      JTGC405TMS1 => jtagppc_0_1_JTGC405TMS,
      JTGC405TRSTNEG1 => jtagppc_0_1_JTGC405TRSTNEG
    );

  plb_bram_if_cntlr_1_bram : plb_bram_if_cntlr_1_bram_wrapper
    port map (
      BRAM_Rst_A => plb_bram_BRAM_Rst,
      BRAM_Clk_A => plb_bram_BRAM_Clk,
      BRAM_EN_A => plb_bram_BRAM_EN,
      BRAM_WEN_A => plb_bram_BRAM_WEN,
      BRAM_Addr_A => plb_bram_BRAM_Addr,
      BRAM_Din_A => plb_bram_BRAM_Din,
      BRAM_Dout_A => plb_bram_BRAM_Dout,
      BRAM_Rst_B => net_gnd0,
      BRAM_Clk_B => net_gnd0,
      BRAM_EN_B => net_gnd0,
      BRAM_WEN_B => net_gnd8,
      BRAM_Addr_B => net_gnd32,
      BRAM_Din_B => open,
      BRAM_Dout_B => net_gnd64
    );

  plb_bram_if_cntlr_1 : plb_bram_if_cntlr_1_wrapper
    port map (
      plb_clk => sys_clk,
      plb_rst => plb_PLB_Rst,
      plb_abort => plb_PLB_abort,
      plb_abus => plb_PLB_ABus,
      plb_be => plb_PLB_BE,
      plb_buslock => plb_PLB_busLock,
      plb_compress => plb_PLB_compress,
      plb_guarded => plb_PLB_guarded,
      plb_lockerr => plb_PLB_lockErr,
      plb_masterid => plb_PLB_masterID(0 to 0),
      plb_msize => plb_PLB_MSize,
      plb_ordered => plb_PLB_ordered,
      plb_pavalid => plb_PLB_PAValid,
      plb_rnw => plb_PLB_RNW,
      plb_size => plb_PLB_size,
      plb_type => plb_PLB_type,
      sl_addrack => plb_Sl_addrAck(0),
      sl_mbusy => plb_Sl_MBusy(0 to 1),
      sl_merr => plb_Sl_MErr(0 to 1),
      sl_rearbitrate => plb_Sl_rearbitrate(0),
      sl_ssize => plb_Sl_SSize(0 to 1),
      sl_wait => plb_Sl_wait(0),
      plb_rdprim => plb_PLB_rdPrim,
      plb_savalid => plb_PLB_SAValid,
      plb_wrprim => plb_PLB_wrPrim,
      plb_wrburst => plb_PLB_wrBurst,
      plb_wrdbus => plb_PLB_wrDBus,
      sl_wrbterm => plb_Sl_wrBTerm(0),
      sl_wrcomp => plb_Sl_wrComp(0),
      sl_wrdack => plb_Sl_wrDAck(0),
      plb_rdburst => plb_PLB_rdBurst,
      sl_rdbterm => plb_Sl_rdBTerm(0),
      sl_rdcomp => plb_Sl_rdComp(0),
      sl_rddack => plb_Sl_rdDAck(0),
      sl_rddbus => plb_Sl_rdDBus(0 to 63),
      sl_rdwdaddr => plb_Sl_rdWdAddr(0 to 3),
      plb_pendreq => plb_PLB_pendReq,
      plb_pendpri => plb_PLB_pendPri,
      plb_reqpri => plb_PLB_reqPri,
      bram_rst => plb_bram_BRAM_Rst,
      bram_clk => plb_bram_BRAM_Clk,
      bram_en => plb_bram_BRAM_EN,
      bram_wen => plb_bram_BRAM_WEN,
      bram_addr => plb_bram_BRAM_Addr,
      bram_din => plb_bram_BRAM_Din,
      bram_dout => plb_bram_BRAM_Dout
    );

  plb2opb_bridge_0 : plb2opb_bridge_0_wrapper
    port map (
      PLB_Clk => sys_clk,
      OPB_Clk => sys_clk,
      PLB_Rst => plb_PLB_Rst,
      OPB_Rst => opb0_OPB_Rst,
      Bus_Error_Det => open,
      BGI_Trans_Abort => open,
      BGO_dcrAck => open,
      BGO_dcrDBus => open,
      DCR_ABus => net_gnd10,
      DCR_DBus => net_gnd32,
      DCR_Read => net_gnd0,
      DCR_Write => net_gnd0,
      BGO_addrAck => plb_Sl_addrAck(1),
      BGO_MErr => plb_Sl_MErr(2 to 3),
      BGO_MBusy => plb_Sl_MBusy(2 to 3),
      BGO_rdBTerm => plb_Sl_rdBTerm(1),
      BGO_rdComp => plb_Sl_rdComp(1),
      BGO_rdDAck => plb_Sl_rdDAck(1),
      BGO_rdDBus => plb_Sl_rdDBus(64 to 127),
      BGO_rdWdAddr => plb_Sl_rdWdAddr(4 to 7),
      BGO_rearbitrate => plb_Sl_rearbitrate(1),
      BGO_SSize => plb_Sl_SSize(2 to 3),
      BGO_wait => plb_Sl_wait(1),
      BGO_wrBTerm => plb_Sl_wrBTerm(1),
      BGO_wrComp => plb_Sl_wrComp(1),
      BGO_wrDAck => plb_Sl_wrDAck(1),
      PLB_abort => plb_PLB_abort,
      PLB_ABus => plb_PLB_ABus,
      PLB_BE => plb_PLB_BE,
      PLB_busLock => plb_PLB_busLock,
      PLB_compress => plb_PLB_compress,
      PLB_guarded => plb_PLB_guarded,
      PLB_lockErr => plb_PLB_lockErr,
      PLB_masterID => plb_PLB_masterID(0 to 0),
      PLB_MSize => plb_PLB_MSize,
      PLB_ordered => plb_PLB_ordered,
      PLB_PAValid => plb_PLB_PAValid,
      PLB_rdBurst => plb_PLB_rdBurst,
      PLB_rdPrim => plb_PLB_rdPrim,
      PLB_RNW => plb_PLB_RNW,
      PLB_SAValid => plb_PLB_SAValid,
      PLB_size => plb_PLB_size,
      PLB_type => plb_PLB_type,
      PLB_wrBurst => plb_PLB_wrBurst,
      PLB_wrDBus => plb_PLB_wrDBus,
      PLB_wrPrim => plb_PLB_wrPrim,
      PLB2OPB_rearb => plb_PLB2OPB_rearb(1),
      BGO_ABus => opb0_M_ABus,
      BGO_BE => opb0_M_BE,
      BGO_busLock => opb0_M_busLock(0),
      BGO_DBus => opb0_M_DBus,
      BGO_request => opb0_M_request(0),
      BGO_RNW => opb0_M_RNW(0),
      BGO_select => opb0_M_select(0),
      BGO_seqAddr => opb0_M_seqAddr(0),
      OPB_DBus => opb0_OPB_DBus,
      OPB_errAck => opb0_OPB_errAck,
      OPB_MnGrant => opb0_OPB_MGrant(0),
      OPB_retry => opb0_OPB_retry,
      OPB_timeout => opb0_OPB_timeout,
      OPB_xferAck => opb0_OPB_xferAck
    );

  plb : plb_wrapper
    port map (
      PLB_Clk => sys_clk,
      SYS_Rst => sys_bus_reset(0),
      PLB_Rst => plb_PLB_Rst,
      PLB_dcrAck => open,
      PLB_dcrDBus => open,
      DCR_ABus => net_gnd10,
      DCR_DBus => net_gnd32,
      DCR_Read => net_gnd0,
      DCR_Write => net_gnd0,
      M_ABus => plb_M_ABus,
      M_BE => plb_M_BE,
      M_RNW => plb_M_RNW,
      M_abort => plb_M_abort,
      M_busLock => plb_M_busLock,
      M_compress => plb_M_compress,
      M_guarded => plb_M_guarded,
      M_lockErr => plb_M_lockErr,
      M_MSize => plb_M_MSize,
      M_ordered => plb_M_ordered,
      M_priority => plb_M_priority,
      M_rdBurst => plb_M_rdBurst,
      M_request => plb_M_request,
      M_size => plb_M_size,
      M_type => plb_M_type,
      M_wrBurst => plb_M_wrBurst,
      M_wrDBus => plb_M_wrDBus,
      Sl_addrAck => plb_Sl_addrAck,
      Sl_MErr => plb_Sl_MErr,
      Sl_MBusy => plb_Sl_MBusy,
      Sl_rdBTerm => plb_Sl_rdBTerm,
      Sl_rdComp => plb_Sl_rdComp,
      Sl_rdDAck => plb_Sl_rdDAck,
      Sl_rdDBus => plb_Sl_rdDBus,
      Sl_rdWdAddr => plb_Sl_rdWdAddr,
      Sl_rearbitrate => plb_Sl_rearbitrate,
      Sl_SSize => plb_Sl_SSize,
      Sl_wait => plb_Sl_wait,
      Sl_wrBTerm => plb_Sl_wrBTerm,
      Sl_wrComp => plb_Sl_wrComp,
      Sl_wrDAck => plb_Sl_wrDAck,
      PLB_ABus => plb_PLB_ABus,
      PLB_BE => plb_PLB_BE,
      PLB_MAddrAck => plb_PLB_MAddrAck,
      PLB_MBusy => plb_PLB_MBusy,
      PLB_MErr => plb_PLB_MErr,
      PLB_MRdBTerm => plb_PLB_MRdBTerm,
      PLB_MRdDAck => plb_PLB_MRdDAck,
      PLB_MRdDBus => plb_PLB_MRdDBus,
      PLB_MRdWdAddr => plb_PLB_MRdWdAddr,
      PLB_MRearbitrate => plb_PLB_MRearbitrate,
      PLB_MWrBTerm => plb_PLB_MWrBTerm,
      PLB_MWrDAck => plb_PLB_MWrDAck,
      PLB_MSSize => plb_PLB_MSSize,
      PLB_PAValid => plb_PLB_PAValid,
      PLB_RNW => plb_PLB_RNW,
      PLB_SAValid => plb_PLB_SAValid,
      PLB_abort => plb_PLB_abort,
      PLB_busLock => plb_PLB_busLock,
      PLB_compress => plb_PLB_compress,
      PLB_guarded => plb_PLB_guarded,
      PLB_lockErr => plb_PLB_lockErr,
      PLB_masterID => plb_PLB_masterID(0 to 0),
      PLB_MSize => plb_PLB_MSize,
      PLB_ordered => plb_PLB_ordered,
      PLB_pendPri => plb_PLB_pendPri,
      PLB_pendReq => plb_PLB_pendReq,
      PLB_rdBurst => plb_PLB_rdBurst,
      PLB_rdPrim => plb_PLB_rdPrim,
      PLB_reqPri => plb_PLB_reqPri,
      PLB_size => plb_PLB_size,
      PLB_type => plb_PLB_type,
      PLB_wrBurst => plb_PLB_wrBurst,
      PLB_wrDBus => plb_PLB_wrDBus,
      PLB_wrPrim => plb_PLB_wrPrim,
      PLB_SaddrAck => open,
      PLB_SMErr => plb_PLB_SMErr,
      PLB_SMBusy => plb_PLB_SMBusy,
      PLB_SrdBTerm => open,
      PLB_SrdComp => open,
      PLB_SrdDAck => open,
      PLB_SrdDBus => open,
      PLB_SrdWdAddr => open,
      PLB_Srearbitrate => open,
      PLB_Sssize => open,
      PLB_Swait => open,
      PLB_SwrBTerm => open,
      PLB_SwrComp => open,
      PLB_SwrDAck => open,
      PLB2OPB_rearb => plb_PLB2OPB_rearb,
      ArbAddrVldReg => open,
      Bus_Error_Det => open
    );

  opb0 : opb0_wrapper
    port map (
      OPB_Clk => sys_clk,
      OPB_Rst => opb0_OPB_Rst,
      SYS_Rst => sys_bus_reset(0),
      Debug_SYS_Rst => net_gnd0,
      WDT_Rst => net_gnd0,
      M_ABus => opb0_M_ABus,
      M_BE => opb0_M_BE,
      M_beXfer => net_gnd1(0 to 0),
      M_busLock => opb0_M_busLock(0 to 0),
      M_DBus => opb0_M_DBus,
      M_DBusEn => net_gnd1(0 to 0),
      M_DBusEn32_63 => net_vcc1(0 to 0),
      M_dwXfer => net_gnd1(0 to 0),
      M_fwXfer => net_gnd1(0 to 0),
      M_hwXfer => net_gnd1(0 to 0),
      M_request => opb0_M_request(0 to 0),
      M_RNW => opb0_M_RNW(0 to 0),
      M_select => opb0_M_select(0 to 0),
      M_seqAddr => opb0_M_seqAddr(0 to 0),
      Sl_beAck => net_gnd3,
      Sl_DBus => opb0_Sl_DBus,
      Sl_DBusEn => net_vcc3,
      Sl_DBusEn32_63 => net_vcc3,
      Sl_errAck => opb0_Sl_errAck,
      Sl_dwAck => net_gnd3,
      Sl_fwAck => net_gnd3,
      Sl_hwAck => net_gnd3,
      Sl_retry => opb0_Sl_retry,
      Sl_toutSup => opb0_Sl_toutSup,
      Sl_xferAck => opb0_Sl_xferAck,
      OPB_MRequest => open,
      OPB_ABus => opb0_OPB_ABus,
      OPB_BE => opb0_OPB_BE,
      OPB_beXfer => open,
      OPB_beAck => open,
      OPB_busLock => open,
      OPB_rdDBus => open,
      OPB_wrDBus => open,
      OPB_DBus => opb0_OPB_DBus,
      OPB_errAck => opb0_OPB_errAck,
      OPB_dwAck => open,
      OPB_dwXfer => open,
      OPB_fwAck => open,
      OPB_fwXfer => open,
      OPB_hwAck => open,
      OPB_hwXfer => open,
      OPB_MGrant => opb0_OPB_MGrant(0 to 0),
      OPB_pendReq => open,
      OPB_retry => opb0_OPB_retry,
      OPB_RNW => opb0_OPB_RNW,
      OPB_select => opb0_OPB_select,
      OPB_seqAddr => opb0_OPB_seqAddr,
      OPB_timeout => opb0_OPB_timeout,
      OPB_toutSup => open,
      OPB_xferAck => opb0_OPB_xferAck
    );

  diffclk_buf_0 : diffclk_buf_0_wrapper
    port map (
      Clkin_p => sysclk_p,
      Clkin_m => sysclk_m,
      Clkout => dcm_clk_s
    );

  RS232_UART_1 : rs232_uart_1_wrapper
    port map (
      OPB_Clk => sys_clk,
      OPB_Rst => opb0_OPB_Rst,
      Interrupt => open,
      OPB_ABus => opb0_OPB_ABus,
      OPB_BE => opb0_OPB_BE,
      OPB_RNW => opb0_OPB_RNW,
      OPB_select => opb0_OPB_select,
      OPB_seqAddr => opb0_OPB_seqAddr,
      OPB_DBus => opb0_OPB_DBus,
      UART_DBus => opb0_Sl_DBus(0 to 31),
      UART_errAck => opb0_Sl_errAck(0),
      UART_retry => opb0_Sl_retry(0),
      UART_toutSup => opb0_Sl_toutSup(0),
      UART_xferAck => opb0_Sl_xferAck(0),
      RX => rs232tsh_rx,
      TX => rs232tsh_tx
    );

  opb_clockcontroller_0 : opb_clockcontroller_0_wrapper
    port map (
      OPB_Clk => sys_clk,
      OPB_Rst => opb0_OPB_Rst,
      Sl_DBus => opb0_Sl_DBus(32 to 63),
      Sl_errAck => opb0_Sl_errAck(1),
      Sl_retry => opb0_Sl_retry(1),
      Sl_toutSup => opb0_Sl_toutSup(1),
      Sl_xferAck => opb0_Sl_xferAck(1),
      OPB_ABus => opb0_OPB_ABus,
      OPB_BE => opb0_OPB_BE,
      OPB_DBus => opb0_OPB_DBus,
      OPB_RNW => opb0_OPB_RNW,
      OPB_select => opb0_OPB_select,
      OPB_seqAddr => opb0_OPB_seqAddr,
      clk_clk => usr_clk,
      clk_psclk => usrclk_psclk,
      clk_psen => usrclk_psen,
      clk_psincdec => usrclk_psincdec,
      clk_reset => usrclk_reset
    );

  ppc405_0 : ppc405_0_wrapper
    port map (
      C405CPMCORESLEEPREQ => open,
      C405CPMMSRCE => open,
      C405CPMMSREE => open,
      C405CPMTIMERIRQ => open,
      C405CPMTIMERRESETREQ => open,
      C405XXXMACHINECHECK => open,
      CPMC405CLOCK => net_gnd0,
      CPMC405CORECLKINACTIVE => net_gnd0,
      CPMC405CPUCLKEN => net_vcc0,
      CPMC405JTAGCLKEN => net_vcc0,
      CPMC405TIMERCLKEN => net_vcc0,
      CPMC405TIMERTICK => net_vcc0,
      MCBCPUCLKEN => net_vcc0,
      MCBTIMEREN => net_vcc0,
      MCPPCRST => net_vcc0,
      PLBCLK => net_gnd0,
      DCRCLK => net_gnd0,
      C405RSTCHIPRESETREQ => open,
      C405RSTCORERESETREQ => open,
      C405RSTSYSRESETREQ => open,
      RSTC405RESETCHIP => net_gnd0,
      RSTC405RESETCORE => net_gnd0,
      RSTC405RESETSYS => net_gnd0,
      C405PLBICUABUS => open,
      C405PLBICUBE => open,
      C405PLBICURNW => open,
      C405PLBICUABORT => open,
      C405PLBICUBUSLOCK => open,
      C405PLBICUU0ATTR => open,
      C405PLBICUGUARDED => open,
      C405PLBICULOCKERR => open,
      C405PLBICUMSIZE => open,
      C405PLBICUORDERED => open,
      C405PLBICUPRIORITY => open,
      C405PLBICURDBURST => open,
      C405PLBICUREQUEST => open,
      C405PLBICUSIZE => open,
      C405PLBICUTYPE => open,
      C405PLBICUWRBURST => open,
      C405PLBICUWRDBUS => open,
      C405PLBICUCACHEABLE => open,
      PLBC405ICUADDRACK => net_gnd0,
      PLBC405ICUBUSY => net_gnd0,
      PLBC405ICUERR => net_gnd0,
      PLBC405ICURDBTERM => net_gnd0,
      PLBC405ICURDDACK => net_gnd0,
      PLBC405ICURDDBUS => net_gnd64,
      PLBC405ICURDWDADDR => net_gnd4,
      PLBC405ICUREARBITRATE => net_gnd0,
      PLBC405ICUWRBTERM => net_gnd0,
      PLBC405ICUWRDACK => net_gnd0,
      PLBC405ICUSSIZE => net_gnd2,
      PLBC405ICUSERR => net_gnd0,
      PLBC405ICUSBUSYS => net_gnd0,
      C405PLBDCUABUS => open,
      C405PLBDCUBE => open,
      C405PLBDCURNW => open,
      C405PLBDCUABORT => open,
      C405PLBDCUBUSLOCK => open,
      C405PLBDCUU0ATTR => open,
      C405PLBDCUGUARDED => open,
      C405PLBDCULOCKERR => open,
      C405PLBDCUMSIZE => open,
      C405PLBDCUORDERED => open,
      C405PLBDCUPRIORITY => open,
      C405PLBDCURDBURST => open,
      C405PLBDCUREQUEST => open,
      C405PLBDCUSIZE => open,
      C405PLBDCUTYPE => open,
      C405PLBDCUWRBURST => open,
      C405PLBDCUWRDBUS => open,
      C405PLBDCUCACHEABLE => open,
      C405PLBDCUWRITETHRU => open,
      PLBC405DCUADDRACK => net_gnd0,
      PLBC405DCUBUSY => net_gnd0,
      PLBC405DCUERR => net_gnd0,
      PLBC405DCURDBTERM => net_gnd0,
      PLBC405DCURDDACK => net_gnd0,
      PLBC405DCURDDBUS => net_gnd64,
      PLBC405DCURDWDADDR => net_gnd4,
      PLBC405DCUREARBITRATE => net_gnd0,
      PLBC405DCUWRBTERM => net_gnd0,
      PLBC405DCUWRDACK => net_gnd0,
      PLBC405DCUSSIZE => net_gnd2,
      PLBC405DCUSERR => net_gnd0,
      PLBC405DCUSBUSYS => net_gnd0,
      BRAMDSOCMCLK => net_gnd0,
      BRAMDSOCMRDDBUS => net_gnd32,
      DSARCVALUE => net_gnd8,
      DSCNTLVALUE => net_gnd8,
      DSOCMBRAMABUS => open,
      DSOCMBRAMBYTEWRITE => open,
      DSOCMBRAMEN => open,
      DSOCMBRAMWRDBUS => open,
      DSOCMBUSY => open,
      BRAMISOCMCLK => net_gnd0,
      BRAMISOCMRDDBUS => net_gnd64,
      ISARCVALUE => net_gnd8,
      ISCNTLVALUE => net_gnd8,
      ISOCMBRAMEN => open,
      ISOCMBRAMEVENWRITEEN => open,
      ISOCMBRAMODDWRITEEN => open,
      ISOCMBRAMRDABUS => open,
      ISOCMBRAMWRABUS => open,
      ISOCMBRAMWRDBUS => open,
      C405DCRABUS => open,
      C405DCRDBUSOUT => open,
      C405DCRREAD => open,
      C405DCRWRITE => open,
      DCRC405ACK => net_gnd0,
      DCRC405DBUSIN => net_gnd32,
      EICC405CRITINPUTIRQ => net_gnd0,
      EICC405EXTINPUTIRQ => net_gnd0,
      C405JTGCAPTUREDR => open,
      C405JTGEXTEST => open,
      C405JTGPGMOUT => open,
      C405JTGSHIFTDR => open,
      C405JTGTDO => jtagppc_0_0_C405JTGTDO,
      C405JTGTDOEN => jtagppc_0_0_C405JTGTDOEN,
      C405JTGUPDATEDR => open,
      MCBJTAGEN => net_vcc0,
      JTGC405BNDSCANTDO => net_gnd0,
      JTGC405TCK => jtagppc_0_0_JTGC405TCK,
      JTGC405TDI => jtagppc_0_0_JTGC405TDI,
      JTGC405TMS => jtagppc_0_0_JTGC405TMS,
      JTGC405TRSTNEG => jtagppc_0_0_JTGC405TRSTNEG,
      C405DBGMSRWE => open,
      C405DBGSTOPACK => open,
      C405DBGWBCOMPLETE => open,
      C405DBGWBFULL => open,
      C405DBGWBIAR => open,
      DBGC405DEBUGHALT => net_gnd0,
      DBGC405EXTBUSHOLDACK => net_gnd0,
      DBGC405UNCONDDEBUGEVENT => net_gnd0,
      C405TRCCYCLE => open,
      C405TRCEVENEXECUTIONSTATUS => open,
      C405TRCODDEXECUTIONSTATUS => open,
      C405TRCTRACESTATUS => open,
      C405TRCTRIGGEREVENTOUT => open,
      C405TRCTRIGGEREVENTTYPE => open,
      TRCC405TRACEDISABLE => net_gnd0,
      TRCC405TRIGGEREVENTIN => net_gnd0
    );

  diffclk_bref_clk_bottom : diffclk_bref_clk_bottom_wrapper
    port map (
      Clkin_p => bref_clk_bottom_p,
      Clkin_m => bref_clk_bottom_n,
      Clkout => bref_clk_bottom
    );

  opb_adccontroller_0 : opb_adccontroller_0_wrapper
    port map (
      OPB_Clk => sys_clk,
      OPB_Rst => opb0_OPB_Rst,
      Sl_DBus => opb0_Sl_DBus(64 to 95),
      Sl_errAck => opb0_Sl_errAck(2),
      Sl_retry => opb0_Sl_retry(2),
      Sl_toutSup => opb0_Sl_toutSup(2),
      Sl_xferAck => opb0_Sl_xferAck(2),
      OPB_ABus => opb0_OPB_ABus,
      OPB_BE => opb0_OPB_BE,
      OPB_DBus => opb0_OPB_DBus,
      OPB_RNW => opb0_OPB_RNW,
      OPB_select => opb0_OPB_select,
      OPB_seqAddr => opb0_OPB_seqAddr,
      adc0_adc3wire_clk => adc0_adc3wire_clk,
      adc0_adc3wire_data => adc0_adc3wire_data,
      adc0_adc3wire_strobe => adc0_adc3wire_strobe,
      adc0_modepin => adc0_modepin,
      adc0_ddrb => adc0_ddrb,
      adc0_psclk => adc0_psclk,
      adc0_psen => adc0_psen,
      adc0_psincdec => adc0_psincdec,
      adc0_clk => adc0_clk,
      adc1_adc3wire_clk => adc1_adc3wire_clk,
      adc1_adc3wire_data => adc1_adc3wire_data,
      adc1_adc3wire_strobe => adc1_adc3wire_strobe,
      adc1_modepin => adc1_modepin,
      adc1_ddrb => adc1_ddrb,
      adc1_psclk => adc1_psclk,
      adc1_psen => adc1_psen,
      adc1_psincdec => adc1_psincdec,
      adc1_clk => adc1_clk
    );

  i_128w_2k_10_r310iadc_XSG_core_config : i_128w_2k_10_r310iadc_xsg_core_config_wrapper
    port map (
      clk => adc0_clk,
      i_128w_2k_10_r310iadc_XAUI0_rx_almost_full => i_128w_2k_10_r310iadc_XAUI0_rx_almost_full,
      i_128w_2k_10_r310iadc_XAUI0_rx_data => i_128w_2k_10_r310iadc_XAUI0_rx_data,
      i_128w_2k_10_r310iadc_XAUI0_rx_empty => i_128w_2k_10_r310iadc_XAUI0_rx_empty,
      i_128w_2k_10_r310iadc_XAUI0_rx_linkdown => i_128w_2k_10_r310iadc_XAUI0_rx_linkdown,
      i_128w_2k_10_r310iadc_XAUI0_rx_outofband => i_128w_2k_10_r310iadc_XAUI0_rx_outofband,
      i_128w_2k_10_r310iadc_XAUI0_rx_valid => i_128w_2k_10_r310iadc_XAUI0_rx_valid,
      i_128w_2k_10_r310iadc_XAUI0_tx_full => i_128w_2k_10_r310iadc_XAUI0_tx_full,
      i_128w_2k_10_r310iadc_XAUI0_rx_get => i_128w_2k_10_r310iadc_XAUI0_rx_get,
      i_128w_2k_10_r310iadc_XAUI0_rx_reset => i_128w_2k_10_r310iadc_XAUI0_rx_reset,
      i_128w_2k_10_r310iadc_XAUI0_tx_data => i_128w_2k_10_r310iadc_XAUI0_tx_data,
      i_128w_2k_10_r310iadc_XAUI0_tx_outofband => i_128w_2k_10_r310iadc_XAUI0_tx_outofband,
      i_128w_2k_10_r310iadc_XAUI0_tx_valid => i_128w_2k_10_r310iadc_XAUI0_tx_valid,
      i_128w_2k_10_r310iadc_adc0_user_data_valid => i_128w_2k_10_r310iadc_adc0_user_data_valid,
      i_128w_2k_10_r310iadc_adc0_user_datai0 => i_128w_2k_10_r310iadc_adc0_user_datai0,
      i_128w_2k_10_r310iadc_adc0_user_datai1 => i_128w_2k_10_r310iadc_adc0_user_datai1,
      i_128w_2k_10_r310iadc_adc0_user_datai2 => i_128w_2k_10_r310iadc_adc0_user_datai2,
      i_128w_2k_10_r310iadc_adc0_user_datai3 => i_128w_2k_10_r310iadc_adc0_user_datai3,
      i_128w_2k_10_r310iadc_adc0_user_dataq0 => i_128w_2k_10_r310iadc_adc0_user_dataq0,
      i_128w_2k_10_r310iadc_adc0_user_dataq1 => i_128w_2k_10_r310iadc_adc0_user_dataq1,
      i_128w_2k_10_r310iadc_adc0_user_dataq2 => i_128w_2k_10_r310iadc_adc0_user_dataq2,
      i_128w_2k_10_r310iadc_adc0_user_dataq3 => i_128w_2k_10_r310iadc_adc0_user_dataq3,
      i_128w_2k_10_r310iadc_adc0_user_outofrangei0 => i_128w_2k_10_r310iadc_adc0_user_outofrangei0,
      i_128w_2k_10_r310iadc_adc0_user_outofrangei1 => i_128w_2k_10_r310iadc_adc0_user_outofrangei1,
      i_128w_2k_10_r310iadc_adc0_user_outofrangeq0 => i_128w_2k_10_r310iadc_adc0_user_outofrangeq0,
      i_128w_2k_10_r310iadc_adc0_user_outofrangeq1 => i_128w_2k_10_r310iadc_adc0_user_outofrangeq1,
      i_128w_2k_10_r310iadc_adc0_user_sync0 => i_128w_2k_10_r310iadc_adc0_user_sync0,
      i_128w_2k_10_r310iadc_adc0_user_sync1 => i_128w_2k_10_r310iadc_adc0_user_sync1,
      i_128w_2k_10_r310iadc_adc0_user_sync2 => i_128w_2k_10_r310iadc_adc0_user_sync2,
      i_128w_2k_10_r310iadc_adc0_user_sync3 => i_128w_2k_10_r310iadc_adc0_user_sync3,
      i_128w_2k_10_r310iadc_adc1_user_data_valid => i_128w_2k_10_r310iadc_adc1_user_data_valid,
      i_128w_2k_10_r310iadc_adc1_user_datai0 => i_128w_2k_10_r310iadc_adc1_user_datai0,
      i_128w_2k_10_r310iadc_adc1_user_datai1 => i_128w_2k_10_r310iadc_adc1_user_datai1,
      i_128w_2k_10_r310iadc_adc1_user_datai2 => i_128w_2k_10_r310iadc_adc1_user_datai2,
      i_128w_2k_10_r310iadc_adc1_user_datai3 => i_128w_2k_10_r310iadc_adc1_user_datai3,
      i_128w_2k_10_r310iadc_adc1_user_dataq0 => i_128w_2k_10_r310iadc_adc1_user_dataq0,
      i_128w_2k_10_r310iadc_adc1_user_dataq1 => i_128w_2k_10_r310iadc_adc1_user_dataq1,
      i_128w_2k_10_r310iadc_adc1_user_dataq2 => i_128w_2k_10_r310iadc_adc1_user_dataq2,
      i_128w_2k_10_r310iadc_adc1_user_dataq3 => i_128w_2k_10_r310iadc_adc1_user_dataq3,
      i_128w_2k_10_r310iadc_adc1_user_outofrangei0 => i_128w_2k_10_r310iadc_adc1_user_outofrangei0,
      i_128w_2k_10_r310iadc_adc1_user_outofrangei1 => i_128w_2k_10_r310iadc_adc1_user_outofrangei1,
      i_128w_2k_10_r310iadc_adc1_user_outofrangeq0 => i_128w_2k_10_r310iadc_adc1_user_outofrangeq0,
      i_128w_2k_10_r310iadc_adc1_user_outofrangeq1 => i_128w_2k_10_r310iadc_adc1_user_outofrangeq1,
      i_128w_2k_10_r310iadc_adc1_user_sync0 => i_128w_2k_10_r310iadc_adc1_user_sync0,
      i_128w_2k_10_r310iadc_adc1_user_sync1 => i_128w_2k_10_r310iadc_adc1_user_sync1,
      i_128w_2k_10_r310iadc_adc1_user_sync2 => i_128w_2k_10_r310iadc_adc1_user_sync2,
      i_128w_2k_10_r310iadc_adc1_user_sync3 => i_128w_2k_10_r310iadc_adc1_user_sync3,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_valid => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_valid,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_address => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_address,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_be => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_be,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_in => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_in,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_we => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_we,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_valid => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_valid,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_address => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_address,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_be => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_be,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_in => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_in,
      i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_we => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_we,
      i_128w_2k_10_r310iadc_gpio_gateway => i_128w_2k_10_r310iadc_gpio_gateway(0),
      i_128w_2k_10_r310iadc_led1_arm_gateway => i_128w_2k_10_r310iadc_led1_arm_gateway(0),
      i_128w_2k_10_r310iadc_led2_sync_gateway => i_128w_2k_10_r310iadc_led2_sync_gateway(0),
      i_128w_2k_10_r310iadc_led4_eq_clip_gateway => i_128w_2k_10_r310iadc_led4_eq_clip_gateway(0),
      i_128w_2k_10_r310iadc_led5_adc_clip_gateway => i_128w_2k_10_r310iadc_led5_adc_clip_gateway(0),
      i_128w_2k_10_r310iadc_led6_link_dn_gateway => i_128w_2k_10_r310iadc_led6_link_dn_gateway(0),
      i_128w_2k_10_r310iadc_led7_xaui_overlfow_gateway => i_128w_2k_10_r310iadc_led7_xaui_overlfow_gateway(0)
    );

  i_128w_2k_10_r310iadc_XAUI0 : i_128w_2k_10_r310iadc_xaui0_wrapper
    port map (
      app_clk => adc0_clk,
      rx_data => i_128w_2k_10_r310iadc_XAUI0_rx_data,
      rx_outofband => i_128w_2k_10_r310iadc_XAUI0_rx_outofband,
      rx_get => i_128w_2k_10_r310iadc_XAUI0_rx_get,
      rx_almost_full => i_128w_2k_10_r310iadc_XAUI0_rx_almost_full,
      rx_empty => i_128w_2k_10_r310iadc_XAUI0_rx_empty,
      rx_reset => i_128w_2k_10_r310iadc_XAUI0_rx_reset,
      rx_linkdown => i_128w_2k_10_r310iadc_XAUI0_rx_linkdown,
      rx_valid => i_128w_2k_10_r310iadc_XAUI0_rx_valid,
      tx_data => i_128w_2k_10_r310iadc_XAUI0_tx_data,
      tx_outofband => i_128w_2k_10_r310iadc_XAUI0_tx_outofband,
      tx_valid => i_128w_2k_10_r310iadc_XAUI0_tx_valid,
      tx_full => i_128w_2k_10_r310iadc_XAUI0_tx_full,
      mgt_tx_l0_p => XAUI1_tx_l0_p,
      mgt_tx_l0_n => XAUI1_tx_l0_n,
      mgt_tx_l1_p => XAUI1_tx_l1_p,
      mgt_tx_l1_n => XAUI1_tx_l1_n,
      mgt_tx_l2_p => XAUI1_tx_l2_p,
      mgt_tx_l2_n => XAUI1_tx_l2_n,
      mgt_tx_l3_p => XAUI1_tx_l3_p,
      mgt_tx_l3_n => XAUI1_tx_l3_n,
      mgt_rx_l0_p => XAUI1_rx_l0_p,
      mgt_rx_l0_n => XAUI1_rx_l0_n,
      mgt_rx_l1_p => XAUI1_rx_l1_p,
      mgt_rx_l1_n => XAUI1_rx_l1_n,
      mgt_rx_l2_p => XAUI1_rx_l2_p,
      mgt_rx_l2_n => XAUI1_rx_l2_n,
      mgt_rx_l3_p => XAUI1_rx_l3_p,
      mgt_rx_l3_n => XAUI1_rx_l3_n,
      mgt_clk => bref_clk_bottom
    );

  i_128w_2k_10_r310iadc_adc0 : i_128w_2k_10_r310iadc_adc0_wrapper
    port map (
      adc_clk_p => adc0clk_p,
      adc_clk_n => adc0clk_n,
      adc_sync_p => adc0sync_p,
      adc_sync_n => adc0sync_n,
      adc_outofrangei_p => adc0outofrangei_p,
      adc_outofrangei_n => adc0outofrangei_n,
      adc_outofrangeq_p => adc0outofrangeq_p,
      adc_outofrangeq_n => adc0outofrangeq_n,
      adc_dataeveni_p => adc0dataeveni_p,
      adc_dataeveni_n => adc0dataeveni_n,
      adc_dataoddi_p => adc0dataoddi_p,
      adc_dataoddi_n => adc0dataoddi_n,
      adc_dataevenq_p => adc0dataevenq_p,
      adc_dataevenq_n => adc0dataevenq_n,
      adc_dataoddq_p => adc0dataoddq_p,
      adc_dataoddq_n => adc0dataoddq_n,
      adc_ddrb_p => adc0ddrb_p,
      adc_ddrb_n => adc0ddrb_n,
      user_datai0 => i_128w_2k_10_r310iadc_adc0_user_datai0,
      user_datai1 => i_128w_2k_10_r310iadc_adc0_user_datai1,
      user_datai2 => i_128w_2k_10_r310iadc_adc0_user_datai2,
      user_datai3 => i_128w_2k_10_r310iadc_adc0_user_datai3,
      user_dataq0 => i_128w_2k_10_r310iadc_adc0_user_dataq0,
      user_dataq1 => i_128w_2k_10_r310iadc_adc0_user_dataq1,
      user_dataq2 => i_128w_2k_10_r310iadc_adc0_user_dataq2,
      user_dataq3 => i_128w_2k_10_r310iadc_adc0_user_dataq3,
      user_outofrangei0 => i_128w_2k_10_r310iadc_adc0_user_outofrangei0,
      user_outofrangei1 => i_128w_2k_10_r310iadc_adc0_user_outofrangei1,
      user_outofrangeq0 => i_128w_2k_10_r310iadc_adc0_user_outofrangeq0,
      user_outofrangeq1 => i_128w_2k_10_r310iadc_adc0_user_outofrangeq1,
      user_sync0 => i_128w_2k_10_r310iadc_adc0_user_sync0,
      user_sync1 => i_128w_2k_10_r310iadc_adc0_user_sync1,
      user_sync2 => i_128w_2k_10_r310iadc_adc0_user_sync2,
      user_sync3 => i_128w_2k_10_r310iadc_adc0_user_sync3,
      user_data_valid => i_128w_2k_10_r310iadc_adc0_user_data_valid,
      ctrl_reset => adc0_ddrb,
      ctrl_clk_in => adc0_clk,
      ctrl_clk_out => adc0_clk,
      ctrl_clk90_out => adc0_clk90,
      ctrl_dcm_locked => open,
      dcm_psclk => adc0_psclk,
      dcm_psen => adc0_psen,
      dcm_psincdec => adc0_psincdec
    );

  i_128w_2k_10_r310iadc_adc1 : i_128w_2k_10_r310iadc_adc1_wrapper
    port map (
      adc_clk_p => adc1clk_p,
      adc_clk_n => adc1clk_n,
      adc_sync_p => adc1sync_p,
      adc_sync_n => adc1sync_n,
      adc_outofrangei_p => adc1outofrangei_p,
      adc_outofrangei_n => adc1outofrangei_n,
      adc_outofrangeq_p => adc1outofrangeq_p,
      adc_outofrangeq_n => adc1outofrangeq_n,
      adc_dataeveni_p => adc1dataeveni_p,
      adc_dataeveni_n => adc1dataeveni_n,
      adc_dataoddi_p => adc1dataoddi_p,
      adc_dataoddi_n => adc1dataoddi_n,
      adc_dataevenq_p => adc1dataevenq_p,
      adc_dataevenq_n => adc1dataevenq_n,
      adc_dataoddq_p => adc1dataoddq_p,
      adc_dataoddq_n => adc1dataoddq_n,
      adc_ddrb_p => adc1ddrb_p,
      adc_ddrb_n => adc1ddrb_n,
      user_datai0 => i_128w_2k_10_r310iadc_adc1_user_datai0,
      user_datai1 => i_128w_2k_10_r310iadc_adc1_user_datai1,
      user_datai2 => i_128w_2k_10_r310iadc_adc1_user_datai2,
      user_datai3 => i_128w_2k_10_r310iadc_adc1_user_datai3,
      user_dataq0 => i_128w_2k_10_r310iadc_adc1_user_dataq0,
      user_dataq1 => i_128w_2k_10_r310iadc_adc1_user_dataq1,
      user_dataq2 => i_128w_2k_10_r310iadc_adc1_user_dataq2,
      user_dataq3 => i_128w_2k_10_r310iadc_adc1_user_dataq3,
      user_outofrangei0 => i_128w_2k_10_r310iadc_adc1_user_outofrangei0,
      user_outofrangei1 => i_128w_2k_10_r310iadc_adc1_user_outofrangei1,
      user_outofrangeq0 => i_128w_2k_10_r310iadc_adc1_user_outofrangeq0,
      user_outofrangeq1 => i_128w_2k_10_r310iadc_adc1_user_outofrangeq1,
      user_sync0 => i_128w_2k_10_r310iadc_adc1_user_sync0,
      user_sync1 => i_128w_2k_10_r310iadc_adc1_user_sync1,
      user_sync2 => i_128w_2k_10_r310iadc_adc1_user_sync2,
      user_sync3 => i_128w_2k_10_r310iadc_adc1_user_sync3,
      user_data_valid => i_128w_2k_10_r310iadc_adc1_user_data_valid,
      ctrl_reset => adc1_ddrb,
      ctrl_clk_in => adc0_clk,
      ctrl_clk_out => adc1_clk,
      ctrl_clk90_out => open,
      ctrl_dcm_locked => open,
      dcm_psclk => adc1_psclk,
      dcm_psen => adc1_psen,
      dcm_psincdec => adc1_psincdec
    );

  i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram : i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_wrapper
    port map (
      clk => adc0_clk,
      we => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_we,
      be => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_be,
      address => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_address,
      data_in => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_in,
      data_out => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_out,
      data_valid => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram_data_valid,
      pads_address => sram0_address,
      pads_bw_b => sram0_bw_b,
      pads_we_b => sram0_we_b,
      pads_adv_ld_b => sram0_adv_ld_b,
      pads_clk => sram0_clk,
      pads_ce => sram0_ce,
      pads_oe_b => sram0_oe_b,
      pads_cen_b => sram0_cen_b,
      pads_mode => sram0_mode,
      pads_zz => sram0_zz,
      pads_dq_I => sram0_dq_I,
      pads_dq_O => sram0_dq_O,
      pads_dq_T => sram0_dq_T
    );

  i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1 : i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_wrapper
    port map (
      clk => adc0_clk,
      we => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_we,
      be => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_be,
      address => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_address,
      data_in => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_in,
      data_out => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_out,
      data_valid => i_128w_2k_10_r310iadc_dbuf_ct_sram_fft_2x_sram1_data_valid,
      pads_address => sram1_address,
      pads_bw_b => sram1_bw_b,
      pads_we_b => sram1_we_b,
      pads_adv_ld_b => sram1_adv_ld_b,
      pads_clk => sram1_clk,
      pads_ce => sram1_ce,
      pads_oe_b => sram1_oe_b,
      pads_cen_b => sram1_cen_b,
      pads_mode => sram1_mode,
      pads_zz => sram1_zz,
      pads_dq_I => sram1_dq_I,
      pads_dq_O => sram1_dq_O,
      pads_dq_T => sram1_dq_T
    );

  i_128w_2k_10_r310iadc_gpio : i_128w_2k_10_r310iadc_gpio_wrapper
    port map (
      gateway => i_128w_2k_10_r310iadc_gpio_gateway(0 to 0),
      io_pad => i_128w_2k_10_r310iadc_gpio_ext(0 to 0),
      clk => adc0_clk,
      clk90 => adc0_clk90
    );

  i_128w_2k_10_r310iadc_led1_arm : i_128w_2k_10_r310iadc_led1_arm_wrapper
    port map (
      gateway => i_128w_2k_10_r310iadc_led1_arm_gateway(0 to 0),
      io_pad => i_128w_2k_10_r310iadc_led1_arm_ext(0 to 0),
      clk => adc0_clk,
      clk90 => adc0_clk90
    );

  i_128w_2k_10_r310iadc_led2_sync : i_128w_2k_10_r310iadc_led2_sync_wrapper
    port map (
      gateway => i_128w_2k_10_r310iadc_led2_sync_gateway(0 to 0),
      io_pad => i_128w_2k_10_r310iadc_led2_sync_ext(0 to 0),
      clk => adc0_clk,
      clk90 => adc0_clk90
    );

  i_128w_2k_10_r310iadc_led4_eq_clip : i_128w_2k_10_r310iadc_led4_eq_clip_wrapper
    port map (
      gateway => i_128w_2k_10_r310iadc_led4_eq_clip_gateway(0 to 0),
      io_pad => i_128w_2k_10_r310iadc_led4_eq_clip_ext(0 to 0),
      clk => adc0_clk,
      clk90 => adc0_clk90
    );

  i_128w_2k_10_r310iadc_led5_adc_clip : i_128w_2k_10_r310iadc_led5_adc_clip_wrapper
    port map (
      gateway => i_128w_2k_10_r310iadc_led5_adc_clip_gateway(0 to 0),
      io_pad => i_128w_2k_10_r310iadc_led5_adc_clip_ext(0 to 0),
      clk => adc0_clk,
      clk90 => adc0_clk90
    );

  i_128w_2k_10_r310iadc_led6_link_dn : i_128w_2k_10_r310iadc_led6_link_dn_wrapper
    port map (
      gateway => i_128w_2k_10_r310iadc_led6_link_dn_gateway(0 to 0),
      io_pad => i_128w_2k_10_r310iadc_led6_link_dn_ext(0 to 0),
      clk => adc0_clk,
      clk90 => adc0_clk90
    );

  i_128w_2k_10_r310iadc_led7_xaui_overlfow : i_128w_2k_10_r310iadc_led7_xaui_overlfow_wrapper
    port map (
      gateway => i_128w_2k_10_r310iadc_led7_xaui_overlfow_gateway(0 to 0),
      io_pad => i_128w_2k_10_r310iadc_led7_xaui_overlfow_ext(0 to 0),
      clk => adc0_clk,
      clk90 => adc0_clk90
    );

  iobuf_0 : IOBUF
    port map (
      I => sram0_dq_O(35),
      IO => sram0_dq(35),
      O => sram0_dq_I(35),
      T => sram0_dq_T(35)
    );

  iobuf_1 : IOBUF
    port map (
      I => sram0_dq_O(34),
      IO => sram0_dq(34),
      O => sram0_dq_I(34),
      T => sram0_dq_T(34)
    );

  iobuf_2 : IOBUF
    port map (
      I => sram0_dq_O(33),
      IO => sram0_dq(33),
      O => sram0_dq_I(33),
      T => sram0_dq_T(33)
    );

  iobuf_3 : IOBUF
    port map (
      I => sram0_dq_O(32),
      IO => sram0_dq(32),
      O => sram0_dq_I(32),
      T => sram0_dq_T(32)
    );

  iobuf_4 : IOBUF
    port map (
      I => sram0_dq_O(31),
      IO => sram0_dq(31),
      O => sram0_dq_I(31),
      T => sram0_dq_T(31)
    );

  iobuf_5 : IOBUF
    port map (
      I => sram0_dq_O(30),
      IO => sram0_dq(30),
      O => sram0_dq_I(30),
      T => sram0_dq_T(30)
    );

  iobuf_6 : IOBUF
    port map (
      I => sram0_dq_O(29),
      IO => sram0_dq(29),
      O => sram0_dq_I(29),
      T => sram0_dq_T(29)
    );

  iobuf_7 : IOBUF
    port map (
      I => sram0_dq_O(28),
      IO => sram0_dq(28),
      O => sram0_dq_I(28),
      T => sram0_dq_T(28)
    );

  iobuf_8 : IOBUF
    port map (
      I => sram0_dq_O(27),
      IO => sram0_dq(27),
      O => sram0_dq_I(27),
      T => sram0_dq_T(27)
    );

  iobuf_9 : IOBUF
    port map (
      I => sram0_dq_O(26),
      IO => sram0_dq(26),
      O => sram0_dq_I(26),
      T => sram0_dq_T(26)
    );

  iobuf_10 : IOBUF
    port map (
      I => sram0_dq_O(25),
      IO => sram0_dq(25),
      O => sram0_dq_I(25),
      T => sram0_dq_T(25)
    );

  iobuf_11 : IOBUF
    port map (
      I => sram0_dq_O(24),
      IO => sram0_dq(24),
      O => sram0_dq_I(24),
      T => sram0_dq_T(24)
    );

  iobuf_12 : IOBUF
    port map (
      I => sram0_dq_O(23),
      IO => sram0_dq(23),
      O => sram0_dq_I(23),
      T => sram0_dq_T(23)
    );

  iobuf_13 : IOBUF
    port map (
      I => sram0_dq_O(22),
      IO => sram0_dq(22),
      O => sram0_dq_I(22),
      T => sram0_dq_T(22)
    );

  iobuf_14 : IOBUF
    port map (
      I => sram0_dq_O(21),
      IO => sram0_dq(21),
      O => sram0_dq_I(21),
      T => sram0_dq_T(21)
    );

  iobuf_15 : IOBUF
    port map (
      I => sram0_dq_O(20),
      IO => sram0_dq(20),
      O => sram0_dq_I(20),
      T => sram0_dq_T(20)
    );

  iobuf_16 : IOBUF
    port map (
      I => sram0_dq_O(19),
      IO => sram0_dq(19),
      O => sram0_dq_I(19),
      T => sram0_dq_T(19)
    );

  iobuf_17 : IOBUF
    port map (
      I => sram0_dq_O(18),
      IO => sram0_dq(18),
      O => sram0_dq_I(18),
      T => sram0_dq_T(18)
    );

  iobuf_18 : IOBUF
    port map (
      I => sram0_dq_O(17),
      IO => sram0_dq(17),
      O => sram0_dq_I(17),
      T => sram0_dq_T(17)
    );

  iobuf_19 : IOBUF
    port map (
      I => sram0_dq_O(16),
      IO => sram0_dq(16),
      O => sram0_dq_I(16),
      T => sram0_dq_T(16)
    );

  iobuf_20 : IOBUF
    port map (
      I => sram0_dq_O(15),
      IO => sram0_dq(15),
      O => sram0_dq_I(15),
      T => sram0_dq_T(15)
    );

  iobuf_21 : IOBUF
    port map (
      I => sram0_dq_O(14),
      IO => sram0_dq(14),
      O => sram0_dq_I(14),
      T => sram0_dq_T(14)
    );

  iobuf_22 : IOBUF
    port map (
      I => sram0_dq_O(13),
      IO => sram0_dq(13),
      O => sram0_dq_I(13),
      T => sram0_dq_T(13)
    );

  iobuf_23 : IOBUF
    port map (
      I => sram0_dq_O(12),
      IO => sram0_dq(12),
      O => sram0_dq_I(12),
      T => sram0_dq_T(12)
    );

  iobuf_24 : IOBUF
    port map (
      I => sram0_dq_O(11),
      IO => sram0_dq(11),
      O => sram0_dq_I(11),
      T => sram0_dq_T(11)
    );

  iobuf_25 : IOBUF
    port map (
      I => sram0_dq_O(10),
      IO => sram0_dq(10),
      O => sram0_dq_I(10),
      T => sram0_dq_T(10)
    );

  iobuf_26 : IOBUF
    port map (
      I => sram0_dq_O(9),
      IO => sram0_dq(9),
      O => sram0_dq_I(9),
      T => sram0_dq_T(9)
    );

  iobuf_27 : IOBUF
    port map (
      I => sram0_dq_O(8),
      IO => sram0_dq(8),
      O => sram0_dq_I(8),
      T => sram0_dq_T(8)
    );

  iobuf_28 : IOBUF
    port map (
      I => sram0_dq_O(7),
      IO => sram0_dq(7),
      O => sram0_dq_I(7),
      T => sram0_dq_T(7)
    );

  iobuf_29 : IOBUF
    port map (
      I => sram0_dq_O(6),
      IO => sram0_dq(6),
      O => sram0_dq_I(6),
      T => sram0_dq_T(6)
    );

  iobuf_30 : IOBUF
    port map (
      I => sram0_dq_O(5),
      IO => sram0_dq(5),
      O => sram0_dq_I(5),
      T => sram0_dq_T(5)
    );

  iobuf_31 : IOBUF
    port map (
      I => sram0_dq_O(4),
      IO => sram0_dq(4),
      O => sram0_dq_I(4),
      T => sram0_dq_T(4)
    );

  iobuf_32 : IOBUF
    port map (
      I => sram0_dq_O(3),
      IO => sram0_dq(3),
      O => sram0_dq_I(3),
      T => sram0_dq_T(3)
    );

  iobuf_33 : IOBUF
    port map (
      I => sram0_dq_O(2),
      IO => sram0_dq(2),
      O => sram0_dq_I(2),
      T => sram0_dq_T(2)
    );

  iobuf_34 : IOBUF
    port map (
      I => sram0_dq_O(1),
      IO => sram0_dq(1),
      O => sram0_dq_I(1),
      T => sram0_dq_T(1)
    );

  iobuf_35 : IOBUF
    port map (
      I => sram0_dq_O(0),
      IO => sram0_dq(0),
      O => sram0_dq_I(0),
      T => sram0_dq_T(0)
    );

  iobuf_36 : IOBUF
    port map (
      I => sram1_dq_O(35),
      IO => sram1_dq(35),
      O => sram1_dq_I(35),
      T => sram1_dq_T(35)
    );

  iobuf_37 : IOBUF
    port map (
      I => sram1_dq_O(34),
      IO => sram1_dq(34),
      O => sram1_dq_I(34),
      T => sram1_dq_T(34)
    );

  iobuf_38 : IOBUF
    port map (
      I => sram1_dq_O(33),
      IO => sram1_dq(33),
      O => sram1_dq_I(33),
      T => sram1_dq_T(33)
    );

  iobuf_39 : IOBUF
    port map (
      I => sram1_dq_O(32),
      IO => sram1_dq(32),
      O => sram1_dq_I(32),
      T => sram1_dq_T(32)
    );

  iobuf_40 : IOBUF
    port map (
      I => sram1_dq_O(31),
      IO => sram1_dq(31),
      O => sram1_dq_I(31),
      T => sram1_dq_T(31)
    );

  iobuf_41 : IOBUF
    port map (
      I => sram1_dq_O(30),
      IO => sram1_dq(30),
      O => sram1_dq_I(30),
      T => sram1_dq_T(30)
    );

  iobuf_42 : IOBUF
    port map (
      I => sram1_dq_O(29),
      IO => sram1_dq(29),
      O => sram1_dq_I(29),
      T => sram1_dq_T(29)
    );

  iobuf_43 : IOBUF
    port map (
      I => sram1_dq_O(28),
      IO => sram1_dq(28),
      O => sram1_dq_I(28),
      T => sram1_dq_T(28)
    );

  iobuf_44 : IOBUF
    port map (
      I => sram1_dq_O(27),
      IO => sram1_dq(27),
      O => sram1_dq_I(27),
      T => sram1_dq_T(27)
    );

  iobuf_45 : IOBUF
    port map (
      I => sram1_dq_O(26),
      IO => sram1_dq(26),
      O => sram1_dq_I(26),
      T => sram1_dq_T(26)
    );

  iobuf_46 : IOBUF
    port map (
      I => sram1_dq_O(25),
      IO => sram1_dq(25),
      O => sram1_dq_I(25),
      T => sram1_dq_T(25)
    );

  iobuf_47 : IOBUF
    port map (
      I => sram1_dq_O(24),
      IO => sram1_dq(24),
      O => sram1_dq_I(24),
      T => sram1_dq_T(24)
    );

  iobuf_48 : IOBUF
    port map (
      I => sram1_dq_O(23),
      IO => sram1_dq(23),
      O => sram1_dq_I(23),
      T => sram1_dq_T(23)
    );

  iobuf_49 : IOBUF
    port map (
      I => sram1_dq_O(22),
      IO => sram1_dq(22),
      O => sram1_dq_I(22),
      T => sram1_dq_T(22)
    );

  iobuf_50 : IOBUF
    port map (
      I => sram1_dq_O(21),
      IO => sram1_dq(21),
      O => sram1_dq_I(21),
      T => sram1_dq_T(21)
    );

  iobuf_51 : IOBUF
    port map (
      I => sram1_dq_O(20),
      IO => sram1_dq(20),
      O => sram1_dq_I(20),
      T => sram1_dq_T(20)
    );

  iobuf_52 : IOBUF
    port map (
      I => sram1_dq_O(19),
      IO => sram1_dq(19),
      O => sram1_dq_I(19),
      T => sram1_dq_T(19)
    );

  iobuf_53 : IOBUF
    port map (
      I => sram1_dq_O(18),
      IO => sram1_dq(18),
      O => sram1_dq_I(18),
      T => sram1_dq_T(18)
    );

  iobuf_54 : IOBUF
    port map (
      I => sram1_dq_O(17),
      IO => sram1_dq(17),
      O => sram1_dq_I(17),
      T => sram1_dq_T(17)
    );

  iobuf_55 : IOBUF
    port map (
      I => sram1_dq_O(16),
      IO => sram1_dq(16),
      O => sram1_dq_I(16),
      T => sram1_dq_T(16)
    );

  iobuf_56 : IOBUF
    port map (
      I => sram1_dq_O(15),
      IO => sram1_dq(15),
      O => sram1_dq_I(15),
      T => sram1_dq_T(15)
    );

  iobuf_57 : IOBUF
    port map (
      I => sram1_dq_O(14),
      IO => sram1_dq(14),
      O => sram1_dq_I(14),
      T => sram1_dq_T(14)
    );

  iobuf_58 : IOBUF
    port map (
      I => sram1_dq_O(13),
      IO => sram1_dq(13),
      O => sram1_dq_I(13),
      T => sram1_dq_T(13)
    );

  iobuf_59 : IOBUF
    port map (
      I => sram1_dq_O(12),
      IO => sram1_dq(12),
      O => sram1_dq_I(12),
      T => sram1_dq_T(12)
    );

  iobuf_60 : IOBUF
    port map (
      I => sram1_dq_O(11),
      IO => sram1_dq(11),
      O => sram1_dq_I(11),
      T => sram1_dq_T(11)
    );

  iobuf_61 : IOBUF
    port map (
      I => sram1_dq_O(10),
      IO => sram1_dq(10),
      O => sram1_dq_I(10),
      T => sram1_dq_T(10)
    );

  iobuf_62 : IOBUF
    port map (
      I => sram1_dq_O(9),
      IO => sram1_dq(9),
      O => sram1_dq_I(9),
      T => sram1_dq_T(9)
    );

  iobuf_63 : IOBUF
    port map (
      I => sram1_dq_O(8),
      IO => sram1_dq(8),
      O => sram1_dq_I(8),
      T => sram1_dq_T(8)
    );

  iobuf_64 : IOBUF
    port map (
      I => sram1_dq_O(7),
      IO => sram1_dq(7),
      O => sram1_dq_I(7),
      T => sram1_dq_T(7)
    );

  iobuf_65 : IOBUF
    port map (
      I => sram1_dq_O(6),
      IO => sram1_dq(6),
      O => sram1_dq_I(6),
      T => sram1_dq_T(6)
    );

  iobuf_66 : IOBUF
    port map (
      I => sram1_dq_O(5),
      IO => sram1_dq(5),
      O => sram1_dq_I(5),
      T => sram1_dq_T(5)
    );

  iobuf_67 : IOBUF
    port map (
      I => sram1_dq_O(4),
      IO => sram1_dq(4),
      O => sram1_dq_I(4),
      T => sram1_dq_T(4)
    );

  iobuf_68 : IOBUF
    port map (
      I => sram1_dq_O(3),
      IO => sram1_dq(3),
      O => sram1_dq_I(3),
      T => sram1_dq_T(3)
    );

  iobuf_69 : IOBUF
    port map (
      I => sram1_dq_O(2),
      IO => sram1_dq(2),
      O => sram1_dq_I(2),
      T => sram1_dq_T(2)
    );

  iobuf_70 : IOBUF
    port map (
      I => sram1_dq_O(1),
      IO => sram1_dq(1),
      O => sram1_dq_I(1),
      T => sram1_dq_T(1)
    );

  iobuf_71 : IOBUF
    port map (
      I => sram1_dq_O(0),
      IO => sram1_dq(0),
      O => sram1_dq_I(0),
      T => sram1_dq_T(0)
    );

end architecture STRUCTURE;

