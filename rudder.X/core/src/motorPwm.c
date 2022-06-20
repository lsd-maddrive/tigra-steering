#include "motorPwm.h"
static uint16_t pwmSaturation = 1500;

void PWM_Init( void )
{
    TRISBbits.TRISB2 = 0; // Сигналы управления для 
    TRISBbits.TRISB4 = 0; // H - моста.
    L1_RESET;
    L2_RESET;
    RPOR0bits.RP35R = 0b010000;     //Переназначение пина RP35 как OC1
    RPOR2bits.RP39R = 0b010001;     // Переназначение пина RP39 как OC2
    ANSELBbits.ANSB3 = 0;           //Сброс аналогового пина в цифровой
    TRISBbits.TRISB3 = 0;           //RB3 output for OC1
    H1_PWM = 0;
    H2_PWM = 0;
    OC1CON1bits.OCM = 0b110;    // Режим ШИМ с выравниванием по фронту: выход устанавливается на высокий уровень,
    OC2CON1bits.OCM = 0b110;    // когда OCxTMR = 0, и на низкий уровень, когда OCxTMR = OCxR
    // Configure Timer 2 (default timer for output compare)
    PR2 = 6449;
    T2CONbits.TCKPS = 0b00; // Timer 2 prescaler 1:8
    T2CONbits.TON = 1;      // Enable Timer 2
}

void setMotorPwmDuty(int16_t duty)
{
    
    if(duty>0)
    {
        if(abs(duty)>pwmSaturation)
            H1_PWM=pwmSaturation;
        else
            H1_PWM = duty;
        H2_PWM = 0;
        L1_RESET;
        L2_SET;
    }
    else if(duty<0)
    {
        H1_PWM = 0; 
        if(abs(duty)>pwmSaturation)
            H2_PWM = pwmSaturation;
        else
            H2_PWM = abs(duty);
        L1_SET;
        L2_RESET;
    }
    else
    {
        L1_RESET;
        L2_RESET;
        H1_PWM = 0;
        H2_PWM = 0;
    }
}