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

static float fsign(float a);

#endif	/* CONTROLLERS_H */

