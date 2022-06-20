#include "main.h"

unsigned long int sum_i[5];
unsigned long int sum,sumiddle;

float refCurrent=0;
float refPosition=0;

#define POSITION_LOOP 0

PIDHandle_t currentLoopPID=
{
    .kp=20,
    .ki=5,
    .kd=0,
    .prevError=0,
    .integralTerm=0,
    .integralSaturation=3000,
    .outSaturation=1500
};

PIDHandle_t positionLoopPID=
{ 
    .kp=0.6,
    .ki=0.1,
    .kd=0,
    .prevError=0,
    .integralTerm=0,
    .integralSaturation=10,
    .outSaturation=15
};

void setup_tmr1 (void)
{
    _T1IF = 0;
    _T1IE = 1; 
    IPC0= IPC0 | 0x1000;
    T1CON	 = 0x8000;
  PR1		 = 129;
}

void __attribute__ ((interrupt,no_auto_psv)) _T1Interrupt (void)
{
    static uint16_t k=0,c=0,i=0,a=0;
    float current,currentPosition;
    int16_t pwmDuty;
    //бегущее среднее
    k=k+1;
    if(k==500)
    {
        currentPosition=180-(float)(ADC_read(8)*0.08789);
        #if POSITION_LOOP
        refCurrent=PIDController(&positionLoopPID,refPosition-currentPosition);
        #endif
        k=0;
    }
    if(i<50)
    {
        i++;
        sumiddle=ADC_read(ADC_CURRENT_CHANNEL)+sumiddle;
    }
    if(i==50)
    {
        sum_i[c]=sumiddle;
        c++;
    }
    if(c==5)
    {
        c=0;
    }
    if(i==50)
    {
        for(a=0;a<5;a=a+1)
        {
            sum=sum+sum_i[a];
        }
        current=sum/ADC_TO_AMP;
        pwmDuty=(int16_t)PIDController(&currentLoopPID,refCurrent-current);
        setMotorPwmDuty(pwmDuty);
        sumiddle=0;
        sum=0;
        i=0;
    }
    _T1IF = 0;
}


int main() 
{
    uint16_t k;
    CLOCK_Initialize();
    initUART();   
    ADC_init();
    PWM_Init();
    setup_tmr1 ();
    while(1)    
    {
        
    }
}