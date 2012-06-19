copy implementation\system.bit ..\bit_files\r4_iadc_spec_2010_Oct_01_0917.bit
mkbof.exe -o implementation\system.bof -s core_info.tab -t 3 implementation\system.bin
copy implementation\system.bof ..\bit_files\r4_iadc_spec_2010_Oct_01_0917.bof
