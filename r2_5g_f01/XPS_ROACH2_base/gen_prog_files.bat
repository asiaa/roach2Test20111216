copy implementation\system.bit ..\bit_files\r2_5g_f01_2011_Dec_13_2057.bit
mkbof.exe -o implementation\system.bof -s core_info.tab -t 3 implementation\system.bin
copy implementation\system.bof ..\bit_files\r2_5g_f01_2011_Dec_13_2057.bof
