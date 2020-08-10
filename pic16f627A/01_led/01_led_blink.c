#include <xc.h>

#define PORTA_RA0 PORTAbits.RA0

void setup( void ){
	PORTA = 0;			// clear port latches
	CMCON = 7;			// turn comparators off, enable related pins for I/O
	TRISA = 0xFE;		// only RA0 is output
}

void loop () {
	PORTA_RA0 = 1;			// conmute pin on and off
	asm( "nop");
	PORTA_RA0 = 0;
}

void main( void) {
	setup();
	
	while( 1) {
		loop();
	}
}
