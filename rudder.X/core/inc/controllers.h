#ifndef CONTROLLERS_H
#define	CONTROLLERS_H

#include "xc.h"
#include "math.h"

typedef struct
{
    float kp;
    float ki;
    float kd;
    float prevError;
    float integralTerm;
    float integralSaturation;
    float outSaturation;
}PIDHandle_t;

void PIDClear(PIDHandle_t * PID);
float f_abs(float a);
float f_sign(float a);
float PIDController(PIDHandle_t * PID,float error);
#endif	/* CONTROLLERS_H */

