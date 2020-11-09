#!/bin/bash

# program compilation

xc8-cc -mcpu=12F683 01_led_blink.c

# intermediate file cleaning
rm *.cmf
rm *.elf
rm *.d
rm *.p1
rm *.hxl
rm startup.*
rm *.o
rm *.sdb
rm *.sym
