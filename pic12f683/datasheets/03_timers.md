# PIC12F683 Timers



## Timers Summary

| Timer  | Bits | Modes          | Clock Source | Prescaler      | Postscaler | Interrupt |
| ------ | ---- | -------------- | ------------ | -------------- | ---------- | --------- |
| Timer0 | 8    | timer /counter |              |                |            |           |
| Timer1 | 16   |                |              |                |            |           |
| Timer2 | 8    | timer          | Fosc/4       | 1:1, 1:4, 1:16 | 1:1 - 1:16 | yes       |



## Timer0



## Timer1



## Timer2

### Operation

- Fosc/4 is feed into Timer2 prescaler
- Every time prescaler overflows, TMR2 is incremented
- When TMR2 matches PR2
  - TMR2 is reset to 00H on the next increment cycle
  - Timer2 postcaler is incremented
- Every time postscaler overflows, timer2 interruption flag is set

### Period Formula

​	$T =  (\frac{1} {Fosc/4} ) * prescaler * period * postcaler $

​	Example: Using Timer2, select prescaler, period and postcaler values for getting a 1ms period  with Fosc = 4 MHz.

​	Solution:    $period = \frac {T \times (Fosc /4) } {(prescaler \times postscaler)}$

​	After tabulating such an expression, the following values are obtained: **period = 25, pre-scaler = 4, post-scaler = 10**

NOTE:

​	By selecting a value of 25 for the period, it allows generating periods from 1m to 10ms by simply multiplying this value

### Initialization

- **T2CON< TMR2ON>* = 1 ** turns on the timer 
- **T2CON< T2CKPS> = XX** sets the prescaler value
- **T2CON< TOUTPS> = XXXX** sets the postscaler value
- **PR2 = period_value** sets Timer2 module period
- **PIE1< TMR2IE > = 1** Timer 2 interrupt enable

````asm
// basic initialization routine
T2CON  = postscaler(4 bits) | on/off (1 bit) | prescaler (1 bit);
TMR2   = 0;
PR2    = NN;
TMR2IF = 0;						// PIR1<TMR2IF> clears timer 2 interruption flag
TMR2IE = 1;						// PIE1<TMR2IE> enables timer 2 interruption
. . .
PEIE   = 1;						// INTCON<PEIE> enables peripheral interruptions
. . . 
ie();							// INTCON<GIE> global interruption enable
````



### T2CON

| U-0  | R/W-0   | R/W-0   | R/W-0   | R/W-0   | R/W-0  | R/W-0  | R/W-0  |
| ---- | ------- | ------- | ------- | ------- | ------ | ------ | ------ |
| ---- | TOUTPS3 | TOUTPS2 | TOUTPS1 | TOUTPS0 | TMR2ON | TCKPS1 | TCKPS0 |

**TOUTPS[3:0]** Timer2 output postscaler

​	**0000** = 1:1 postcaler

​	**1111** = 1:16 postcaler

**TMR2ON** Timer2 on

​	**1**= Timer2 is on

​	**0** = Timer2 is off

**T2CKPS[1:0]** Timer2 clock prescale

​	**00**= pre-scaler is 1

​	**01** = pre-scaler is 4

​	**1X** = pre-scaler is 16