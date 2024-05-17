/*
 * File:   TapeReader.c
 * Author: gxjacobs
 *
 * Created on May 16, 2024, 4:14 PM
 */

#include "BOARD.h"
#include "AD.h"
#include "xc.h"
#include "pwm.h"
#include "TapeReader.h"
#include <stdio.h>
#include "IO_Ports.h"

/////* PRIVATE DEFINITIONS */////
#define TOPRIGHT  AD_ReadADPin(AD_PORTW5)
#define RIGHT AD_ReadADPin(AD_PORTW6)
#define TOPLEFT AD_ReadADPin(AD_PORTW3)
#define LEFT AD_ReadADPin(AD_PORTW4)

#define TOPRIGHT_TRIS PORTW05_TRIS
#define RIGHT_TRIS PORTW06_TRIS
#define TOPLEFT_TRIS PORTW03_TRIS
#define LEFT_TRIS PORTW04_TRIS

#define TAPE_TR_THRESHOLD 110 
#define TAPE_R_THRESHOLD 110 
#define TAPE_TL_THRESHOLD 110 
#define TAPE_L_THRESHOLD 110

/////* FUNCTIONS */////
void Tape_Init(void) {
    //Set all pins to input
    AD_Init();
    BOARD_Init();
    TOPRIGHT_TRIS = 1;
    RIGHT_TRIS = 1;
    TOPLEFT_TRIS = 1;
    LEFT_TRIS = 1;
    AD_AddPins(AD_PORTW3);
    AD_AddPins(AD_PORTW4);
    AD_AddPins(AD_PORTW5);
    AD_AddPins(AD_PORTW6);
}
//BIT ARRAY WILL BE IN THE FORM: LEFT, TOP LEFT, TOP RIGHT, RIGHT

unsigned char TapeReading() {
    uint8_t TLRead = 0;
    uint8_t LRead = 0;
    uint8_t RRead = 0;
    uint8_t TRRead = 0;
    //check which sensors are on tape
    if (LEFT > TAPE_L_THRESHOLD) { //if left tape detected
        LRead = 1;
    } else{
        LRead = 0;
    }
    if (TOPLEFT > TAPE_TL_THRESHOLD) {
        TLRead = 1;
    } else{
        TLRead = 0;
    }
    if (TOPRIGHT > TAPE_TR_THRESHOLD) {
        TRRead = 1;
    } else{
        TRRead = 0;
    }
    if (RIGHT > TAPE_R_THRESHOLD) {
        RRead = 1;
    } else{
        RRead = 0;
    }
    return (LRead + (TLRead << 1) + (TRRead << 2) + (RRead << 3));
}
