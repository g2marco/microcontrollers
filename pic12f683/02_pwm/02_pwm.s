subtitle "Microchip MPLAB XC8 C Compiler v2.20 (Free license) build 20200408173844 Og1 "

pagewidth 120

	opt flic

	processor	12F683
include "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\12f683.cgen.inc"
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
# 54 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
INDF equ 00h ;# 
# 61 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
TMR0 equ 01h ;# 
# 68 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
PCL equ 02h ;# 
# 75 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
STATUS equ 03h ;# 
# 161 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
FSR equ 04h ;# 
# 168 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
GPIO equ 05h ;# 
# 218 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
PCLATH equ 0Ah ;# 
# 238 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
INTCON equ 0Bh ;# 
# 316 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
PIR1 equ 0Ch ;# 
# 387 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
TMR1 equ 0Eh ;# 
# 394 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
TMR1L equ 0Eh ;# 
# 401 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
TMR1H equ 0Fh ;# 
# 408 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
T1CON equ 010h ;# 
# 485 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
TMR2 equ 011h ;# 
# 492 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
T2CON equ 012h ;# 
# 563 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
CCPR1 equ 013h ;# 
# 570 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
CCPR1L equ 013h ;# 
# 577 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
CCPR1H equ 014h ;# 
# 584 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
CCP1CON equ 015h ;# 
# 648 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
WDTCON equ 018h ;# 
# 701 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
CMCON0 equ 019h ;# 
# 760 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
CMCON1 equ 01Ah ;# 
# 786 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
ADRESH equ 01Eh ;# 
# 793 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
ADCON0 equ 01Fh ;# 
# 883 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
OPTION_REG equ 081h ;# 
# 953 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
TRISIO equ 085h ;# 
# 1003 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
PIE1 equ 08Ch ;# 
# 1074 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
PCON equ 08Eh ;# 
# 1113 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
OSCCON equ 08Fh ;# 
# 1178 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
OSCTUNE equ 090h ;# 
# 1230 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
PR2 equ 092h ;# 
# 1237 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
WPU equ 095h ;# 
# 1242 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
WPUA equ 095h ;# 
# 1391 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
IOC equ 096h ;# 
# 1396 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
IOCA equ 096h ;# 
# 1565 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
VRCON equ 099h ;# 
# 1625 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
EEDAT equ 09Ah ;# 
# 1630 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
EEDATA equ 09Ah ;# 
# 1663 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
EEADR equ 09Bh ;# 
# 1670 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
EECON1 equ 09Ch ;# 
# 1708 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
EECON2 equ 09Dh ;# 
# 1715 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
ADRESL equ 09Eh ;# 
# 1722 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
ANSEL equ 09Fh ;# 
# 54 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
INDF equ 00h ;# 
# 61 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
TMR0 equ 01h ;# 
# 68 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
PCL equ 02h ;# 
# 75 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
STATUS equ 03h ;# 
# 161 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
FSR equ 04h ;# 
# 168 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
GPIO equ 05h ;# 
# 218 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
PCLATH equ 0Ah ;# 
# 238 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
INTCON equ 0Bh ;# 
# 316 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
PIR1 equ 0Ch ;# 
# 387 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
TMR1 equ 0Eh ;# 
# 394 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
TMR1L equ 0Eh ;# 
# 401 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
TMR1H equ 0Fh ;# 
# 408 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
T1CON equ 010h ;# 
# 485 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
TMR2 equ 011h ;# 
# 492 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
T2CON equ 012h ;# 
# 563 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
CCPR1 equ 013h ;# 
# 570 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
CCPR1L equ 013h ;# 
# 577 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
CCPR1H equ 014h ;# 
# 584 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
CCP1CON equ 015h ;# 
# 648 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
WDTCON equ 018h ;# 
# 701 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
CMCON0 equ 019h ;# 
# 760 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
CMCON1 equ 01Ah ;# 
# 786 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
ADRESH equ 01Eh ;# 
# 793 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
ADCON0 equ 01Fh ;# 
# 883 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
OPTION_REG equ 081h ;# 
# 953 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
TRISIO equ 085h ;# 
# 1003 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
PIE1 equ 08Ch ;# 
# 1074 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
PCON equ 08Eh ;# 
# 1113 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
OSCCON equ 08Fh ;# 
# 1178 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
OSCTUNE equ 090h ;# 
# 1230 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
PR2 equ 092h ;# 
# 1237 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
WPU equ 095h ;# 
# 1242 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
WPUA equ 095h ;# 
# 1391 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
IOC equ 096h ;# 
# 1396 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
IOCA equ 096h ;# 
# 1565 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
VRCON equ 099h ;# 
# 1625 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
EEDAT equ 09Ah ;# 
# 1630 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
EEDATA equ 09Ah ;# 
# 1663 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
EEADR equ 09Bh ;# 
# 1670 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
EECON1 equ 09Ch ;# 
# 1708 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
EECON2 equ 09Dh ;# 
# 1715 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
ADRESL equ 09Eh ;# 
# 1722 "C:\Program Files\Microchip\xc8\v2.20\pic\include\proc\pic12f683.h"
ANSEL equ 09Fh ;# 
	FNCALL	_main,_loop
	FNCALL	_main,_setup
	FNCALL	_setup,_config_gpio
	FNCALL	_setup,_config_pwm
	FNCALL	_config_pwm,_set_duty_cycle
	FNCALL	_loop,_set_duty_cycle
	FNROOT	_main
psect	strings,class=STRING,delta=2,noexec
global __pstrings
__pstrings:
stringtab:
	global    __stringtab
__stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
	global __stringbase
__stringbase:
	retlw	0
psect	strings
	global    __end_of__stringtab
__end_of__stringtab:
	file	"02_pwm.c"
	line	19
_DELTA_PWM:
	retlw	01Ch
	retlw	0

	global __end_of_DELTA_PWM
__end_of_DELTA_PWM:
psect	strings
	file	"02_pwm.c"
	line	18
_MAX_PWM_VALUE:
	retlw	018h
	retlw	01h

	global __end_of_MAX_PWM_VALUE
__end_of_MAX_PWM_VALUE:
	global	_increment
	global	_pwm_value
psect	nvCOMMON,class=COMMON,space=1,noexec
global __pnvCOMMON
__pnvCOMMON:
_pwm_value:
       ds      2

	global	_GPIObits
_GPIObits	set	0x5
	global	_CMCON0
_CMCON0	set	0x19
	global	_GPIO
_GPIO	set	0x5
	global	_T2CONbits
_T2CONbits	set	0x12
	global	_PIR1bits
_PIR1bits	set	0xC
	global	_CCP1CON
_CCP1CON	set	0x15
	global	_CCPR1L
_CCPR1L	set	0x13
	global	_ANSEL
_ANSEL	set	0x9F
	global	_TRISIO
_TRISIO	set	0x85
	global	_OPTION_REGbits
_OPTION_REGbits	set	0x81
	global	_PR2
_PR2	set	0x92
	global	_WPU5
_WPU5	set	0x4AD
	global	_TRISIO5
_TRISIO5	set	0x42D
	global	_TRISIO0
_TRISIO0	set	0x428
	global	_TRISIO2
_TRISIO2	set	0x42A
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
	file	"02_pwm.s"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bssCOMMON,class=COMMON,space=1,noexec
global __pbssCOMMON
__pbssCOMMON:
_increment:
       ds      1

	file	"02_pwm.s"
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
?_set_duty_cycle:	; 1 bytes @ 0x0
?_config_pwm:	; 1 bytes @ 0x0
?_config_gpio:	; 1 bytes @ 0x0
??_config_gpio:	; 1 bytes @ 0x0
?_setup:	; 1 bytes @ 0x0
?_loop:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
	global	set_duty_cycle@value
set_duty_cycle@value:	; 2 bytes @ 0x0
	ds	2
??_set_duty_cycle:	; 1 bytes @ 0x2
	ds	2
??_config_pwm:	; 1 bytes @ 0x4
??_setup:	; 1 bytes @ 0x4
??_loop:	; 1 bytes @ 0x4
	ds	3
??_main:	; 1 bytes @ 0x7
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    4
;!    Data        0
;!    BSS         1
;!    Persistent  2
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14      7      10
;!    BANK0            80      0       0
;!    BANK1            32      0       0

;!
;!Pointer List with Targets:
;!
;!    None.


;!
;!Critical Paths under _main in COMMON
;!
;!    _main->_loop
;!    _config_pwm->_set_duty_cycle
;!    _loop->_set_duty_cycle
;!
;!Critical Paths under _main in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
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
;! (0) _main                                                 0     0      0     392
;!                               _loop
;!                              _setup
;! ---------------------------------------------------------------------------------
;! (1) _setup                                                0     0      0     196
;!                        _config_gpio
;!                         _config_pwm
;! ---------------------------------------------------------------------------------
;! (2) _config_pwm                                           0     0      0     196
;!                     _set_duty_cycle
;! ---------------------------------------------------------------------------------
;! (2) _config_gpio                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _loop                                                 3     3      0     196
;!                                              4 COMMON     3     3      0
;!                     _set_duty_cycle
;! ---------------------------------------------------------------------------------
;! (3) _set_duty_cycle                                       4     2      2     196
;!                                              0 COMMON     4     2      2
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 3
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _loop
;!     _set_duty_cycle
;!   _setup
;!     _config_gpio
;!     _config_pwm
;!       _set_duty_cycle
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BITCOMMON            E      0       0       0        0.0%
;!EEDATA             100      0       0       0        0.0%
;!NULL                 0      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!COMMON               E      7       A       1       71.4%
;!BITSFR0              0      0       0       1        0.0%
;!SFR0                 0      0       0       1        0.0%
;!BITSFR1              0      0       0       2        0.0%
;!SFR1                 0      0       0       2        0.0%
;!STACK                0      0       0       2        0.0%
;!BITBANK0            50      0       0       3        0.0%
;!BANK0               50      0       0       4        0.0%
;!BANK1               20      0       0       5        0.0%
;!ABS                  0      0       A       6        0.0%
;!BITBANK1            20      0       0       7        0.0%
;!DATA                 0      0       A       8        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 101 in file "02_pwm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_loop
;;		_setup
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"02_pwm.c"
	line	101
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"02_pwm.c"
	line	101
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	callstack 5
; Regs used in _main: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	102
	
l784:	
	fcall	_setup
	line	104
	
l69:	
	line	105
	fcall	_loop
	goto	l69
	global	start
	ljmp	start
	callstack 0
	line	107
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_setup

;; *************** function _setup *****************
;; Defined at:
;;		line 62 in file "02_pwm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
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
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_config_gpio
;;		_config_pwm
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1,group=0
	line	62
global __ptext1
__ptext1:	;psect for function _setup
psect	text1
	file	"02_pwm.c"
	line	62
	global	__size_of_setup
	__size_of_setup	equ	__end_of_setup-_setup
	
_setup:	
;incstack = 0
	callstack 5
; Regs used in _setup: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	63
	
l746:	
	movlw	low(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	65
	
l748:	
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	66
	
l750:	
	movlw	low(07h)
	movwf	(25)	;volatile
	line	67
	bsf	status, 5	;RP0=1, select bank1
	clrf	(159)^080h	;volatile
	line	69
	
l752:	
	fcall	_config_pwm
	line	70
	
l754:	
	fcall	_config_gpio
	line	71
	
l55:	
	return
	callstack 0
GLOBAL	__end_of_setup
	__end_of_setup:
	signat	_setup,89
	global	_config_pwm

;; *************** function _config_pwm *****************
;; Defined at:
;;		line 29 in file "02_pwm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
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
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_set_duty_cycle
;; This function is called by:
;;		_setup
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1,group=0
	line	29
global __ptext2
__ptext2:	;psect for function _config_pwm
psect	text2
	file	"02_pwm.c"
	line	29
	global	__size_of_config_pwm
	__size_of_config_pwm	equ	__end_of_config_pwm-_config_pwm
	
_config_pwm:	
;incstack = 0
	callstack 5
; Regs used in _config_pwm: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	30
	
l730:	
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1066/8)^080h,(1066)&7	;volatile
	line	32
	
l732:	
	movlw	low(045h)
	movwf	(146)^080h	;volatile
	line	33
	movlw	low(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(21)	;volatile
	line	18
	movlw	018h
	movwf	(_pwm_value)
	movlw	01h
	movwf	((_pwm_value))+1
	line	36
	
l734:	
	clrf	(_increment)
	line	38
	
l736:	
	movf	(_pwm_value+1),w
	movwf	(set_duty_cycle@value+1)
	movf	(_pwm_value),w
	movwf	(set_duty_cycle@value)
	fcall	_set_duty_cycle
	line	40
	
l738:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(12),1	;volatile
	line	41
	
l740:	
	bcf	(18),1	;volatile
	line	42
	
l742:	
	bcf	(18),0	;volatile
	line	43
	
l744:	
	bsf	(18),2	;volatile
	line	46
	
l46:	
	line	45
	btfss	(12),1	;volatile
	goto	u91
	goto	u90
u91:
	goto	l46
u90:
	
l48:	
	line	48
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1066/8)^080h,(1066)&7	;volatile
	line	49
	
l49:	
	return
	callstack 0
GLOBAL	__end_of_config_pwm
	__end_of_config_pwm:
	signat	_config_pwm,89
	global	_config_gpio

;; *************** function _config_gpio *****************
;; Defined at:
;;		line 51 in file "02_pwm.c"
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
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_setup
;; This function uses a non-reentrant model
;;
psect	text3,local,class=CODE,delta=2,merge=1,group=0
	line	51
global __ptext3
__ptext3:	;psect for function _config_gpio
psect	text3
	file	"02_pwm.c"
	line	51
	global	__size_of_config_gpio
	__size_of_config_gpio	equ	__end_of_config_gpio-_config_gpio
	
_config_gpio:	
;incstack = 0
	callstack 6
; Regs used in _config_gpio: []
	line	53
	
l684:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1064/8)^080h,(1064)&7	;volatile
	line	56
	bcf	(129)^080h,7	;volatile
	line	58
	bsf	(1069/8)^080h,(1069)&7	;volatile
	line	59
	bsf	(1197/8)^080h,(1197)&7	;volatile
	line	60
	
l52:	
	return
	callstack 0
GLOBAL	__end_of_config_gpio
	__end_of_config_gpio:
	signat	_config_gpio,89
	global	_loop

;; *************** function _loop *****************
;; Defined at:
;;		line 73 in file "02_pwm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          3       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_set_duty_cycle
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text4,local,class=CODE,delta=2,merge=1,group=0
	line	73
global __ptext4
__ptext4:	;psect for function _loop
psect	text4
	file	"02_pwm.c"
	line	73
	global	__size_of_loop
	__size_of_loop	equ	__end_of_loop-_loop
	
_loop:	
;incstack = 0
	callstack 6
; Regs used in _loop: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	74
	
l756:	
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(5),5	;volatile
	goto	u101
	goto	u100
u101:
	goto	l760
u100:
	line	75
	
l758:	
	asmopt push
asmopt off
movlw	130
movwf	((??_loop+0)+0+1),f
	movlw	221
movwf	((??_loop+0)+0),f
	u157:
decfsz	((??_loop+0)+0),f
	goto	u157
	decfsz	((??_loop+0)+0+1),f
	goto	u157
	nop2
asmopt pop

	line	78
	
l760:	
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(5),5	;volatile
	goto	u111
	goto	u110
u111:
	goto	l64
u110:
	line	79
	
l762:	
	movlw	01h
	subwf	(_pwm_value+1),w
	movlw	018h
	skipnz
	subwf	(_pwm_value),w
	skipc
	goto	u121
	goto	u120
u121:
	goto	l768
u120:
	line	80
	
l764:	
	asmopt push
asmopt off
movlw  2
movwf	((??_loop+0)+0+2),f
movlw	134
movwf	((??_loop+0)+0+1),f
	movlw	153
movwf	((??_loop+0)+0),f
	u167:
decfsz	((??_loop+0)+0),f
	goto	u167
	decfsz	((??_loop+0)+0+1),f
	goto	u167
	decfsz	((??_loop+0)+0+2),f
	goto	u167
asmopt pop

	line	81
	
l766:	
	clrf	(_increment)
	line	84
	
l768:	
	movf	(_pwm_value+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(0)^80h
	subwf	btemp+1,w
	skipz
	goto	u135
	movlw	01h
	subwf	(_pwm_value),w
u135:

	skipnc
	goto	u131
	goto	u130
u131:
	goto	l774
u130:
	line	85
	
l770:	
	asmopt push
asmopt off
movlw  2
movwf	((??_loop+0)+0+2),f
movlw	134
movwf	((??_loop+0)+0+1),f
	movlw	153
movwf	((??_loop+0)+0),f
	u177:
decfsz	((??_loop+0)+0),f
	goto	u177
	decfsz	((??_loop+0)+0+1),f
	goto	u177
	decfsz	((??_loop+0)+0+2),f
	goto	u177
asmopt pop

	line	86
	
l772:	
	clrf	(_increment)
	incf	(_increment),f
	line	89
	
l774:	
	movf	((_increment)),w
	btfsc	status,2
	goto	u141
	goto	u140
u141:
	goto	l778
u140:
	line	19
	
l776:	
	movlw	01Ch
	addwf	(_pwm_value),f
	skipnc
	incf	(_pwm_value+1),f
	movlw	0
	addwf	(_pwm_value+1),f
	line	91
	goto	l780
	line	19
	
l778:	
	movlw	0E4h
	addwf	(_pwm_value),f
	skipnc
	incf	(_pwm_value+1),f
	movlw	0FFh
	addwf	(_pwm_value+1),f
	line	95
	
l780:	
	movf	(_pwm_value+1),w
	movwf	(set_duty_cycle@value+1)
	movf	(_pwm_value),w
	movwf	(set_duty_cycle@value)
	fcall	_set_duty_cycle
	line	97
	
l782:	
	asmopt push
asmopt off
movlw  2
movwf	((??_loop+0)+0+2),f
movlw	134
movwf	((??_loop+0)+0+1),f
	movlw	153
movwf	((??_loop+0)+0),f
	u187:
decfsz	((??_loop+0)+0),f
	goto	u187
	decfsz	((??_loop+0)+0+1),f
	goto	u187
	decfsz	((??_loop+0)+0+2),f
	goto	u187
asmopt pop

	line	99
	
l64:	
	return
	callstack 0
GLOBAL	__end_of_loop
	__end_of_loop:
	signat	_loop,89
	global	_set_duty_cycle

;; *************** function _set_duty_cycle *****************
;; Defined at:
;;		line 24 in file "02_pwm.c"
;; Parameters:    Size  Location     Type
;;  value           2    0[COMMON] unsigned short 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         0       0       0
;;      Temps:          2       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_config_pwm
;;		_loop
;; This function uses a non-reentrant model
;;
psect	text5,local,class=CODE,delta=2,merge=1,group=0
	line	24
global __ptext5
__ptext5:	;psect for function _set_duty_cycle
psect	text5
	file	"02_pwm.c"
	line	24
	global	__size_of_set_duty_cycle
	__size_of_set_duty_cycle	equ	__end_of_set_duty_cycle-_set_duty_cycle
	
_set_duty_cycle:	
;incstack = 0
	callstack 5
; Regs used in _set_duty_cycle: [wreg+status,2+status,0+btemp+1]
	line	25
	
l726:	
	movf	(set_duty_cycle@value+1),w
	movwf	(??_set_duty_cycle+0)+0+1
	movf	(set_duty_cycle@value),w
	movwf	(??_set_duty_cycle+0)+0
	clrc
	rrf	(??_set_duty_cycle+0)+1,f
	rrf	(??_set_duty_cycle+0)+0,f
	clrc
	rrf	(??_set_duty_cycle+0)+1,f
	rrf	(??_set_duty_cycle+0)+0,f
	movf	0+(??_set_duty_cycle+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	line	26
	
l728:	
	movf	(set_duty_cycle@value),w
	movwf	(??_set_duty_cycle+0)+0
	movlw	(04h)-1
u85:
	clrc
	rlf	(??_set_duty_cycle+0)+0,f
	addlw	-1
	skipz
	goto	u85
	clrc
	rlf	(??_set_duty_cycle+0)+0,w
	movwf	btemp+1
	movf	btemp+1,w
	iorwf	(21),f	;volatile
	line	27
	
l43:	
	return
	callstack 0
GLOBAL	__end_of_set_duty_cycle
	__end_of_set_duty_cycle:
	signat	_set_duty_cycle,4217
global	___latbits
___latbits	equ	0
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp+0
	end
