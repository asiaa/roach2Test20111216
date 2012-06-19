@ECHO OFF
@REM ###########################################
@REM # Script file to run the flow 
@REM # 
@REM ###########################################
@REM #
@REM # Command line for ngdbuild
@REM #
ngdbuild -p xc2vp50ff1152-7 -nt timestamp -bm system.bmm "D:/casper10_1/projects/packetized_correlator/ibob/i_128w_2k_10_r310iadc/XPS_iBOB_base/implementation/system.ngc" -uc system.ucf system.ngd 

@REM #
@REM # Command line for map
@REM #
map -timing -ol high -o system_map.ncd -pr b system.ngd system.pcf 

@REM #
@REM # Command line for par
@REM #
par -w -ol high system_map.ncd system.ncd system.pcf 

@REM #
@REM # Command line for post_par_trce
@REM #
trce -e 3 -xml system.twx system.ncd system.pcf 

