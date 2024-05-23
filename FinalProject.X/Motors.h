/*
 * File:   Motors.h
 * Author: bgoldbla
 *
 * Created on May 14, 2024, 8:15 PM
 */
#ifndef MOTORS_H
#define MOTORS_H

//#include "BOARD.h"
//#include "AD.h"
#include "ES_Configure.h"


//Initialization Function for the Robot and Respective Components
void ROBO_Init(void);

//Functions to move robo motors
int RoboLeftMtrSpeed(int speed);
int RoboRightMtrSpeed(int speed);
void run(void);
void goBackward(void);
void pivotBackLeft(void);
void pivotBackRight(void);
void tankTurnLeft(void);
void tankTurnRight(void);
void hardTurnLeft(void);
void hardTurnRight(void);
void stop(void);

void roboSway(uint8_t bias);
////Turn Functions where robot stops in place
//int RoboRightTankTurn(int speed);
//int RoboLeftTankTurn(int speed);
//
////Moving Turn Functions
//int RoboForwardLeftTurn();
//int RoboForwardRightTurn();
//int RoboBackLeftTurn();
//int RoboBackRightTurn();

#endif