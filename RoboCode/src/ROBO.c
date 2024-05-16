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
int RoboLeftMtrSpeed(int leftSpeed){
    if (leftSpeed <  (-1 * ROBOT_MAXSPEED) || leftSpeed > ROBOT_MAXSPEED){
        //Error with speed bounds!
        return ERROR;
    }
    if (leftSpeed < 0){
        ROBOT_LEFT_DIR = 0;
        leftSpeed *= -1;
        printf("Left Motor less than 0\r\n");
    }
    else{
        ROBOT_LEFT_DIR = 1;
        
    }
    ROBOT_LEFT_DIR_INV = ~ROBOT_LEFT_DIR;
    printf("LEFT DIR IS %d\r\nLEFT DIR INVERSE IS %d\r\n",ROBOT_LEFT_DIR,ROBOT_LEFT_DIR_INV);
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

void ROBO_Init(void) {
    //Initialize Robot Motors
    ROBOT_RIGHT_DIR = 0;
    ROBOT_RIGHT_DIR_INV = ~ROBOT_RIGHT_DIR;
    ROBOT_LEFT_DIR = 0;
    ROBOT_LEFT_DIR_INV = ~ROBOT_LEFT_DIR;
    ROBOT_RIGHT_DIR_TRIS = 0;
    ROBOT_RIGHT_DIR_INV_TRIS = 0;
    ROBOT_LEFT_DIR_TRIS = 0;
    ROBOT_LEFT_DIR_INV_TRIS =  0;
    //Initialize Board, AD Ports, and PWM Ports

}

