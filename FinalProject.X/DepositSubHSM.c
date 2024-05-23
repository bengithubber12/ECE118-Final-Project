/*
 * File: DepositSubHSM.c
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
#include "Motors.h"
#include "RoboHSM.h"
#include "DepositSubHSM.h"
#include "TapeService.h"
#include "BumperService.h"
#include <stdio.h>

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
typedef enum {
    InitPSubState,
    FIND_TAPE,
    ALINE,
    FOLLOW_TAPE,
    BUMPER_HANDLER,          
} DepositSubHSMState_t;

static const char *StateNames[] = {
	"InitPSubState",
	"FIND_TAPE",
	"ALINE",
	"FOLLOW_TAPE",
	"BUMPER_HANDLER",
};

//Timer Definitions
#define QUARTER_SECOND 250
#define HALF_SECOND 500
#define ONE_SECOND 1000
#define ADJUST_TIMER 4
#define BUMPER_TIMER 4

//Tape Definitions
#define LeftTape 1
#define TopLeftTape 2
#define BothLeftTape 3
#define TopRightTape 4
#define BothTopTape 6 
#define RightTape 8
#define BothRightTape 12
#define AllFrontTape 15

//Bumper Definitions
#define FLB 1
#define FRB 2
#define FrontBumpers 3
#define BRB 4
#define BLB 8
#define BackBumpers 12

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

static DepositSubHSMState_t CurrentState = InitPSubState; // <- change name to match ENUM
static uint8_t MyPriority;


/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function InitTemplateSubHSM(uint8_t Priority)
 * @param Priority - internal variable to track which event queue to use
 * @return TRUE or FALSE
 * @brief This will get called by the framework at the beginning of the code
 *        execution. It will post an ES_INIT event to the appropriate event
 *        queue, which will be handled inside RunTemplateFSM function. Remember
 *        to rename this to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t InitDepositSubHSM(void)
{
    ES_Event returnEvent;

    CurrentState = InitPSubState;
    returnEvent = RunDepositSubHSM(INIT_EVENT);
    if (returnEvent.EventType == ES_NO_EVENT) {
        return TRUE;
    }
    return FALSE;
}

/**
 * @Function RunTemplateSubHSM(ES_Event ThisEvent)
 * @param ThisEvent - the event (type and param) to be responded.
 * @return Event - return event (type and param), in general should be ES_NO_EVENT
 * @brief This function is where you implement the whole of the heirarchical state
 *        machine, as this is called any time a new event is passed to the event
 *        queue. This function will be called recursively to implement the correct
 *        order for a state transition to be: exit current state -> enter next state
 *        using the ES_EXIT and ES_ENTRY events.
 * @note Remember to rename to something appropriate.
 *       The lower level state machines are run first, to see if the event is dealt
 *       with there rather than at the current level. ES_EXIT and ES_ENTRY events are
 *       not consumed as these need to pass pack to the higher level state machine.
 * @author J. Edward Carryer, 2011.10.23 19:25
 * @author Gabriel H Elkaim, 2011.10.23 19:25 */
ES_Event RunDepositSubHSM(ES_Event ThisEvent)
{
    uint8_t makeTransition = FALSE; // use to flag transition
    DepositSubHSMState_t nextState; // <- change type to correct enum

    ES_Tattle(); // trace call stack

    switch (CurrentState) {
    case InitPSubState: // If current state is initial Psedudo State
        if (ThisEvent.EventType == ES_INIT)// only respond to ES_Init
        {
            // this is where you would put any actions associated with the
            // transition from the initial pseudo-state into the actual
            // initial state

            // now put the machine into the actual initial state
            nextState = FIND_TAPE;
            makeTransition = TRUE;
            ThisEvent.EventType = ES_NO_EVENT;
        }
        break;

    case FIND_TAPE: // in the first state, replace this with correct names
        
        run();
        switch (ThisEvent.EventType) {
            case ES_ENTRY:
                break;

            case TAPE_STATUS_CHANGE:
                nextState = ALINE;
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
        
    case ALINE: //State used to aline robot so it follows the tape going left
            
        //Determine which tape sensor is triggered
        if (ThisEvent.EventParam & LeftTape){// ONLY Left Tape Sensor Triggered
            pivotBackRight();
            //printf("Left Tape Sensor\r\n");
        }
        else if (ThisEvent.EventParam & TopLeftTape){// ONLY TOP Left Triggered
            pivotBackRight();
            //printf("Top Left Tape Sensor\r\n");
        }
        else if ((ThisEvent.EventParam & TopRightTape)){// ONLY TOP Right Tape Sensor Triggered
            pivotBackRight();
            //printf("Top Right Tape Sensor\r\n");
        }
        else if ((ThisEvent.EventParam & TopRightTape) && (ThisEvent.EventParam & RightTape) ){// Both Right Tape Triggered
            pivotBackRight();
            //printf("Both Right Tape Sensors\r\n");
        }
        else if (ThisEvent.EventParam & RightTape){// ONLY Right Triggered
            //Now matched with tape
            nextState = FOLLOW_TAPE;
            makeTransition = TRUE;
            ThisEvent.EventType = ES_NO_EVENT;
            //printf("Right Tape Sensor\r\n");
        }
        
        // At a corner
        else if (ThisEvent.EventParam == RightTape && (ThisEvent.EventParam == TopRightTape || ThisEvent.EventParam == TopLeftTape)){
                    //Now matched with tape
                    nextState = FOLLOW_TAPE;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                    //printf("Top Right Tape Sensor\r\n");
                }
                
        switch (ThisEvent.EventType) {
            case ES_ENTRY:
                printf("Timer inited\r\n");
                ES_Timer_InitTimer(ADJUST_TIMER, HALF_SECOND);
                break;
                
            case ES_EXIT:
                ES_Timer_SetTimer(ADJUST_TIMER, HALF_SECOND);
                break;
                
            case ES_TIMEOUT:
                if (ThisEvent.EventParam == ADJUST_TIMER){
                    nextState = FIND_TAPE;
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
        
    case FOLLOW_TAPE:
        slightRightDrive();
        switch (ThisEvent.EventType) {
            case TAPE_STATUS_CHANGE:
                nextState = ALINE;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
                break;
        }
        
        break;
        
    case BUMPER_HANDLER:
        
        //Determine which bumper is triggered
        if (ThisEvent.EventParam == FLB){// Front Left Bumper
            pivotBackRight();
            //printf("Front Left Bumper\r\n");
        }
        else if (ThisEvent.EventParam == FRB){// Front Right Bumper
            pivotBackLeft();
            //printf("Front Right Bumper\r\n");
        }
        else if ((ThisEvent.EventParam == FrontBumpers)){//Both Front Bumpers
            goBackward();
            //printf("Both Front Bumpers\r\n");
        }
        else if (ThisEvent.EventParam == BRB){// Back Right Bumper
            run();
            //printf("Back Right Bumper\r\n");
        }
        else if (ThisEvent.EventParam == BLB){// Back Left Bumper
            run();
            //printf("Back Left Bumper\r\n");
        }
        else if (ThisEvent.EventParam == BackBumpers){// Both Back Bumpers
            run();
            //printf("Both Back Bumpers\r\n");
        }

        switch (ThisEvent.EventType) {
            case ES_ENTRY:
                ES_Timer_InitTimer(BUMPER_TIMER, QUARTER_SECOND);
                break;

            case ES_EXIT:
                ES_Timer_SetTimer(BUMPER_TIMER, QUARTER_SECOND);
                break;

            case ES_TIMEOUT: 
                if (ThisEvent.EventParam == BUMPER_TIMER) {
                    //printf("Bumper timer done\r\n");
                    nextState = FIND_TAPE;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                }
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
        RunDepositSubHSM(EXIT_EVENT); 
        CurrentState = nextState;
        RunDepositSubHSM(ENTRY_EVENT);
    }

    ES_Tail(); // trace call stack end
    return ThisEvent;
}


/*******************************************************************************
 * PRIVATE FUNCTIONS                                                           *
 ******************************************************************************/

