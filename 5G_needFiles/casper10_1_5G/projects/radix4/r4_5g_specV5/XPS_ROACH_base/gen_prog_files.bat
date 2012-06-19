copy implementation\system.bit ..\bit_files\r4_5g_specV5_2010_Sep_01_1640.bit
mkbof.exe -o implementation\system.bof -s core_info.tab -t 3 implementation\system.bin
copy implementation\system.bof ..\bit_files\r4_5g_specV5_2010_Sep_01_1640.bof
