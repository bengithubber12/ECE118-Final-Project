/* 
 * File:   BumperService.h
 * Author: gxjacobs
 *
 * Created on May 20, 2024, 12:50 PM
 */

#ifndef BUMPERSERVICE_H
#define	BUMPERSERVICE_H


/*******************************************************************************
 * PUBLIC #INCLUDES                                                            *
 ******************************************************************************/

#include "ES_Configure.h"   // defines ES_Event, INIT_EVENT, ENTRY_EVENT, and EXIT_EVENT

/*******************************************************************************
 * PUBLIC #DEFINES                                                             *
 ******************************************************************************/


/*******************************************************************************
 * PUBLIC TYPEDEFS                                                             *
 ******************************************************************************/


/*******************************************************************************
 * PUBLIC FUNCTION PROTOTYPES                                                  *
 ******************************************************************************/

 
uint8_t InitBumperService(uint8_t Priority);


uint8_t PostBumperService(ES_Event ThisEvent);


ES_Event RunBumperService(ES_Event ThisEvent);

#endif	/* BUMPERSERVICE_H */

