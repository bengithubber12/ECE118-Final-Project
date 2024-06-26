/*
 * File: TemplateService.h
 * Author: J. Edward Carryer
 * Modified: Gabriel H Elkaim
 *
 * Template file to set up a simple service to work with the Events and Services
 * Framework (ES_Framework) on the Uno32 for the CMPE-118/L class. Note that this file
 * will need to be modified to fit your exact needs, and most of the names will have
 * to be changed to match your code.
 *
 * This is provided as an example and a good place to start.
 *
 * Created on 23/Oct/2011
 * Updated on 13/Nov/2013
 */

/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "BOARD.h"
#include "AD.h"
#include "xc.h"
#include "ES_Configure.h"
#include "ES_Framework.h"
#include "TapeService.h"
#include "WallTapeService.h"
#include <stdio.h>
#include "Motors.h"
#include "IO_Ports.h"

#define TIMER_5_TICKS 5

static uint8_t MyPriority;

uint8_t InitWallTapeService(uint8_t Priority) {
    ES_Timer_InitTimer(WALL_TAPE_SERVICE_TIMER, TIMER_5_TICKS);

    ES_Event ThisEvent;

    MyPriority = Priority;
    
    //Setup tape sensors pins
    PORTZ05_TRIS = 1;
    PORTZ08_TRIS = 1;

    ThisEvent.EventType = ES_INIT;
    if (ES_PostToService(MyPriority, ThisEvent) == TRUE) {
        return TRUE;
    } else {
        return FALSE;
    }
}

uint8_t PostWallTapeService(ES_Event ThisEvent) {
    return ES_PostToService(MyPriority, ThisEvent);
}

ES_Event RunWallTapeService(ES_Event ThisEvent) {
    ES_Event ReturnEvent;
    ReturnEvent.EventType = ES_NO_EVENT;
    static uint8_t lastEvent = 0x00;
    uint8_t curEvent;
    switch (ThisEvent.EventType) {
        case ES_INIT:
            break;
        case ES_TIMERACTIVE:
            //printf("Timer\r\n");
            break;
        case ES_TIMERSTOPPED:
            break;
        case ES_TIMEOUT:
            ES_Timer_InitTimer(WALL_TAPE_SERVICE_TIMER, TIMER_5_TICKS); // runs every 5ms
            curEvent =  ((PORTZ05_BIT << 1) | ((PORTZ08_BIT)));
            
            // compare previous and current values
            if (lastEvent != curEvent) {
                ReturnEvent.EventType = WALL_TAPE_STATUS_CHANGE;
                ReturnEvent.EventParam = curEvent;
                lastEvent = curEvent;
                PostRoboTopHSM(ReturnEvent);
                //PostWallTapeService(ReturnEvent);
            }
            break;

        default:
            printf("\r\nEvent: %s\tParam: 0x%X",
            EventNames[ThisEvent.EventType], ThisEvent.EventParam);
            break;
    }
    return ReturnEvent;
}