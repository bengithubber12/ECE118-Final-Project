/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "ES_Configure.h"
#include "ES_Framework.h"
#include "BOARD.h"
#include "RoboHSM.h"
#include "MowerSubHSM.h"
#include "Motors.h"
#include "stdio.h"
#include <xc.h>
#include "IO_Ports.h"

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
typedef enum {
    InitPSubState,
    FIND_TAPE,
    FIND_TAPE_OR_WALL,
    FOLLOW_TAPE,
    TOWARD_TAPE,
    AWAY_TAPE,
    PIVOT,
    MOW,
    TURN,
    ALIGN,
    REALIGN,
    CORNER,
    CORNER_ADJUST,
    WALL_TURN,

} MowerSubHSMState_t;

static const char *StateNames[] = {
	"InitPSubState",
	"FIND_TAPE",
	"FIND_TAPE_OR_WALL",
	"FOLLOW_TAPE",
	"TOWARD_TAPE",
	"AWAY_TAPE",
	"PIVOT",
	"MOW",
	"TURN",
	"ALIGN",
	"REALIGN",
	"CORNER",
	"CORNER_ADJUST",
	"WALL_TURN",
};

//Timer Definitions
#define QUARTER_SECOND 250
#define HALF_SECOND 500
#define ONE_SECOND 1000
#define ADJUST_TIMER 13
#define BUMPER_TIMER 13
#define TURN_TIMER 13

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

//check bumoer movement based on if on tape or not
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

static MowerSubHSMState_t CurrentState = InitPSubState; // <- change name to match ENUM
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
uint8_t InitMowerSubHSM(void) {
    ES_Event returnEvent;

    CurrentState = InitPSubState;
    returnEvent = RunMowerSubHSM(INIT_EVENT);
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
ES_Event RunMowerSubHSM(ES_Event ThisEvent) {
    uint8_t makeTransition = FALSE; // use to flag transition
    MowerSubHSMState_t nextState; // <- change type to correct enum
    unsigned char bumperRead;
    ES_Tattle(); // trace call stack

    switch (CurrentState) {
        case InitPSubState: // If current state is initial Psedudo State
            if (ThisEvent.EventType == ES_INIT)// only respond to ES_Init
            {
                nextState = FIND_TAPE_OR_WALL;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            break;

        case FIND_TAPE_OR_WALL:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    run();
                    ES_Timer_InitTimer(ADJUST_TIMER, 4000);
                    break;
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == ADJUST_TIMER) {
                        nextState = WALL_TURN;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }

                case BUMPER_STATUS_CHANGE:
                    switch (ThisEvent.EventParam) {
                        case BOT_FLB:
                            RoboLeftMtrSpeed(-30);
                            RoboRightMtrSpeed(50);
                            //nextState = WALL_TURN;
                            //makeTransition = TRUE;
                            //ThisEvent.EventType = ES_NO_EVENT;
                            break;
                        case BOT_FRB:
                            RoboLeftMtrSpeed(50);
                            RoboRightMtrSpeed(-30);
                            //nextState = WALL_TURN;
                            //makeTransition = TRUE;
                            //ThisEvent.EventType = ES_NO_EVENT;
                            break;
                        case BOT_FrontBumpers:
                            nextState = WALL_TURN;
                            makeTransition = TRUE;
                            ThisEvent.EventType = ES_NO_EVENT;
                            break;
                        default:
                            break;
                    }
                    break;
                case TAPE_STATUS_CHANGE:
                    nextState = FIND_TAPE;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;
                default:
                    break;
            }
            break;

        case WALL_TURN:
            RoboLeftMtrSpeed(-60);
            RoboRightMtrSpeed(-30);
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    ES_Timer_InitTimer(ADJUST_TIMER, 2000);
                    break;
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == ADJUST_TIMER) {
                        nextState = FIND_TAPE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        break;
                    }
                    break;
                case ES_EXIT:
                    ES_Timer_SetTimer(ADJUST_TIMER, 1000);
                    break;
                default:
                    break;
            }
            break;
        case FIND_TAPE: // in the first state, replace this with correct names
            slightLeftDrive();
            switch (ThisEvent.EventType) {

                case TAPE_STATUS_CHANGE:

                    if (ThisEvent.EventParam == LeftTape) {
                        nextState = PIVOT;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    } else if (ThisEvent.EventParam == TopLeftTape) {
                        nextState = PIVOT;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    } else if (ThisEvent.EventParam == TR_R_Tape) {
                        nextState = PIVOT;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    } else if (ThisEvent.EventParam == TopRightTape) {
                        nextState = PIVOT;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    } else if (ThisEvent.EventParam == RightTape) {
                        nextState = PIVOT;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    } else if (ThisEvent.EventParam == TL_L_Tape) {
                        nextState = PIVOT;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    } else if (ThisEvent.EventParam == LeftTape) {
                        nextState = PIVOT;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    } else if (ThisEvent.EventParam == (TR_R_Tape + TopLeftTape) || ThisEvent.EventParam == (TL_L_Tape + TopRightTape)) {
                        nextState = PIVOT;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    } else if (ThisEvent.EventParam == AllTopSensors) {
                        nextState = PIVOT;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    } else if (ThisEvent.EventParam == BothTopTape) {
                        nextState = PIVOT;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }

                    break;

                case BACK_TAPE_STATUS_CHANGE:
                    if (ThisEvent.EventParam == 0x3) {
                        nextState = FOLLOW_TAPE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    } else if (ThisEvent.EventParam == 0x1 && PORTZ07_BIT) {
                        nextState = FOLLOW_TAPE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;

                case BUMPER_STATUS_CHANGE:
                    if ((ThisEvent.EventParam == 0x1) || (ThisEvent.EventParam == 0x2) || (ThisEvent.EventParam == 0x3)) {
                        nextState = ALIGN;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        break;
                    }
                    break;

                default: // all unhandled events pass the event back up to the next level
                    break;
            }
            break;

        case PIVOT:
            pivotBackLeft();
            switch (ThisEvent.EventType) {
                case TAPE_STATUS_CHANGE:
                    if (ThisEvent.EventParam == NoTape) {
                        nextState = TOWARD_TAPE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;

                case BACK_TAPE_STATUS_CHANGE:
                    if (ThisEvent.EventParam == 0x3 || ThisEvent.EventParam == 0x2) {
                        nextState = FIND_TAPE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;

                case BUMPER_STATUS_CHANGE:
                    if ((ThisEvent.EventParam == 0x1) || (ThisEvent.EventParam == 0x2) || (ThisEvent.EventParam == 0x3)) {
                        nextState = ALIGN;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        break;
                    }
                    break;

                default:
                    break;
            }
            break;

        case TOWARD_TAPE:
            RoboRightMtrSpeed(60);
            RoboLeftMtrSpeed(40);
            switch (ThisEvent.EventType) {
                case TAPE_STATUS_CHANGE:
                    if (PORTZ06_BIT) {
                        nextState = AWAY_TAPE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    } else if (PORTZ08_BIT && PORTZ05_BIT) {
                        nextState = CORNER;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;

                    //case BACK_TAPE_STATUS_CHANGE:
                    //   if (ThisEvent.EventParam == 0x3 || ThisEvent.EventParam == 0x2) {
                    //       nextState = FIND_TAPE;
                    //       makeTransition = TRUE;
                    //       ThisEvent.EventType = ES_NO_EVENT;
                    //  }
                    //  break;

                case BUMPER_STATUS_CHANGE:
                    if ((ThisEvent.EventParam == 0x1) || (ThisEvent.EventParam == 0x2) || (ThisEvent.EventParam == 0x3)) {
                        nextState = ALIGN;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        break;
                    }
                    break;

                default:
                    break;
            }
            break;

        case AWAY_TAPE:
            RoboRightMtrSpeed(60);
            RoboLeftMtrSpeed(75);
            switch (ThisEvent.EventType) {
                case TAPE_STATUS_CHANGE:
                    if (!PORTZ06_BIT) {
                        nextState = TOWARD_TAPE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    } else if (PORTZ06_BIT && PORTZ07_BIT) {
                        nextState = CORNER;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;

                    //case BACK_TAPE_STATUS_CHANGE:
                    //if (ThisEvent.EventParam == 0x3 || ThisEvent.EventParam == 0x2) {
                    //  nextState = FIND_TAPE;
                    //  makeTransition = TRUE;
                    //  ThisEvent.EventType = ES_NO_EVENT;
                    // }
                    //break;

                case BUMPER_STATUS_CHANGE:
                    if ((ThisEvent.EventParam == 0x1) || (ThisEvent.EventParam == 0x2) || (ThisEvent.EventParam == 0x3)) {
                        nextState = ALIGN;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        break;
                    }
                    break;

                default:
                    break;
            }
            break;

        case CORNER:
            RoboRightMtrSpeed(-40);
            RoboLeftMtrSpeed(40);
            //pivotBackLeft();
            switch (ThisEvent.EventType) {
                case TAPE_STATUS_CHANGE:
                    if (ThisEvent.EventParam == 0x1) {
                        nextState = AWAY_TAPE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }

                //case BACK_TAPE_STATUS_CHANGE:
                    //if (ThisEvent.EventParam == 0x3 || ThisEvent.EventParam == 0x1) {
                    //    nextState = CORNER_ADJUST;
                    //    makeTransition = TRUE;
                    //    ThisEvent.EventType = ES_NO_EVENT;
                    //    break;
                    //}
                    break;

                case BUMPER_STATUS_CHANGE:
                    if ((ThisEvent.EventParam == 0x1) || (ThisEvent.EventParam == 0x2) || (ThisEvent.EventParam == 0x3)) {
                        nextState = ALIGN;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        break;
                    }
                    break;

                default:
                    break;
            }
            break;

        case CORNER_ADJUST:
            stop();
            switch (ThisEvent.EventType) {

                case BACK_TAPE_STATUS_CHANGE:
                    if (ThisEvent.EventParam == 0x3) {
                        nextState = PIVOT;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;

                case BUMPER_STATUS_CHANGE:
                    if ((ThisEvent.EventParam == 0x1) || (ThisEvent.EventParam == 0x2) || (ThisEvent.EventParam == 0x3)) {
                        nextState = ALIGN;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        break;
                    }
                    break;

                default:
                    break;
            }
            break;

        case FOLLOW_TAPE:
            run();
            switch (ThisEvent.EventType) {
                case TAPE_STATUS_CHANGE:
                    if ((ThisEvent.EventParam == (RightTape + TopRightTape)) || (ThisEvent.EventParam == (RightTape + TopRightTape + TopLeftTape)) || (ThisEvent.EventParam == (RightTape + TopLeftTape))) {
                        nextState = PIVOT;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    } else if (ThisEvent.EventParam == AllTopSensors) {
                        nextState = PIVOT;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    } else if (ThisEvent.EventParam == BothTopTape) {
                        nextState = PIVOT;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    } else if (ThisEvent.EventParam == NoTape) {
                        nextState = FIND_TAPE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    } else {
                        nextState = FIND_TAPE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;

                    }
                    break;

                case BUMPER_STATUS_CHANGE:

                    if ((ThisEvent.EventParam == 0x1) || (ThisEvent.EventParam == 0x2) || (ThisEvent.EventParam == 0x3)) {
                        nextState = ALIGN;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;

                default:
                    break;

            }
            break;

        case ALIGN:
            pivotBackLeft();
            switch (ThisEvent.EventType) {
                case BACK_TAPE_STATUS_CHANGE:
                    if (ThisEvent.EventParam == 0x3) {
                        nextState = MOW;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;
                default:
                    break;

            }
            break;

        case TURN:
            hardTurnRight();
            switch (ThisEvent.EventType) {
                case BACK_TAPE_STATUS_CHANGE:
                    if (ThisEvent.EventParam == 0x1) {
                        nextState = REALIGN;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;
                default:
                    break;
            }
            break;

        case REALIGN:
            pivotBackRight();
            switch (ThisEvent.EventType) {
                case BACK_TAPE_STATUS_CHANGE:
                    if (ThisEvent.EventParam == 0x3) {
                        nextState = MOW;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;
                default:
                    break;

            }
            break;

        case MOW:
            run();
            switch (ThisEvent.EventType) {

                case TAPE_STATUS_CHANGE:
                    if (ThisEvent.EventParam == 0x02 || ThisEvent.EventParam == 0x04 || ThisEvent.EventParam == 0x06) {
                        nextState = TURN;
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
    } // end switch on Current State

    if (makeTransition == TRUE) { // making a state transition, send EXIT and ENTRY
        // recursively call the current state with an exit event
        RunMowerSubHSM(EXIT_EVENT); // <- rename to your own Run function
        CurrentState = nextState;
        RunMowerSubHSM(ENTRY_EVENT); // <- rename to your own Run function
    }

    ES_Tail(); // trace call stack end
    return ThisEvent;
}


/*******************************************************************************
 * PRIVATE FUNCTIONS                                                           *
 ******************************************************************************/


