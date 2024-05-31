/*
 * File: TemplateSubHSM.c
 * Author: J. Edward Carryer
 * Modified: Gabriel H Elkaim
 *
 * Template file to set up a Heirarchical State Machine to work with the Events and
 * Services Framework (ES_Framework) on the Uno32 for the CMPE-118/L class. Note that
 * this file will need to be modified to fit your exact needs, and most of the names
 * will have to be changed to match your code.
 *
 * There is for a substate machine. Make sure it has a unique name
 *
 * This is provided as an example and a good place to start.
 *
 * History
 * When           Who     What/Why
 * -------------- ---     --------
 * 09/13/13 15:17 ghe      added tattletail functionality and recursive calls
 * 01/15/12 11:12 jec      revisions for Gen2 framework
 * 11/07/11 11:26 jec      made the queue static
 * 10/30/11 17:59 jec      fixed references to CurrentEvent in RunTemplateSM()
 * 10/23/11 18:20 jec      began conversion from SMTemplate.c (02/20/07 rev)
 */


/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "ES_Configure.h"
#include "ES_Framework.h"
#include "BOARD.h"
#include "AD.h"
#include "Motors.h"
#include "TapeService.h"
#include "BumperService.h"
#include "RoboHSM.h"
#include "RoamSubHSM.h"
#include <stdio.h>
#include <xc.h>
#include "IO_Ports.h"
//#define TRACK_WIRE 1 //testing track wire, comment out if running normally
/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/

#ifdef TRACK_WIRE 

typedef enum {
    InitPSubState,
    TEST_TW,
} RoamSubHSMState_t;

static const char *StateNames[] = {
	"InitPSubState",
	"TEST_TW",
};

#endif

#ifndef TRACK_WIRE

typedef enum {
    InitPSubState,
    FREE_ROAM,
    TAPE_HANDLER,
    BUMPER_HANDLER,
} RoamSubHSMState_t;

static const char *StateNames[] = {
    "InitPSubState",
    "FREE_ROAM",
    "TAPE_HANDLER",
    "BUMPER_HANDLER",
};
#endif

//Timer Definitions
#define QUARTER_SECOND 250
#define HALF_SECOND 500
#define ONE_SECOND 1000
#define TURN_TIMER 2
#define BUMPER_TIMER 2
#define ROAM_TIME 300000 // 1 min 30 seconds

//Tape Definitions
#define LeftTape 0x01
#define TopLeftTape 0x02
#define L_TL_Tape 0x03
#define TopRightTape 0x04
#define BothTopTape 0x06 
#define RightTape 0x08
#define TR_R_Tape 0x0C 
#define AllTopSensors 0x0F
#define BackRightTape 0x10
#define BothRightTape 0x18
#define AllRight 0x1C
#define BackLeftTape 0x20
#define BothLeftTape 0x21
#define AllLeft 0x23
#define BothBackTape 0x30

//Bumper Definitions
#define FLB 1
#define FRB 2
#define FrontBumpers 3
#define BRB 4
#define BLB 8
#define BackBumpers 12
#define BacksAndFR 14
#define BacksAndFL 13

/*******************************************************************************
 * PRIVATE FUNCTION PROTOTYPES                                                 *
 ******************************************************************************/
/* Prototypes for private functions for this machine. They should be functions
   relevant to the behavior of this state machine */


/*******************************************************************************
 * PRIVATE MODULE VARIABLES                                                            *
 ******************************************************************************/
/* You will need MyPriority and the state variable; you may need others as well.
 * The type of state variable should match that of enum in header file. */

static RoamSubHSMState_t CurrentState = InitPSubState; // <- change name to match ENUM
static uint8_t MyPriority;
static uint8_t lastEvent = 0;
static uint8_t curMotorBias; // Motor bias represents left(0) and right(1) sway for the bot
static uint8_t turning;

/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t InitRoamSubHSM(void) {
    ES_Event returnEvent;

    CurrentState = InitPSubState;
    returnEvent = RunRoamSubHSM(INIT_EVENT);

    if (returnEvent.EventType == ES_NO_EVENT) {
        return TRUE;
    }
    return FALSE;
}

/**
 * @author J. Edward Carryer, 2011.10.23 19:25
 * @author Gabriel H Elkaim, 2011.10.23 19:25 */
ES_Event RunRoamSubHSM(ES_Event ThisEvent) {
    uint8_t makeTransition = FALSE; // use to flag transition
    RoamSubHSMState_t nextState;
    ES_Tattle(); // trace call stack
    unsigned char bumperRead;
    unsigned char tapeRead;
    switch (CurrentState) {
        case InitPSubState: // If current state is initial Psedudo State
            if (ThisEvent.EventType == ES_INIT)// only respond to ES_Init
            {
                //printf("Currently initializing free roam\r\n");
                // now put the machine into the actual initial state
                //curMotorBias = 1; //Set the initial motor BIAS to right(1)
                ES_Timer_InitTimer(ROAM_TIMER, ROAM_TIME);
                //roboSway(curMotorBias);
                //run();
                nextState = FREE_ROAM;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;

            }
            break;

        case FREE_ROAM: // in the first state, replace this with correct names
            // right 
            beltDriveMax();
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    roboSway(curMotorBias);
                    break;

                case TAPE_STATUS_CHANGE: //if a change in tape is detected
                    nextState = TAPE_HANDLER;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;

                case BUMPER_STATUS_CHANGE:
                    nextState = BUMPER_HANDLER;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;

                default: // all unhandled events pass the event back up to the next level
                    break;
            }

            break;

        case TAPE_HANDLER: // Handles tape detection
<<<<<<< HEAD
            tapeRead = ((PORTZ11_BIT << 5)  | ((PORTZ09_BIT << 4) | (PORTZ07_BIT << 3) | (PORTZ05_BIT << 2) | (PORTZ08_BIT << 1) | (PORTZ06_BIT) ));
=======
            tapeRead = ((PORTZ11_BIT << 5) | ((PORTZ09_BIT << 4) | ((PORTZ07_BIT << 3) | ((PORTZ05_BIT << 2) | ((PORTZ08_BIT << 1) | ((PORTZ06_BIT) ))))));
>>>>>>> fe753338859ddcbb2bb503b72e85199b4ebb5841
            //Determine which tape sensor is triggered
            if ((int)tapeRead == LeftTape) {// ONLY Left Tape Sensor Triggered
                tankTurnRight();
                //printf("Front Left Tape Sensor\r\n");
            } else if (((int)tapeRead == TopLeftTape || (int)tapeRead == BothLeftTape)) {// Front TOP Left or (Top Left and Left) Triggered
                tankTurnRight();
                //printf("Top Left Tape Sensor\r\n");
            } else if (((int)tapeRead == TopRightTape)) {// ONLY TOP Right Tape Sensor Triggered
                tankTurnLeft();
                //printf("Front Right Tape Sensor\r\n");
            } else if ((int)tapeRead == RightTape || (int)tapeRead == BothRightTape) {// Front TOP Right or (Top Right and Front Right) Triggered
                tankTurnLeft();
                //printf("Top Right Tape Sensor\r\n");
            } else if (((int)tapeRead == BothTopTape)) { //Either All front tape sensors are triggered or just front tape sensors
                goBackward();
            }
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    ES_Timer_InitTimer(TURN_TIMER, HALF_SECOND);
                    break;

                case ES_EXIT:
                    ES_Timer_SetTimer(TURN_TIMER, HALF_SECOND);
                    break;

                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == TURN_TIMER) {
                        curMotorBias ^= 1;
                        //roboSway(curMotorBias); 
                        //printf("Tape timer done\r\n");
                        nextState = FREE_ROAM;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;

                case BUMPER_STATUS_CHANGE:
                    nextState = BUMPER_HANDLER;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;

                default: // all unhandled events pass the event back up to the next level
                    break;
            }
            break;

        case BUMPER_HANDLER: // Handles bumper detection

            bumperRead = ~((PORTX08_BIT << 7) | ((PORTX06_BIT << 6) | ((PORTX05_BIT << 5) | (PORTX12_BIT << 4) | (PORTX11_BIT << 3) | ((PORTX04_BIT << 2) | ((PORTX03_BIT << 1) | PORTX10_BIT)))));
             
            //Determine which bumper is triggered
            if ((int) bumperRead == FLB) {// Front Left Bumper
                pivotBackLeft();
                //printf("Front Left Bumper\r\n");
            } else if ((int) bumperRead == FRB) {// Front Right Bumper
                pivotBackRight();
                //printf("Front Right Bumper\r\n");
            } else if (((int) bumperRead == FrontBumpers)) {//Both Front Bumpers
                goBackward();
                //printf("Both Front Bumpers\r\n");
            } else if ((int) bumperRead == BRB) {// Back Right Bumper
                //run();
                //printf("Back Right Bumper\r\n");
            } else if ((int) bumperRead == BLB) {// Back Left Bumper
                //run();
                //printf("Back Left Bumper\r\n");
            } else if ((int) bumperRead == BackBumpers) {// Both Back Bumpers
                //run();
                //printf("Both Back Bumpers\r\n");
            } else if ((int) bumperRead == 9) {// BL and Front Left Bumper
                pivotBackLeft();
                //printf("BL and Front Left Bumper\r\n");
            } else if ((int) bumperRead == 10) {// BL and Front Right Bumper
                pivotBackRight();
                //printf("BL and Front Right Bumper\r\n");
            } else if ((int) bumperRead == BacksAndFR) {// Backs and Front Right Bumper
                pivotBackRight();
                //printf("Both back and Front Right Bumper\r\n");
            } else if ((int) bumperRead == BacksAndFL) {// Backs and Front Left Bumper
                pivotBackLeft();
                //printf("Both back and Front Left Bumper\r\n");
            }
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    ES_Timer_InitTimer(BUMPER_TIMER, ONE_SECOND);
                    break;

                case ES_EXIT:
                    ES_Timer_SetTimer(BUMPER_TIMER, ONE_SECOND);
                    break;

                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == BUMPER_TIMER) {
                        //printf("Bumper timer done\r\n");
                        nextState = FREE_ROAM;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;

                case TAPE_STATUS_CHANGE:
                    nextState = TAPE_HANDLER;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;

                default: // all unhandled events pass the event back up to the next level
                    break;
            }
            break;

        default: // all unhandled states fall into here
            break;
    } // end switch on Current State

    if (makeTransition == TRUE) { // making a state transition, send EXIT and ENTRY
        // recursively call the current state with an exit event
        RunRoamSubHSM(EXIT_EVENT);
        CurrentState = nextState;
        RunRoamSubHSM(ENTRY_EVENT);
    }

    ES_Tail(); // trace call stack end
    return ThisEvent;
}