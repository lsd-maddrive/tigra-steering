#ifndef MOTORPWM_H
#define	MOTORPWM_H

#include <xc.h>
#include "math.h"

#define L1_SET LATBbits.LATB4=1
#define L2_SET LATBbits.LATB2=1

#define L1_RESET LATBbits.LATB4=0
#define L2_RESET LATBbits.LATB2=0

#define H1_PWM OC1R
#define H2_PWM OC2R


void PWM_Init(void);
void setMotorPwmDuty(int16_t duty);

#endif	/* MOTORPWM_H */

