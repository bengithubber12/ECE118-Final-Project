#include "BOARD.h"
#include "xc.h"
#include "ROBO.h"
#include "pwm.h"
#include "AD.h"
#include <inttypes.h>
#include "BOARD.h"
#include <stdio.h>
#include "TapeReader.h"
#include "IO_Ports.h"

int main(void) {
    BOARD_Init();
    AD_Init();
    Tape_Init();
    
    while (1) {
        printf("Tape reading: %d\r\n", (uint16_t)TapeReading());
        printf("Current Top Left Tape Num: %d\r\n", AD_ReadADPin(AD_PORTW3));
        printf("Current Left Tape Num: %d\r\n", AD_ReadADPin(AD_PORTW4));
        printf("Current Top Right Tape Num: %d\r\n", AD_ReadADPin(AD_PORTW5));
        printf("Current Right Tape Num: %d\r\n", AD_ReadADPin(AD_PORTW6));
    }
    return(1);
}
