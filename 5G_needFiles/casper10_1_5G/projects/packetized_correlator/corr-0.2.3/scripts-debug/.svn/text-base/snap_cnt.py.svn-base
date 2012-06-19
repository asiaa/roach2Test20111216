#! /usr/bin/env python
import corr.borph,sys
if not sys.argv[1]:
    print 'Please specify a BEE'
    exit()
targetbee=sys.argv[1];

def format(data, chunks=4):
    rv = []
    hexstr = lambda x: ('00' + hex(ord(x))[2:])[-2:]
    for i in range(0, len(data), chunks):
        rv.append(''.join(map(hexstr, data[i:i+chunks])))
    return rv

for f in ['FPGA0', 'FPGA1', 'FPGA2', 'FPGA3']:
    conn = corr.borph.BorphClient(targetbee,9999)
    print conn.write('snap_cnt_ctrl', 1, fpgas=f)
    print conn.write('snap_cnt_ctrl', 0, fpgas=f)
    print 
    data = conn.binary_read('snap_cnt_bram', num=-1, fpgas=f)[f]['data']
    antennas=[]
    highest_ant=0

    for i in range(0,len(data),4):
        antennas.append(ord(data[i+2]))
        if ord(data[i+2]) > highest_ant:
            highest_ant=ord(data[i+2])
        print 'mcnt: %04x, Antenna: %03i, data: %02x'%((ord(data[i])*256 + ord(data[i+1])), ord(data[i+2]), ord(data[i+3]))

    for i in range(0,highest_ant+1):
        print 'Number of packets received from antenna %i: %i'%(i,antennas.count(i))

    data = format(data)[:-1]
    cnts = {}
    for i, d in enumerate(data):
#        print d
        k = d[:-4]
        try:
            cnt, min, max = cnts[k]
            if i < min: cnts[k] = (cnt+1, i, max)
            elif i > max: cnts[k] = (cnt+1, min, i)
            else: cnts[k] = (cnt+1, min, max)
        except: cnts[k] = (1, i, i)

    keys = cnts.keys()
    keys.sort()
    max_sep = 0
    for k in keys:
        cnt, min, max = cnts[k]
        sep = max - min
        if cnt == 16 and sep > max_sep: max_sep = sep
        print k, ':', cnt, sep, max, min
    print max_sep
