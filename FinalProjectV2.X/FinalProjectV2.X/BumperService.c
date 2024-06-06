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
#include "Motors.h"

#define BUMPER_TIMER_TICKS 20

static uint8_t MyPriority;

uint8_t InitBumperService(uint8_t Priority)
{
    ES_Timer_InitTimer(BUMPER_SERVICE_TIMER, BUMPER_TIMER_TICKS);
   
    ES_Event ThisEvent;

    MyPriority = Priority;
    //Setup bottom bumper pins
    PORTX10_TRIS = 1;  //bottom front left
    PORTX11_TRIS = 1;  //bottom back left
    PORTX03_TRIS = 1;  //bottom front right
    PORTX04_TRIS = 1;  //bottom back right
    
    PORTX12_TRIS = 1;  //top front left
    PORTX08_TRIS = 1;  //top back left
    PORTX05_TRIS = 1;  //top front right
    PORTX06_TRIS = 1;  //top back right
    

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
    static uint8_t lastEvent  = 0x00;
    uint8_t curEvent;
    unsigned char bumperRead = 0x00;
    //array of all readings 
    
    
    switch(ThisEvent.EventType){
        case ES_INIT:
            break;
        case ES_TIMERACTIVE:
            break;
        case ES_TIMERSTOPPED:
            break;
        case ES_TIMEOUT:
            ES_Timer_InitTimer(BUMPER_SERVICE_TIMER, BUMPER_TIMER_TICKS); // runs every 5ms
            curEvent = ~((PORTX08_BIT << 7) | ((PORTX06_BIT << 6) | ((PORTX05_BIT << 5) | ((PORTX12_BIT << 4) | ((PORTX11_BIT << 3) | ((PORTX04_BIT << 2) | ((PORTX03_BIT << 1) | ((PORTX10_BIT)))))))));
            // compare previous and current values
            if (lastEvent != curEvent){
                ReturnEvent.EventType = BUMPER_STATUS_CHANGE;
                ReturnEvent.EventParam = curEvent;
                lastEvent = curEvent;
                //printf("BumperRead: %x\r\n", bumperRead);
                PostRoboTopHSM(ReturnEvent);
                //PostBumperService(ReturnEvent);
            }
            break;

        default:
            printf("\r\nEvent: %s\tParam: 0x%X",
            EventNames[ThisEvent.EventType], ThisEvent.EventParam);
            break;
    }
    return ReturnEvent;
}
