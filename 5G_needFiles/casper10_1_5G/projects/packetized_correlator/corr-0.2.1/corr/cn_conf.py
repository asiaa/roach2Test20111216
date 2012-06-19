import ConfigParser,exceptions

LISTDELIMIT = ','
PORTDELIMIT = ':'



def tokenise(inputstring, delimiter):
    startindex=0
    output=[]
    for i in range(len(inputstring)):
        if inputstring[i] == delimiter:
            output.append(inputstring[startindex:i])
            startindex=i+1
    #get the last one:
    if startindex != i+1:
        output.append(inputstring[startindex:i+1])
    return output


class CorrConf:    
    def __init__(self, config_file, mode='r'):
        #corr_conf=dict()
        self.config_file=config_file
        self.cp = ConfigParser.ConfigParser()
        self.cp.read(config_file)
        self.config=dict()
        if mode=='r': self.read_all()

    def __getitem__(self,item):
        return self.config[item]

    def file_exists(self):
        try:
            file = open(self.config_file)
        except IOError:
            exists = False
        else:
            exists = True
            file.close()
        return exists

    def read_all(self):
        if not self.file_exists():
            return 'ERR: Config file not found'

        #Get the servers:
        self.config['servers']=[]
        try:
            serverstr= self.cp.get('borphserver','servers')
        except ConfigParser.NoOptionError:
            return 'ERR: %s not found'%'servers'
        except exceptions.ValueError:
            return 'ERR: value %s'%'servers'
        except ConfigParser.NoSectionError:
            return 'ERR: %s section not found'%'borphserver'
        except:
            return 'ERR: %s section'%'borphserver'

        #print 'got serverstring ',serverstr
        server_port_strings = tokenise(serverstr,LISTDELIMIT)
        self.servers=[]
        for i in range(len(server_port_strings)):
            tokens_out = tokenise(server_port_strings[i],PORTDELIMIT)
            if len(tokens_out)==2:
                self.config['servers'].append({'server':tokens_out[0]})                
                self.config['servers'][i].update({'port':int(tokens_out[1])})
            else:
                return 'ERR: serverlist'

        try:
            self.config['timeserver'] = self.cp.get('borphserver','timeserver')
        except ConfigParser.NoOptionError:
            return 'ERR: %s not found'%'timeserver'
        except exceptions.ValueError:
            return 'ERR: value %s'%'timeserver'
        except:
            return 'ERR: %s section'%'borphserver'


        #get the correlator config stuff:
        try:
            self.config['correlator']=dict()
            self.read_int('correlator','n_chans')
            self.read_int('correlator','n_ants')
            self.read_str('correlator','fft_shift')
            self.read_int('correlator','acc_len')
            self.read_float('correlator','adc_clk')
            self.read_int('correlator','n_stokes')
            self.read_int('correlator','x_per_fpga')
            self.read_int('correlator','clk_per_sync')
            self.read_int('correlator','xeng_acc_len')
            self.read_float('correlator','ddc_mix_freq')
            self.read_int('correlator','ddc_decimation')
            self.read_int('correlator','10gbe_port')
            self.read_int('correlator','10gbe_ip')
            self.read_int('correlator','feng_bits')
            self.read_int('correlator','feng_fix_pnt_pos')
        except:
            return 'ERR Processing the correlator section'
                
        #get the receiver section:
        try:
            self.config['receiver']=dict()
            self.read_int('receiver','t_per_file')
            self.read_str('receiver','db_file')
            self.read_int('receiver','max_payload_len')
            self.read_int('receiver','udp_port')
        except:
            return 'ERR Processing the receiver section'

        # get the antenna info:
        self.config['antennas']=dict()
        self.config['antennas']['EQ']=[]
        for ant in range(self.config['n_ants']):
            ant_eq_str=self.get_line('antennas','EQ_%i'%(ant))
            if (ant_eq_str):
                self.config['antennas']['EQ'].append([int(coef) for coef in tokenise(ant_eq_str,LISTDELIMIT)])
            else:
                return 'ERR EQ_%i'%(ant)
                break

        self.config['antennas']['pos']=[]
        for ant in range(self.config['n_ants']):
            ant_pos_str=self.get_line('antennas','pos_%i'%(ant))
            if (ant_pos_str):
                self.config['antennas']['pos'].append([float(coef) for coef in tokenise(ant_pos_str,LISTDELIMIT)])
            else:
                return 'ERR pos_%i'%(ant)
                break

        self.config['antennas']['location']=[]
        ant_loc_str=self.get_line('antennas','location')
        if (ant_loc_str):
            location = (tokenise(ant_loc_str,LISTDELIMIT))
            if len(location) == 2:
                self.config['antennas']['location']= location
            else: 
                return 'ERR setting array location'
        else:
            return 'ERR setting array location'

        self.config['antennas']['order']=[]
        ant_ord_str=self.get_line('antennas','order')
        if (ant_ord_str):
            order = (tokenise(ant_ord_str,LISTDELIMIT))
            if len(order) == self.config['n_ants']:
                try:
                    self.config['antennas']['order']= [int(ant) for ant in order]
                except:
                    return 'ERR setting antenna ordering'                    
            else: 
                return 'ERR setting antenna ordering'
        else:
            return 'ERR setting antenna ordering'

        #perform some sanity checks:
        
        return 'OK'



    def get_line(self,section,variable):
        try:
            return self.cp.get(section,variable)
        except:
            return None

    def read_int(self,section,variable):
        self.config[variable]=self.cp.getint(section,variable)

    def read_str(self,section,variable):
        self.config[variable]=self.cp.get(section,variable)

    def read_float(self,section,variable):
        self.config[variable]=self.cp.getfloat(section,variable)
        
    def calc_consts(self):
        print 'Calculating constants and populating as necessary'
