

/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "BOARD.h"
#include "AD.h"
#include "ES_Configure.h"
#include "ES_Framework.h"
#include "TrackWireService.h"
#include <stdio.h>

//THRESHOLDS
#define TW_TICKS 5
#define TW_TRIGGER_HIGH 270
#define TW_TRIGGER_LOW  250


static uint8_t lastEvent  = 0;
static uint8_t MyPriority;

uint8_t InitTWService(uint8_t Priority)
{
    
    ES_Event ThisEvent;

    MyPriority = Priority;
    //Setup Beacon Detector Pin (PORT W8)
    AD_Init();
    AD_AddPins(AD_PORTW8);
    
    //Init timer
    //ES_Timer_InitTimer(TRACK_WIRE_SERVICE_TIMER, TW_TICKS);
    
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
    uint8_t curEvent;
    static uint8_t lastEvent  = 0;
    
    uint16_t TWRead = AD_ReadADPin(AD_PORTW8); //read trackwire from port
    //printf("TWRead = %d\r\n", TWRead);
    switch(ThisEvent.EventType){
        case ES_INIT:
            break;
               /*
        case ES_TIMEOUT:
            //Reset timer
            ES_Timer_InitTimer(TRACK_WIRE_SERVICE_TIMER, TW_TICKS);
            
            //Track wire is detected if within certain bounds
            if (TWRead < TW_TRIGGER_HIGH && TWRead > TW_TRIGGER_LOW){
                curEvent = TRACK_WIRE_FOUND;
            }
            else {
                curEvent = TRACK_WIRE_NOT_DETECTED;
            }
            
             // compare previous and current values
            if (lastEvent != curEvent) {
                ReturnEvent.EventType = curEvent;
                ReturnEvent.EventParam = TWRead;
                lastEvent = curEvent;
                PostRoboTopHSM(ReturnEvent);
                //PostTapeService(ReturnEvent);
            }
            break;
            */
        default:
            printf("\r\nEvent: %s\tParam: 0x%X",
            EventNames[ThisEvent.EventType], ThisEvent.EventParam);
            break;
    }
    return ReturnEvent;
}