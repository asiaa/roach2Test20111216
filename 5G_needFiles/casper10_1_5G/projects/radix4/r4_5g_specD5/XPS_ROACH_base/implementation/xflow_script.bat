@ECHO OFF
@REM ###########################################
@REM # Script file to run the flow 
@REM # 
@REM ###########################################
@REM #
@REM # Command line for ngdbuild
@REM #
ngdbuild -p xc5vsx95tff1136-1 -nt timestamp -uc system.ucf "D:/casper10_1/projects/radix4/r4_5g_specD5/XPS_ROACH_base/implementation/system.ngc" system.ngd 

@REM #
@REM # Command line for map
@REM #
map -timing -ol high -xe n -register_duplication -o system_map.ncd -w -pr b system.ngd system.pcf 

@REM #
@REM # Command line for par
@REM #
par -xe n -w -ol high system_map.ncd system.ncd system.pcf 

@REM #
@REM # Command line for post_par_trce
@REM #
trce -e 200 -xml system.twx system.ncd system.pcf 

