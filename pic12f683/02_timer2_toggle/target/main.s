subtitle "Microchip MPLAB XC8 C Compiler v2.32 (Free license) build 20210201212658 Og1 "

pagewidth 120

	opt flic

	processor	12F683
include "C:\software\microchip\xc8\v2.32\pic\include\proc\12f683.cgen.inc"
getbyte	macro	val,pos
	(((val) >> (8 * pos)) and 0xff)
endm
byte0	macro	val
	(getbyte(val,0))
endm
byte1	macro	val
	(getbyte(val,1))
endm
byte2	macro	val
	(getbyte(val,2))
endm
byte3	macro	val
	(getbyte(val,3))
endm
byte4	macro	val
	(getbyte(val,4))
endm
byte5	macro	val
	(getbyte(val,5))
endm
byte6	macro	val
	(getbyte(val,6))
endm
byte7	macro	val
	(getbyte(val,7))
endm
getword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffff)
endm
word0	macro	val
	(getword(val,0))
endm
word1	macro	val
	(getword(val,2))
endm
word2	macro	val
	(getword(val,4))
endm
word3	macro	val
	(getword(val,6))
endm
gettword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffff)
endm
tword0	macro	val
	(gettword(val,0))
endm
tword1	macro	val
	(gettword(val,3))
endm
tword2	macro	val
	(gettword(val,6))
endm
getdword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffffff)
endm
dword0	macro	val
	(getdword(val,0))
endm
dword1	macro	val
	(getdword(val,4))
endm
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
# 55 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
INDF equ 00h ;# 
# 62 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TMR0 equ 01h ;# 
# 69 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PCL equ 02h ;# 
# 76 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
STATUS equ 03h ;# 
# 162 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
FSR equ 04h ;# 
# 169 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
GPIO equ 05h ;# 
# 219 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PCLATH equ 0Ah ;# 
# 239 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
INTCON equ 0Bh ;# 
# 317 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PIR1 equ 0Ch ;# 
# 388 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TMR1 equ 0Eh ;# 
# 395 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TMR1L equ 0Eh ;# 
# 402 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TMR1H equ 0Fh ;# 
# 409 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
T1CON equ 010h ;# 
# 486 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TMR2 equ 011h ;# 
# 493 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
T2CON equ 012h ;# 
# 564 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CCPR1 equ 013h ;# 
# 571 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CCPR1L equ 013h ;# 
# 578 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CCPR1H equ 014h ;# 
# 585 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CCP1CON equ 015h ;# 
# 649 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
WDTCON equ 018h ;# 
# 702 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CMCON0 equ 019h ;# 
# 761 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CMCON1 equ 01Ah ;# 
# 787 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
ADRESH equ 01Eh ;# 
# 794 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
ADCON0 equ 01Fh ;# 
# 884 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
OPTION_REG equ 081h ;# 
# 954 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TRISIO equ 085h ;# 
# 1004 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PIE1 equ 08Ch ;# 
# 1075 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PCON equ 08Eh ;# 
# 1114 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
OSCCON equ 08Fh ;# 
# 1179 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
OSCTUNE equ 090h ;# 
# 1231 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PR2 equ 092h ;# 
# 1238 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
WPU equ 095h ;# 
# 1243 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
WPUA equ 095h ;# 
# 1392 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
IOC equ 096h ;# 
# 1397 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
IOCA equ 096h ;# 
# 1566 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
VRCON equ 099h ;# 
# 1626 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
EEDAT equ 09Ah ;# 
# 1631 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
EEDATA equ 09Ah ;# 
# 1664 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
EEADR equ 09Bh ;# 
# 1671 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
EECON1 equ 09Ch ;# 
# 1709 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
EECON2 equ 09Dh ;# 
# 1716 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
ADRESL equ 09Eh ;# 
# 1723 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
ANSEL equ 09Fh ;# 
# 55 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
INDF equ 00h ;# 
# 62 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TMR0 equ 01h ;# 
# 69 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PCL equ 02h ;# 
# 76 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
STATUS equ 03h ;# 
# 162 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
FSR equ 04h ;# 
# 169 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
GPIO equ 05h ;# 
# 219 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PCLATH equ 0Ah ;# 
# 239 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
INTCON equ 0Bh ;# 
# 317 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PIR1 equ 0Ch ;# 
# 388 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TMR1 equ 0Eh ;# 
# 395 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TMR1L equ 0Eh ;# 
# 402 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TMR1H equ 0Fh ;# 
# 409 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
T1CON equ 010h ;# 
# 486 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TMR2 equ 011h ;# 
# 493 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
T2CON equ 012h ;# 
# 564 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CCPR1 equ 013h ;# 
# 571 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CCPR1L equ 013h ;# 
# 578 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CCPR1H equ 014h ;# 
# 585 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CCP1CON equ 015h ;# 
# 649 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
WDTCON equ 018h ;# 
# 702 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CMCON0 equ 019h ;# 
# 761 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CMCON1 equ 01Ah ;# 
# 787 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
ADRESH equ 01Eh ;# 
# 794 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
ADCON0 equ 01Fh ;# 
# 884 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
OPTION_REG equ 081h ;# 
# 954 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TRISIO equ 085h ;# 
# 1004 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PIE1 equ 08Ch ;# 
# 1075 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PCON equ 08Eh ;# 
# 1114 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
OSCCON equ 08Fh ;# 
# 1179 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
OSCTUNE equ 090h ;# 
# 1231 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PR2 equ 092h ;# 
# 1238 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
WPU equ 095h ;# 
# 1243 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
WPUA equ 095h ;# 
# 1392 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
IOC equ 096h ;# 
# 1397 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
IOCA equ 096h ;# 
# 1566 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
VRCON equ 099h ;# 
# 1626 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
EEDAT equ 09Ah ;# 
# 1631 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
EEDATA equ 09Ah ;# 
# 1664 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
EEADR equ 09Bh ;# 
# 1671 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
EECON1 equ 09Ch ;# 
# 1709 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
EECON2 equ 09Dh ;# 
# 1716 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
ADRESL equ 09Eh ;# 
# 1723 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
ANSEL equ 09Fh ;# 
# 55 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
INDF equ 00h ;# 
# 62 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TMR0 equ 01h ;# 
# 69 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PCL equ 02h ;# 
# 76 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
STATUS equ 03h ;# 
# 162 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
FSR equ 04h ;# 
# 169 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
GPIO equ 05h ;# 
# 219 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PCLATH equ 0Ah ;# 
# 239 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
INTCON equ 0Bh ;# 
# 317 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PIR1 equ 0Ch ;# 
# 388 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TMR1 equ 0Eh ;# 
# 395 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TMR1L equ 0Eh ;# 
# 402 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TMR1H equ 0Fh ;# 
# 409 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
T1CON equ 010h ;# 
# 486 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TMR2 equ 011h ;# 
# 493 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
T2CON equ 012h ;# 
# 564 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CCPR1 equ 013h ;# 
# 571 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CCPR1L equ 013h ;# 
# 578 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CCPR1H equ 014h ;# 
# 585 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CCP1CON equ 015h ;# 
# 649 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
WDTCON equ 018h ;# 
# 702 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CMCON0 equ 019h ;# 
# 761 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CMCON1 equ 01Ah ;# 
# 787 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
ADRESH equ 01Eh ;# 
# 794 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
ADCON0 equ 01Fh ;# 
# 884 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
OPTION_REG equ 081h ;# 
# 954 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TRISIO equ 085h ;# 
# 1004 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PIE1 equ 08Ch ;# 
# 1075 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PCON equ 08Eh ;# 
# 1114 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
OSCCON equ 08Fh ;# 
# 1179 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
OSCTUNE equ 090h ;# 
# 1231 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PR2 equ 092h ;# 
# 1238 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
WPU equ 095h ;# 
# 1243 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
WPUA equ 095h ;# 
# 1392 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
IOC equ 096h ;# 
# 1397 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
IOCA equ 096h ;# 
# 1566 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
VRCON equ 099h ;# 
# 1626 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
EEDAT equ 09Ah ;# 
# 1631 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
EEDATA equ 09Ah ;# 
# 1664 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
EEADR equ 09Bh ;# 
# 1671 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
EECON1 equ 09Ch ;# 
# 1709 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
EECON2 equ 09Dh ;# 
# 1716 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
ADRESL equ 09Eh ;# 
# 1723 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
ANSEL equ 09Fh ;# 
# 55 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
INDF equ 00h ;# 
# 62 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TMR0 equ 01h ;# 
# 69 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PCL equ 02h ;# 
# 76 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
STATUS equ 03h ;# 
# 162 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
FSR equ 04h ;# 
# 169 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
GPIO equ 05h ;# 
# 219 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PCLATH equ 0Ah ;# 
# 239 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
INTCON equ 0Bh ;# 
# 317 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PIR1 equ 0Ch ;# 
# 388 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TMR1 equ 0Eh ;# 
# 395 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TMR1L equ 0Eh ;# 
# 402 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TMR1H equ 0Fh ;# 
# 409 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
T1CON equ 010h ;# 
# 486 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TMR2 equ 011h ;# 
# 493 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
T2CON equ 012h ;# 
# 564 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CCPR1 equ 013h ;# 
# 571 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CCPR1L equ 013h ;# 
# 578 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CCPR1H equ 014h ;# 
# 585 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CCP1CON equ 015h ;# 
# 649 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
WDTCON equ 018h ;# 
# 702 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CMCON0 equ 019h ;# 
# 761 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CMCON1 equ 01Ah ;# 
# 787 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
ADRESH equ 01Eh ;# 
# 794 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
ADCON0 equ 01Fh ;# 
# 884 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
OPTION_REG equ 081h ;# 
# 954 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TRISIO equ 085h ;# 
# 1004 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PIE1 equ 08Ch ;# 
# 1075 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PCON equ 08Eh ;# 
# 1114 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
OSCCON equ 08Fh ;# 
# 1179 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
OSCTUNE equ 090h ;# 
# 1231 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PR2 equ 092h ;# 
# 1238 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
WPU equ 095h ;# 
# 1243 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
WPUA equ 095h ;# 
# 1392 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
IOC equ 096h ;# 
# 1397 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
IOCA equ 096h ;# 
# 1566 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
VRCON equ 099h ;# 
# 1626 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
EEDAT equ 09Ah ;# 
# 1631 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
EEDATA equ 09Ah ;# 
# 1664 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
EEADR equ 09Bh ;# 
# 1671 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
EECON1 equ 09Ch ;# 
# 1709 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
EECON2 equ 09Dh ;# 
# 1716 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
ADRESL equ 09Eh ;# 
# 1723 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
ANSEL equ 09Fh ;# 
# 55 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
INDF equ 00h ;# 
# 62 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TMR0 equ 01h ;# 
# 69 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PCL equ 02h ;# 
# 76 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
STATUS equ 03h ;# 
# 162 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
FSR equ 04h ;# 
# 169 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
GPIO equ 05h ;# 
# 219 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PCLATH equ 0Ah ;# 
# 239 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
INTCON equ 0Bh ;# 
# 317 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PIR1 equ 0Ch ;# 
# 388 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TMR1 equ 0Eh ;# 
# 395 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TMR1L equ 0Eh ;# 
# 402 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TMR1H equ 0Fh ;# 
# 409 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
T1CON equ 010h ;# 
# 486 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TMR2 equ 011h ;# 
# 493 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
T2CON equ 012h ;# 
# 564 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CCPR1 equ 013h ;# 
# 571 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CCPR1L equ 013h ;# 
# 578 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CCPR1H equ 014h ;# 
# 585 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CCP1CON equ 015h ;# 
# 649 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
WDTCON equ 018h ;# 
# 702 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CMCON0 equ 019h ;# 
# 761 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
CMCON1 equ 01Ah ;# 
# 787 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
ADRESH equ 01Eh ;# 
# 794 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
ADCON0 equ 01Fh ;# 
# 884 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
OPTION_REG equ 081h ;# 
# 954 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
TRISIO equ 085h ;# 
# 1004 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PIE1 equ 08Ch ;# 
# 1075 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PCON equ 08Eh ;# 
# 1114 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
OSCCON equ 08Fh ;# 
# 1179 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
OSCTUNE equ 090h ;# 
# 1231 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
PR2 equ 092h ;# 
# 1238 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
WPU equ 095h ;# 
# 1243 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
WPUA equ 095h ;# 
# 1392 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
IOC equ 096h ;# 
# 1397 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
IOCA equ 096h ;# 
# 1566 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
VRCON equ 099h ;# 
# 1626 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
EEDAT equ 09Ah ;# 
# 1631 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
EEDATA equ 09Ah ;# 
# 1664 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
EEADR equ 09Bh ;# 
# 1671 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
EECON1 equ 09Ch ;# 
# 1709 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
EECON2 equ 09Dh ;# 
# 1716 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
ADRESL equ 09Eh ;# 
# 1723 "C:\software\microchip\xc8\v2.32\pic\include\proc\pic12f683.h"
ANSEL equ 09Fh ;# 
	debug_source C
	FNCALL	_main,_interruptions
	FNCALL	_main,_loop
	FNCALL	_main,_setup
	FNCALL	_setup,_config_timer2
	FNCALL	_setup,_init_timer2
	FNROOT	_main
	FNCALL	intlevel1,_general_isr
	global	intlevel1
	FNROOT	intlevel1
	global	_tick
	global	_TMR2
_TMR2	set	0x11
	global	_T2CON
_T2CON	set	0x12
	global	_INTCONbits
_INTCONbits	set	0xB
	global	_CMCON0
_CMCON0	set	0x19
	global	_GPIO
_GPIO	set	0x5
	global	_TMR2ON
_TMR2ON	set	0x92
	global	_PEIE
_PEIE	set	0x5E
	global	_GP0
_GP0	set	0x28
	global	_TMR2IF
_TMR2IF	set	0x61
	global	_PR2
_PR2	set	0x92
	global	_ANSEL
_ANSEL	set	0x9F
	global	_TRISIO0
_TRISIO0	set	0x428
	global	_TMR2IE
_TMR2IE	set	0x461
; #config settings
	config pad_punits      = on
	config apply_mask      = off
	config ignore_cmsgs    = off
	config default_configs = off
	config default_idlocs  = off
	config FOSC = "INTOSCIO"
	config WDTE = "OFF"
	config PWRTE = "OFF"
	config MCLRE = "OFF"
	config CP = "OFF"
	config CPD = "OFF"
	config BOREN = "OFF"
	config IESO = "OFF"
	config FCMEN = "OFF"
	file	"main.s"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bssCOMMON,class=COMMON,space=1,noexec
global __pbssCOMMON
__pbssCOMMON:
_tick:
       ds      1

	file	"main.s"
	line	#
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2,merge=1
	clrf	((__pbssCOMMON)+0)&07Fh
psect cinit,class=CODE,delta=2,merge=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1,noexec
global __pcstackCOMMON
__pcstackCOMMON:
?_setup:	; 1 bytes @ 0x0
?_interruptions:	; 1 bytes @ 0x0
?_loop:	; 1 bytes @ 0x0
?_init_timer2:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
?_general_isr:	; 1 bytes @ 0x0
??_general_isr:	; 1 bytes @ 0x0
	ds	2
??_interruptions:	; 1 bytes @ 0x2
??_loop:	; 1 bytes @ 0x2
?_config_timer2:	; 1 bytes @ 0x2
??_init_timer2:	; 1 bytes @ 0x2
	global	config_timer2@period
config_timer2@period:	; 1 bytes @ 0x2
	ds	1
	global	config_timer2@postscaler
config_timer2@postscaler:	; 1 bytes @ 0x3
	ds	1
??_config_timer2:	; 1 bytes @ 0x4
	global	config_timer2@prescaler
config_timer2@prescaler:	; 1 bytes @ 0x4
	ds	1
??_setup:	; 1 bytes @ 0x5
	ds	2
??_main:	; 1 bytes @ 0x7
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        0
;!    BSS         1
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14      7       8
;!    BANK0            80      0       0
;!    BANK1            32      0       0

;!
;!Pointer List with Targets:
;!
;!    None.


;!
;!Critical Paths under _main in COMMON
;!
;!    _main->_setup
;!    _setup->_config_timer2
;!
;!Critical Paths under _general_isr in COMMON
;!
;!    None.
;!
;!Critical Paths under _main in BANK0
;!
;!    None.
;!
;!Critical Paths under _general_isr in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _general_isr in BANK1
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 0     0      0     218
;!                      _interruptions
;!                               _loop
;!                              _setup
;! ---------------------------------------------------------------------------------
;! (1) _setup                                                2     2      0     218
;!                                              5 COMMON     2     2      0
;!                      _config_timer2
;!                        _init_timer2
;! ---------------------------------------------------------------------------------
;! (2) _init_timer2                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _config_timer2                                        3     1      2     218
;!                                              2 COMMON     3     1      2
;! ---------------------------------------------------------------------------------
;! (1) _loop                                                 0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _interruptions                                        0     0      0       0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 2
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (3) _general_isr                                          2     2      0       0
;!                                              0 COMMON     2     2      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 3
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _interruptions
;!   _loop
;!   _setup
;!     _config_timer2
;!     _init_timer2
;!
;! _general_isr (ROOT)
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BITCOMMON            E      0       0       0        0.0%
;!EEDATA             100      0       0       0        0.0%
;!NULL                 0      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!COMMON               E      7       8       1       57.1%
;!BITSFR0              0      0       0       1        0.0%
;!SFR0                 0      0       0       1        0.0%
;!BITSFR1              0      0       0       2        0.0%
;!SFR1                 0      0       0       2        0.0%
;!STACK                0      0       0       2        0.0%
;!BITBANK0            50      0       0       3        0.0%
;!BANK0               50      0       0       4        0.0%
;!BANK1               20      0       0       5        0.0%
;!ABS                  0      0       8       6        0.0%
;!BITBANK1            20      0       0       7        0.0%
;!DATA                 0      0       8       8        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 7 in file "..\src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_interruptions
;;		_loop
;;		_setup
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"..\src\main.c"
	line	7
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"..\src\main.c"
	line	7
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	callstack 5
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	8
	
l726:	
	fcall	_setup
	line	10
	
l728:	
	fcall	_interruptions
	line	13
	
l730:	
	fcall	_loop
	goto	l730
	global	start
	ljmp	start
	callstack 0
	line	15
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_setup

;; *************** function _setup *****************
;; Defined at:
;;		line 10 in file "..\src\libs\device_setup.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          2       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		_config_timer2
;;		_init_timer2
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1,group=0
	file	"..\src\libs\device_setup.c"
	line	10
global __ptext1
__ptext1:	;psect for function _setup
psect	text1
	file	"..\src\libs\device_setup.c"
	line	10
	global	__size_of_setup
	__size_of_setup	equ	__end_of_setup-_setup
	
_setup:	
;incstack = 0
	callstack 5
; Regs used in _setup: [wreg+status,2+status,0+pclath+cstack]
	line	11
	
l714:	
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	12
	
l716:	
	movlw	low(07h)
	movwf	(25)	;volatile
	line	13
	
l718:	
	bsf	status, 5	;RP0=1, select bank1
	clrf	(159)^080h	;volatile
	line	15
	
l720:	
	bsf	(1064/8)^080h,(1064)&7	;volatile
	line	16
	
l722:	
	bcf	(1064/8)^080h,(1064)&7	;volatile
	line	18
	
l724:	
	movlw	low(019h)
	movwf	(??_setup+0)+0
	movf	(??_setup+0)+0,w
	movwf	(config_timer2@period)
	movlw	low(048h)
	movwf	(??_setup+1)+0
	movf	(??_setup+1)+0,w
	movwf	(config_timer2@postscaler)
	movlw	low(01h)
	fcall	_config_timer2
	line	19
	fcall	_init_timer2
	line	20
	
l51:	
	return
	callstack 0
GLOBAL	__end_of_setup
	__end_of_setup:
	signat	_setup,89
	global	_init_timer2

;; *************** function _init_timer2 *****************
;; Defined at:
;;		line 11 in file "..\src\libs\timer2.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_setup
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1,group=0
	file	"..\src\libs\timer2.c"
	line	11
global __ptext2
__ptext2:	;psect for function _init_timer2
psect	text2
	file	"..\src\libs\timer2.c"
	line	11
	global	__size_of_init_timer2
	__size_of_init_timer2	equ	__end_of_init_timer2-_init_timer2
	
_init_timer2:	
;incstack = 0
	callstack 5
; Regs used in _init_timer2: [status,2]
	line	12
	
l670:	
	bcf	status, 5	;RP0=0, select bank0
	clrf	(17)	;volatile
	line	14
	
l672:	
	bcf	(97/8),(97)&7	;volatile
	line	15
	
l674:	
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1121/8)^080h,(1121)&7	;volatile
	line	16
	
l72:	
	return
	callstack 0
GLOBAL	__end_of_init_timer2
	__end_of_init_timer2:
	signat	_init_timer2,89
	global	_config_timer2

;; *************** function _config_timer2 *****************
;; Defined at:
;;		line 4 in file "..\src\libs\timer2.c"
;; Parameters:    Size  Location     Type
;;  prescaler       1    wreg     unsigned char 
;;  period          1    2[COMMON] unsigned char 
;;  postscaler      1    3[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  prescaler       1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_setup
;; This function uses a non-reentrant model
;;
psect	text3,local,class=CODE,delta=2,merge=1,group=0
	line	4
global __ptext3
__ptext3:	;psect for function _config_timer2
psect	text3
	file	"..\src\libs\timer2.c"
	line	4
	global	__size_of_config_timer2
	__size_of_config_timer2	equ	__end_of_config_timer2-_config_timer2
	
_config_timer2:	
;incstack = 0
	callstack 5
; Regs used in _config_timer2: [wreg+status,2+status,0]
	movwf	(config_timer2@prescaler)
	line	5
	
l708:	
	movf	(config_timer2@prescaler),w
	iorwf	(config_timer2@postscaler),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	6
	
l710:	
	movf	(config_timer2@period),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	8
	
l712:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(146/8),(146)&7	;volatile
	line	9
	
l69:	
	return
	callstack 0
GLOBAL	__end_of_config_timer2
	__end_of_config_timer2:
	signat	_config_timer2,12409
	global	_loop

;; *************** function _loop *****************
;; Defined at:
;;		line 17 in file "..\src\app_main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text4,local,class=CODE,delta=2,merge=1,group=0
	file	"..\src\app_main.c"
	line	17
global __ptext4
__ptext4:	;psect for function _loop
psect	text4
	file	"..\src\app_main.c"
	line	17
	global	__size_of_loop
	__size_of_loop	equ	__end_of_loop-_loop
	
_loop:	
;incstack = 0
	callstack 6
; Regs used in _loop: [wreg+status,2+status,0]
	line	18
	
l690:	
	movf	((_tick)),w
	btfsc	status,2
	goto	u11
	goto	u10
u11:
	goto	l32
u10:
	line	19
	
l692:	
	movlw	1<<((40)&7)
	bcf	status, 5	;RP0=0, select bank0
	xorwf	((40)/8),f
	line	20
	
l694:	
	clrf	(_tick)
	line	22
	
l32:	
	return
	callstack 0
GLOBAL	__end_of_loop
	__end_of_loop:
	signat	_loop,89
	global	_interruptions

;; *************** function _interruptions *****************
;; Defined at:
;;		line 25 in file "..\src\libs\device_setup.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text5,local,class=CODE,delta=2,merge=1,group=0
	file	"..\src\libs\device_setup.c"
	line	25
global __ptext5
__ptext5:	;psect for function _interruptions
psect	text5
	file	"..\src\libs\device_setup.c"
	line	25
	global	__size_of_interruptions
	__size_of_interruptions	equ	__end_of_interruptions-_interruptions
	
_interruptions:	
;incstack = 0
	callstack 6
; Regs used in _interruptions: []
	line	26
	
l688:	
	bsf	(94/8),(94)&7	;volatile
	line	27
	bsf	(11),7	;volatile
	line	28
	
l54:	
	return
	callstack 0
GLOBAL	__end_of_interruptions
	__end_of_interruptions:
	signat	_interruptions,89
	global	_general_isr

;; *************** function _general_isr *****************
;; Defined at:
;;		line 10 in file "..\src\app_main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          2       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text6,local,class=CODE,delta=2,merge=1,group=0
	file	"..\src\app_main.c"
	line	10
global __ptext6
__ptext6:	;psect for function _general_isr
psect	text6
	file	"..\src\app_main.c"
	line	10
	global	__size_of_general_isr
	__size_of_general_isr	equ	__end_of_general_isr-_general_isr
	
_general_isr:	
;incstack = 0
	callstack 5
; Regs used in _general_isr: []
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_general_isr+0)
	movf	pclath,w
	movwf	(??_general_isr+1)
	ljmp	_general_isr
psect	text6
	line	11
	
i1l702:	
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1121/8)^080h,(1121)&7	;volatile
	goto	u2_21
	goto	u2_20
u2_21:
	goto	i1l28
u2_20:
	
i1l704:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(97/8),(97)&7	;volatile
	goto	u3_21
	goto	u3_20
u3_21:
	goto	i1l28
u3_20:
	line	12
	
i1l706:	
	bcf	(97/8),(97)&7	;volatile
	line	13
	clrf	(_tick)
	incf	(_tick),f
	line	15
	
i1l28:	
	movf	(??_general_isr+1),w
	movwf	pclath
	swapf	(??_general_isr+0),w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	callstack 0
GLOBAL	__end_of_general_isr
	__end_of_general_isr:
	signat	_general_isr,89
global	___latbits
___latbits	equ	0
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp+0
	end
