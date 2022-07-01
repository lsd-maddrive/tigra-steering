#include "main.h"

float refCurrent=-15;
float refPosition;
int8_t receivedangle;
#define POSITION_LOOP 1
int16_t meascurrent;

uint8_t statusFlag=1;

PIDHandle_t currentLoopPID=
{
    .kp=100,//250
    .ki=30,
    .kd=0,
    .prevError=0,
    .integralTerm=0,
    .integralSaturation=4000,
    .outSaturation=4500 
};

PIDHandle_t positionLoopPID=
{ 
    .kp=0.3,
    .ki=0.025,//1
    .kd=0,
    .prevError=0,
    .integralTerm=0,
    .integralSaturation=35,
    .outSaturation=40
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
    float positionError,currentError;
    static int32_t sum,sumiddle;
    static int32_t sum_i[5];
    int16_t pwmDuty;
    static uint8_t positionZeroFlag=1;
    k=k+1;
    if(k==500)
    {
        currentPosition=180-(float)(ADC_read(8)*0.08789);
        uartTransmittcurrentPosition(currentPosition);
//        uartTransmittcurrentPosition(currentPosition);
        #if POSITION_LOOP
        positionError=refPosition-currentPosition;
        if(f_abs(positionError)>5)
        {
            positionZeroFlag=0;
        }
        if(f_abs(positionError)<2) 
        {
            positionError=0;
            PIDClear(&positionLoopPID);
            PIDClear(&currentLoopPID);
            positionZeroFlag=1;

        }
        if(positionZeroFlag)
        {
            positionError=0;
            PIDClear(&positionLoopPID);
            PIDClear(&currentLoopPID);
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
        if(f_abs(current_2)>60)
        {
            setMotorPwmDuty(0);
            statusFlag=0;
        }
        else
        {
//            uartTransmitt(sum);
            currentError=refCurrent-current_2;
            if(f_abs(currentError)<2) 
            {
                currentError=0;
            }
            if(statusFlag==1)
            {
                pwmDuty=(int16_t)PIDController(&currentLoopPID,currentError);
                setMotorPwmDuty(pwmDuty);
            }
        }
        sumiddle=0;
        sum=0;
        i=0;
    }
    _T1IF = 0;
}
void __attribute__ ((interrupt, no_auto_psv)) _U1RXInterrupt(void) {
    refPosition=uartget();
	IFS0bits.U1RXIF = 0;
    }



int main() 
{
    CLOCK_Initialize();
    initUART();
    initUART_1();
    ADC_init();
    __delay_ms(100);
    PWM_Init();
    adcCalibrationCurrentChannel();
    setup_tmr1 ();
//    setMotorPwmDuty(-1000);
    while(1)    
    {
        
    }
}