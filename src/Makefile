#
# Makefile for hd44780 (mwm_script_2018)
#

obj-m = hd44780.o
hd44780-y := hd44780-i2c.o hd44780-dev.o

ifeq ($(MAKING_MODULES),1)

-include $(TOPDIR)/Rules.make
endif
