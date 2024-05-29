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
#include "RoboHSM.h"
#include "MowerSubHSM.h"
#include "Motors.h"

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
typedef enum {
    InitPSubState,
    FORWARD,
    ALIGN,
    CORNER_TURN,
    FOLLOW_TAPE
    
} MowerSubHSMState_t;

static const char *StateNames[] = {
	"InitPSubState",
	"FORWARD",
	"ALIGN",
	"CORNER_TURN",
};

//Timer Definitions
#define QUARTER_SECOND 250
#define HALF_SECOND 500
#define ONE_SECOND 1000
#define ADJUST_TIMER 4
#define BUMPER_TIMER 4
#define TURN_TIMER 4

//Tape Definitions
#define NoTape 0x00
#define LeftTape 0x01
#define TopLeftTape 0x02
#define BothLeftTape 0x03
#define TopRightTape 0x04
#define BothTopTape 0x06 
#define RightTape 0x08
#define BothRightTape 0x0C
#define AllFrontTape 0x0F
#define BackRightTape 0x10
#define BackLeftTape 0x20
#define BothBackTape 0x30

//extra tape cases
#define All3RightTape 0x1C
#define All3LeftTape 0x23
#define TwoMostRightTape 0x18
#define TwoMostLeftTape 0x21


//Bumper Definitions
#define FLB 0x01
#define FRB 0x02
#define FrontBumpers 0x03
#define BRB 0x04
#define BLB 0x08
#define BackBumpers 0x0C

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
uint8_t InitMowerSubHSM(void)
{
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
ES_Event RunMowerSubHSM(ES_Event ThisEvent)
{
    uint8_t makeTransition = FALSE; // use to flag transition
    MowerSubHSMState_t nextState; // <- change type to correct enum

    ES_Tattle(); // trace call stack

    switch (CurrentState) {
    case InitPSubState: // If current state is initial Psedudo State
        if (ThisEvent.EventType == ES_INIT)// only respond to ES_Init
        {
            // this is where you would put any actions associated with the
            // transition from the initial pseudo-state into the actual
            // initial state

            // now put the machine into the actual initial state
            nextState = FORWARD;
            makeTransition = TRUE;
            ThisEvent.EventType = ES_NO_EVENT;
        }
        break;

    case FORWARD: // in the first state, replace this with correct names
        run();
        switch (ThisEvent.EventType) {
        case ES_NO_EVENT:
        case TAPE_STATUS_CHANGE:
            nextState = ALIGN;
            makeTransition = TRUE;
            ThisEvent.EventType = ES_NO_EVENT;
            break;
        case BUMPER_STATUS_CHANGE:
            break;
                
                
        default: // all unhandled events pass the event back up to the next level
            break;
        }
        break;
    case ALIGN:
            //Tape Definitions
//#define LeftTape 0x01
//#define TopLeftTape 0x02
//#define BothLeftTape 0x03
//#define TopRightTape 0x04
//#define BothTopTape 0x06 
//#define RightTape 0x08
//#define BothRightTape 0x0C
//#define AllFrontTape 0x0F
//#define BackRightTape 0x10
//#define BackLeftTape 0x20
//#define BothBackTape 0x30
//
////extra tape cases
//#define All3RightTape 0x1C
//#define All3LeftTape 0x23
//#define TwoMostRightTape 0x18
//#define TwoMostLeftTape 0x21
        switch(ThisEvent.EventType){
            case ES_ENTRY: 
                ES_Timer_InitTimer(MOWER_TIMER, QUARTER_SECOND);
                switch(ThisEvent.EventParam){
                    case LeftTape:
                        RoboLeftMtrSpeed(90);
                        RoboRightMtrSpeed(10);
                        break;
                    case TwoMostLeftTape:
                        RoboLeftMtrSpeed(90);
                        RoboRightMtrSpeed(10);
                        break;
                    case BackLeftTape: 
                        RoboLeftMtrSpeed(90);
                        RoboRightMtrSpeed(80);
                        break;
                    case All3RightTape:
                        nextState = CORNER_TURN;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                        break;
                
                    default:
                        break;
                }
                
            case ES_EXIT :
               ES_Timer_SetTimer(MOWER_TIMER, QUARTER_SECOND);
               break;
            case ES_TIMEOUT : 
                if (ThisEvent.EventParam == MOWER_TIMER){
                    nextState = FORWARD;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                }
                break;
            default :
                break;
        }
        case CORNER_TURN:
            tankTurnRight();
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    ES_Timer_InitTimer(GenericTimer, HALF_SECOND);
                    break;
                
                case ES_EXIT:
                    ES_Timer_SetTimer(GenericTimer, HALF_SECOND);
                    break;
                
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == GenericTimer){
                        nextState = FORWARD;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;
        }
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

