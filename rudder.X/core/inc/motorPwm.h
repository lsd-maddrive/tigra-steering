#ifndef MOTORPWM_H
#define	MOTORPWM_H

#include <xc.h>
#include "math.h"


#ifndef FOSC
    #define FOSC 64487500UL
    #define FCY (FOSC/2)
#endif
#include <libpic30.h>
#define L1_SET LATBbits.LATB4=1
#define L2_SET LATBbits.LATB2=1

#define L1_RESET LATBbits.LATB4=0
#define L2_RESET LATBbits.LATB2=0

#define H1_PWM OC1R
#define H2_PWM OC2R

typedef enum
{
    DIRECTION_FORWARD,
    DIRECTION_BACKWARD,
    DIRECTION_IDLE
}Motor_direction_t;

void PWM_Init(void);
void setMotorPwmDuty(int16_t duty);

#endif	/* MOTORPWM_H */

