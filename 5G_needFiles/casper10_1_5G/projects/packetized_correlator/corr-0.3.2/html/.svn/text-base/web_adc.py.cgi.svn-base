#! /usr/bin/env python
"""
"""

print "Content-Type: text/html\n"

def printusage():
    print """<html><head><title>ADC Power Amplitude Script</title>\n</head><h3>Usage:</h3><body><br>web_adc_py_cgi?conf=example.conf&refresh=(man,auto)&rate=1</body>  """


import cgi, cgitb, os, shutil, sys, time, numpy
cgitb.enable()

working_dir='/tmp/'
web_dir=''

form = cgi.FieldStorage()

try: conf = form['conf'].value
except KeyError:
    printusage()
    sys.exit()

try: refresh = form['refresh'].value
except KeyError: refresh='auto'

try: rate = form['rate'].value
except KeyError: rate='1'

print """<html><head>"""

if refresh == 'auto':
    print """<META HTTP-EQUIV=REFRESH CONTENT=%s>"""%(rate)

print "<title>ADC Power Amplitudes</title>\n</head>"
os.system('adc_amplitudes.py -s %s > %sadc.out'%(conf,working_dir))
f_adc = open('%sadc.out'%(working_dir),'r')
adc_out = f_adc.read()
adc_out = adc_out.replace("\n","\n<br>")
print adc_out
f_adc.close()

