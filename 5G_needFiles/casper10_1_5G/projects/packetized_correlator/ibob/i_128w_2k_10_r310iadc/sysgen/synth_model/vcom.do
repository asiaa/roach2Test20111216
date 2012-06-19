-- If you see error messages concerning missing libraries for
-- XilinxCoreLib, unisims, or simprims, you may not have set
-- up your ModelSim environment correctly.  See the Xilinx
-- Support Website for instructions telling how to compile
-- these libraries.

vlib work

vcom  -nowarn 1 -novopt i_128w_2k_10_r310iadc.vhd
vcom  -nowarn 1 -novopt i_128w_2k_10_r310iadc_cw.vhd
