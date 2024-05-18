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
FINAL_IMAGE=${DISTDIR}/FinalProject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/FinalProject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED="C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/AD.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/BOARD.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_CheckEvents.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_Framework.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_KeyboardInput.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_PostList.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_Queue.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_TattleTale.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_Timers.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/IO_Ports.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/LED.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/RC_Servo.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/pwm.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/roach.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/serial.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/timers.c" RobotMain.c TapeService.c ROBO.c "C:/Users/jeemcast/OneDrive - ucsc.edu/FinalProject.X/RoboHSM.c" "C:/Users/jeemcast/OneDrive - ucsc.edu/FinalProject.X/RoamSubHSM.c"

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/70233818/AD.o ${OBJECTDIR}/_ext/70233818/BOARD.o ${OBJECTDIR}/_ext/70233818/ES_CheckEvents.o ${OBJECTDIR}/_ext/70233818/ES_Framework.o ${OBJECTDIR}/_ext/70233818/ES_KeyboardInput.o ${OBJECTDIR}/_ext/70233818/ES_PostList.o ${OBJECTDIR}/_ext/70233818/ES_Queue.o ${OBJECTDIR}/_ext/70233818/ES_TattleTale.o ${OBJECTDIR}/_ext/70233818/ES_Timers.o ${OBJECTDIR}/_ext/70233818/IO_Ports.o ${OBJECTDIR}/_ext/70233818/LED.o ${OBJECTDIR}/_ext/70233818/RC_Servo.o ${OBJECTDIR}/_ext/70233818/pwm.o ${OBJECTDIR}/_ext/70233818/roach.o ${OBJECTDIR}/_ext/70233818/serial.o ${OBJECTDIR}/_ext/70233818/timers.o ${OBJECTDIR}/RobotMain.o ${OBJECTDIR}/TapeService.o ${OBJECTDIR}/ROBO.o ${OBJECTDIR}/_ext/425729343/RoboHSM.o ${OBJECTDIR}/_ext/425729343/RoamSubHSM.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/70233818/AD.o.d ${OBJECTDIR}/_ext/70233818/BOARD.o.d ${OBJECTDIR}/_ext/70233818/ES_CheckEvents.o.d ${OBJECTDIR}/_ext/70233818/ES_Framework.o.d ${OBJECTDIR}/_ext/70233818/ES_KeyboardInput.o.d ${OBJECTDIR}/_ext/70233818/ES_PostList.o.d ${OBJECTDIR}/_ext/70233818/ES_Queue.o.d ${OBJECTDIR}/_ext/70233818/ES_TattleTale.o.d ${OBJECTDIR}/_ext/70233818/ES_Timers.o.d ${OBJECTDIR}/_ext/70233818/IO_Ports.o.d ${OBJECTDIR}/_ext/70233818/LED.o.d ${OBJECTDIR}/_ext/70233818/RC_Servo.o.d ${OBJECTDIR}/_ext/70233818/pwm.o.d ${OBJECTDIR}/_ext/70233818/roach.o.d ${OBJECTDIR}/_ext/70233818/serial.o.d ${OBJECTDIR}/_ext/70233818/timers.o.d ${OBJECTDIR}/RobotMain.o.d ${OBJECTDIR}/TapeService.o.d ${OBJECTDIR}/ROBO.o.d ${OBJECTDIR}/_ext/425729343/RoboHSM.o.d ${OBJECTDIR}/_ext/425729343/RoamSubHSM.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/70233818/AD.o ${OBJECTDIR}/_ext/70233818/BOARD.o ${OBJECTDIR}/_ext/70233818/ES_CheckEvents.o ${OBJECTDIR}/_ext/70233818/ES_Framework.o ${OBJECTDIR}/_ext/70233818/ES_KeyboardInput.o ${OBJECTDIR}/_ext/70233818/ES_PostList.o ${OBJECTDIR}/_ext/70233818/ES_Queue.o ${OBJECTDIR}/_ext/70233818/ES_TattleTale.o ${OBJECTDIR}/_ext/70233818/ES_Timers.o ${OBJECTDIR}/_ext/70233818/IO_Ports.o ${OBJECTDIR}/_ext/70233818/LED.o ${OBJECTDIR}/_ext/70233818/RC_Servo.o ${OBJECTDIR}/_ext/70233818/pwm.o ${OBJECTDIR}/_ext/70233818/roach.o ${OBJECTDIR}/_ext/70233818/serial.o ${OBJECTDIR}/_ext/70233818/timers.o ${OBJECTDIR}/RobotMain.o ${OBJECTDIR}/TapeService.o ${OBJECTDIR}/ROBO.o ${OBJECTDIR}/_ext/425729343/RoboHSM.o ${OBJECTDIR}/_ext/425729343/RoamSubHSM.o

# Source Files
SOURCEFILES=C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/AD.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/BOARD.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_CheckEvents.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_Framework.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_KeyboardInput.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_PostList.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_Queue.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_TattleTale.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_Timers.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/IO_Ports.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/LED.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/RC_Servo.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/pwm.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/roach.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/serial.c C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/timers.c RobotMain.c TapeService.c ROBO.c C:/Users/jeemcast/OneDrive - ucsc.edu/FinalProject.X/RoboHSM.c C:/Users/jeemcast/OneDrive - ucsc.edu/FinalProject.X/RoamSubHSM.c



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
ProjectDir="C:\Users\jeemcast\OneDrive - ucsc.edu\FinalProject.X"
ProjectName=FinalProject
ConfName=default
ImagePath="${DISTDIR}\FinalProject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ImageDir="${DISTDIR}"
ImageName="FinalProject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IsDebug="true"
else
IsDebug="false"
endif

.build-conf:  .pre ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/FinalProject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/_ext/70233818/AD.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/AD.c  .generated_files/flags/default/bf6d375472e54c684b470f2ea479523a6acb24c9 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/AD.o.d" -o ${OBJECTDIR}/_ext/70233818/AD.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/AD.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/BOARD.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/BOARD.c  .generated_files/flags/default/310f67b25605b4c7fd9954d9eb5df48464f1c208 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/BOARD.o.d" -o ${OBJECTDIR}/_ext/70233818/BOARD.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/BOARD.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_CheckEvents.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_CheckEvents.c  .generated_files/flags/default/bf3e840aea01637a61b101e9253ca4d091edb6fd .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_CheckEvents.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_CheckEvents.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_Framework.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_Framework.c  .generated_files/flags/default/6d83f78123e4c52f5080a777b1e16bab5e365d1c .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_Framework.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_Framework.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_KeyboardInput.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_KeyboardInput.c  .generated_files/flags/default/582c1e0cc6f8d1ffbc691b00e5f8327e9fcfab9b .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_KeyboardInput.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_KeyboardInput.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_PostList.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_PostList.c  .generated_files/flags/default/7dd2b07b176bb35fd3dfc5fb4d1bdcb752384f97 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_PostList.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_PostList.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_Queue.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_Queue.c  .generated_files/flags/default/39bc2a2197468c58e50477300af152b5a349abb8 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_Queue.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_Queue.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_TattleTale.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_TattleTale.c  .generated_files/flags/default/dd612658abe53af46f8d01d07543bc73c7a1fc8a .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_TattleTale.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_TattleTale.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_Timers.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_Timers.c  .generated_files/flags/default/4c4048a278db064ad851488a78d8e3038a408d05 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_Timers.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_Timers.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/IO_Ports.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/IO_Ports.c  .generated_files/flags/default/9c69922e170a3f0144266d771dfc38a58da5176 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/70233818/IO_Ports.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/IO_Ports.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/LED.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/LED.c  .generated_files/flags/default/74367ad1965950e24b007b3dd5c06fcda98cd105 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/LED.o.d" -o ${OBJECTDIR}/_ext/70233818/LED.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/LED.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/RC_Servo.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/RC_Servo.c  .generated_files/flags/default/b13694ea07e0d397b465356007f40523a1843f89 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/RC_Servo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/70233818/RC_Servo.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/RC_Servo.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/pwm.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/pwm.c  .generated_files/flags/default/3654f2df82ad231ba5d8dcb5bc51c4c132a04073 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/pwm.o.d" -o ${OBJECTDIR}/_ext/70233818/pwm.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/pwm.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/roach.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/roach.c  .generated_files/flags/default/5466cca9ce7b8eb96d4899c2dd48265fe44e77ee .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/roach.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/roach.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/roach.o.d" -o ${OBJECTDIR}/_ext/70233818/roach.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/roach.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/serial.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/serial.c  .generated_files/flags/default/7c4f3eec37633d5959138fbe322a81961cd6df6f .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/serial.o.d" -o ${OBJECTDIR}/_ext/70233818/serial.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/serial.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/timers.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/timers.c  .generated_files/flags/default/8df99e1ae32e52b712eef4299cae7c41358cd5f6 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/timers.o.d" -o ${OBJECTDIR}/_ext/70233818/timers.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/timers.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/RobotMain.o: RobotMain.c  .generated_files/flags/default/814ec724bbe01392b4bc91d6552a7b52534cba4 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RobotMain.o.d 
	@${RM} ${OBJECTDIR}/RobotMain.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/RobotMain.o.d" -o ${OBJECTDIR}/RobotMain.o RobotMain.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TapeService.o: TapeService.c  .generated_files/flags/default/31bc752a60241f7d04f0088592dba2996e18f0bc .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TapeService.o.d 
	@${RM} ${OBJECTDIR}/TapeService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/TapeService.o.d" -o ${OBJECTDIR}/TapeService.o TapeService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ROBO.o: ROBO.c  .generated_files/flags/default/36b25bb191c444f210cbfbc56b048e90c1c8eb69 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ROBO.o.d 
	@${RM} ${OBJECTDIR}/ROBO.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/ROBO.o.d" -o ${OBJECTDIR}/ROBO.o ROBO.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/425729343/RoboHSM.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/FinalProject.X/RoboHSM.c  .generated_files/flags/default/edd3c667d2161d1a629ba21e41d18d898fac7367 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/425729343" 
	@${RM} ${OBJECTDIR}/_ext/425729343/RoboHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/425729343/RoboHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/425729343/RoboHSM.o.d" -o ${OBJECTDIR}/_ext/425729343/RoboHSM.o "C:/Users/jeemcast/OneDrive - ucsc.edu/FinalProject.X/RoboHSM.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/425729343/RoamSubHSM.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/FinalProject.X/RoamSubHSM.c  .generated_files/flags/default/9748de892c9cc7d6ef7cb022816575bdb47f0f2f .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/425729343" 
	@${RM} ${OBJECTDIR}/_ext/425729343/RoamSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/425729343/RoamSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/425729343/RoamSubHSM.o.d" -o ${OBJECTDIR}/_ext/425729343/RoamSubHSM.o "C:/Users/jeemcast/OneDrive - ucsc.edu/FinalProject.X/RoamSubHSM.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/70233818/AD.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/AD.c  .generated_files/flags/default/97b7116f79292dc7cfe22f22a0f5f5644ecd375d .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/AD.o.d" -o ${OBJECTDIR}/_ext/70233818/AD.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/AD.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/BOARD.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/BOARD.c  .generated_files/flags/default/ab21002a73b9515652930dec9bcf32cfadd727cc .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/BOARD.o.d" -o ${OBJECTDIR}/_ext/70233818/BOARD.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/BOARD.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_CheckEvents.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_CheckEvents.c  .generated_files/flags/default/6e95a403d422ac21007edb06d760f687d81f9683 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_CheckEvents.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_CheckEvents.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_Framework.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_Framework.c  .generated_files/flags/default/d4c37a1405a63b62907cc0635dfc1bf74f474bdc .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_Framework.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_Framework.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_KeyboardInput.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_KeyboardInput.c  .generated_files/flags/default/20f317f2a5f149617b179ccc5ab53cd5e8d64c48 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_KeyboardInput.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_KeyboardInput.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_PostList.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_PostList.c  .generated_files/flags/default/2ce783b5242ff24b2114a86d97be5506e9a6f5e2 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_PostList.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_PostList.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_Queue.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_Queue.c  .generated_files/flags/default/9319b9bd7aafa6943d015c2bdbe79b08ce9ba0d3 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_Queue.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_Queue.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_TattleTale.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_TattleTale.c  .generated_files/flags/default/35ff8a9e9caffb365d83302d0c707483f1dc5338 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_TattleTale.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_TattleTale.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/ES_Timers.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/ES_Timers.c  .generated_files/flags/default/27328de99bb3082509787120b4506f944dbf868f .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/70233818/ES_Timers.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/ES_Timers.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/IO_Ports.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/IO_Ports.c  .generated_files/flags/default/ec8a348cd6663d67cd88f53f766047417ba649f3 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/70233818/IO_Ports.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/IO_Ports.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/LED.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/LED.c  .generated_files/flags/default/d24e189fbbb70850f0a1d3c6e38796303472a638 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/LED.o.d" -o ${OBJECTDIR}/_ext/70233818/LED.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/LED.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/RC_Servo.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/RC_Servo.c  .generated_files/flags/default/6c4676c5d9b9b052e2e5f0b4989d306a95f16201 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/RC_Servo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/70233818/RC_Servo.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/RC_Servo.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/pwm.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/pwm.c  .generated_files/flags/default/f4e1494bac424c134e303e351020d2ea171d2d0f .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/pwm.o.d" -o ${OBJECTDIR}/_ext/70233818/pwm.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/pwm.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/roach.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/roach.c  .generated_files/flags/default/5ddc991a11fa5dafb837701cdb6e2c76d0228873 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/roach.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/roach.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/roach.o.d" -o ${OBJECTDIR}/_ext/70233818/roach.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/roach.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/serial.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/serial.c  .generated_files/flags/default/f02370925b19499aa1d1d438b6487cab7f5b7677 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/serial.o.d" -o ${OBJECTDIR}/_ext/70233818/serial.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/serial.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/70233818/timers.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/src/timers.c  .generated_files/flags/default/7bcee736a372044af3baf5509ac64ecf90f1484a .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/70233818" 
	@${RM} ${OBJECTDIR}/_ext/70233818/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/70233818/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/70233818/timers.o.d" -o ${OBJECTDIR}/_ext/70233818/timers.o "C:/Users/jeemcast/OneDrive - ucsc.edu/ECE118/src/timers.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/RobotMain.o: RobotMain.c  .generated_files/flags/default/956901d3b3dbe74959e2a82563bbca35e5387c89 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RobotMain.o.d 
	@${RM} ${OBJECTDIR}/RobotMain.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/RobotMain.o.d" -o ${OBJECTDIR}/RobotMain.o RobotMain.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TapeService.o: TapeService.c  .generated_files/flags/default/5594cd502f29d3439ef4238c616fe02409cdd35a .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TapeService.o.d 
	@${RM} ${OBJECTDIR}/TapeService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/TapeService.o.d" -o ${OBJECTDIR}/TapeService.o TapeService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ROBO.o: ROBO.c  .generated_files/flags/default/c5f9a335644afbe462e4617ea742f8c501a18907 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ROBO.o.d 
	@${RM} ${OBJECTDIR}/ROBO.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/ROBO.o.d" -o ${OBJECTDIR}/ROBO.o ROBO.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/425729343/RoboHSM.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/FinalProject.X/RoboHSM.c  .generated_files/flags/default/66dfb1933c65056d36eb3ed588f12073fce267b8 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/425729343" 
	@${RM} ${OBJECTDIR}/_ext/425729343/RoboHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/425729343/RoboHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/425729343/RoboHSM.o.d" -o ${OBJECTDIR}/_ext/425729343/RoboHSM.o "C:/Users/jeemcast/OneDrive - ucsc.edu/FinalProject.X/RoboHSM.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/425729343/RoamSubHSM.o: C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/FinalProject.X/RoamSubHSM.c  .generated_files/flags/default/7a50aa8e7230874dd522a7085a95367e4960060e .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/425729343" 
	@${RM} ${OBJECTDIR}/_ext/425729343/RoamSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/425729343/RoamSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/425729343/RoamSubHSM.o.d" -o ${OBJECTDIR}/_ext/425729343/RoamSubHSM.o "C:/Users/jeemcast/OneDrive - ucsc.edu/FinalProject.X/RoamSubHSM.c"    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/FinalProject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/FinalProject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=10,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/FinalProject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   C:/Users/jeemcast/OneDrive\ -\ ucsc.edu/ECE118/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/FinalProject.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=10,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/FinalProject.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif

.pre:
	@echo "--------------------------------------"
	@echo "User defined pre-build step: [python C:\Users\jeemcast\ECE118\scripts\Enum_To_String.py]"
	@python C:\Users\jeemcast\ECE118\scripts\Enum_To_String.py
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
