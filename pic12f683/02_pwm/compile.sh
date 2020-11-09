#!/bin/bash
# 

# compiles program

xc8-cc -mcpu=12F683 02_pwm.c

# erases intermediate files

rm *.cmf
rm *.elf
rm *.d
rm *.p1
rm *.hxl
rm startup.*
rm *.o
rm *.sdb
rm *.sym
