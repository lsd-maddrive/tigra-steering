#include "main.h"

float refCurrent=15;
float refPosition=0;
int8_t receivedangle;
#define POSITION_LOOP 1
int16_t meascurrent;

PIDHandle_t currentLoopPID=
{
    .kp=250,
    .ki=2,
    .kd=0,
    .prevError=0,
    .integralTerm=0,
    .integralSaturation=1000,
    .outSaturation=1500
};

PIDHandle_t positionLoopPID=
{ 
    .kp=0.2,
    .ki=0.008,
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
    float currentPosition;
    float current_2;
    float positionError;
    static int32_t sum,sumiddle;
    static int32_t sum_i[5];
    int16_t pwmDuty;
    uint8_t transmittData[5];
    k=k+1;
    if(k==500)
    {
        currentPosition=180-(float)(ADC_read(8)*0.08789);
        #if POSITION_LOOP
        positionError=refPosition-currentPosition;
        if(f_abs(positionError)<1.5) 
        {
            positionError=0;
            PIDClear(&positionLoopPID);
        }
        refCurrent=PIDController(&positionLoopPID,positionError);
        #endif
        k=0;
    }
    if(i<50)
    {
        i++;
        meascurrent=adcMeasureMotorCurrent();
        sumiddle=meascurrent+sumiddle;
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
        current_2=(float)sum/(ADC_TO_AMP*250);
        uartTransmitt(sum);
        pwmDuty=(int16_t)PIDController(&currentLoopPID,(float)(refCurrent-current_2));
        setMotorPwmDuty(pwmDuty);
        sumiddle=0;
        sum=0;
        i=0;
    }
    _T1IF = 0;
}
//void __attribute__ ((interrupt, no_auto_psv)) _U2RXInterrupt(void) {
//	 receivedangle= U2RXREG;
//	IFS1bits.U2RXIF = 0;
//}



int main() 
{
    uint16_t k;
    CLOCK_Initialize();
    initUART();   
    ADC_init();
    __delay_ms(100);
    PWM_Init();
    adcCalibrationCurrentChannel();
    setup_tmr1 ();
//    setMotorPwmDuty(-1500);
    while(1)    
    {
            
    }
}