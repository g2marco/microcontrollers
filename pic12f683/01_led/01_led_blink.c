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

void setup( void ){
	GPIO = 0;			// clear port latches
	CMCON0 = 7;			// turn comparators off, enable related pins for I/O
	ANSEL  = 0;

	TRISIO0 = 0;		// only GPIO0 is output
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
