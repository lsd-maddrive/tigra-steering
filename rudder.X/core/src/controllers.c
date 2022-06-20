#include "controllers.h"

static float fsign(float a)
{
    if(a>=0)
        return 1;
    else if(a<0)
        return -1;
}


float PIDController(PIDHandle_t * PID,float error)
{
    float deltaError = error - PID->prevError;
    float controllerOut;
    float integral;
    PID->prevError=error;
    integral=PID->integralTerm*PID->ki;
    if(fabs(integral)>PID->integralSaturation)
    {
        integral=fsign(integral)*PID->integralSaturation;
    }
    else
    {
        PID->integralTerm+=error;
    }
    controllerOut=error*PID->kp+integral+deltaError*PID->kd;
    if(fabs(controllerOut)>PID->outSaturation)
    {
        controllerOut=fsign(controllerOut)*PID->outSaturation;
    }
    return controllerOut;
}

void PIDClear(PIDHandle_t * PID)
{
    PID->integralTerm=0;
    PID->prevError=0;
}
