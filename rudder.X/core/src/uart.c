#include "uart.h"

void initUART()
{
    
UART2_RX_TRIS = 1;
RPINR19bits.U2RXR = 54;                 //RC7 input pin for uart2 receiver 
RPOR5bits.RP55R = 3;                    //RC6 output pin for uart2 transmitter
U2BRG = 17;                         //Baud 
U2MODEbits.STSEL = 0;                   // One Stop bit
U2MODEbits.PDSEL = 0;                   //8-bit data, no parity
U2MODEbits.BRGH = 1;                    //HIGH speed 
U2MODE =0;
U2MODEbits.UARTEN = 1;                  //Enable UART
U2STAbits.UTXEN = 1;                    //Enable UART TX  Transmit is enabled, U2TX pin is controlled by UART2
U2STAbits.URXISEL=0;                    //Interrupt is set when any character is received and transferred from the UxRSR to the receive buffer receive buffer has one or more characters
IEC1bits.U2RXIE=1;                      //Enable Rx interrupt
IPC7bits.U2RXIP2=1;                     //Interrupt priority high
IFS1bits.U2RXIF=0;                      //Interrupt flag
}
void initUART_1()
{
    
UART1_RX_TRIS = 1;
RPINR18bits.U1RXR = 58;                 //RC10 input pin for uart2 receiver 
RPOR8bits.RP118R = 1;                    //Rg6 output pin for uart2 transmitter 
U1BRG = 17;                         //Baud 
U1MODEbits.STSEL = 0;                   // One Stop bit
U1MODEbits.PDSEL = 0;                   //8-bit data, no parity
U1MODEbits.BRGH = 1;                    //HIGH speed 
U1MODE =0;
U1MODEbits.UARTEN = 1;                  //Enable UART
U1STAbits.UTXEN = 1;                    //Enable UART TX  Transmit is enabled, U2TX pin is controlled by UART2
U1STAbits.URXISEL=0;                    //Interrupt is set when any character is received and transferred from the UxRSR to the receive buffer receive buffer has one or more characters
IEC0bits.U1RXIE=1;                      //Enable Rx interrupt
IPC2bits.U1RXIP2=1;                     //Interrupt priority high
IFS0bits.U1RXIF=0;                      //Interrupt flag

}

    
void uartTransmitt(int32_t data)
{
    while (U2STAbits.UTXBF == 1);
    U2TXREG = 0x0B;  
    while (U2STAbits.UTXBF == 1);
    U2TXREG = data;  
    while (U2STAbits.UTXBF == 1);
    U2TXREG = data>>8;
    while (U2STAbits.UTXBF == 1);
    U2TXREG = data>>16;  
    while (U2STAbits.UTXBF == 1);
    U2TXREG = data>>24;

}
void uartTransmittcurrentPosition(int8_t curpos){
    while (U1STAbits.UTXBF == 1);
    U1TXREG = curpos;
//    while (U2STAbits.UTXBF == 1);
//    U2TXREG = curpos>>8;
}
void uartTransmittBuff(uint8_t* data,uint16_t size)
{
    uint16_t i;
    for(i=0;i<size;i++)
    {
        uartTransmitt(data[i]);
    }
}

int8_t uartget (void)
{
    int8_t receivedangle;
    receivedangle = U1RXREG;
    return receivedangle;
}