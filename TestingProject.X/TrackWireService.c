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
#include "TrackWireService.h"
#include <stdio.h>
#include "Motors.h"
#define TIMER_7_TICKS 5
#define TW_TRIGGER_HIGH 0000
#define TW_TRIGGER_LOW  0000
static uint8_t lastEvent  = 0;
static uint8_t MyPriority;

uint8_t InitTWService(uint8_t Priority)
{
    ES_Timer_InitTimer(TRACK_WIRE_SERVICE_TIMER, TIMER_7_TICKS);
    
    ES_Event ThisEvent;

    MyPriority = Priority;
    //Setup Beacon Detector Pin (PORT V7)
    AD_Init();
    AD_AddPins(AD_PORTW8);
    
    ThisEvent.EventType = ES_INIT;
    if (ES_PostToService(MyPriority, ThisEvent) == TRUE) {
        return TRUE;
    } else {
        return FALSE;
    }
}

uint8_t PostTWService(ES_Event ThisEvent)
{
    return ES_PostToService(MyPriority, ThisEvent);
}



ES_Event RunTWService(ES_Event ThisEvent) {
    ES_Event ReturnEvent;
    ReturnEvent.EventType = ES_NO_EVENT;
    //uint8_t curEvent;
    static uint8_t lastEvent  = 0;
    uint16_t curTWRead;
    switch(ThisEvent.EventType){
        case ES_INIT:
            break;
        case ES_TIMERACTIVE:
            break;
        case ES_TIMERSTOPPED:
            break;
        case ES_TIMEOUT:
            curTWRead = AD_ReadADPin(AD_PORTW8);
            //Return change event if current read goes above threshold or vice versa!
            if (curTWRead > TW_TRIGGER_HIGH && lastEvent < TW_TRIGGER_LOW){
                ReturnEvent.EventType = TRACK_WIRE_STATUS_CHANGE;
                lastEvent = curTWRead;
            }
            else if (curTWRead > TW_TRIGGER_LOW && lastEvent > TW_TRIGGER_HIGH){
                ReturnEvent.EventType = TRACK_WIRE_STATUS_CHANGE;
                lastEvent = curTWRead;
            }
            ES_Timer_InitTimer(TRACK_WIRE_SERVICE_TIMER, TIMER_7_TICKS);
            break;
        default:
            printf("\r\nEvent: %s\tParam: 0x%X",
            EventNames[ThisEvent.EventType], ThisEvent.EventParam);
            break;
    }
    return ReturnEvent;
}