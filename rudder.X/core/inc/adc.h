#ifndef ADC_H
#define	ADC_H

#include <xc.h>

#ifndef FOSC
    #define FOSC 64487500UL
    #define FCY (FOSC/2)
#endif
#include <libpic30.h>


#define ADC_CURRENT_CHANNEL 7
#define ADC_CALLIBRATION_COUNT 1000
#define ADC_TO_AMP 28//17.745//24.8181818

void ADC_init(void);
uint16_t ADC_read(uint8_t n);

/**
 * @brief   Calibrate current offset
**/
void adcCalibrationCurrentChannel(void);

/**
 * @brief   Measure motor current
 * @return  current in Amp
**/
int16_t adcMeasureMotorCurrent(void);

#endif	/* ADC_H */

