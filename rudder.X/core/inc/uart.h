#ifndef UART_H
#define	UART_H

#include <xc.h>

#define UART2_TX_TRIS TRISCbits.TRISC6
#define UART2_RX_TRIS TRISCbits.TRISC7

void initUART();
void uartTransmitt(int32_t data);
void uartTransmittBuff(uint8_t* data,uint16_t size);
int8_t uartget (void);
#endif	
