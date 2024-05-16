#include <inttypes.h>
#include "BOARD.h"
#include "AD.h"
#include "ES_Configure.h"
#include "ES_Framework.h"
#include "TapeService.h"
#include <stdio.h>

#define TIMER_1_TICKS 5
#define TAPE_FRB_THRESHOLD 60 // front right back
#define TAPE_FRF_THRESHOLD 60 // front right front 
#define TAPE_FLB_THRESHOLD 60  // front left back
#define TAPE_FLF_THRESHOLD 60  // front left front
#define TAPE_BR_THRESHOLD 60    // back right
#define TAPE_BL_THRESHOLD 60   // back left

static uint8_t MyPriority;

uint8_t InitTapeService(uint8_t Priority)
{
    ES_Event ThisEvent;

    MyPriority = Priority;

    ThisEvent.EventType = ES_INIT;
    if (ES_PostToService(MyPriority, ThisEvent) == TRUE) {
        return TRUE;
    } else {
        return FALSE;
    }
}

uint8_t PostTapeService(ES_Event ThisEvent)
{
    return ES_PostToService(MyPriority, ThisEvent);
}



ES_Event RunTapeService(ES_Event ThisEvent) {
    ES_Event ReturnEvent;
    ReturnEvent.EventType = ES_NO_EVENT;
    uint8_t lastEvent  = 0x00;
    uint8_t curEvent;


    switch(ThisEvent.EventType){
        case ES_INIT:
            break;
        case ES_TIMERACTIVE:
        case ES_TIMERSTOPPED:
            break;
        case ES_TIMEOUT:
            ES_Timer_InitTimer(TAPE_SERVICE_TIMER, TIMER_1_TICKS); // runs every 5ms

            uint16_t TapeFrontRightBack = AD_READ;
            uint16_t TapeFrontRightFront = AD_READ;
            uint16_t TapeFrontLeftBack = AD_READ;
            uint16_t TapeFrontLeftFront = AD_READ;
            uint16_t TapeBackLeft = AD_READ;
            uint16_t TapeBackRight = AD_READ;

            ES_Timer_InitTimer(TAPE_SERVICE_TIMER, TIMER_1_TICKS);

            // check for Front Left Back Tape
            if (TapeFrontLeftBack < TAPE_FLB_THRESHOLD) {
                curEvent = lastEvent | (1 << 6); 
            } else {
                curEvent = lastEvent | ~(1<<6);
            }

            // check for Front Left Front Tape
            if (TapeFrontLeftFront < TAPE_FLF_THRESHOLD) {
                curEvent = lastEvent | (1 << 5); 
            } else {
                curEvent = lastEvent | ~(1<<5);
            }

            // check for Front Right Front Tape
            if (TapeFrontRightFront < TAPE_FRF_THRESHOLD) {
                curEvent = lastEvent | (1 << 4); 
            } else {
                curEvent = lastEvent | ~(1<<4);
            }

            // check for Front Right Back Tape
            if (TapeFrontRightBack < TAPE_FRB_THRESHOLD) {
                curEvent = lastEvent | (1 << 3); 
            } else {
                curEvent = lastEvent | ~(1<<3);
            }

            // Check for Back Right Tape
            if (TapeBackRight < TAPE_BR_THRESHOLD) {
                curEvent = lastEvent | (1 <<2); 
            } else {
                curEvent = lastEvent | ~(1<<2);
            }

            //check for Back Left Tape
            if (TapeBackLeft < TAPE_BL_THRESHOLD) {
                curEvent = lastEvent | (1 << 1); 
            } else {
                curEvent = lastEvent | ~(1<<1);
            }


            // compare previous and current values
            if (lastEvent != curEvent){
                ReturnEvent.EventType = TAPE_STATUS_CHANGE;
                ReturnEvent.EventParam = curEvent;
                lastEvent = curEvent;
            PostTapeService(ReturnEvent);
   
            }
            break;
    }
    return ReturnEvent;
}