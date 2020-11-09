@ echo off

xc8-ccxc8 -mcpu=12F683 01_led_blink.c

del *.cmf
del *.elf
del *.d
del *.p1
del *.hxl
del startup.*
del *.o
del *.sdb
del *.sym
