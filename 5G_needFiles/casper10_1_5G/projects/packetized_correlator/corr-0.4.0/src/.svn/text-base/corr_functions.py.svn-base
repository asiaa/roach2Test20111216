#! /usr/bin/env python
""" 
Seclection of commonly-used correlator control functions.

UNDER CONSTRUCTION

Author: Jason Manley\n
Revisions:\n
2009-12-14  JRM Changed snap_x to expect two kinds of snap block, original simple kind, and new one with circular capture, which should have certain additional registers (wr_since_trig).
2009-12-10  JRM Started adding SPEAD stuff.
2009-12-01  JRM Added check for loopback mux sync to, and fixed bugs in, loopback_check_mcnt.\n
                Changed all "check" functions to just return true/false for global system health. Some have "verbose" option to print more detailed errors.\n
                Added loopback_mux_rst to xeng_ctrl
2009-11-06  JRM Bugfix snap_x offset triggering.\n
2009-11-04  JRM Added ibob_eq_x.\n
2009-10-29  JRM Bugfix snap_x.\n
2009-06-26  JRM UNDER CONSTRUCTION.\n
\n

"""
import corr, time, sys, numpy, os, logging, katcp, stats, struct

class Correlator:
    def __init__(self, config_file,log_handler):
        self.config = corr.cn_conf.CorrConf(config_file)
        self.config.read_all()
        self.servers = [s['server'] for s in self.config['servers']]
        self.loggers=[logging.getLogger(s['server']) for s in self.config['servers']]
        for s,server in enumerate(self.servers): self.loggers[s].addHandler(log_handler)
        self.fpgas=[(corr.katcp_wrapper.FpgaClient(server['server'], server['port'], timeout=10,logger=self.loggers[s])) for s,server in enumerate(self.config['servers'])]
        #self.speadstream = spead.SpeadStream(self.config['rx_udp_ip_str'],self.config['rx_udp_port'],"corr_n","A packetised correlator SPEAD stream.")

    def __del__(self):
        self.disconnect_all()

    def disconnect_all(self):
        """Stop all TCP KATCP link to all FPGAs defined in the config file."""
        try:
            for fpga in self.fpgas: fpga.stop()
        except:
            pass

    def prog_all(self):
        """Programs all the FPGAs."""
        for fpga in self.fpgas:
            fpga.progdev(self.config['bitstream'])
            #time.sleep(4)

    def deprog_all(self):
        """Deprograms all the FPGAs."""
        for fpga in self.fpgas:
            fpga.progdev('')

    def write_int_all(self,register,value):
        """Writes to a 32-bit software register on all Xengines."""
        #TESTED OK
        for f,fpga in enumerate(self.fpgas):
            fpga.write_int(register,value)

    def write_all_ibobs(self,addr,data):
        """Writes a value to the IBOB through the Xengine, across XAUI.
        addr maps to the 32 MSbs of the XAUI link. 
        data maps to the 32 LSbs."""
        #WORKING 2009-07-01
        for i in range(self.config['n_xaui_ports_per_fpga']):
            self.write_int_all('ibob_addr%i'%i,(2**32)-1)
            self.write_int_all('ibob_data%i'%i,data)
            self.write_int_all('ibob_addr%i'%i,addr)

    def write_all_feng_ctrl(self,input_sel=0, use_sram_tvg=False, use_fft_tvg=False, arm_rst=False, sync_rst=False, fft_shift=(2**16)-1):
        """Writes a value to the ibob control registers connected to all BEEs."""
        #WORKING 2009-07-01
        value = input_sel<<20 | use_sram_tvg<<19 | use_fft_tvg<<18 | arm_rst<<17 | sync_rst<<16 | fft_shift
        return self.write_all_ibobs(addr=8192,data=value)

    def write_all_xeng_ctrl(self,loopback_mux_rst=False, gbe_disable=False, cnt_rst=False, gbe_rst=False, vacc_rst=False):
        """Writes a value to all the Xengine control registers."""
        #WORKING 2009-12-01
        value = loopback_mux_rst<<10 | gbe_disable<<9 | cnt_rst<<8 | gbe_rst<<15 | vacc_rst<<0
        self.write_int_all('ctrl',value)

    def read_all_xeng_ctrl(self):
        """Reads and decodes the values from all the Xengine control registers."""
        #WORKING 2009-07-02
        all_values = self.read_uint_all('ctrl')
        return [{'gbe_disable':bool(value&(1<<9)),
                'cnt_rst':bool(value&(1<<8)),
                'gbe_rst':bool(value&(1<<15)),
                'vacc_rst':bool(value&(1<<0))} for value in all_values]

    def arm(self):
        """Arms all F engines. Returns the time at which the system was sync'd (MCNT=0)"""
        #WORKING 2009-07-01
        #wait for within 100ms of a half-second, then send out the arm signal.
        ready=(int(time.time()*10)%5)==0
        while not ready: 
            ready=(int(time.time()*10)%5)==0
        trig_time=numpy.ceil(time.time()) #Good for PAPER ibob F engine rev 306. KAT will require a +1 second here.
        self.write_all_feng_ctrl(arm_rst=False)
        self.write_all_feng_ctrl(arm_rst=True)
        self.config['sync_time']=trig_time
        return trig_time

    def read_all(self,register,bram_size,offset=0):
        """Reads a register of specified size from all X engines. Returns a list."""
        #WORKING 2009-07-01
        rv = [fpga.read(register,bram_size,offset) for fpga in self.fpgas]
        return rv

    def read_uint_all(self, register):
        """Reads a value from register 'device' for all BEE FPGAs."""
        return [fpga.read_uint(register) for fpga in self.fpgas]

    def get_bee2_gbe_conf(port,start_addr,fpga):
        """Generates a 10GbE configuration string for BEE2s starting from 
        ip "start_addr" for FPGA numbered "FPGA" (offset from start addr)"""
        gbe_conf = """begin\n\tmac = 00:12:6D:AE:%02X:%02X\n\tip = %i.%i.%i.%i\n\tgateway = %i.%i.0.1\n\tport = %i\nend\n"""
    #+ chr(255)
        ip = start_addr + fpga
        ip_1 = (ip/(2**24))
        ip_2 = (ip%(2**24))/(2**16)
        ip_3 = (ip%(2**16))/(2**8)
        ip_4 = (ip%(2**8))
        return gbe_conf % (ip_3,ip_4,ip_1,ip_2,ip_3,ip_4,ip_1,ip_2,port)

    def get_roach_gbe_conf(self,start_addr,fpga,port):
        """Generates 10GbE configuration strings for ROACH-based xengines starting from 
        ip "start_addr" for FPGA numbered "FPGA" (offset from start addr).
        Returns a (mac,ip,port) tuple suitable for passing to tap_start."""
        sys.stdout.flush()
        ip = (start_addr + fpga) & ((1<<32)-1)
        mac = (2<<40) + (2<<32) + ip
        return (mac,ip,port)

    def rst_cnt(self):
        """Resets all error counters on the X engines."""
        self.write_all_xeng_ctrl(cnt_rst=False)
        self.write_all_xeng_ctrl(cnt_rst=True)

    def get_xeng_clks(self):
        """Returns the approximate clock rate of each X engine FPGA in MHz."""
        firstpass=self.read_uint_all('sys_clkcounter')
        time.sleep(2)
        secondpass=self.read_uint_all('sys_clkcounter')
        for f,s in enumerate(self.servers):
            if firstpass[f]>secondpass[f]:
                secondpass[f]=secondpass[f]+(2**32)
        return [(secondpass[f]-firstpass[f])/2000000 for f,s in enumerate(self.servers)]

    def check_katcp_connections(self):
        """ Returns a list showing the result of a KATCP watchdog ping to each X engine."""
        result = []
        for fpga in self.fpgas:
            try:
                result.append(fpga.ping())
            except:
                result.append(False)
        return result

    def check_x_miss(self):
        """Returns boolean pass/fail to indicate if any X engine has missed any data, or if the descrambler is stalled."""
        #WORKING OK 2009-12-01
        rv = True
        for x in range(self.config['x_per_fpga']):
            err_check = self.read_uint_all('pkt_reord_err%i'%(x))
            cnt_check = self.read_uint_all('pkt_reord_cnt%i'%(x))
            for f,fpga in enumerate(self.fpgas):
                if (err_check[f] !=0) or (cnt_check[f] == 0) :
                    rv=False
        return rv

    def check_xaui_error(self,verbose=False):
        """Returns a boolean indicating if any X engines have bad incomming XAUI links.
        Checks that data is flowing and that no errors have occured."""
        #WORKING OK 2009-12-01
        rv = True
        for x in range(self.config['n_xaui_ports_per_fpga']):
            cnt_check = self.read_uint_all('xaui_cnt%i'%(x))
            err_check = self.read_uint_all('xaui_err%i'%x)
            for f,fpga in enumerate(self.fpgas):
                if (err_check[f] !=0) or (cnt_check[f] == 0):
                    if verbose: print 'Missing X engine data on %s, x engine %i.'%(self.servers[f],x)
                    rv=False
        return rv

    def check_10gbe_tx(self,verbose=False):
        """Checks that the 10GbE cores are transmitting data. Outputs boolean good/bad."""
        #WORKING OK 2009-12-01
        rv=True
        for x in range(self.config['n_xaui_ports_per_fpga']):
            firstpass_check = self.read_uint_all('gbe_tx_cnt%i'%x)
            time.sleep(0.01)
            secondpass_check = self.read_uint_all('gbe_tx_cnt%i'%x)

            for f,fpga in enumerate(self.fpgas):
                if (secondpass_check[f] == 0) or (secondpass_check[f] == firstpass_check[f]):
                    if verbose: print '10GbE core %i on %s is stalled.'%(x,self.servers[f])
                    rv = False
        return rv

    def check_10gbe_rx(self,verbose=False):
        """Checks that all the 10GbE cores are receiving packets."""
        #WORKING OK 2009-12-01
        rv=True
        for x in range(min(self.config['n_xaui_ports_per_fpga'],self.config['x_per_fpga'])):
            firstpass_check = self.read_uint_all('gbe_rx_cnt%i'%x)
            time.sleep(0.01)
            secondpass_check = self.read_uint_all('gbe_rx_cnt%i'%x)
            for f,fpga in enumerate(self.fpgas):
                if (secondpass_check[f] == 0):
                    rv=False
                    if (verbose): print('\tFAILURE! 10GbE core %i on %s is not receiving any packets.' %(x,self.servers[f]))
                elif (secondpass_check[f] == firstpass_check[f]):
                    rv=False
                    if (verbose): print('\tFAILURE! 10GbE core %i on %s received %i packets, but then stopped.'%(x,self.servers[f],secondpass_check[f]))
        return rv

    def check_loopback_mcnt(self,verbose=False):
        """Checks to see if the mux_pkts block has become stuck waiting for a crazy mcnt Returns boolean true/false."""
        #TESTED WORKING 2009-12-01.
        rv=True
        for x in range(min(self.config['n_xaui_ports_per_fpga'],self.config['x_per_fpga'])):
            firstpass_check = self.read_all('loopback_mux%i_mcnt'%x,4)
            time.sleep(0.01)
            secondpass_check = self.read_all('loopback_mux%i_mcnt'%x,4)
            for f,fpga in enumerate(self.fpgas):
                firstloopmcnt,firstgbemcnt=struct.unpack('>HH',firstpass_check[f])
                secondloopmcnt,secondgbemcnt=struct.unpack('>HH',secondpass_check[f])
                if abs(secondloopmcnt - secondgbemcnt) > (self.config['x_per_fpga']*len(self.fpgas)): 
                    rv=False
                    if verbose: print('FAILURE! Loopback mux on %s GbE port %i is not syncd.' %(self.servers[f],x))

                if (secondloopmcnt == firstloopmcnt):
                    if verbose: print('FAILURE! Loopback on %s GbE port %i is stalled.' %(self.servers[f],x))
                    rv = False

                if (secondgbemcnt == firstgbemcnt):
                    if verbose: print('FAILURE! 10GbE input on %s GbE port %i is stalled.' %(self.servers[f],x))
                    rv = False
        return rv

    def attempt_fix(self,n_retries=1):
        """Try to fix (sync) the system. If n_retries is <0, retry forever. Otherwise, retry for n_retries."""
        while(1):
            if self.check_all(): return True
            elif n_retries == 0: return False
            #Attempt resync:
            self.arm()
            time.sleep(4)
            rst_cnt()
            time.sleep(2)
            if n_retries > 0:
                n_retries -= 1
                #print ' Retries remaining: %i'%n_retries


    def check_all(self):
        if (self.check_x_miss() and self.check_loopback_mcnt() and self.check_xaui_error()):
            return True
        else:
            return False


    def sel_xeng_tvg(self,mode=0, user_values=()):
        """Select Xengine TVG. Disables VACC (and other) TVGs in the process. Mode can be:
            0: no TVG selected.
            1: select 4-bit counters. Real components count up, imaginary components count down. Bot polarisations have equal values.
            2: Fixed numbers: Pol0real=0.125, Pol0imag=-0.75, Pol1real=0.5, Pol1imag=-0.2
            3: User-defined input values. Should be 8 values, passed as tuple in user_value."""

        if mode>4 or mode<0:
            raise RuntimeError("Invalid mode selection. Mode must be in range(0,4).")
        else:
            self.write_int_all('tvg_sel',mode<<3) 

        if mode==3:
            for i,v in enumerate(user_val):
                for xeng in self.config['x_per_fpga']:
                    self.write_int_all('xeng_tvg%i_tv%i'%(xeng,i),v)

    def set_acc_len(self,acc_len=-1):
        """Set the Accumulation Length (in # of spectrum accumulations). If not specified, get the config from the config file."""
        if acc_len<0: acc_len=self.config['acc_len']
        self.write_int_all('acc_len', acc_len)

    def set_ant_index(self):
        """Sets the boards' antenna indices number them."""
        ant = 0
        for x in range(self.config['n_xaui_ports_per_fpga']):
            for f,fpga in enumerate(self.fpgas):
                fpga.write_int('base_ant%i'%x, ant)
                ant += n_ants_per_xaui

    def set_udp_exchange_port(self):
        """Set the UDP TX port for internal correlator data exchange."""
        self.write_int_all('gbe_port', data_port)

    def set_udp_exchange_ip(self):
        """Assign an IP address to each XAUI port."""
        for xaui in range(self.config['n_xaui_ports_per_fpga']):
            for f,fpga in enumerate(self.fpgas):
                ip = gbe_start_ip + f + xaui*(len(fpgas))
                fpga.write_int('gbe_ip%i'%xaui, ip)

    def config_roach_10gbe_ports(self):
        """Configures 10GbE ports on roach X engines for correlator data exchange."""
        arp_table=[(2**48)-1 for i in range(256)]
        for f,fpga in enumerate(self.fpgas):
            for x in range(self.config['n_xaui_ports_per_fpga']):
                start_addr=self.config['10gbe_ip']
                start_port=self.config['10gbe_port']
                mac,ip,port=self.get_roach_gbe_conf(start_addr,(f*self.config['n_xaui_ports_per_fpga']+x),start_port)

                fpga.tap_start('gbe%i'%x,mac,ip,port)

                #tgtap is broken. The following four lines are a workaround. let's hard-code the cores for now...
        #        arp_table[ip%256]=mac
        ##for f,fpga in enumerate(self.fpgas):
        #    for x in range(self.config['n_xaui_ports_per_fpga']):
        #        mac,ip,port=self.get_roach_gbe_conf(start_addr,(f*self.config['n_xaui_ports_per_fpga']+x),start_port)
        #        fpga.config_10gbe_core('gbe%i'%x,mac,ip,port,arp_table)
                
    def config_udp_output(self):
        self.write_int_all('gbe_out_ip_addr',self.config['rx_udp_ip'])
        self.write_int_all('gbe_out_port',self.config['rx_udp_port'])
        self.write_int_all('gbe_out_pkt_len',self.config['rx_pkt_payload_len'])
        self.write_int_all('instance_id',0) #hardcode this for now... we only have one correlator running at a time.
        for x in range(self.config['x_per_fpga']):
            for f,fpga in enumerate(self.fpgas):
                fpga.write_int('xeng_id%i'%x,x*len(self.fpgas)+f)
        
        def deconfig_roach_10gbe_ports(self):
            """Stops tgtap drivers."""
            for f,fpga in enumerate(self.fpgas):
                for x in range(self.config['n_xaui_ports_per_fpga']):
                    fpga.tap_stop('gbe%i'%x)

    def snap_x(self,dev_name,brams,man_trig=False,man_valid=False,wait_period=1,offset=-1,circular_capture=False):
        """Triggers and retrieves data from the a snap block device on all the X engines. Depending on the hardware capabilities, it can optionally capture with an offset. The actual captured length and starting offset is returned with the dictionary of data for each FPGA (useful if you've done a circular capture and can't calculate this yourself).\n
        \tdev_name: string, name of the snap block.\n
        \tman_trig: boolean, Trigger the snap block manually.\n
        \toffset: integer, wait this number of valids before beginning capture. Set to negative value if your hardware doesn't support this or the circular capture function.\n
        \tcircular_capture: boolean, Enable the circular capture function.\n
        \twait_period: integer, wait this number of seconds between triggering and trying to read-back the data.\n
        \tbrams: list, names of the bram components.\n
        \tRETURNS: dictionary with keywords: \n
        \t\tlengths: list of integers matching number of valids captured off each fpga.\n
        \t\toffset: optional (depending on snap block version) list of number of valids elapsed since last trigger on each fpga.
        \t\t{brams}: list of data from each fpga for corresponding bram.\n
        """
        #2009-12-14: Expect wr_since_trig register now if not simple snap block.
        #2009-11-09: Added circular capturing.
        #2009-11-06. Fix to offset triggering.
        if offset >= 0:
            self.write_int_all(dev_name+'_trig_offset',offset)
            #print 'Capturing from snap offset %i'%offset

        #print 'Triggering Capture...',
        self.write_int_all(dev_name+'_ctrl',(0 + (man_trig<<1) + (man_valid<<2) + (circular_capture<<3)))
        self.write_int_all(dev_name+'_ctrl',(1 + (man_trig<<1) + (man_valid<<2) + (circular_capture<<3)))

        done=False
        start_time=time.time()
        while not done and ((time.time()-start_time)<wait_period): 
            addr= self.read_uint_all(dev_name+'_addr')
            done_list=[bool(i & 0x80000000) for i in addr]
            if (done_list == [True for i in self.servers]):
                done=True
        bram_sizes=[i&0x7fffffff for i in self.read_uint_all(dev_name+'_addr')]
        bram_dmp={'lengths':numpy.add(bram_sizes,1)}
        bram_dmp['offsets']=[0 for f in self.fpgas]
        #print 'Addr+1:',bram_dmp['lengths']
        for f,fpga in enumerate(self.fpgas):
            if (bram_sizes[f] != fpga.read_uint(dev_name+'_addr')&0x7fffffff) or bram_sizes[f]==0:
                #if address is still changing, then the snap block didn't finish capturing. we return empty.  
                print "Looks like snap block on %s didn't finish."%self.servers[f]
                bram_dmp['lengths'][f]=0
                bram_dmp['offsets'][f]=0
                bram_sizes[f]=0

        if circular_capture or (offset>=0):
            bram_dmp['offsets']=numpy.subtract(numpy.add(self.read_uint_all(dev_name+'_wr_since_trig'),offset),bram_dmp['lengths'])
            print 'Wr since trig:',self.read_uint_all(dev_name+'_wr_since_trig')
            print 'offsets:',bram_dmp['offsets']
        else: bram_dmp['offsets']=[0 for f in self.fpgas]
    
        for f,fpga in enumerate(self.fpgas):
            if (bram_dmp['offsets'][f] < 0):  
                raise RuntimeError('SNAP block hardware or logic failure happened. Returning no data.')
            #if offset<0, there was a big error. this should never happen. unless you held stop high while resetting before inputting valid data during a circular capture? In any case, zero the output.
                bram_dmp['lengths'][f]=0
                bram_dmp['offsets'][f]=0
                bram_sizes[f]=0

        for b,bram in enumerate(brams):
            bram_path = dev_name+'_'+bram
            bram_dmp[bram]=[]
            for f,fpga in enumerate(self.fpgas):
                if (bram_sizes[f] == 0): 
                    bram_dmp[bram].append([])
                else: 
                    bram_dmp[bram].append(fpga.read(bram_path,(bram_sizes[f]+1)*4))
        return bram_dmp

    def snap_x_single(self,fpga,dev_name,brams,man_trig=False,man_valid=False,wait_period=1,offset=-1):
        """Grabs from a single X engine board in the system, brams from device.\n
        \tfpga: katcp_wrapper.fpga object from which to grab snapshot data.\n
        \tdev_name: string, name of the snap block.\n
        \tman_trig: boolean, Trigger the snap block manually.\n
        \toffset: integer, wait this number of valids before beginning capture.\n
        \twait_period: integer, wait this number of seconds between triggering and trying to read-back the data.\n
        \tbrams: list, names of the bram components."""
        #WORKING OK 2009-07-01
        if offset >= 0:
            self.write_int_all(dev_name+'_trig_offset',offset)
            #print 'Capturing from snap offset %i'%offset

        #print 'Triggering Capture...',
        fpga.write_int(dev_name+'_ctrl',(0 + (man_trig<<1) + (man_valid<<2)))
        fpga.write_int(dev_name+'_ctrl',(1 + (man_trig<<1) + (man_valid<<2)))

        time.sleep(wait_period)

        bram_size=fpga.read_uint(dev_name+'_addr')
        bram_dmp=dict()
        for b,bram in enumerate(brams):
            bram_path = dev_name+'_'+bram
            if (bram_size == 0): bram_dmp[bram]=[]
            else: 
                bram_dmp[bram]=(fpga.read(bram_path,(bram_size+1)*4))
        return bram_dmp

    def check_xaui_sync(self,verbose=False):
        """Checks if all F engines are in sync by examining mcnts at sync of incomming XAUI streams. \n
        If this test passes, it does not gaurantee that the system is indeed sync'd,
         merely that the F engines were reset between the same 1PPS pulses.
        Returns boolean true/false if system is in sync.
        """
        #WORKING OK 2009-07-01
        max_mcnt_difference=4
        mcnts=dict()
        mcnts_list=[]
        mcnt_tot=0
        rv=True

        for f,fpga in enumerate(self.fpgas):
            for x in range(self.config['n_xaui_ports_per_fpga']):
                n_xaui=f*self.config['n_xaui_ports_per_fpga']+x
                mcnts[n_xaui]=dict()
                mcnts[n_xaui]['mcnt'] =fpga.read_uint('xaui_sync_mcnt%i'%x)
                mcnts_list.append(mcnts[n_xaui]['mcnt'])

#        mcnts['mean']=stats.mean(mcnts_list)
#        mcnts['median']=stats.median(mcnts_list)
        mcnts['mode']=stats.mode(mcnts_list)
        if mcnts['mode']==0:
            raise RuntimeError("Too many XAUI links are receiving no data. Unable to produce a reliable result.")
        mcnts['modalmean']=stats.mean(mcnts['mode'][1])

    #    print 'mean: %i, median: %i, modal mean: %i mode:'%(mcnts['mean'],mcnts['median'],mcnts['modalmean']),mcnts['mode']

        for f,fpga in enumerate(self.fpgas):
            for x in range(self.config['n_xaui_ports_per_fpga']):
                n_xaui=f*self.config['n_xaui_ports_per_fpga']+x
                if mcnts[n_xaui]['mcnt']>(mcnts['modalmean']+max_mcnt_difference) or mcnts[n_xaui]['mcnt'] < (mcnts['modalmean']-max_mcnt_difference):
                    rv=False
                    if verbose: print 'Sync check failed on %s, port %i with error of %i.'%(self.servers[f],x,mcnts[n_xaui]['mcnt']-mcnts['modalmean'])
        return rv

    def ibob_eq_init(self,verbose_level=0,init_coeffs=[]):
        """Initialise all connected ibobs' EQs to given polynomial. If no polynomial is given, use defaults from config file."""
        #WORKING OK 2009-07-01
        for fn,fpga in enumerate(self.fpgas):
            for xaui in range(self.config['n_xaui_ports_per_fpga']):
                for ibob_ant in range(self.config['n_ants_per_xaui']):
                    for pol in ['x','y']:
                        self.ibob_eq_set(fn,xaui,ibob_ant,pol,verbose_level=verbose_level,init_coeffs=init_coeffs)

    def ibob_eq_set(self,fpga_n,xaui,ibob_ant,pol,verbose_level=0,init_coeffs=[]):
        """Set a given antenna's polarisation equaliser to given co-efficients. pol is 'x' or 'y'. ibob_ant is range n_ants_per_xaui. fpga_n and xaui are integers. """
        #Tested working 2009-11-04
        fpga=self.fpgas[fpga_n]
        fn=fpga_n
        ant=xaui*(len(self.fpgas)*self.config['n_ants_per_xaui'])+fn*self.config['n_ants_per_xaui']+ibob_ant
        pol_n = {'x':0,'y':1}[pol]
        if init_coeffs == []: coeffs = self.config['eq']['eq_poly_%i%c'%(ant,pol)]
        else: coeffs=init_coeffs
        equalization = numpy.polyval(coeffs, range(self.config['n_chans']))[self.config['eq_decimation']/2::self.config['eq_decimation']]
        start_addr=((2*ibob_ant + pol_n)*self.config['n_chans']/self.config['eq_decimation']) 
        if verbose_level>0:
            print '''Initialising EQ for antenna %i, polarisation %c on %s's XAUI %i (addr %i) to'''%(ant,pol,self.servers[fn],xaui,start_addr),
            for term,coeff in enumerate(coeffs):
                if term==(len(coeffs)-1): print '%i...'%(coeff),
                else: print '%ix^%i +'%(coeff,len(coeffs)-term-1),
                sys.stdout.flush()
            print ''
        fpga.write_int('ibob_addr%i'%(xaui),(2**32)-1)
        for chan, gain in enumerate(equalization):
            if (verbose_level > 1):
                print 'Setting EQ at %i to %f'%(chan+start_addr,int(gain))
            fpga.write_int('ibob_data%i'%(xaui),int(gain))
            fpga.write_int('ibob_addr%i'%(xaui),(chan+start_addr))

    def issue_spead_metadata(self):
        """ Issues the SPEAD metadata packets containing the payload and options descriptors and unpack sequences."""

        n_chans_descriptor = spead.SpeadDescriptor("n_chans","The total number of frequency channels present in any integration.")
        n_chans_descriptor.add_unpack_type('uint48','u',48)
        n_chans_descriptor.set_unpack_list(['uint48'])
        n_chans = spead.SpeadOption(9, self.config['n_chans'], n_chans_descriptor)
        # create a frequency count descriptor and option

        n_bls_descriptor = spead.SpeadDescriptor("n_bls","The total number of baselines in the data product.")
        n_bls_descriptor.add_unpack_type('uint48','u',48)
        n_bls_descriptor.set_unpack_list(['uint48'])
        n_bls = spead.SpeadOption(11, self.config['n_bls'], n_bls_descriptor)
         # create a baseline count descriptor and option

        n_ants_descriptor = spead.SpeadDescriptor("n_ants","The total number of antennas in the system.")
        n_ants_descriptor.add_unpack_type('uint48','u',48)
        n_ants_descriptor.set_unpack_list(['uint48'])
        n_ants = spead.SpeadOption(10, self.config['n_ants'], n_ants_descriptor)

        sync_time_descriptor = spead.SpeadDescriptor("sync_time","The time at which the system was last sync'd in seconds since UNIX Epoch.")
        sync_time_descriptor.add_unpack_type('uint48','u',48)
        sync_time_descriptor.set_unpack_list(['uint48'])
        sync_time = spead.SpeadOption(15, self.config['sync_time'], sync_time_descriptor)

        center_freq_descriptor = spead.SpeadDescriptor("center_freq","The center frequency of the DBE in Hz.")
        center_freq_descriptor.add_unpack_type('uint48','u',48)
        center_freq_descriptor.set_unpack_list(['uint48'])
        center_freq = spead.SpeadOption(17, self.config['center_freq'], center_freq_descriptor)
       
        bandwidth_descriptor = spead.SpeadDescriptor("bandwidth","The analogue bandwidth of the digitally processed signal in Hz.")
        bandwidth_descriptor.add_unpack_type('uint48','u',48)
        bandwidth_descriptor.set_unpack_list(['uint48'])
        bandwidth = spead.SpeadOption(19, self.config['bandwidth'], bandwidth_descriptor)

        n_accs_descriptor = spead.SpeadDescriptor("n_accs","The number of spectra that are accumulated per integration.")
        n_accs_descriptor.add_unpack_type('uint48','u',48)
        n_accs_descriptor.set_unpack_list(['uint48'])
        n_accs = spead.SpeadOption(21, self.config['acc_len']*self.config['xeng_acc_len'], n_accs_descriptor)

        #how to do quantisation scalars? 

        fft_shift_descriptor = spead.SpeadDescriptor("fft_shift","The FFT bitshift pattern. F-engine correlator internals.")
        fft_shift_descriptor.add_unpack_type('uint48','u',48)
        fft_shift_descriptor.set_unpack_list(['uint48'])
        fft_shift = spead.SpeadOption(30, self.config['fft_shift'], fft_shift_descriptor)

        xeng_acc_len_descriptor = spead.SpeadDescriptor("xeng_acc_len","Number of spectra accumulated inside X engine. Determines minimum integration time and user-configurable integration time stepsize. X-engine correlator internals.")
        xeng_acc_len_descriptor.add_unpack_type('uint48','u',48)
        xeng_acc_len_descriptor.set_unpack_list(['uint48'])
        xeng_acc_len = spead.SpeadOption(31, self.config['xeng_acc_len'], xeng_acc_len_descriptor)

        requant_bits_descriptor = spead.SpeadDescriptor("requant_bits","Number of bits after requantisation, before any accumulation.")
        requant_bits_descriptor.add_unpack_type('uint48','u',48)
        requant_bits_descriptor.set_unpack_list(['uint48'])
        requant_bits = spead.SpeadOption(32, self.config['feng_bits'], requant_bits_descriptor)

        feng_pkt_len_descriptor = spead.SpeadDescriptor("feng_pkt_len","Payload size of 10GbE packet exchange between F and X engines in 64 bit words. Usually equal to the number of spectra accumulated inside X engine. F-engine correlator internals.")
        feng_pkt_len_descriptor.add_unpack_type('uint48','u',48)
        feng_pkt_len_descriptor.set_unpack_list(['uint48'])
        feng_pkt_len = spead.SpeadOption(33, self.config['10gbe_pkt_len'], xeng_acc_len_descriptor)

#INCOMPLETE!!!!!!!!!!!!!!!

        complex = spead.SpeadDescriptor("complex","A complex data type that holds two signed 32-bit integers")
        complex.add_unpack_type("int32",'i',32)
        complex.set_unpack_list(['int32','int32'])
         # create a complex data type

        pol = spead.SpeadDescriptor("pol","Holds the four polarisation products for a single baseline")
        pol.add_unpack_type('complex','0',complex)
        pol.set_unpack_list(['complex'])
        pol.set_count('0',4)
         # create a polarisation type

        baseline = spead.SpeadDescriptor("baseline","The baselines for a particular frequency channel.")
        baseline.add_unpack_type('pol','0',pol)
        baseline.set_unpack_list(['pol'])
        baseline.set_count('1',n_bls)
         # create a baseline type

        freq = spead.SpeadDescriptor("frequency","A frequency channels for a complete integration.")
        freq.add_unpack_type('baseline','0',baseline)
        freq.set_unpack_list(['baseline'])
        freq.set_count('1',n_chans)
         # create a frequency type

        s.set_payload_descriptor(freq)
         # set the top level data type
        s.add_meta_option(n_chans)
        s.add_meta_option(n_bls)
        s.add_meta_option(n_ants)
         # add the options that will be sent in the meta packet
         # at least the options referenced in the payload descriptor must be present
        s.compile()
         # sorts out inheritence issues and checks for consistency of the payload and option formats

        s.build_payload_meta_packet()
        s.build_option_meta_packet()
        s.build_start_packet()
        s.build_stop_packet()
         # build the various packets. A stream has the following sequence:
         # 1) Meta data packet containig the payload descriptors
         # 2) Meta data packet containing the option descriptors
         # 3) Meta data packet starting the stream (also contains the options)
         # 4 - n-1) Data packets (payload + data options)
         # n) Stop packet

        s.start_stream()
         # send the first three packets
        s.send_data(v)
        s.send_data(v)
         # send some data
         
