#!/usr/bin/python
import corr.borph, time, sys

#servers = ['beegentle', 'beekind']
servers = sys.argv[1:]

print('Stopping the following servers:')
print(servers)


port = 9999
bees = [corr.borph.BorphClient(s, port) for s in servers]

def special_all(dev, value):
    rv = []
    for b in bees: rv.append(b.special(dev, value))
    return rv

special_all('stop_tx',0)
