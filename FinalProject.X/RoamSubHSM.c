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
#include "BumperService.h"
#include "RoboHSM.h"
#include "RoamSubHSM.h"
#include <stdio.h>
/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
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

//Timer Definitions
#define TURN_TIMEOUT 1000 //1 seconds
#define TURN_TIMER 2
#define BUMPER_TIMER 2
#define ROAM_TIMER 90000 // 1 min 30 seconds

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
    switch (CurrentState) {
        case InitPSubState: // If current state is initial Psedudo State
            if (ThisEvent.EventType == ES_INIT)// only respond to ES_Init
            {
                 printf("Currently initializing free roam\r\n");
                // now put the machine into the actual initial state
                curMotorBias = 0; //Set the initial motor BIAS to left(0)
                //roboSway(curMotorBias);
                //run();
                nextState = FREE_ROAM;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;

            }
            break;
        case FREE_ROAM: // in the first state, replace this with correct names
            //printf("We in free roam\r\n");
            //printf("The event is %d\r\n", ThisEvent.EventParam);
            run(); // go forward
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
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
            
            //Determine which tape sensor is triggered
            if (ThisEvent.EventParam == LeftTape){// ONLY Left Tape Sensor Triggered
                printf("Front Left Tape Sensor\r\n");
                pivotBackLeft();
            }
            else if ((ThisEvent.EventParam == TopLeftTape || ThisEvent.EventParam == BothLeftTape)){// Front TOP Left or (Top Left and Left) Triggered
                pivotBackLeft();
                printf("Top Left Tape Sensor\r\n");
            }
            else if ((ThisEvent.EventParam == TopRightTape)){// ONLY TOP Right Tape Sensor Triggered
                pivotBackRight();
                printf("Front Right Tape Sensor\r\n");
            }
            else if (ThisEvent.EventParam == RightTape || ThisEvent.EventParam == BothRightTape){// Front TOP Right or (Top Right and Front Right) Triggered
                pivotBackRight();
                printf("Top Right Tape Sensor\r\n");
            }
            else if ((ThisEvent.EventParam == BothTopTape) || ThisEvent.EventParam == AllFrontTape){ //Either All front tape sensors are triggered or just front tape sensors
                goBackward();
            }
            
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    ES_Timer_InitTimer(TURN_TIMER, TURN_TIMEOUT);
                    break;
                    
                case ES_EXIT:
                    ES_Timer_SetTimer(TURN_TIMER, TURN_TIMEOUT);
                    break;
                    
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == TURN_TIMER){
                        //curMotorBias ^= 1;
                        //roboSway(curMotorBias); 
                        printf("Tape timer done\r\n");
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

            //Determine which bumper is triggered
            if (ThisEvent.EventParam == FLB){// Front Left Bumper
                printf("Front Left Bumper\r\n");
                pivotBackRight();
            }
            else if (ThisEvent.EventParam == FRB){// Front Right Bumper
                pivotBackLeft();
                printf("Front Right Bumper\r\n");
            }
            else if ((ThisEvent.EventParam == FrontBumpers)){//Both Front Bumpers
                goBackward();
                printf("Both Front Bumpers\r\n");
            }
            else if (ThisEvent.EventParam == BRB){// Back Right Bumper
                run();
                printf("Back Right Bumper\r\n");
            }
            else if (ThisEvent.EventParam == BLB){// Back Left Bumper
                run();
                printf("Back Left Bumper\r\n");
            }
            else if (ThisEvent.EventParam == BackBumpers){// Both Back Bumpers
                run();
                printf("Both Back Bumpers\r\n");
            }
            
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    ES_Timer_InitTimer(BUMPER_TIMER, TURN_TIMEOUT);
                    break;
                    
                case ES_EXIT:
                    ES_Timer_SetTimer(BUMPER_TIMER, TURN_TIMEOUT);
                    break;
                    
                case ES_TIMEOUT: 
                    if (ThisEvent.EventParam == BUMPER_TIMER) {
                        printf("Bumper timer done\r\n");
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