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

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
typedef enum {
    InitPSubState,
    FTW, // Find Tape or Wall

    //Clockwise States
    CLK_ALIGN,
    CLK_TO_TAPE,
    CLK_AWAY_TAPE,
    CLK_CORNER_TURN,
    CLK_WALL_ALIGN,
    CLK_PARALLEL,

    //Counter Clockwise States
    CCLK_ALIGN,
    CCLK_TO_TAPE,
    CCLK_AWAY_TAPE,
    CCLK_CORNER_TURN,
    CCLK_WALL_ALIGN,


} MowerSubHSMState_t;

static const char *StateNames[] = {
	"InitPSubState",
	"FTW",
	"CLK_ALIGN",
	"CLK_TO_TAPE",
	"CLK_AWAY_TAPE",
	"CLK_CORNER_TURN",
	"CLK_WALL_ALIGN",
	"CLK_PARALLEL",
	"CCLK_ALIGN",
	"CCLK_TO_TAPE",
	"CCLK_AWAY_TAPE",
	"CCLK_CORNER_TURN",
	"CCLK_WALL_ALIGN",
};

//Timer Definitions
#define QUARTER_SECOND 250
#define HALF_SECOND 500
#define ONE_SECOND 1000
#define ADJUST_TIMER 4
#define BUMPER_TIMER 4
#define TURN_TIMER 4

//Tape Definitions
#define NoTape 0x0
#define FrontLeftTape 0x1
#define BottomLeftTape 0x8
#define FrontRightTape 0x2
#define BottomRightTape 0x4

#define BothLeftTape 0x9
#define BothRightTape 0x6

#define CornerLeftTape 0xB
#define CornerRightTape 0x7

#define BothBackTape 0xC
#define BothFrontTape 0x3

//Bumper Definitions
#define FLB 0x01
#define FRB 0x02
#define FrontBumpers 0x03
#define BRB 0x04
#define BLB 0x08
#define BackBumpers 0x0C

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

    ES_Tattle(); // trace call stack

    switch (CurrentState) {
        case InitPSubState: // If current state is initial Psedudo State
            if (ThisEvent.EventType == ES_INIT)// only respond to ES_Init
            {
                nextState = FTW;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            break;

        case FTW: // in the first state, replace this with correct names
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    run();
                    break;
                case TAPE_STATUS_CHANGE:
                    switch (ThisEvent.EventParam) {
                        case FrontLeftTape:
                            nextState = CLK_ALIGN;
                            makeTransition = TRUE;
                            ThisEvent.EventType = ES_NO_EVENT;
                            break;
                        case FrontRightTape:
                            nextState = CCLK_ALIGN;
                            makeTransition = TRUE;
                            ThisEvent.EventType = ES_NO_EVENT;
                            break;
                        case BothFrontTape:
                            break;
                        default:
                            break;

                    }

                    break;
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
        case CLK_ALIGN:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    RoboLeftMtrSpeed(0);
                    RoboRightMtrSpeed(-40);
                    break;
                case TAPE_STATUS_CHANGE:
                    if (ThisEvent.EventParam == BothLeftTape) {
                        nextState = CLK_AWAY_TAPE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    } else if (ThisEvent.EventParam == NoTape) {
                        nextState = CLK_TO_TAPE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    } else if (ThisEvent.EventParam == BottomLeftTape){
                        nextState = CLK_TO_TAPE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
        case CLK_AWAY_TAPE:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    RoboLeftMtrSpeed(65);
                    RoboRightMtrSpeed(50);
                    break;
                case TAPE_STATUS_CHANGE:
                    if (ThisEvent.EventParam == BottomLeftTape) {
                        nextState = CLK_TO_TAPE;
                        makeTransition = TRUE;
                        ThisEvent.EventType == ES_NO_EVENT;
                    } else if (ThisEvent.EventParam == NoTape) {
                        nextState = CLK_TO_TAPE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    } else if (ThisEvent.EventParam == BothFrontTape) {
                        nextState = CLK_CORNER_TURN;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
        case CLK_TO_TAPE:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    RoboLeftMtrSpeed(50);
                    RoboRightMtrSpeed(60);
                    break;
                case TAPE_STATUS_CHANGE:
                    if (ThisEvent.EventParam == FrontLeftTape) {
                        nextState = CLK_AWAY_TAPE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    } else if (ThisEvent.EventParam == BothLeftTape) {
                        nextState = CLK_AWAY_TAPE;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    } else if (ThisEvent.EventParam == BothFrontTape) {
                        nextState = CLK_CORNER_TURN;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
        case CLK_CORNER_TURN:
             switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    RoboLeftMtrSpeed(0);
                    RoboRightMtrSpeed(0);
                    break;
                case TAPE_STATUS_CHANGE:
                   
                case ES_NO_EVENT:
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


