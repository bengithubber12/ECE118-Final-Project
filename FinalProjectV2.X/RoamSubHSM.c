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

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/



typedef enum {
    InitPSubState,
    FREE_ROAM,
    BACKUP,
    TURN,
    BUMPER_HANDLER,
} RoamSubHSMState_t;

static const char *StateNames[] = {
    "InitPSubState",
    "FREE_ROAM",
    "TAPE_HANDLER",
    "BUMPER_HANDLER",
};

typedef enum {
    NOTURN,
    PIVOTBLEFT,
    PIVOTBRIGHT,
    PIVOTFLEFT,
    PIVOTFRIGHT,
    TANKTURNLEFT,
    TANKTURNRIGHT,
} MotorFunc;

//Timer Definitions
#define QUARTER_SECOND 250
#define HALF_SECOND 500
#define ONE_SECOND 1000
#define TURN_TIMER 2
#define BUMPER_TIMER 2
#define ROAM_TIME 90000 // 1 min 30 seconds

//Tape Definitions
#define LeftTape 0x01
#define TopLeftTape 0x02
#define L_TL_Tape 0x03
#define TR_L_TL_Tape 0x07
#define TopRightTape 0x04
#define BothTopTape 0x06 
#define RightTape 0x08
#define TR_R_Tape 0xC 
#define TR_R_TL_Tape 0xE
#define AllTopSensors 0xF

#define BackRightTape 0x01
#define BackLeftTape 0x02
#define BothBackTape 0x03

//Bumper Definitions
#define TOP_FLB 0x10
#define TOP_FRB 0x20
#define TOP_FrontBumpers 0x30
#define BOT_FLB 0x1
#define BOT_FRB 0x2
#define BOT_FrontBumpers 0x3
#define TOP_BRB 0x40
#define TOP_BLB 0x80
#define TOP_BackBumpers 0xC0
#define BOT_BRB 0x4
#define BOT_BLB 0x8
#define BOT_BackBumpers 0xC


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
// Motor bias represents left(0) and right(1) sway for the bot
static uint8_t prevTapeRead = 0;
static MotorFunc nextMotorState = NOTURN;
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
    uint8_t curMotorBias = 1;
    ES_Tattle(); // trace call stack
    unsigned char bumperRead;
    unsigned char tapeRead;
    switch (CurrentState) {
        case InitPSubState: // If current state is initial Psedudo State
            if (ThisEvent.EventType == ES_INIT)// only respond to ES_Init
            {
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
                    if (PORTZ06_BIT || PORTZ08_BIT) {// ONLY Left Tape Sensor Triggered
                        nextMotorState = TANKTURNRIGHT;
                        //printf("Front Left Tape Sensor\r\n");
                    } else if (PORTZ07_BIT || PORTZ05_BIT) {// ONLY TOP Right Tape Sensor Triggered
                        nextMotorState = TANKTURNLEFT;
                    } else if (((int) prevTapeRead == BothTopTape) && !TURNING) { //Either All front tape sensors are triggered or just front tape sensors
                        nextMotorState = NOTURN;
                    }
                    break;

                case BACK_TAPE_STATUS_CHANGE: //if a change in tape is detected
                    if (PORTZ11_BIT) {//TAPE BACK LEFT TRIGGERED
                        nextMotorState = PIVOTFLEFT;
                        //TURNING = 1;
                    } else if (PORTZ09_BIT) { //TAPE BACK RIGHT TRIGGERED
                        nextMotorState = PIVOTFRIGHT;
                        //TURNING = 1;
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

        case BACKUP:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    ES_Timer_InitTimer(TURN_TIMER, 400);
                    goBackward();
                    break;
                case BACK_TAPE_STATUS_CHANGE: //if a change in tape is detected
                    if (PORTZ11_BIT) {//TAPE BACK LEFT TRIGGERED
                        nextMotorState = PIVOTFLEFT;
                        nextState = TURN;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        ES_Timer_StopTimer(TURN_TIMER);
                    } else if (PORTZ09_BIT) { //TAPE BACK RIGHT TRIGGERED
                        nextMotorState = PIVOTFRIGHT;
                        nextState = TURN;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        ES_Timer_StopTimer(TURN_TIMER);
                    }
                    break;
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == TURN_TIMER){
                        nextState = TURN;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }

                default: // all unhandled events pass the event back up to the next level
                    break;
            }
            break;
        case BUMPER_HANDLER: // Handles bumper detection
            bumperRead = ~((PORTX08_BIT << 7) | ((PORTX06_BIT << 6) | ((PORTX05_BIT << 5) | (PORTX12_BIT << 4) | (PORTX11_BIT << 3) | ((PORTX04_BIT << 2) | ((PORTX03_BIT << 1) | PORTX10_BIT)))));
            //Determine which bumper is triggered
            if ((int) bumperRead == BOT_FLB) {// BOTTOM Front Left Bumper
                pivotBackLeft();

                //printf("Front Left Bumper\r\n");
            } else if ((int) bumperRead == BOT_FRB && !BUMPER_TURNING) {//  BOTTOM Front Right Bumper
                pivotBackRight();

                //printf("Front Right Bumper\r\n");
            } else if (((int) bumperRead == BOT_FrontBumpers) && !BUMPER_TURNING) {//BOTTOM Both Front Bumpers
                pivotBackRight();

                //printf("Both Front Bumpers\r\n");
            } else if ((int) bumperRead == BOT_BRB) {// Back Right Bumper
                slightLeftDrive();

                //printf("Back Right Bumper\r\n");
            } else if ((int) bumperRead == BOT_BLB) {// Back Left Bumper
                slightRightDrive();

                //printf("Back Left Bumper\r\n");
            } else if ((int) bumperRead == BOT_BackBumpers) {// Both Back Bumpers
                run();

                //printf("Both Back Bumpers\r\n");
            }

            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    ES_Timer_InitTimer(BUMPER_TIMER, 600);

                    break;

                case ES_EXIT:
                    ES_Timer_SetTimer(BUMPER_TIMER, 600);

                    break;

                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == BUMPER_TIMER) {
                        nextState = FREE_ROAM;
                        if (BUMPER_BACKUP == 1) {
                            BUMPER_TURNING = 0;
                            BUMPER_BACKUP = 2;
                        } else if (BUMPER_TURNING == 1) {
                            BUMPER_BACKUP = 0;
                            BUMPER_TURNING = 0;
                            curMotorBias ^= 1;
                        }
                        if (bumperRead > 0) {
                            nextState = BUMPER_HANDLER;
                        }
                        //printf("Bumper timer done\r\n");
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;

                case TAPE_STATUS_CHANGE:
                    nextState = TAPE_HANDLER;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                    BUMPER_BACKUP = 0;
                    BUMPER_TURNING = 0;
                    //ES_Timer_StopTimer(BUMPER_TIMER);
                    break;

                case BACK_TAPE_STATUS_CHANGE:
                    nextState = TAPE_HANDLER;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                    BUMPER_BACKUP = 0;
                    BUMPER_TURNING = 0;
                    //ES_Timer_StopTimer(BUMPER_TIMER);
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