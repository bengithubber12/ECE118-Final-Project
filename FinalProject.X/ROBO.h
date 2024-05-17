/*
 * File:   newmainXC16.h
 * Author: bgoldbla
 *
 * Created on May 14, 2024, 8:15 PM
 */
#ifndef ROBO_H
#define ROBO_H

//#include "BOARD.h"
//#include "AD.h"
#include "ES_Configure.h"


//Initialization Function for the Robot and Respective Components
void ROBO_Init(void);

//Functions to move robo motors
int RoboLeftMtrSpeed(int speed);
int RoboRightMtrSpeed(int speed);

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