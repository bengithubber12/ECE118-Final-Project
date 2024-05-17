/*
 * File:   RoboMain.c
 * Author: bgoldbla
 *
 * Created on May 14, 2024, 9:47 PM
 */


#include "xc.h"
#include "ROBO.h"
#include "pwm.h"
#include "AD.h"
#include <inttypes.h>
//#include "ES_Timers.h"
//#include "ES_Configure.h"
#include "BOARD.h"
#include <stdio.h>
#include "LED.h"


#include <BOARD.h>
#include "ROBO.h"
#include <xc.h>
#include <stdio.h>
#include "ES_Configure.h"
#include "ES_Framework.h"

void main(void)
{
    ES_Return_t ErrorType;

    BOARD_Init();
    ROBO_Init();
    printf("Starting ES Framework Template\r\n");
    printf("using the 2nd Generation Events & Services Framework\r\n");


    // Your hardware initialization function calls go here

    // now initialize the Events and Services Framework and start it running
    ErrorType = ES_Initialize();
    if (ErrorType == Success) {
        ErrorType = ES_Run();

    }
    //if we got to here, there was an error
    switch (ErrorType) {
    case FailedPointer:
        printf("Failed on NULL pointer");
        break;
    case FailedInit:
        printf("Failed Initialization");
        break;
    default:
        printf("Other Failure: %d", ErrorType);
        break;
    }
    while (1){
           /*
       uint16_t topRight=  AD_ReadADPin(AD_PORTW6);
       uint16_t right=  AD_ReadADPin(AD_PORTW4);
       uint16_t topLeft=  AD_ReadADPin(AD_PORTW3);
       uint16_t left=  AD_ReadADPin(AD_PORTW5);
       
       if (topRight < 20) {
           LED_SetBank(LED_BANK1, 0x1);
       } else if (right < 20){
           LED_SetBank(LED_BANK1, 0x2);
       } else if (topLeft < 20) {
           LED_SetBank(LED_BANK1, 0x4);
       } else if (left < 20) {
           LED_SetBank(LED_BANK1, 0x8);
       } else {
           LED_SetBank(LED_BANK1, 0x0);
       }
        **/
       //printf("TopRight: %d\r\n", topRight);
       //printf("Right: %d\r\n", right);
       //printf("TopLeft: %d\r\n", topLeft);
       //printf("Left: %d\r\n", left);
       //RoboBackLeftTurn();
    }

};

