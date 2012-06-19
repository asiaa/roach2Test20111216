/* ************************************ */
/* **                                ** */
/* **          Core info file        ** */
/* **                                ** */
/* ************************************ */

#include "core_info.h"

core cores[NUM_CORES] = {
	{"XSG core config",xps_xsg,-1,""},
	{"XAUI0",xps_xaui,-1,""},
	{"adc0",xps_adc,-1,"adc = adc0 / interleave = off"},
	{"adc1",xps_adc,-1,"adc = adc1 / interleave = off"},
	{"dbuf_ct_sram_fft_2x/sram",xps_sram,-1,""},
	{"dbuf_ct_sram_fft_2x/sram1",xps_sram,-1,""},
	{"gpio",xps_gpio,-1,""},
	{"led1_arm",xps_gpio,-1,""},
	{"led2_sync",xps_gpio,-1,""},
	{"led4_eq_clip",xps_gpio,-1,""},
	{"led5_adc_clip",xps_gpio,-1,""},
	{"led6_link_dn",xps_gpio,-1,""},
	{"led7_xaui_overlfow",xps_gpio,-1,""},
};
