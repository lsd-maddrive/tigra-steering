#include "adc.h"

static uint16_t adcOffset;

void ADC_init()
{
    AD1CON1bits.AD12B = 1; //4 канальный режим АЦП
    AD1CON2bits.VCFG = 0;  //конфигурация опорного напряжения
    AD1CON1bits.FORM = 0; //формат данных
    AD1CON1bits.ADON = 1; //включение АЦП
}

uint16_t ADC_read(uint8_t n)
{
    AD1CHS0bits.CH0SA=n; //выбор входа АЦП
    AD1CHS0bits.CH0NA = 0; //выбор отрицательного входа бита 
    AD1CON1bits.SAMP = 1; // разрешение выборки АЦП( АЦП осуществляет выборку)
    __delay_us(1);
    AD1CON1bits.SAMP = 0;// разрешение выборки АЦП( АЦП удерживает)
    while(!AD1CON1bits.DONE);
    return (ADC1BUF0);
}

void adcCalibrationCurrentChannel(void)
{
    uint32_t adcBuff=0;
    uint16_t k=0;
    for(k=0;k<ADC_CALLIBRATION_COUNT;k++)
    {
        adcBuff+=ADC_read(ADC_CURRENT_CHANNEL);
    }
    adcOffset=adcBuff/ADC_CALLIBRATION_COUNT;
}

int16_t adcMeasureMotorCurrent(void)
{
    int16_t current = ADC_read(ADC_CURRENT_CHANNEL);
    current-=adcOffset;
    return current; 
}