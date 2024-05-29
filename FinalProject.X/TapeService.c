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
#include <stdio.h>
#include "Motors.h"
#include "IO_Ports.h"

#define TIMER_1_TICKS 5

static uint8_t MyPriority;

uint8_t InitTapeService(uint8_t Priority) {
    ES_Timer_InitTimer(TAPE_SERVICE_TIMER, TIMER_1_TICKS);

    ES_Event ThisEvent;

    MyPriority = Priority;
    
    //Setup tape sensors pins
    PORTZ06_TRIS = 1;  //TapeLeft
    PORTZ08_TRIS = 1;  //TapeTopLeft
    PORTZ05_TRIS = 1;  //TapeTopRight 
    PORTZ07_TRIS = 1;  //TapeRight
    //PORTZ09_TRIS = 1;  //TapeBackRight
    //PORTZ11_TRIS = 1;  //TapeBackLeft

    ThisEvent.EventType = ES_INIT;
    if (ES_PostToService(MyPriority, ThisEvent) == TRUE) {
        return TRUE;
    } else {
        return FALSE;
    }
}

uint8_t PostTapeService(ES_Event ThisEvent) {
    return ES_PostToService(MyPriority, ThisEvent);
}

ES_Event RunTapeService(ES_Event ThisEvent) {
    ES_Event ReturnEvent;
    ReturnEvent.EventType = ES_NO_EVENT;
    static uint8_t lastEvent = 0x00;
    uint8_t curEvent;

    int TapeLeft = PORTZ06_BIT;
    //printf("TapeLeft: %d\r\n", TapeLeft);
    int TapeTopLeft = PORTZ08_BIT;
    //printf("TapeTopLeft: %d\r\n", TapeTopLeft);
    int TapeTopRight = PORTZ05_BIT;
    //printf("TapeTopRight: %d\r\n", TapeTopRight);
    int TapeRight = PORTZ07_BIT;
    //printf("TapeRight: %d\r\n", TapeRight);
    int TapeBackRight = PORTZ09_BIT;
    //printf("TapeBackRight: %d\r\n", TapeBackRight);
    int TapeBackLeft = PORTZ11_BIT;  
    //printf("TapeBackLeft: %d\r\n", TapeBackLeft);

    
    switch (ThisEvent.EventType) {
        case ES_INIT:
            break;
        case ES_TIMERACTIVE:
            //printf("Timer\r\n");
        case ES_TIMERSTOPPED:
            break;
        case ES_TIMEOUT:
            ES_Timer_InitTimer(TAPE_SERVICE_TIMER, TIMER_1_TICKS); // runs every 5ms
            curEvent = 0x00;

            // check for Left Tape
            if (TapeLeft) {
                //printf("Left reading: %d\r\n", TapeLeft);
                curEvent |= (1 << 0);
            } else {
                //printf("Left reading: %d\r\n", TapeLeft);
                curEvent &= ~(1 << 0);
            }

            // check for Front Left Tape
            if (TapeTopLeft) {
                //printf("Top Left reading: %d\r\n", TapeTopLeft);
                curEvent |= (1 << 1);
            } else {
                //printf("Top Left reading: %d\r\n", TapeTopLeft);
                curEvent &= ~(1 << 1);
            }

            // check for Front Right Tape
            if (TapeTopRight) {
                //printf("Top Right reading: %d\r\n", TapeTopRight);
                curEvent |= (1 << 2);
            } else {
                //printf("Top Right reading: %d\r\n", TapeTopRight);
                curEvent &= ~(1 << 2);
            }

            // check for Right Tape
            if (TapeRight) {
                //printf("Right reading: %d\r\n", TapeRight);
                curEvent |= (1 << 3);
            } else {
                //printf("Right reading: %d\r\n", TapeRight);
                curEvent &= ~(1 << 3);
            }

            if (TapeBackRight) {
                curEvent |= (1 << 4);
            } else {
                curEvent &= ~(1 << 4);
            }

            //check for Back Left Tape
            if (TapeBackLeft) {
                curEvent |= (1 << 5);
            } else {
                curEvent &= ~(1 << 5);
            }

            // compare previous and current values
            if (lastEvent != curEvent) {
                ReturnEvent.EventType = TAPE_STATUS_CHANGE;
                ReturnEvent.EventParam = curEvent;

                lastEvent = curEvent;
                PostRoboTopHSM(ReturnEvent);
                //PostTapeService(ReturnEvent);
            }
            break;

        default:
            printf("\r\nEvent: %s\tParam: 0x%X",
            EventNames[ThisEvent.EventType], ThisEvent.EventParam);
            break;
    }
    return ReturnEvent;
}