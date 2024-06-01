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

#define BUMPER_TIMER_TICKS 15

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
            curEvent = ~((PORTX08_BIT << 7) | ((PORTX06_BIT << 6) | ((PORTX05_BIT << 5) | ((PORTX12_BIT << 4) | ((PORTX11_BIT << 3) | ((PORTX04_BIT << 2) | ((PORTX03_BIT << 1) | PORTX10_BIT)))))));
            //printf("BumperRead: %x\r\n", bumperRead);
            //Front Left Bumper
            /*
            if (bumperRead & BOTTOM_FLEFT_BUMP_MASK) {
                //printf("FLB Triggered.\r\n");
                curEvent &= ~(1 << 0);
            }else {
                curEvent |= (1 << 0);
            }
            
            //Front Right Bumper
            if (bumperRead & BOTTOM_FRIGHT_BUMP_MASK) {
                //printf("FRB Triggered.\r\n");
                curEvent &= ~(1 << 1); //2
            } else {
                curEvent |= (1 << 1);
            }
            
            //Back Right Bumper 
            if (bumperRead & BOTTOM_BRIGHT_BUMP_MASK) {
                //printf("BRB Triggered.\r\n");
                curEvent &= ~(1 << 2); //4 
            } else {
                curEvent |= (1 << 2);
            }
            
            //Back Left Bumper
            if (bumperRead & BOTTOM_BLEFT_BUMP_MASK) {
                //printf("BLB Triggered.\r\n");
                curEvent &= ~(1 << 3);  //8
            } else {
                curEvent |= (1 << 3);
            }
            
            if (bumperRead & TOP_FLEFT_BUMP_MASK) {
                //printf("FLB Triggered.\r\n");
                curEvent &= ~(1 << 4); //10
            }else {
                curEvent |= (1 << 4);
            }
            
            if (bumperRead & TOP_FRIGHT_BUMP_MASK) {
                //printf("FRB Triggered.\r\n");
                curEvent &= ~(1 << 5); //20
            } else {
                curEvent |= (1 << 5);
            }
             
            if (bumperRead & TOP_BRIGHT_BUMP_MASK) {
                //printf("BRB Triggered.\r\n");
                curEvent &= ~(1 << 6); //40
            } else {
                curEvent |= (1 << 6);
            }

            if (bumperRead & TOP_BLEFT_BUMP_MASK) {
                //printf("BLB Triggered.\r\n");
                curEvent &= ~(1 << 7);  //80
            } else {
                curEvent |= (1 << 7);
            }
             * */
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
