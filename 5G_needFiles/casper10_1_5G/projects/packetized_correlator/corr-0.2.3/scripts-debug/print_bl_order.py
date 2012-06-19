#! /usr/bin/env python

import corr.sim_cn_data,os

for i in range(0,36):
    print corr.sim_cn_data.bl2ij(corr.sim_cn_data.get_bl_order(8)[i])

print "done"
