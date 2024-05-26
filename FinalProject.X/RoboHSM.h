/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.h

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef ROBO_HSM_H    /* Guard against multiple inclusion */
#define ROBO_HSM_H

uint8_t InitRoboTopHSM(uint8_t Priority); 
/**
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t PostRoboTopHSM(ES_Event ThisEvent); 
/**
 * @author J. Edward Carryer, 2011.10.23 19:25
 * @author Gabriel H Elkaim, 2011.10.23 19:25 */
ES_Event RunRoboTopHSM(ES_Event ThisEvent); 
#endif /* _EXAMPLE_FILE_NAME_H */

/* *****************************************************************************
 End of File
 */
