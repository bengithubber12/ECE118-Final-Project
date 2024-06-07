/*
 * File: RoboSubHSM.c
 * Author: J. Edward Carryer
 * Modified: Gabriel Elkaim and Soja-Marie Morgens
 *
 * Template file to set up a Heirarchical State Machine to work with the Events and
 * Services Framework (ES_Framework) on the Uno32 for the CMPE-118/L class. Note that
 * this file will need to be modified to fit your exact needs, and most of the names
 * will have to be changed to match your code.
 *
 * There is another template file for the SubHSM's that is slightly differet, and
 * should be used for all of the subordinate state machines (flat or heirarchical)
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
#include <stdio.h>
#include "ES_Configure.h"
#include "ES_Framework.h"
#include "BOARD.h"
#include "TapeService.h"
#include "Motors.h"
#include "RoboHSM.h"
#include "RoamSubHSM.h"
#include "DepositSubHSM.h"
#include "MowerSubHSM.h"
#include "FindDoorSubHSM.h"
#include "RC_Servo.h"
//#include all sub state machines called
/*******************************************************************************
 * PRIVATE #DEFINES                                                            *
 ******************************************************************************/
#define ROAM_TIME 30000

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
typedef enum {
    InitPState,
    ROAMING,
    FIND_DOOR,
    MOWING,
    DEPOSIT,
} RoboTopHSMState_t;

static const char *StateNames[] = {
	"InitPState",
	"ROAMING",
	"FIND_DOOR",
	"MOWING",
	"DEPOSIT",
};


/*******************************************************************************
 * PRIVATE FUNCTION PROTOTYPES                                                 *
 ******************************************************************************/

/*******************************************************************************
 * PRIVATE MODULE VARIABLES                                                            *
 ******************************************************************************/
static RoboTopHSMState_t CurrentState = InitPState; // <- change enum name to match ENUM
static uint8_t MyPriority;

/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t InitRoboTopHSM(uint8_t Priority) {
    //printf("The Top HSM is init'ing...\r\n");
    MyPriority = Priority;
    // put us into the Initial PseudoState
    CurrentState = InitPState;
    // post the initial transition event
    if (ES_PostToService(MyPriority, INIT_EVENT) == TRUE) {
        return TRUE;
    } else {
        return FALSE;
    }
}

/**
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t PostRoboTopHSM(ES_Event ThisEvent) {
    return ES_PostToService(MyPriority, ThisEvent);
}

/**
 * @author J. Edward Carryer, 2011.10.23 19:25
 * @author Gabriel H Elkaim, 2011.10.23 19:25 */
ES_Event RunRoboTopHSM(ES_Event ThisEvent) {
    uint8_t makeTransition = FALSE; // use to flag transition
    RoboTopHSMState_t nextState; // <- change type to correct enum

    ES_Tattle(); // trace call stack
    switch (CurrentState) {
        case InitPState: // If current state is initial Pseudo State
            if (ThisEvent.EventType == ES_INIT)// only respond to ES_Init
            {
                // Initialize all sub-state machines
                //InitRoamSubHSM();
                //InitDepositSubHSM();
                //InitFindDoorSubHSM();
                //InitMowerSubHSM();
                beltDriveMax();
                RC_AddPins(RC_PORTW08);
                RC_SetPulseTime(RC_PORTW08, 1250);
                // now put the machine into the actual initial state
                nextState = ROAMING;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            break;
        /*
         *
         *
         *
         END OF INIT STATE
         *
         *
         *
         *
         *
         */
        case ROAMING:
            ThisEvent = RunRoamSubHSM(ThisEvent);
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    InitRoamSubHSM();
                    ES_Timer_InitTimer(ROAM_TIMER, ROAM_TIME);
                    break;
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == ROAM_TIMER) {
                        nextState = FIND_DOOR;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;
                default:
                    break;
            }

            break;

        case FIND_DOOR:
            ThisEvent = RunFindDoorSubHSM(ThisEvent);
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    InitFindDoorSubHSM();
                    break;
                case DOOR_FOUND:
                    nextState = DEPOSIT;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;
                    /*
                case ES_NO_EVENT:
                    break;*/
                default:
                    break;
            }
            break;

        case DEPOSIT:
            ThisEvent = RunDepositSubHSM(ThisEvent);
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    ES_Timer_InitTimer(DEPOSIT_TIMER, 6000);
                    InitDepositSubHSM();
                    break;
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == DEPOSIT_TIMER) {
                        RC_SetPulseTime(RC_PORTW08, 1250);
                        nextState = MOWING;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;

                default:
                    break;
            }
            break;

        case MOWING:
            beltDriveMax();
            ThisEvent = RunMowerSubHSM(ThisEvent);
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    //ES_Timer_InitTimer(MOWER_TIMER, 000); //Starting length is length of entire run
                    InitMowerSubHSM();
                    break;
                //case ES_TIMEOUT:
                   // if (ThisEvent.EventParam == MOWER_TIMER) {
                    //    nextState = ROAMING;
                    //   makeTransition = TRUE;
                    //    ThisEvent.EventType = ES_NO_EVENT;
                    //}
                    //break;
                case ES_TIMERSTOPPED:
                    if (ThisEvent.EventParam == MOWER_TIMER) {
                        nextState = ROAMING;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;
                case DOOR_FOUND:
                    nextState = FIND_DOOR;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;
                default:
                    break;
            }
            break;
        default: // all unhandled states fall into here
            break;



    } // end switch on Current State

    if (makeTransition == TRUE) { // making a state transition, send EXIT and ENTRY
        // recursively call the current state with an exit event
        RunRoboTopHSM(EXIT_EVENT); // <- rename to your own Run function
        CurrentState = nextState;
        RunRoboTopHSM(ENTRY_EVENT); // <- rename to your own Run function
    }
    ES_Tail(); // trace call stack end
    return ThisEvent;
}

/*******************************************************************************
 * PRIVATE FUNCTIONS                                                           *
 ******************************************************************************/
