@ echo off

xc8-cc -mcpu=12F683 02_pwm.c

del *.cmf
del *.elf
del *.d
del *.p1
del *.hxl
del startup.*
del *.o
del *.sdb
del *.sym
