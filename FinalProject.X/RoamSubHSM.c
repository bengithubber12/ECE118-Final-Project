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
#include "ROBO.h"
#include "TapeService.h"
#include "RoboHSM.h"
#include "RoamSubHSM.h"
#include <stdio.h>
/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
typedef enum {
    InitPSubState,
    FREE_ROAM,
    ROAM_HANDLER,
} RoamSubHSMState_t;

static const char *StateNames[] = {
	"InitPSubState",
	"FREE_ROAM",
	"ROAM_HANDLER",
};

#define TURN_TIMEOUT 500
#define TURN_TIMER 2

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
    RoamSubHSMState_t nextState; // <- change type to correct enum
    ES_Tattle(); // trace call stack
    switch (CurrentState) {
        case InitPSubState: // If current state is initial Psedudo State
            if (ThisEvent.EventType == ES_INIT)// only respond to ES_Init
            {
                 printf("Currently initializing free roam\r\n");
                // now put the machine into the actual initial state
                curMotorBias = 0; //Set the initial motor BIAS to left(0)
                roboSway(curMotorBias);
                //run();
                nextState = FREE_ROAM;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;

            }
            break;
        case FREE_ROAM: // in the first state, replace this with correct names
            //printf("We in free roam\r\n");
            //printf("The event is %d\r\n", ThisEvent.EventParam);
            switch (ThisEvent.EventType) {
                case ES_NO_EVENT:
                    //nextState = FREE_ROAM;
                    //makeTransition = TRUE:
                    break;
                case TAPE_STATUS_CHANGE:
                    if (ThisEvent.EventParam == 1){// ONLY Front Left Tape Sensor Triggered
                        printf("Front Left Tape Sensor\r\n");
                        pivotBackLeft();
                        ES_Timer_InitTimer(TURN_TIMER, TURN_TIMEOUT);
                    }
                    else if ((ThisEvent.EventParam == 2 || ThisEvent.EventParam == 3)){// Front TOP Left or (Top Left and Front Left) Triggered
                        pivotBackLeft();
                        ES_Timer_InitTimer(TURN_TIMER, TURN_TIMEOUT);
                        printf("Top Left Tape Sensor\r\n");
                    }
                    else if ((ThisEvent.EventParam == 4)){// ONLY Front TOP Right Tape Sensor Triggered
                        pivotBackRight();
                        ES_Timer_InitTimer(TURN_TIMER, TURN_TIMEOUT);
                        
                        printf("Front Right Tape Sensor\r\n");
                    }
                    else if (ThisEvent.EventParam == 8 || ThisEvent.EventParam == 12){// Front TOP Right or (Top Right and Front Right) Triggered
                        pivotBackRight();
                        ES_Timer_InitTimer(TURN_TIMER, TURN_TIMEOUT);
                        printf("Top Right Tape Sensor\r\n");
                    }
                    else if ((ThisEvent.EventParam == 10) || ThisEvent.EventParam == 10){ //Either All front tape sensors are triggered or just front tape sensors
                        goBackward();
                        ES_Timer_InitTimer(TURN_TIMER, TURN_TIMEOUT);
                        
                    }
                    break;
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == TURN_TIMER){
                        curMotorBias ^= 1;
                        roboSway(curMotorBias);
                        //run();
                        
                    }
                    break;
                default: // all unhandled events pass the event back up to the next level
                    break;
            }
            
            break;
        case ROAM_HANDLER: // in the first state, replace this with correct names
            switch (ThisEvent.EventType) {
                case ES_NO_EVENT:
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
        RunRoamSubHSM(EXIT_EVENT); // <- rename to your own Run function
        CurrentState = nextState;
        RunRoamSubHSM(ENTRY_EVENT); // <- rename to your own Run function
    }

    ES_Tail(); // trace call stack end
    return ThisEvent;
}

/*******************************************************************************
 * PRIVATE FUNCTIONS                                                           *
 ******************************************************************************/
#define TAPE_FRB_THRESHOLD 100 // front right back
#define TAPE_FRF_THRESHOLD 100 // front right front 
#define TAPE_FLB_THRESHOLD 100  // front left back
#define TAPE_FLF_THRESHOLD 100  // front left front
#define TAPE_BR_THRESHOLD 100    // back right
#define TAPE_BL_THRESHOLD 100   // back left


