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
//#include "ES_Timers.h"
//#include "ES_Configure.h"
#include "BOARD.h"
#include <stdio.h>

int main(void) {
    ROBO_Init();
    BOARD_Init();
    AD_Init();
    PWM_Init();
    PWM_AddPins(PWM_PORTY10);
    PWM_AddPins(PWM_PORTY04);
    //int time = ES_Timer_GetTime();
    int state = 0;
    while(1){
            RoboLeftMtrSpeed(100);
            RoboRightMtrSpeed(100);
    }
    return 0;
}
