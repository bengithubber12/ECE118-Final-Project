/*
 * File:   newmainXC16.h
 * Author: bgoldbla
 *
 * Created on May 14, 2024, 8:15 PM
 */
#ifndef ROBO_MOVE_H
#define ROBO_MOVE_H

#include "BOARD.h"
#include "AD.h"
//Function(s) To move Right and left robo motors
int RoboLeftMtrSpeed(int speed);
int RoboRightMtrSpeed(int speed);

//Initialization Function for the Robot and Respective Components
void ROBO_Init(void);

#endif