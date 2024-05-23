/*
 * File:   RoboMain.c
 * Author: bgoldbla
 *
 * Created on May 14, 2024, 7:25 PM
 */
#include "xc.h"
#include "pwm.h"
#include "Motors.h"
#include <stdio.h>
#include "IO_Ports.h"
#include "AD.h"
#include "serial.h"
/////* PRIVATE DEFINITIONS */////
#define SPEEDRIGHT 90
#define SPEEDLEFT 85
#define FORWARD 1
#define BACKWARD -1
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

void run(void) {
    RoboLeftMtrSpeed(FORWARD * SPEEDLEFT);
    RoboRightMtrSpeed(FORWARD * SPEEDRIGHT);
}

void goBackward(void) {
    RoboLeftMtrSpeed(BACKWARD * SPEEDLEFT);
    RoboRightMtrSpeed(BACKWARD * SPEEDRIGHT);
}

void tankTurnRight(void) {
    RoboLeftMtrSpeed(FORWARD * SPEEDLEFT);
    RoboRightMtrSpeed(BACKWARD * SPEEDRIGHT);
}

void tankTurnLeft(void) {
    RoboLeftMtrSpeed(BACKWARD * SPEEDLEFT);
    RoboRightMtrSpeed(FORWARD * SPEEDRIGHT);
}

void hardTurnRight(void) {
    RoboLeftMtrSpeed(75 * SPEEDLEFT);
    RoboRightMtrSpeed(BACKWARD * SPEEDRIGHT);
}

void hardTurnLeft(void) {
    RoboLeftMtrSpeed(BACKWARD * SPEEDLEFT);
    RoboRightMtrSpeed(75 * SPEEDRIGHT);
}

void pivotBackRight(void) {
    RoboLeftMtrSpeed(BACKWARD * SPEEDLEFT);
    RoboRightMtrSpeed(0);
}

void pivotBackLeft(void) {
    RoboLeftMtrSpeed(0);
    RoboRightMtrSpeed(BACKWARD * SPEEDRIGHT);
}

void stop(void) {
    RoboLeftMtrSpeed(0);
    RoboRightMtrSpeed(0);
}

void slightRightDrive(void) {
    RoboLeftMtrSpeed(SPEEDLEFT);
    RoboRightMtrSpeed(80);
}

void roboSway(uint8_t bias){
    if (bias == 0){ //Left Sway
        RoboRightMtrSpeed(85);
        RoboLeftMtrSpeed(100);
    }
    else if (bias == 1){//Right Sway
        RoboRightMtrSpeed(100);
        RoboLeftMtrSpeed(75);
    }
}