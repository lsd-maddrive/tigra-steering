#include "controllers.h"

float f_sign(float a)
{
    if(a>=0)
        return 1;
    else if(a<0)
        return -1;
}

float f_abs(float a)
{
    if(a<0) a=-1*a;
    return a;
}


float PIDController(PIDHandle_t * PID,float error)
{
    //float deltaError = error - PID->prevError;
    float controllerOut;
    float integral;
    PID->prevError=error;
    integral=PID->integralTerm*PID->ki;
    PID->integralTerm+=error;
    if(f_abs(integral)>PID->integralSaturation)
    {
        integral=f_sign(integral)*PID->integralSaturation;
    }
    
    
    controllerOut=error*PID->kp+integral;
    if(f_abs(controllerOut)>PID->outSaturation)
    {
        controllerOut=f_sign(controllerOut)*PID->outSaturation;
    }
    return controllerOut;
}

void PIDClear(PIDHandle_t * PID)
{
    PID->integralTerm=0;
    PID->prevError=0;
}
