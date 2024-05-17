/*
 * File:   RoboMain.c
 * Author: bgoldbla
 *
 * Created on May 14, 2024, 7:25 PM
 */
#include "xc.h"
#include "pwm.h"
#include "ROBO.h"
#include <stdio.h>
#include "IO_Ports.h"
#include "AD.h"
#include "serial.h"
/////* PRIVATE DEFINITIONS */////
#define ROBOT_MAXSPEED 100

#define ROBOT_RIGHT_PWM PWM_PORTY12
#define ROBOT_LEFT_PWM PWM_PORTY04
#define ROBOT_RIGHT_DIR PORTW03_LAT
#define ROBOT_RIGHT_DIR_INV PORTW04_LAT
#define ROBOT_LEFT_DIR PORTW07_LAT
#define ROBOT_LEFT_DIR_INV PORTW08_LAT


#define ROBOT_RIGHT_DIR_TRIS PORTW03_TRIS
#define ROBOT_RIGHT_DIR_INV_TRIS PORTW04_TRIS
#define ROBOT_LEFT_DIR_TRIS PORTW07_TRIS
#define ROBOT_LEFT_DIR_INV_TRIS PORTW08_TRIS


/////* PRIVATE FUNCTIONS */////
void ROBO_Init(void) {
    //Initialize Robot Motors
    PWM_Init();
    PWM_AddPins(ROBOT_RIGHT_PWM|ROBOT_LEFT_PWM);
    
    ROBOT_RIGHT_DIR = 0;
    ROBOT_RIGHT_DIR_INV = ~ROBOT_RIGHT_DIR;
    ROBOT_LEFT_DIR = 0;
    ROBOT_LEFT_DIR_INV = ~ROBOT_LEFT_DIR;
    ROBOT_RIGHT_DIR_TRIS = 0;
    ROBOT_RIGHT_DIR_INV_TRIS = 0;
    ROBOT_LEFT_DIR_TRIS = 0;
    ROBOT_LEFT_DIR_INV_TRIS =  0;
    
    //Setup tape sensors pins
    AD_Init();
    AD_AddPins(AD_PORTW6);
    AD_AddPins(AD_PORTW5);
    AD_AddPins(AD_PORTW4);
    AD_AddPins(AD_PORTW3);
    
}

int RoboLeftMtrSpeed(int leftSpeed){
    if (leftSpeed <  (-1 * ROBOT_MAXSPEED) || leftSpeed > ROBOT_MAXSPEED){
        //Error with speed bounds!
        return ERROR;
    }
    if (leftSpeed < 0){
        ROBOT_LEFT_DIR = 0;
        leftSpeed *= -1;
    }
    else{
        ROBOT_LEFT_DIR = 1;
        
    }
    ROBOT_LEFT_DIR_INV = ~ROBOT_LEFT_DIR;
    if (PWM_SetDutyCycle(ROBOT_LEFT_PWM, (leftSpeed * (MAX_PWM / ROBOT_MAXSPEED))) == ERROR){
        return ERROR;
    }
    return SUCCESS;
    
}

int RoboRightMtrSpeed(int rightSpeed){
    if (rightSpeed <  (-1 * ROBOT_MAXSPEED) || rightSpeed > ROBOT_MAXSPEED){
        //Error with speed bounds!
        return ERROR;
    }
    if (rightSpeed < 0){
        ROBOT_RIGHT_DIR = 0;
        rightSpeed *= -1;
        
    }
    else{
        ROBOT_RIGHT_DIR = 1;
    }
    ROBOT_RIGHT_DIR_INV = ~ROBOT_RIGHT_DIR;
    if (PWM_SetDutyCycle(ROBOT_RIGHT_PWM, (rightSpeed * (MAX_PWM / ROBOT_MAXSPEED))) == ERROR){
        return ERROR;
    }
    return SUCCESS;
}

int RoboRightTankTurn(int speed){
     if (speed <  (-1 * ROBOT_MAXSPEED) || speed > ROBOT_MAXSPEED){
        //Error with speed bounds!
        return ERROR;
    }
    //call motor functions, EXACT AMOUNTS TBD
    RoboRightMtrSpeed(speed);
    RoboLeftMtrSpeed(-1*speed);
    return SUCCESS;
}

int RoboLeftTankTurn(int speed){
     if (speed <  (-1 * ROBOT_MAXSPEED) || speed > ROBOT_MAXSPEED){
        //Error with speed bounds!
        return ERROR;
    }
    //call motor functions, EXACT AMOUNTS TBD
    RoboRightMtrSpeed(-1*speed);
    RoboLeftMtrSpeed(speed);
    return SUCCESS;
}

int RoboForwardLeftTurn() {
    //call motor functions, EXACT AMOUNTS TBD
    RoboRightMtrSpeed(100);
    RoboLeftMtrSpeed(80);
    return SUCCESS;
}

int RoboForwardRightTurn() {
    //call motor functions, EXACT AMOUNTS TBD
    RoboRightMtrSpeed(80);
    RoboLeftMtrSpeed(100);
    return SUCCESS;
}

int RoboBackLeftTurn() {
    //call motor functions, EXACT AMOUNTS TBD
    RoboRightMtrSpeed(-100);
    RoboLeftMtrSpeed(-80);
    return SUCCESS;
}

int RoboBackRightTurn() {
    //call motor functions, EXACT AMOUNTS TBD
    RoboRightMtrSpeed(-80);
    RoboLeftMtrSpeed(-100);
    return SUCCESS;
}