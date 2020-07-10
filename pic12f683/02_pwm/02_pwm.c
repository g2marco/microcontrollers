#include <xc.h>

#pragma config FOSC  = INTOSCIO
#pragma config WDTE  = OFF
#pragma config PWRTE = OFF
#pragma config MCLRE = OFF
#pragma config CP 	 = OFF
#pragma config CPD 	 = OFF
#pragma config BOREN = OFF
#pragma config IESO  = OFF
#pragma config FCMEN = OFF


#define GPIO0 GPIObits.GP0

void config_pwm( void) {
	TRISIO2 = 1;

	PR2 = 69;					// pwm period
	CCP1CON = 0x0F;				// pwm mode, active low

	CCPR1L   = 140 >> 2;		// duty cycle
	CCP1CON |= (140 << 4);

	PIR1bits.TMR2IF   = 0;		// timer 2, prescale and activation
	T2CONbits.T2CKPS1 = 0;
	T2CONbits.T2CKPS0 = 0;
	T2CONbits.TMR2ON  = 1;

 	while( PIR1bits.TMR2IF == 0) {	// wait timer 2 overflow
	}

	TRISIO2 = 0;				// CCP1 as output
}

void setup( void ){
	GPIO = 0;			// clear port latches
	CMCON0 = 7;			// turn comparators off, enable related pins for I/O
	ANSEL  = 0;

	TRISIO0 = 0;		// only GPIO0 is output

	config_pwm();
}

void loop () {
	GPIO0 = 1;			// conmute pin on and off
	asm( "nop");
	GPIO0 = 0;
}

void main( void) {
	setup();

	while( 1) {
		loop();
	}
}
