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
#include "ES_Configure.h"
#include "ES_Framework.h"
#include "BeaconService.h"
#include <stdio.h>
#include "Motors.h"
#define TIMER_5_TICKS 5
#define BEACON_READ_THRESHOLD 0000

static uint8_t lastEvent  = 0;
static uint8_t MyPriority;

uint8_t InitBeaconService(uint8_t Priority)
{
    ES_Timer_InitTimer(BEACON_SERVICE_TIMER, TIMER_5_TICKS);
    
    ES_Event ThisEvent;

    MyPriority = Priority;
    //Setup Beacon Detector Pin (PORT V7)
    AD_Init();
    AD_AddPins(AD_PORTV8);
    
    ThisEvent.EventType = ES_INIT;
    if (ES_PostToService(MyPriority, ThisEvent) == TRUE) {
        return TRUE;
    } else {
        return FALSE;
    }
}

uint8_t PostBeaconService(ES_Event ThisEvent)
{
    return ES_PostToService(MyPriority, ThisEvent);
}



ES_Event RunBeaconService(ES_Event ThisEvent) {
    ES_Event ReturnEvent;
    ReturnEvent.EventType = ES_NO_EVENT;
    //uint8_t curEvent;
    uint16_t curBeaconRead;
    switch(ThisEvent.EventType){
        case ES_INIT:
            break;
        case ES_TIMERACTIVE:
            break;
        case ES_TIMERSTOPPED:
            break;
        case ES_TIMEOUT:
            curBeaconRead = AD_ReadADPin(AD_PORTV8);
            ES_Timer_InitTimer(BEACON_SERVICE_TIMER, TIMER_5_TICKS); // runs every 5ms
            ReturnEvent.EventType = BEACON_STATUS_UPDATE;
            ReturnEvent.EventParam = curEvent;
            break;
        default:
            printf("\r\nEvent: %s\tParam: 0x%X",
            EventNames[ThisEvent.EventType], ThisEvent.EventParam);
            break;
    }
    return ReturnEvent;
}