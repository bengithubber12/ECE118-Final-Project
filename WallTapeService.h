#ifndef WallTapeService_H  
#define WallTapeService_H 


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

 
uint8_t InitWallTapeService(uint8_t Priority);


uint8_t PostWallTapeService(ES_Event ThisEvent);


ES_Event RunWallTapeService(ES_Event ThisEvent);



#endif 