#! /usr/bin/env python
"""
Update tmp.png from the database file specified in cgi arguments and 
generate HTML output through stdout.

Revisions:
2008-03-13  JRM Hacked to support multiple simultaneous connections - rand files

"""

print "Content-Type: text/html\n"

def printusage():
    print """<html><head><title>Plotting script</title>\n</head><h3>Usage:</h3><body><br>web_plotdb_py_cgi?dbfile=corr.db&refresh=(man,auto)&plot=(cross,raw,auto)&plotmode1=(power,rms,raw)&plotmode2=(wrap,unwrap,raw)&plottype=(linear,semilogy)&plottype2=(linear,semilogy)&chan1=(1...n)&chan2=(1...n) </body>  """


import cgi, cgitb, os, shutil, sys, time, numpy
cgitb.enable()

working_dir='/var/www'
web_dir=''

os.environ['HOME']=working_dir
import matplotlib
matplotlib.use('Agg')
import corr.plotdb
form = cgi.FieldStorage()

try: dbfile = form['dbfile'].value
except KeyError: 
    printusage()
    sys.exit()

try: mode = form['plot'].value
except KeyError: 
    printusage()
    sys.exit()

try: refresh = form['refresh'].value
except KeyError: refresh='auto'

try: plot_mode1 = form['plotmode1'].value
except KeyError: plot_mode1='power'

try: plot_mode2 = form['plotmode2'].value
except KeyError: plot_mode2='wrap'

try: plot_type1 = form['plottype1'].value
except KeyError: plot_type1='linear'

try: plot_type2 = form['plottype2'].value
except KeyError: plot_type2='linear'

try: chan1 = form['chan1'].value
except KeyError: chan1=0

try: chan2 = form['chan2'].value
except KeyError: chan2=0


db = corr.plotdb.PlotDB('%s/'%working_dir+dbfile)
db.plot_type(type1=plot_type1, type2=plot_type2)
db.plot_mode(mode1=plot_mode1,mode2=plot_mode2)

rand_image='tmp_%i.png'%(numpy.random.randint(500))
rand_file='%s/%s'%(working_dir,rand_image)

try:
    os.remove(rand_file)
except: 
    print ''

print """<html><head>"""

if refresh == 'auto':
    print """<META HTTP-EQUIV=REFRESH CONTENT=16>"""

if (mode == None or mode == 'auto'):
    print """<title>Auto-Correlations</title>\n</head><h3>Auto Correlations for all antennas:</h3><body><br>  """
    db.plot_auto(outfile='%s'%rand_file)

elif (mode == 'real'):
    print """<title>Real values: Cross-Correlations</title>\n</head><h3>Auto Correlations for all antennas:</h3><body><br>  """
    db.plot_real(outfile='%s'%rand_file,chan1=int(chan1),chan2=int(chan2))

elif (mode == 'cross'):
    print "<title>Cross-Correlations</title>\n</head><h3>Cross Correlation between antennas %s and %s:</h3>"%(chan1,chan2)
    db.plot_cross(outfile='%s'%rand_file,chan1=int(chan1),chan2=int(chan2))

elif (mode == 'raw'):
    print "<title>Raw Data</title>\n</head><h3>Raw correlator output between antennas %s and %s:</h3>"%(chan1,chan2)
    db.plot_raw(outfile='%s'%rand_file,chan1=int(chan1),chan2=int(chan2))

elif (mode == 'amps'):
    print "<title>Amplitudes</title>\n</head><h3>Amplitude output between antennas %s and %s:</h3>"%(chan1,chan2)
    db.plot_amps(outfile='%s'%rand_file,chan1=int(chan1),chan2=int(chan2))



print '''<img class="bordered" src="%s">'''%(web_dir+'/'+rand_image)

print '''<p> Details:'''
print 'Number of channels: %s<br>' %db.n_chans
print 'Number of Antennas: %s<br>' %db.n_ants
print 'Number of Stokes params: %s<br>' %db.n_stokes
print 'Total correlator bandwidth (GHz): %s<br>' %db.bandwidth
print 'Mixing Frequency (GHz): %s<br>' %db.mix_freq
#print 'Equalisation polynomial: %s<br>'%db.eq_poly
print '''</p>'''
