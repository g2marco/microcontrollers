#include <xc.h>


void config_timer0( unsigned char prescaler, unsigned char period) {
    T0CS = 0

    CLRWDT;

    OPTION_REG = OPTION_REG & b’11110000’;
    OPTION_REG = OPTION_REG | prescaler  ;

    TMR0 = 0;
}

void init_timer2() {
    TMR0 = 0;

    T0IF = 0;
    T0IE = 1;
}