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
#include "TapeService.h"
#include <stdio.h>
#include "ROBO.h"

#define TIMER_1_TICKS 5
#define TAPE_FRB_THRESHOLD 100 // front right back
#define TAPE_FRF_THRESHOLD 100 // front right front 
#define TAPE_FLB_THRESHOLD 100  // front left back
#define TAPE_FLF_THRESHOLD 100  // front left front
#define TAPE_BR_THRESHOLD 100    // back right
#define TAPE_BL_THRESHOLD 100   // back left

static uint8_t MyPriority;

uint8_t InitTapeService(uint8_t Priority)
{
   ES_Timer_InitTimer(TAPE_SERVICE_TIMER, TIMER_1_TICKS);
   
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
    static uint8_t lastEvent  = 0x00;
    uint8_t curEvent;
    uint16_t TapeFrontRightBack = AD_ReadADPin(AD_PORTW6);
    //printf("FrontRightBack:%d\r\n", TapeFrontRightBack);
    uint16_t TapeFrontRightFront = AD_ReadADPin(AD_PORTW5);
    //printf("FrontRightFront:%d\r\n", TapeFrontRightFront);
    uint16_t TapeFrontLeftBack = AD_ReadADPin(AD_PORTW4);
    //printf("FrontLeftBack:%d\r\n", TapeFrontLeftBack);
    uint16_t TapeFrontLeftFront = AD_ReadADPin(AD_PORTW3);
    //printf("FrontLeftFront:%d\r\n", TapeFrontLeftFront);
    switch(ThisEvent.EventType){
        case ES_INIT:
            break;
        case ES_TIMERACTIVE:
        case ES_TIMERSTOPPED:
            break;
        case ES_TIMEOUT:
        ES_Timer_InitTimer(TAPE_SERVICE_TIMER, TIMER_1_TICKS); // runs every 5ms
        curEvent = 0x00;
            // check for Front Left Back Tape
            if (TapeFrontLeftBack < TAPE_FLB_THRESHOLD) {
                curEvent |= (1 << 0); 
            } else {
                curEvent  &= ~(1<<0);
            }

            // check for Front Left Front Tape
            if (TapeFrontLeftFront < TAPE_FLF_THRESHOLD) {
                curEvent |= (1 << 1); 
            } else {
                curEvent &= ~(1<<1);
            }

            // check for Front Right Front Tape
            if (TapeFrontRightFront < TAPE_FRF_THRESHOLD) {
                curEvent |= (1 << 2); 
            } else {
                curEvent &= ~(1<<2);
            }

            // check for Front Right Back Tape
            if (TapeFrontRightBack < TAPE_FRB_THRESHOLD) {
                curEvent |= (1 << 3); 
            } else {
                curEvent &= ~(1<<3);
            }
//            // Check for Back Right Tape
//            if (TapeBackRight < TAPE_BR_THRESHOLD) {
//                curEvent = lastEvent | (1 <<2); 
//            } else {
//                curEvent = lastEvent | ~(1<<2);
//            }
//
//            //check for Back Left Tape
//            if (TapeBackLeft < TAPE_BL_THRESHOLD) {
//                curEvent = lastEvent | (1 << 1); 
//            } else {
//                curEvent = lastEvent | ~(1<<1);
//            }

            // compare previous and current values
            if (lastEvent != curEvent){
                ReturnEvent.EventType = TAPE_STATUS_CHANGE;
                ReturnEvent.EventParam = curEvent;
              
                lastEvent = curEvent;
                PostTapeService(ReturnEvent);
            }
            break;

        default:
             printf("\r\nEvent: %s\tParam: 0x%X",
                EventNames[ThisEvent.EventType], ThisEvent.EventParam);
             break;
    }
    return ReturnEvent;
}