/*
 * File: FindDoorSubHSM.c
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
#include "RoboHSM.h"
#include "FindDoorSubHSM.h"
#include "DepositSubHSM.h"
#include "Motors.h"
#include <xc.h>
#include "IO_Ports.h"
#include <stdio.h>

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
typedef enum {
    InitPSubState,
    FIND_TAPE,
    FOLLOW_TAPE,
    BUMPER_HANDLER,
    PIVOT,
    FIRST_TURN,
    RUN_FWD,
    SECOND_TURN,
    THIRD_TURN,
    DRIVE,
    TOWARD_TAPE,
    ALIGN,
    AWAY_TAPE,
} FindDoorSubHSMState_t;

static const char *StateNames[] = {
	"InitPSubState",
	"FIND_TAPE",
	"FOLLOW_TAPE",
	"BUMPER_HANDLER",
	"PIVOT",
	"FIRST_TURN",
	"RUN_FWD",
	"SECOND_TURN",
	"THIRD_TURN",
	"DRIVE",
	"TOWARD_TAPE",
	"ALIGN",
	"AWAY_TAPE",
};

//Timer Definitions
#define QUARTER_SECOND 250
#define HALF_SECOND 500
#define ONE_SECOND 1000
#define STRAIGHT_TIMER 7
#define TURN_TIMER_ONE 7
#define TURN_TIMER_TWO 7
#define TURN_TIMER_THREE 7
#define BUMPER_TIMER 7

//Tape Definitions
#define NoTape 0x00
#define LeftTape 0x01
#define TopLeftTape 0x02
#define TL_L_Tape 0x03
#define TopRightTape 0x04
#define BothTopTape 0x06 
#define EverythingButRight 0x07
#define RightTape 0x08
#define TR_R_Tape 0x0C 
#define EverythingButLeft 0x0E
#define AllTopSensors 0x0F
#define BackRightTape 0x10
#define BothRightTape 0x18
#define AllRight 0x1C
#define BackLeftTape 0x20
#define BothLeftTape 0x21
#define AllLeft 0x23
#define BothBackTape 0x30

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

static FindDoorSubHSMState_t CurrentState = InitPSubState;
static uint8_t MyPriority;
static uint8_t tapeFound = 0;
static uint8_t driveTracker = 0;
static uint8_t prevTapeRead = 0;
/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function InitFindDoorSubHSM(uint8_t Priority)
 * @param Priority - internal variable to track which event queue to use
 * @return TRUE or FALSE
 * @brief This will get called by the framework at the beginning of the code
 *        execution. It will post an ES_INIT event to the appropriate event
 *        queue, which will be handled inside RunTemplateFSM function. Remember
 *        to rename this to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t InitFindDoorSubHSM(void) {
    ES_Event returnEvent;

    CurrentState = InitPSubState;
    returnEvent = RunFindDoorSubHSM(INIT_EVENT);
    if (returnEvent.EventType == ES_NO_EVENT) {
        return TRUE;
    }
    return FALSE;
}

/**
 * @Function RunFindDoorSubHSM(ES_Event ThisEvent)
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
ES_Event RunFindDoorSubHSM(ES_Event ThisEvent) {
    uint8_t makeTransition = FALSE; // use to flag transition
    FindDoorSubHSMState_t nextState; // <- change type to correct enum
    unsigned char bumperRead;
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
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    RoboRightMtrSpeed(50);
                    RoboLeftMtrSpeed(60);
                    if (tapeFound) {
                        ES_Timer_InitTimer(WATCH_DOG_TIMER, 2000);
                    }
                    if ((PORTZ11_BIT || PORTZ09_BIT) && !PORTZ07_BIT && !PORTZ06_BIT) {
                        break;
                    } else if (PORTZ11_BIT || PORTZ09_BIT || PORTZ07_BIT || PORTZ06_BIT) {
                        tapeFound = 1;
                        nextState = PIVOT;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;

                case TAPE_STATUS_CHANGE:
                    if (ThisEvent.EventParam == 0xC || ThisEvent.EventParam == 0x04 || ThisEvent.EventParam == 0x08) {
                        break;
                    } else if (ThisEvent.EventParam != NoTape) {
                        tapeFound = 1;
                        nextState = PIVOT;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }


                    break;

                case BUMPER_STATUS_CHANGE:
                    if (!PORTX12_BIT) {// Front Left Hit
                        nextState = FIRST_TURN;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        break;
                    } else if (!PORTX05_BIT) {// Front Right Hit
                        nextState = FIRST_TURN;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        break;
                    }
                    nextState = BUMPER_HANDLER;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;
                 
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == WATCH_DOG_TIMER) {
                        nextState = PIVOT;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;
                    

                default: // all unhandled events pass the event back up to the next level
                    break;
            }
            break;
        case PIVOT:
            RoboLeftMtrSpeed(-60);
            RoboRightMtrSpeed(0);
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    ES_Timer_InitTimer(TURN_TIMER_ONE, 175);
                    ES_Timer_InitTimer(WATCH_DOG_TIMER, 2000);
                    break;
                case TAPE_STATUS_CHANGE:
                    if (ThisEvent.EventParam == NoTape) {
                        ES_Timer_InitTimer(TURN_TIMER_ONE, 175);
                    } else if (PORTZ07_BIT && PORTZ11_BIT) {
                        nextState = FIND_TAPE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        ES_Timer_StopTimer(TURN_TIMER_ONE);
                    } else if (PORTZ09_BIT && PORTZ06_BIT) {
                        nextState = FIND_TAPE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        ES_Timer_StopTimer(TURN_TIMER_ONE);
                    }//else if (ThisEvent.EventParam == 0x8) {
                        //  nextState = RUN_FWD;
                        //  makeTransition = TRUE;
                        // ThisEvent.EventType = ES_NO_EVENT;
                        // ES_Timer_StopTimer(TURN_TIMER_ONE);
                        //} 
                    else if (ThisEvent.EventParam == 0xC) {
                        nextState = FIND_TAPE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        ES_Timer_StopTimer(TURN_TIMER_ONE);
                    } else if (ThisEvent.EventParam == 0x3) {
                        nextState = FIND_TAPE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        ES_Timer_StopTimer(TURN_TIMER_ONE);
                    }
                    break;

                case BUMPER_STATUS_CHANGE:
                    if (!PORTX12_BIT) {// Front Left Hit
                        nextState = FIRST_TURN;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        break;
                    } else if (!PORTX05_BIT) {// Front Right Hit
                        nextState = FIRST_TURN;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        break;
                    }
                    nextState = BUMPER_HANDLER;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == TURN_TIMER_ONE) {
                        nextState = FIND_TAPE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    } else if (ThisEvent.EventParam == WATCH_DOG_TIMER) {
                        RoboLeftMtrSpeed(-60);
                        RoboRightMtrSpeed(0);
                        nextState = FIND_TAPE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                default:
                    break;
            }
            break;

        case RUN_FWD:
            RoboLeftMtrSpeed(50);
            RoboRightMtrSpeed(50);
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    ES_Timer_InitTimer(STRAIGHT_TIMER, 200);
                    break;


                case TAPE_STATUS_CHANGE:
                    if (ThisEvent.EventParam == 0x1 || ThisEvent.EventParam == 0x2 || ThisEvent.EventParam == 0x3) {
                        nextState = PIVOT;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        ES_Timer_StopTimer(STRAIGHT_TIMER);
                    }
                    break;

                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == STRAIGHT_TIMER) {
                        nextState = FIND_TAPE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;

                case BUMPER_STATUS_CHANGE:
                    if ((ThisEvent.EventParam == 0x10) || (ThisEvent.EventParam == 0x20)) {
                        nextState = FIRST_TURN;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;
                default:
                    break;
            }
            break;

        case BUMPER_HANDLER:
            //bumperRead = ~((PORTX08_BIT << 7) | ((PORTX06_BIT << 6) | ((PORTX05_BIT << 5) | ((PORTX12_BIT << 4) | ((PORTX11_BIT << 3) | ((PORTX04_BIT << 2) | ((PORTX03_BIT << 1) | ((PORTX10_BIT)))))))));
            if (!PORTX04_BIT) {// Back Bottom Right Bumper
                pivotForwardRight();
            } else if (!PORTX11_BIT) {// Back Bottom Left Bumper
                pivotForwardLeft();
            } else if (!PORTX10_BIT) {// Bottom Front Left Bumper
                if (tapeFound == 1) {
                    printf("Front Left Bumper\r\n");

                    PostRoboTopHSM((ES_Event) {
                        DOOR_FOUND, 0
                    });
                } else {
                    pivotBackLeft();
                }

            } else if (!PORTX03_BIT) {// Bottom Front Right Bumper
                if (tapeFound == 1) {

                    PostRoboTopHSM((ES_Event) {
                        DOOR_FOUND, 0
                    });
                } else {
                    pivotBackRight();
                }
            }

            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    ES_Timer_InitTimer(BUMPER_TIMER, ONE_SECOND + QUARTER_SECOND);
                    break;

                case ES_EXIT:
                    ES_Timer_SetTimer(BUMPER_TIMER, ONE_SECOND + QUARTER_SECOND);
                    break;

                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == BUMPER_TIMER) {
                        nextState = FIND_TAPE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;

                    }
                    break;

                case TAPE_STATUS_CHANGE:
                    if (PORTZ11_BIT && PORTZ09_BIT) {
                        nextState = FOLLOW_TAPE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;
                default: // all unhandled events pass the event back up to the next level
                    break;
            }
            break;

        case DRIVE:
            run();
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    ES_Timer_InitTimer(STRAIGHT_TIMER, 850);
                    break;

                case ES_EXIT:
                    ES_Timer_SetTimer(STRAIGHT_TIMER, 850);
                    break;

                case TAPE_STATUS_CHANGE:
                    nextState = FIND_TAPE;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;

                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == STRAIGHT_TIMER) {
                        nextState = FIND_TAPE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        break;
                        /*
                        if (driveTracker == 1) {
                            nextState = SECOND_TURN;
                            makeTransition = TRUE;
                            ThisEvent.EventType = ES_NO_EVENT;
                        } else if (driveTracker == 2) {
                            nextState = THIRD_TURN;
                            makeTransition = TRUE;
                            ThisEvent.EventType = ES_NO_EVENT;
                        } else {
                            nextState = FIND_TAPE;
                            makeTransition = TRUE;
                            ThisEvent.EventType = ES_NO_EVENT;
                            break;
                        }
                         * */
                    }
                    break;

                case BUMPER_STATUS_CHANGE:
                    if ((ThisEvent.EventParam == 0x10) || (ThisEvent.EventParam == 0x20)) {
                        nextState = FIRST_TURN;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;
                default:
                    break;
            }
            break;

        case FIRST_TURN:
            driveTracker = 1;
            tankTurnLeft();
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    ES_Timer_InitTimer(TURN_TIMER_ONE, 500);
                    break;

                case ES_EXIT:
                    ES_Timer_SetTimer(TURN_TIMER_ONE, 500);
                    break;

                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == TURN_TIMER_ONE) {
                        nextState = DRIVE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;
                default:
                    break;
            }
            break;

        case SECOND_TURN:
            driveTracker = 2;
            tankTurnRight();
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    ES_Timer_InitTimer(TURN_TIMER_TWO, 500);
                    break;

                case ES_EXIT:
                    ES_Timer_SetTimer(TURN_TIMER_TWO, 500);
                    break;

                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == TURN_TIMER_TWO) {
                        nextState = DRIVE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;
                default:
                    break;
            }
            break;

        case THIRD_TURN:
            driveTracker = 3;
            tankTurnRight();
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    ES_Timer_InitTimer(TURN_TIMER_THREE, 500);
                    break;

                case ES_EXIT:
                    ES_Timer_SetTimer(TURN_TIMER_THREE, 500);
                    break;

                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == TURN_TIMER_THREE) {
                        nextState = DRIVE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;
                default:
                    break;
            }
            break;

        default: // all unhandled states fall into here
            break;
    }

    if (makeTransition == TRUE) { // making a state transition, send EXIT and ENTRY
        // recursively call the current state with an exit event
        RunFindDoorSubHSM(EXIT_EVENT); // <- rename to your own Run function
        CurrentState = nextState;
        RunFindDoorSubHSM(ENTRY_EVENT); // <- rename to your own Run function
    }

    ES_Tail(); // trace call stack end
    return ThisEvent;
}



/*******************************************************************************
 * PRIVATE FUNCTIONS                                                           *
 ******************************************************************************/

