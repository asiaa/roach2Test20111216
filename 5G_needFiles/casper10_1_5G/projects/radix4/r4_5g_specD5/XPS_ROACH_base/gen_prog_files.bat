copy implementation\system.bit ..\bit_files\r4_5g_specD5_2010_Sep_02_1730.bit
mkbof.exe -o implementation\system.bof -s core_info.tab -t 3 implementation\system.bin
copy implementation\system.bof ..\bit_files\r4_5g_specD5_2010_Sep_02_1730.bof
