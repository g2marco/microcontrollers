
#ifndef _device_pinout_
#define _device_pinout_

/**
 *  Pin definition
 */

#define config_switchA  TRISIO0 = 1         // GPIO1 is input
#define switchA         GP1

#define config_outputA  TRISIO0 = 0        // GPIO0 is output
#define outputA         GP0

/*

#define GPIO0 			GPIObits.GP0
#define GPIO5 			GPIObits.GP5

*/

#define raw_XXX  GP1


#endif



