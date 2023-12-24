import numpy as np
import matplotlib.pyplot as plt


#
#   Configuration params for timer0 ( tmr0, prescaler)
#

fosc = 4e6
tosc = 1 / fosc

#
#
#

prescales = np.array( [2, 4, 8, 16, 32, 64, 128, 256])
tmr0 = np.arange( 0, 256)


for prescale in prescales :
    period     = (pr2 + 1) * 4 * tosc * prescale
    axs[0].plot( pr2, 1 / period, label= 'prescale [' + str( prescale) + ']')


