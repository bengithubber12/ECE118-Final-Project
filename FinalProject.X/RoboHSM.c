/*
 * File: TemplateSubHSM.c
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
#include "ROBO.h"
#include "RoboHSM.h"
#include "RoamSubHSM.h"
#include "DepositSubHSM.h"
//#include all sub state machines called
/*******************************************************************************
 * PRIVATE #DEFINES                                                            *
 ******************************************************************************/

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
typedef enum {
    InitPState,
    ROAMING,
    DISCOVERING,
    DEPOSITING,
} RoboTopHSMState_t;

static const char *StateNames[] = {
	"InitPState",
	"ROAMING",
	"DISCOVERING",
	"DEPOSITING",
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
                // Initialize all sub-state machines (NEED TO CREATE  SUB-STATE MACHINES)
                InitRoamSubHSM();
                InitDepositSubHSM();
                //InitBeaconSubHSM();
                
                // now put the machine into the actual initial state
                nextState = DEPOSITING;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            break;

        case ROAMING:
            ThisEvent = RunRoamSubHSM(ThisEvent);
            //printf("In Roaming Mode\r\n");
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    InitRoamSubHSM();
                    break;
                case ES_NO_EVENT:
                    //nextState = ROAMING;
                    //makeTransition = TRUE;
                    break;
                default:
                    break;
            }
            
            break;
        case DISCOVERING:
            switch (ThisEvent.EventType) {
                case ES_NO_EVENT:
                    break;
                default:
                    break;
            }
            break;
        case DEPOSITING:
            ThisEvent = RunDepositSubHSM(ThisEvent);
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    InitDepositSubHSM();
                    break;
                case ES_NO_EVENT:
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
