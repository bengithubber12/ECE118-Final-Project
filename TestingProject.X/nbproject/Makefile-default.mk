#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/TestingProject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/TestingProject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED="C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/AD.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/BOARD.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_CheckEvents.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_Framework.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_KeyboardInput.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_PostList.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_Queue.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_TattleTale.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_Timers.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/IO_Ports.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/LED.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/RC_Servo.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/pwm.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/serial.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/timers.c" TapeService.c RobotMain.c RoboHSM.c RoamSubHSM.c Motors.c DepositSubHSM.c BumperService.c "C:/Users/jeemcast/OneDrive - ucsc.edu/TestingProject.X/BeaconService.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/TestingProject.X/TrackWireService.c"

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/70233818/AD.o ${OBJECTDIR}/_ext/70233818/BOARD.o ${OBJECTDIR}/_ext/70233818/ES_CheckEvents.o ${OBJECTDIR}/_ext/70233818/ES_Framework.o ${OBJECTDIR}/_ext/70233818/ES_KeyboardInput.o ${OBJECTDIR}/_ext/70233818/ES_PostList.o ${OBJECTDIR}/_ext/70233818/ES_Queue.o ${OBJECTDIR}/_ext/70233818/ES_TattleTale.o ${OBJECTDIR}/_ext/70233818/ES_Timers.o ${OBJECTDIR}/_ext/70233818/IO_Ports.o ${OBJECTDIR}/_ext/70233818/LED.o ${OBJECTDIR}/_ext/70233818/RC_Servo.o ${OBJECTDIR}/_ext/70233818/pwm.o ${OBJECTDIR}/_ext/70233818/serial.o ${OBJECTDIR}/_ext/70233818/timers.o ${OBJECTDIR}/TapeService.o ${OBJECTDIR}/RobotMain.o ${OBJECTDIR}/RoboHSM.o ${OBJECTDIR}/RoamSubHSM.o ${OBJECTDIR}/Motors.o ${OBJECTDIR}/DepositSubHSM.o ${OBJECTDIR}/BumperService.o ${OBJECTDIR}/_ext/223517287/BeaconService.o ${OBJECTDIR}/_ext/223517287/TrackWireService.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/70233818/AD.o.d ${OBJECTDIR}/_ext/70233818/BOARD.o.d ${OBJECTDIR}/_ext/70233818/ES_CheckEvents.o.d ${OBJECTDIR}/_ext/70233818/ES_Framework.o.d ${OBJECTDIR}/_ext/70233818/ES_KeyboardInput.o.d ${OBJECTDIR}/_ext/70233818/ES_PostList.o.d ${OBJECTDIR}/_ext/70233818/ES_Queue.o.d ${OBJECTDIR}/_ext/70233818/ES_TattleTale.o.d ${OBJECTDIR}/_ext/70233818/ES_Timers.o.d ${OBJECTDIR}/_ext/70233818/IO_Ports.o.d ${OBJECTDIR}/_ext/70233818/LED.o.d ${OBJECTDIR}/_ext/70233818/RC_Servo.o.d ${OBJECTDIR}/_ext/70233818/pwm.o.d ${OBJECTDIR}/_ext/70233818/serial.o.d ${OBJECTDIR}/_ext/70233818/timers.o.d ${OBJECTDIR}/TapeService.o.d ${OBJECTDIR}/RobotMain.o.d ${OBJECTDIR}/RoboHSM.o.d ${OBJECTDIR}/RoamSubHSM.o.d ${OBJECTDIR}/Motors.o.d ${OBJECTDIR}/DepositSubHSM.o.d ${OBJECTDIR}/BumperService.o.d ${OBJECTDIR}/_ext/223517287/BeaconService.o.d ${OBJECTDIR}/_ext/223517287/TrackWireService.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/70233818/AD.o ${OBJECTDIR}/_ext/70233818/BOARD.o ${OBJECTDIR}/_ext/70233818/ES_CheckEvents.o ${OBJECTDIR}/_ext/70233818/ES_Framework.o ${OBJECTDIR}/_ext/70233818/ES_KeyboardInput.o ${OBJECTDIR}/_ext/70233818/ES_PostList.o ${OBJECTDIR}/_ext/70233818/ES_Queue.o ${OBJECTDIR}/_ext/70233818/ES_TattleTale.o ${OBJECTDIR}/_ext/70233818/ES_Timers.o ${OBJECTDIR}/_ext/70233818/IO_Ports.o ${OBJECTDIR}/_ext/70233818/LED.o ${OBJECTDIR}/_ext/70233818/RC_Servo.o ${OBJECTDIR}/_ext/70233818/pwm.o ${OBJECTDIR}/_ext/70233818/serial.o ${OBJECTDIR}/_ext/70233818/timers.o ${OBJECTDIR}/TapeService.o ${OBJECTDIR}/RobotMain.o ${OBJECTDIR}/RoboHSM.o ${OBJECTDIR}/RoamSubHSM.o ${OBJECTDIR}/Motors.o ${OBJECTDIR}/DepositSubHSM.o ${OBJECTDIR}/BumperService.o ${OBJECTDIR}/_ext/223517287/BeaconService.o ${OBJECTDIR}/_ext/223517287/TrackWireService.o

# Source Files
SOURCEFILES=C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/AD.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/BOARD.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_CheckEvents.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_Framework.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_KeyboardInput.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_PostList.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_Queue.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_TattleTale.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_Timers.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/IO_Ports.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/LED.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/RC_Servo.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/pwm.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/serial.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/timers.c TapeService.c RobotMain.c RoboHSM.c RoamSubHSM.c Motors.c DepositSubHSM.c BumperService.c C:/Users/jeemcast/OneDrive - ucsc.edu/TestingProject.X/BeaconService.c C:/Users/jeemcast/OneDrive - ucsc.edu/TestingProject.X/TrackWireService.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

# The following macros may be used in the pre and post step lines
_/_=\\
ShExtension=.bat
Device=PIC32MX320F128H
ProjectDir="C:\Users\jeemcast\OneDrive - ucsc.edu\TestingProject.X"
ProjectName=TestingProject
ConfName=default
ImagePath="${DISTDIR}\TestingProject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ImageDir="${DISTDIR}"
ImageName="TestingProject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IsDebug="true"
else
IsDebug="false"
endif

.build-conf:  .pre ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/TestingProject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX320F128H
MP_LINKER_FILE_OPTION=,--script="C:\Users\jeemcast\OneDrive - ucsc.edu\ECE118\bootloader320.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/70233818/AD.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/AD.c  .generated_files/flags/default/60d1b4219f45c3c30bd1825c2134bf01d1fd932e .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/AD.o.d" -o ${OBJECTDIR}/_ext/70233818/AD.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/AD.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/BOARD.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/BOARD.c  .generated_files/flags/default/83051a1de469750a119a965d27e3c3780f55bb3b .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/BOARD.o.d" -o ${OBJECTDIR}/_ext/70233818/BOARD.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/BOARD.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_CheckEvents.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_CheckEvents.c  .generated_files/flags/default/386b413d0719036a0b3aa86af39bb043a37681f8 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_CheckEvents.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_CheckEvents.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_Framework.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_Framework.c  .generated_files/flags/default/46ca32aba425768d1b633b17bb492158f9429c86 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_Framework.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_Framework.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_KeyboardInput.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_KeyboardInput.c  .generated_files/flags/default/8eb92c46aeec690013f0061e4fa55ae517ed36af .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_KeyboardInput.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_KeyboardInput.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_PostList.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_PostList.c  .generated_files/flags/default/5bbe8e46fabfe779b79fb70c0b157ae8c2b82592 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_PostList.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_PostList.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_Queue.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_Queue.c  .generated_files/flags/default/feb5c73ca348699ac5705023903f3f5112b94d01 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_Queue.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_Queue.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_TattleTale.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_TattleTale.c  .generated_files/flags/default/64a88bba80fbb8a1d54f60eb81e120f4dc96b143 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_TattleTale.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_TattleTale.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_Timers.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_Timers.c  .generated_files/flags/default/11897b2285b5ff9c24ee98bde950526a466e9a94 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_Timers.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_Timers.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/IO_Ports.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/IO_Ports.c  .generated_files/flags/default/a3737e26b652a44632de452c4934d9d50caa3a82 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/70233818/IO_Ports.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/IO_Ports.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/LED.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/LED.c  .generated_files/flags/default/35408ffcfacb0c3dbbde372443982d0248d9f5b .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/LED.o.d" -o ${OBJECTDIR}/_ext/70233818/LED.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/LED.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/RC_Servo.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/RC_Servo.c  .generated_files/flags/default/1b52cd702427e315d9948fa8e84d60bf1840a074 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/RC_Servo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/70233818/RC_Servo.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/RC_Servo.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/pwm.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/pwm.c  .generated_files/flags/default/5fa5724064fa99598c003a05fcc26505b5977c4a .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/pwm.o.d" -o ${OBJECTDIR}/_ext/70233818/pwm.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/pwm.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/serial.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/serial.c  .generated_files/flags/default/c19fc3944885638c3ef3e56e74c775a50cfb7360 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/serial.o.d" -o ${OBJECTDIR}/_ext/70233818/serial.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/serial.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/timers.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/timers.c  .generated_files/flags/default/cae9db5a7878567f9614ab40d1fb77ddb3a69cca .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/timers.o.d" -o ${OBJECTDIR}/_ext/70233818/timers.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/timers.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TapeService.o: TapeService.c  .generated_files/flags/default/6b41e95595379592ae4e0fbf1b1ab9fcabd0f50f .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TapeService.o.d 
	@${RM} ${OBJECTDIR}/TapeService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/TapeService.o.d" -o ${OBJECTDIR}/TapeService.o TapeService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/RobotMain.o: RobotMain.c  .generated_files/flags/default/849068ca229bb822998bae9f810183eaf959464d .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RobotMain.o.d 
	@${RM} ${OBJECTDIR}/RobotMain.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/RobotMain.o.d" -o ${OBJECTDIR}/RobotMain.o RobotMain.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/RoboHSM.o: RoboHSM.c  .generated_files/flags/default/3690baeedc3a42c187141411da54682def6cf3a9 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RoboHSM.o.d 
	@${RM} ${OBJECTDIR}/RoboHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/RoboHSM.o.d" -o ${OBJECTDIR}/RoboHSM.o RoboHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/RoamSubHSM.o: RoamSubHSM.c  .generated_files/flags/default/7fafafa0a5e6114456ce00e7bdbf1406085af75 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RoamSubHSM.o.d 
	@${RM} ${OBJECTDIR}/RoamSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/RoamSubHSM.o.d" -o ${OBJECTDIR}/RoamSubHSM.o RoamSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/Motors.o: Motors.c  .generated_files/flags/default/7893d2ba44b68b1576f00149a1d5d50aa7dcd507 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Motors.o.d 
	@${RM} ${OBJECTDIR}/Motors.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/Motors.o.d" -o ${OBJECTDIR}/Motors.o Motors.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/DepositSubHSM.o: DepositSubHSM.c  .generated_files/flags/default/e5f4f5f24c0964bb019071c685315a1e2a904d35 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/DepositSubHSM.o.d 
	@${RM} ${OBJECTDIR}/DepositSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/DepositSubHSM.o.d" -o ${OBJECTDIR}/DepositSubHSM.o DepositSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/BumperService.o: BumperService.c  .generated_files/flags/default/1b9388e3442281443901ab5e972368de70c1510f .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/BumperService.o.d 
	@${RM} ${OBJECTDIR}/BumperService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/BumperService.o.d" -o ${OBJECTDIR}/BumperService.o BumperService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/223517287/BeaconService.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/TestingProject.X/BeaconService.c  .generated_files/flags/default/9e8ef60b76b29af6c600075c38edecb623b22337 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/223517287" 
	@${RM} ${OBJECTDIR}/_ext/223517287/BeaconService.o.d 
	@${RM} ${OBJECTDIR}/_ext/223517287/BeaconService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/223517287/BeaconService.o.d" -o ${OBJECTDIR}/_ext/223517287/BeaconService.o "C:/Users/jeemcast/OneDrive - ucsc.edu/TestingProject.X/BeaconService.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/223517287/TrackWireService.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/TestingProject.X/TrackWireService.c  .generated_files/flags/default/6b8aec13da2c51269952f94a2f7ffb3fe72b56e6 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/223517287" 
	@${RM} ${OBJECTDIR}/_ext/223517287/TrackWireService.o.d 
	@${RM} ${OBJECTDIR}/_ext/223517287/TrackWireService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/223517287/TrackWireService.o.d" -o ${OBJECTDIR}/_ext/223517287/TrackWireService.o "C:/Users/jeemcast/OneDrive - ucsc.edu/TestingProject.X/TrackWireService.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/70233818/AD.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/AD.c  .generated_files/flags/default/1f136716a9744b91ad2adb431eefcaf7faa64a6d .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/AD.o.d" -o ${OBJECTDIR}/_ext/70233818/AD.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/AD.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/BOARD.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/BOARD.c  .generated_files/flags/default/c7bce60a15c239ccf97a951ab87e0e31b4d5e037 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/BOARD.o.d" -o ${OBJECTDIR}/_ext/70233818/BOARD.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/BOARD.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_CheckEvents.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_CheckEvents.c  .generated_files/flags/default/72a1f5ecf473b7c2587787086e82d46036f1a909 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_CheckEvents.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_CheckEvents.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_Framework.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_Framework.c  .generated_files/flags/default/6aeb1f9909ee77750cddee51c4022d27323f8e76 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_Framework.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_Framework.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_KeyboardInput.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_KeyboardInput.c  .generated_files/flags/default/6db8197d51b2ab8d387db57cff6056a261b3370b .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_KeyboardInput.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_KeyboardInput.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_PostList.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_PostList.c  .generated_files/flags/default/97288e4d8f8cf187e1bc6bf3414ebe705329f12b .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_PostList.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_PostList.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_Queue.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_Queue.c  .generated_files/flags/default/71920e65f4e3498774aadd77713327eb44fb2d19 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_Queue.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_Queue.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_TattleTale.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_TattleTale.c  .generated_files/flags/default/bbdc18b4b13e40de4381cb5b458fec67bcb36456 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_TattleTale.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_TattleTale.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_Timers.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_Timers.c  .generated_files/flags/default/dfa69e6005e6d329cd01a6ff71cbcd562db60541 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_Timers.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_Timers.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/IO_Ports.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/IO_Ports.c  .generated_files/flags/default/76a98e7184dc8f82d1f41477f4856a98dd35bd66 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/70233818/IO_Ports.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/IO_Ports.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/LED.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/LED.c  .generated_files/flags/default/e1e2a36c0f1cef8ccc4eb56984b0a31ae2819646 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/LED.o.d" -o ${OBJECTDIR}/_ext/70233818/LED.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/LED.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/RC_Servo.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/RC_Servo.c  .generated_files/flags/default/7fd74648d9cbf1754c561616134bff23d951a5c5 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/RC_Servo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/70233818/RC_Servo.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/RC_Servo.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/pwm.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/pwm.c  .generated_files/flags/default/a0e62e6151a2123fd20da7d22206c08317963af9 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/pwm.o.d" -o ${OBJECTDIR}/_ext/70233818/pwm.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/pwm.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/serial.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/serial.c  .generated_files/flags/default/26ccdcc5ddf6da50a664c68a69435ee2dc9149e8 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/serial.o.d" -o ${OBJECTDIR}/_ext/70233818/serial.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/serial.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/timers.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/timers.c  .generated_files/flags/default/ff894aa594fbe0d90cf129508d4d8496e1e5422e .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/timers.o.d" -o ${OBJECTDIR}/_ext/70233818/timers.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/timers.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TapeService.o: TapeService.c  .generated_files/flags/default/d0b312687c6851fdd8f83bfa68ecc5366540d766 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TapeService.o.d 
	@${RM} ${OBJECTDIR}/TapeService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/TapeService.o.d" -o ${OBJECTDIR}/TapeService.o TapeService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/RobotMain.o: RobotMain.c  .generated_files/flags/default/bd3fc794acba871f2afcbc760642af3c938a394d .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RobotMain.o.d 
	@${RM} ${OBJECTDIR}/RobotMain.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/RobotMain.o.d" -o ${OBJECTDIR}/RobotMain.o RobotMain.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/RoboHSM.o: RoboHSM.c  .generated_files/flags/default/16b03e0dc84844ab6a9fa60ff824f5b2d62580d2 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RoboHSM.o.d 
	@${RM} ${OBJECTDIR}/RoboHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/RoboHSM.o.d" -o ${OBJECTDIR}/RoboHSM.o RoboHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/RoamSubHSM.o: RoamSubHSM.c  .generated_files/flags/default/8bdded0fe5ec47f20d2ab79bcc1aef81a6cb6070 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RoamSubHSM.o.d 
	@${RM} ${OBJECTDIR}/RoamSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/RoamSubHSM.o.d" -o ${OBJECTDIR}/RoamSubHSM.o RoamSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/Motors.o: Motors.c  .generated_files/flags/default/787ddbd1f4ac19feabcc64beeb079dd7cd457cd5 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Motors.o.d 
	@${RM} ${OBJECTDIR}/Motors.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/Motors.o.d" -o ${OBJECTDIR}/Motors.o Motors.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/DepositSubHSM.o: DepositSubHSM.c  .generated_files/flags/default/7d84bfe4b88c393be9196e4e1ec5c327c36f9f6e .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/DepositSubHSM.o.d 
	@${RM} ${OBJECTDIR}/DepositSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/DepositSubHSM.o.d" -o ${OBJECTDIR}/DepositSubHSM.o DepositSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/BumperService.o: BumperService.c  .generated_files/flags/default/f7024bdc1d4998dfcc0be5b0912506ac2ec2514f .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/BumperService.o.d 
	@${RM} ${OBJECTDIR}/BumperService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/BumperService.o.d" -o ${OBJECTDIR}/BumperService.o BumperService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/223517287/BeaconService.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/TestingProject.X/BeaconService.c  .generated_files/flags/default/36112144c61cf6d95e71b45aadf1e9eac1d58f07 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/223517287" 
	@${RM} ${OBJECTDIR}/_ext/223517287/BeaconService.o.d 
	@${RM} ${OBJECTDIR}/_ext/223517287/BeaconService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/223517287/BeaconService.o.d" -o ${OBJECTDIR}/_ext/223517287/BeaconService.o "C:/Users/jeemcast/OneDrive - ucsc.edu/TestingProject.X/BeaconService.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/223517287/TrackWireService.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/TestingProject.X/TrackWireService.c  .generated_files/flags/default/c7d776a15792fb2bb1f12ec1554dbf11fa091350 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/223517287" 
	@${RM} ${OBJECTDIR}/_ext/223517287/TrackWireService.o.d 
	@${RM} ${OBJECTDIR}/_ext/223517287/TrackWireService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/include" -I"." -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/223517287/TrackWireService.o.d" -o ${OBJECTDIR}/_ext/223517287/TrackWireService.o "C:/Users/jeemcast/OneDrive - ucsc.edu/TestingProject.X/TrackWireService.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/TestingProject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/TestingProject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=10,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/TestingProject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/TestingProject.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=10,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/TestingProject.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif

.pre:
	@echo "--------------------------------------"
	@echo "User defined pre-build step: [python C:\ECE118\scripts\Enum_To_String.py]"
	@python C:\ECE118\scripts\Enum_To_String.py
	@echo "--------------------------------------"

# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
