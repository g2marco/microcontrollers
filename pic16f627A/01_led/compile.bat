@ echo off

xc8-cc -mcpu=16F627A 01_led_blink.c

del *.cmf
del *.elf
del *.d
del *.p1
del *.hxl
del startup.*
del *.o
del *.sdb
del *.sym
