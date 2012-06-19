"""
A module for controlling and receiving data from a CASPER_N correlator.

Implements interfaces for controlling a CASPER_N correlator
and writing Miriad files from the resultant interferometric data.  
Used primarily for by the PAPER array project.

Author: Aaron Parsons, Jason Manley
Email: aparsons at astron.berkeley.edu, jason_manley at hotmail.com
Revisions: None
"""
import corr.borph,corr.c2m,cn_conf,packet,plotdb,sim_cn_data,udp_client
__version__='0.2.3'

