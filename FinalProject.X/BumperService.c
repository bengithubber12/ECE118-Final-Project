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
    PORTX10_TRIS = 1;  //front left
    PORTX09_TRIS = 1;  //back left
    PORTX06_TRIS = 1;  //front right
    PORTX05_TRIS = 1;  //back right

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
    
    //array of all readings 
    unsigned char bumperRead = ((PORTX09_BIT << 3) | ((PORTX05_BIT << 2) | ((PORTX06_BIT << 1) | PORTX10_BIT)));
    
    switch(ThisEvent.EventType){
        case ES_INIT:
            break;
        case ES_TIMERACTIVE:
            break;
        case ES_TIMERSTOPPED:
            break;
        case ES_TIMEOUT:
            ES_Timer_InitTimer(BUMPER_SERVICE_TIMER, BUMPER_TIMER_TICKS); // runs every 5ms
            curEvent = 0x00;
            
            //Front Left Bumper
            if (bumperRead & FLEFT_BUMP_MASK) {
                //printf("FLB Triggered.\r\n");
                curEvent |= (1 << 0); //1
            }else {
                curEvent &= ~(1 << 0);
            }
            
            //Front Right Bumper
            if (bumperRead & FRIGHT_BUMP_MASK) {
                //printf("FRB Triggered.\r\n");
                curEvent |= (1 << 1); //2
            } else {
                curEvent &= ~(1 << 1);
            }
            
            //Back Right Bumper 
            if (bumperRead & BRIGHT_BUMP_MASK) {
                //printf("BRB Triggered.\r\n");
                curEvent |= (1 << 2); //4 
            } else {
                curEvent &= ~(1 << 2);
            }
            
            //Back Left Bumper
            if (bumperRead & BLEFT_BUMP_MASK) {
                //printf("BLB Triggered.\r\n");
                curEvent |= (1 << 3);
            } else {
                curEvent &= ~(1 << 3);
            }
            
            /*
            else if (bumperRead & FRONT_BUMPERS) {
                //printf("Front bumpers Triggered\r\n");
                curEvent = FLB_EVENT;
            }
            else {
                curEvent = NO_BUMPER_EVENT;
            }
            */
            // compare previous and current values
            if (lastEvent != curEvent){
                ReturnEvent.EventType = BUMPER_STATUS_CHANGE;
                ReturnEvent.EventParam = curEvent;
                lastEvent = curEvent;
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
