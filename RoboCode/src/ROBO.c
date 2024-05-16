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
#define ROBOT_RIGHT_DIR PORTV04_LAT
#define ROBOT_RIGHT_DIR_INV PORTV07_LAT
#define ROBOT_LEFT_DIR PORTV03_LAT
#define ROBOT_LEFT_DIR_INV PORTV05_LAT


#define ROBOT_RIGHT_DIR_TRIS PORTV04_TRIS
#define ROBOT_RIGHT_DIR_INV_TRIS PORTV07_TRIS
#define ROBOT_LEFT_DIR_TRIS PORTV03_TRIS
#define ROBOT_LEFT_DIR_INV_TRIS PORTV05_TRIS


/////* PRIVATE FUNCTIONS */////
int RoboLeftMtrSpeed(int speed){
    if (speed <  (-1 * ROBOT_MAXSPEED) || speed > ROBOT_MAXSPEED){
        //Error with speed bounds!
        return ERROR;
    }
    if (speed < 0){
        ROBOT_LEFT_DIR = 0;
        speed *= -1;
    }
    else{
        ROBOT_LEFT_DIR = 1;
        
    }
    ROBOT_LEFT_DIR_INV = ~ROBOT_LEFT_DIR;
    if (PWM_SetDutyCycle(ROBOT_LEFT_PWM, (speed * (MAX_PWM / ROBOT_MAXSPEED))) == ERROR){
        return ERROR;
    }
    return SUCCESS;
    
}

int RoboRightMtrSpeed(int speed){
    if (speed <  (-1 * ROBOT_MAXSPEED) || speed > ROBOT_MAXSPEED){
        //Error with speed bounds!
        return ERROR;
    }
    if (speed < 0){
        ROBOT_RIGHT_DIR = 0;
        speed *= -1;
    }
    else{
        ROBOT_RIGHT_DIR = 1;
    }
    ROBOT_RIGHT_DIR_INV = ~ROBOT_RIGHT_DIR;
    if (PWM_SetDutyCycle(ROBOT_RIGHT_PWM, (speed * (MAX_PWM / ROBOT_MAXSPEED))) == ERROR){
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
    ROBOT_RIGHT_DIR_INV_TRIS =  0;
    //Initialize Board, AD Ports, and PWM Ports

}

