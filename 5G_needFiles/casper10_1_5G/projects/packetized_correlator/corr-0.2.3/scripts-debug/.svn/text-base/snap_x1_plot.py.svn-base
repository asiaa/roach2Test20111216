#!/usr/bin/env python
import corr.borph,sys, time, numpy, pylab, struct,pylab
if not sys.argv[1:]:
    print 'Please specify BORPHserver'
    exit()

b= corr.borph.BorphClient(sys.argv[1],9999)
print ('Capturing...'),
b.write('snap_x1_ctrl',0)
print b.write('snap_x1_ctrl',1)['FPGA0']['status']
time.sleep(2)
print ('Retrieving...')

x1_dmp=b.binary_read('snap_x1_bram',-1)

x1_data=dict()

print 'Unpacking data and verifying that no packets were lost during this dump...'
for f in ['FPGA0','FPGA1','FPGA2','FPGA3']:
    x1_data[f]=[]
    for i in range(0,len(x1_dmp['FPGA0']['data']),4):
        x1_data[f].append(struct.unpack('h', x1_dmp[f]['data'][i+2:i+4])[0])
        if (((x1_dmp[f]['data'][i:i+4]) and (1<<17)) != 131072):
            print 'Failed at index %i for %s'%(i,f)
print 'Done checking'


print 'Plotting...FPGA0...',
ax1 = pylab.subplot(411)
# Make this axis invisible (to share with the one below it)
pylab.setp(ax1.get_xticklabels(), visible=False)
pylab.xlim(0,2**12)
pylab.plot(x1_data['FPGA0'])
pylab.setp(ax1.get_xticklabels(), visible=False)
pylab.ylabel('Amplitude')
pylab.title('FPGA0')
pylab.grid()

print 'FPGA1...',        
# Share the x axis with plot above it
pylab.subplot(412, sharex=ax1)
pylab.title('FPGA1')
pylab.plot(x1_data['FPGA1'])
pylab.xlim(0,2**12)
pylab.ylabel('Amplitude')
pylab.grid()

print 'FPGA2...',        
# Share the x axis with plot above it
pylab.subplot(413, sharex=ax1)
pylab.title('FPGA2')
pylab.plot(x1_data['FPGA2'])
pylab.xlim(0,2**12)
pylab.ylabel('Amplitude')
pylab.grid()

print 'FPGA3...',        
# Share the x axis with plot above it
pylab.subplot(414, sharex=ax1)
pylab.title('FPGA3')
pylab.plot(x1_data['FPGA3'])
pylab.xlim(0,2**12)
pylab.ylabel('Amplitude')
pylab.grid()


pylab.show()
