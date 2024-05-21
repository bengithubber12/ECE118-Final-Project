/*
 * File: BumperService.c
 * Author: Jesus Castro
 * 
 */

/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "BOARD.h"
#include "IO_Ports.h"
#include "ES_Configure.h"
#include "ES_Framework.h"
#include "BumperService.h"
#include <stdio.h>
#include <xc.h>
#include "ROBO.h"

#define BUMPER_TIMER_TICKS 5
//#define FLB PORTX03_BIT
//#define BLB PORTX04_BIT
//#define FRB PORTX05_BIT
//#define BRB PORTX06_BIT

#define FLEFT_BUMP_MASK 1
#define FRIGHT_BUMP_MASK 2
#define FRONT_BUMPERS 3
#define BRIGHT_BUMP_MASK 4
#define BLEFT_BUMP_MASK 8
#define BACK_BUMPERS 12

static uint8_t MyPriority;

uint8_t InitBumperService(uint8_t Priority)
{
    ES_Timer_InitTimer(BUMPER_SERVICE_TIMER, BUMPER_TIMER_TICKS);
   
    ES_Event ThisEvent;

    MyPriority = Priority;
    //Setup bumper pins
    //IO_PortsSetPortInputs(PORTX, PIN3);
    //IO_PortsSetPortInputs(PORTX, PIN4);
    //IO_PortsSetPortInputs(PORTX, PIN5);
    //IO_PortsSetPortInputs(PORTX, PIN6);
    PORTX03_TRIS = 1;  //front left
    PORTX04_TRIS = 1;  //back left
    PORTX05_TRIS = 1;  //front right
    PORTX06_TRIS = 1;  //back right

    ThisEvent.EventType = ES_INIT;
    if (ES_PostToService(MyPriority, ThisEvent) == TRUE) {
        return TRUE;
    } else {
        return FALSE;
    }
}

uint8_t PostBumperService(ES_Event ThisEvent)
{
    return ES_PostToService(MyPriority, ThisEvent);
}


ES_Event RunBumperService(ES_Event ThisEvent) {
    ES_Event ReturnEvent;
    ReturnEvent.EventType = ES_NO_EVENT;
    static uint8_t lastEvent  = NO_BUMPER_EVENT;
    uint8_t curEvent;
    
    //array of all readings 
    unsigned char bumperRead = ((PORTX04_BIT << 3) | ((PORTX06_BIT << 2) | ((PORTX05_BIT << 1) | PORTX03_BIT)));
    //uint16_t bumperRead = IO_PortsReadPort(PORTX);
    
    switch(ThisEvent.EventType){
        case ES_INIT:
            break;
        case ES_TIMERACTIVE:
            break;
        case ES_TIMERSTOPPED:
            break;
        case ES_TIMEOUT:
            ES_Timer_InitTimer(BUMPER_SERVICE_TIMER, BUMPER_TIMER_TICKS); // runs every 5ms
            
            if (bumperRead & 0){
                //printf("No bumpers read.\r\n");
                curEvent = NO_BUMPER_EVENT;
            }
            else if (bumperRead & FLEFT_BUMP_MASK) {
                //printf("FLB Triggered.\r\n");
                curEvent = FLB_EVENT;
            }
            else if (bumperRead & FRIGHT_BUMP_MASK) {
                //printf("FRB Triggered.\r\n");
                curEvent = FRB_EVENT;
            }
            else if (bumperRead & BRIGHT_BUMP_MASK) {
                //printf("BRB Triggered.\r\n");
                curEvent = BRB_EVENT;
            }
            else if (bumperRead & BLEFT_BUMP_MASK) {
               // printf("BLB Triggered.\r\n");
                curEvent = BLB_EVENT;
            }
            else if (bumperRead & FRONT_BUMPERS) {
                //printf("Front bumpers Triggered\r\n");
                curEvent = FLB_EVENT;
            }

            // compare previous and current values
            if (lastEvent != curEvent){
                ReturnEvent.EventType = curEvent;
                ReturnEvent.EventParam = bumperRead;
                lastEvent = curEvent;
                //PostRoboTopHSM(ReturnEvent);
                PostBumperService(ReturnEvent);
            }
            break;

        default:
             printf("\r\nEvent: %s\tParam: 0x%X",
                EventNames[ThisEvent.EventType], ThisEvent.EventParam);
             break;
    }
    return ReturnEvent;
}
