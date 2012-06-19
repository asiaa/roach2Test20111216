/* ************************************ */
/* **                                ** */
/* **      Core info header file     ** */
/* **                                ** */
/* ************************************ */

#ifndef CORE_INFO_H
#define CORE_INFO_H

#include <xbasic_types.h>
#include <xparameters.h> 

typedef enum blk_types {xps_adc,xps_block,xps_bram,xps_corr_adc,xps_corr_dac,xps_corr_mxfe,xps_corr_rf,xps_dram,xps_ethlite,xps_framebuffer,xps_fifo,xps_gpio,xps_interchip,xps_lwip,xps_plb2opb,xps_opb2opb,xps_probe,xps_quadc,xps_sram,xps_sw_reg,xps_tengbe,xps_vsi,xps_xaui,xps_xsg,all} blk_type;
typedef struct cores {
   char*    name;
   blk_type type;
   Xuint32  address;
   char*    params;
} core;

#define NUM_CORES 13

extern core cores[NUM_CORES];

#endif
