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


int main(void) {
    ROBO_Init();
    BOARD_Init();
    AD_Init();
    LED_Init();
    PWM_Init();
    PWM_AddPins(PWM_PORTY12);
    PWM_AddPins(PWM_PORTY04);
    
    LED_AddBanks(LED_BANK1);
    
    //AD_AddPins(AD_PORTW6);
    //AD_AddPins(AD_PORTW4);
    //AD_AddPins(AD_PORTW3);
    //AD_AddPins(AD_PORTW5);
    //int time = ES_Timer_GetTime();
    //int state = 0
 
    while(1){
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
       RoboBackLeftTurn();
     }
    
    return 0;
}
