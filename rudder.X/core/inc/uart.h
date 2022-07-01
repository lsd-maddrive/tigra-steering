#ifndef UART_H
#define	UART_H

#include <xc.h>

#define UART2_TX_TRIS TRISCbits.TRISC6
#define UART2_RX_TRIS TRISCbits.TRISC7
#define UART1_TX_TRIS TRISGbits.TRISG6
#define UART1_RX_TRIS TRISCbits.TRISC10

void initUART();
void initUART_1();
void uartTransmitt(int32_t data);
void uartTransmittBuff(uint8_t* data,uint16_t size);
int8_t uartget (void);
void uartTransmittcurrentPosition(int8_t curpos);

#endif	
