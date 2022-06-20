#include "uart.h"

void initUART()
{
    UART2_TX_TRIS = 0; 
    UART2_RX_TRIS = 1;
    RPINR19bits.U2RXR = 54;                 //RC6 input pin for uart2 receiver 
    RPOR5bits.RP55R = 3;                    //RC7 output pin for uart2 transmitter
    U2BRG = 17;                         //Baud 
    U2MODEbits.STSEL = 0;                   // One Stop bit
    U2MODEbits.PDSEL = 0;                   //8-bit data, no parity
    U2MODEbits.BRGH = 1;                    //HIGH speed mode
    U2MODE =0;
    U2MODEbits.UARTEN = 1;                  //Enable UART
    U2STAbits.UTXEN = 1;                    //Enable UART TX  Transmit is enabled, U2TX pin is controlled by UART2
    IFS1bits.U2RXIF = 0;                    //Флаг прерывание прbема как я понял
}

void uartTransmitt(uint8_t data)
{
    while (U2STAbits.UTXBF == 1);
    U2TXREG = data;    
}

void uartTransmittBuff(uint8_t* data,uint16_t size)
{
    uint16_t i;
    for(i=0;i<size;i++)
    {
        uartTransmitt(data[i]);
    }
}