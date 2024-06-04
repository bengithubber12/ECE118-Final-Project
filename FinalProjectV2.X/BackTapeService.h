#ifndef BackTapeService_H  
#define BackTapeService_H 


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

 
uint8_t InitBackTapeService(uint8_t Priority);


uint8_t PostBackTapeService(ES_Event ThisEvent);


ES_Event RunBackTapeService(ES_Event ThisEvent);



#endif 