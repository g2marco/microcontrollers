#include <xc.h>
#include <stdbool.h>

#pragma config FOSC  = INTOSCIO
#pragma config WDTE  = OFF
#pragma config PWRTE = OFF
#pragma config MCLRE = OFF
#pragma config CP 	 = OFF
#pragma config CPD 	 = OFF
#pragma config BOREN = OFF
#pragma config IESO  = OFF
#pragma config FCMEN = OFF

#define _XTAL_FREQ 		4000000
#define GPIO0 			GPIObits.GP0
#define GPIO5 			GPIObits.GP5

const unsigned short MAX_PWM_VALUE = 280;
const unsigned short DELTA_PWM = 28;

int pwm_value;
bool increment;

void set_duty_cycle( unsigned short value) {
	CCPR1L   = (unsigned char) (value >> 2);		// duty cycle
	CCP1CON |= (unsigned char) (value << 4);
}

void config_pwm( void) {
	TRISIO2 = 1;

	PR2 = 69;					// pwm period
	CCP1CON = 0x0F;				// pwm mode, active low

	pwm_value = MAX_PWM_VALUE;
	increment = false;

	set_duty_cycle( pwm_value);

	PIR1bits.TMR2IF   = 0;		// timer 2, prescale and activation
	T2CONbits.T2CKPS1 = 0;
	T2CONbits.T2CKPS0 = 0;
	T2CONbits.TMR2ON  = 1;

 	while( PIR1bits.TMR2IF == 0) {	// wait timer 2 overflow
	}

	TRISIO2 = 0;				// CCP1 as output
}

void config_gpio() {
	// output I/O
	TRISIO0 = 0;			// GPIO0 is output

	// input I/O
	OPTION_REGbits.nGPPU = 0;	// general enable pull up

	TRISIO5 = 1;			// GPIO5 pin as input
	WPU5    = 1;			// pull up enabled
}

void setup( void ) {
	TRISIO = 0xFF;		// all GPIO pins as inputs

	GPIO = 0;			// clear port latches
	CMCON0 = 7;			// turn comparators off, enable related pins for I/O
	ANSEL  = 0;

	config_pwm();
	config_gpio();
}

void loop () {
	if (GPIO5 == 0) {					// debounces
		__delay_ms( 100);
	}

	if( GPIO5 == 0) {
		if( pwm_value >= MAX_PWM_VALUE) {
			__delay_ms( 300);
			increment = false;
		}

		if ( pwm_value <= 0) {
			__delay_ms( 300);
			increment = true;
		}

		if ( increment) {
			pwm_value += DELTA_PWM;
		} else {
			pwm_value -= DELTA_PWM;
		}

		set_duty_cycle( pwm_value);

		__delay_ms( 300);
	}
}

void main( void) {
	setup();

	while( 1) {
		loop();
	}
}
