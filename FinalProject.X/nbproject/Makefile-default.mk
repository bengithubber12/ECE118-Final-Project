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
SOURCEFILES_QUOTED_IF_SPACED=RobotMain.c TapeService.c BumperService.c DepositSubHSM.c Motors.c MowerSubHSM.c ../../ECE118/src/AD.c ../../ECE118/src/BOARD.c ../../ECE118/src/ES_CheckEvents.c ../../ECE118/src/ES_Framework.c ../../ECE118/src/ES_KeyboardInput.c ../../ECE118/src/ES_PostList.c ../../ECE118/src/ES_Queue.c ../../ECE118/src/ES_TattleTale.c ../../ECE118/src/ES_Timers.c ../../ECE118/src/IO_Ports.c ../../ECE118/src/LED.c ../../ECE118/src/RC_Servo.c ../../ECE118/src/pwm.c ../../ECE118/src/roach.c ../../ECE118/src/serial.c ../../ECE118/src/timers.c FindDoorSubHSM.c RoamSubHSM.c TrackWireService.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/RobotMain.o ${OBJECTDIR}/TapeService.o ${OBJECTDIR}/BumperService.o ${OBJECTDIR}/DepositSubHSM.o ${OBJECTDIR}/Motors.o ${OBJECTDIR}/MowerSubHSM.o ${OBJECTDIR}/_ext/720413242/AD.o ${OBJECTDIR}/_ext/720413242/BOARD.o ${OBJECTDIR}/_ext/720413242/ES_CheckEvents.o ${OBJECTDIR}/_ext/720413242/ES_Framework.o ${OBJECTDIR}/_ext/720413242/ES_KeyboardInput.o ${OBJECTDIR}/_ext/720413242/ES_PostList.o ${OBJECTDIR}/_ext/720413242/ES_Queue.o ${OBJECTDIR}/_ext/720413242/ES_TattleTale.o ${OBJECTDIR}/_ext/720413242/ES_Timers.o ${OBJECTDIR}/_ext/720413242/IO_Ports.o ${OBJECTDIR}/_ext/720413242/LED.o ${OBJECTDIR}/_ext/720413242/RC_Servo.o ${OBJECTDIR}/_ext/720413242/pwm.o ${OBJECTDIR}/_ext/720413242/roach.o ${OBJECTDIR}/_ext/720413242/serial.o ${OBJECTDIR}/_ext/720413242/timers.o ${OBJECTDIR}/FindDoorSubHSM.o ${OBJECTDIR}/RoamSubHSM.o ${OBJECTDIR}/TrackWireService.o
POSSIBLE_DEPFILES=${OBJECTDIR}/RobotMain.o.d ${OBJECTDIR}/TapeService.o.d ${OBJECTDIR}/BumperService.o.d ${OBJECTDIR}/DepositSubHSM.o.d ${OBJECTDIR}/Motors.o.d ${OBJECTDIR}/MowerSubHSM.o.d ${OBJECTDIR}/_ext/720413242/AD.o.d ${OBJECTDIR}/_ext/720413242/BOARD.o.d ${OBJECTDIR}/_ext/720413242/ES_CheckEvents.o.d ${OBJECTDIR}/_ext/720413242/ES_Framework.o.d ${OBJECTDIR}/_ext/720413242/ES_KeyboardInput.o.d ${OBJECTDIR}/_ext/720413242/ES_PostList.o.d ${OBJECTDIR}/_ext/720413242/ES_Queue.o.d ${OBJECTDIR}/_ext/720413242/ES_TattleTale.o.d ${OBJECTDIR}/_ext/720413242/ES_Timers.o.d ${OBJECTDIR}/_ext/720413242/IO_Ports.o.d ${OBJECTDIR}/_ext/720413242/LED.o.d ${OBJECTDIR}/_ext/720413242/RC_Servo.o.d ${OBJECTDIR}/_ext/720413242/pwm.o.d ${OBJECTDIR}/_ext/720413242/roach.o.d ${OBJECTDIR}/_ext/720413242/serial.o.d ${OBJECTDIR}/_ext/720413242/timers.o.d ${OBJECTDIR}/FindDoorSubHSM.o.d ${OBJECTDIR}/RoamSubHSM.o.d ${OBJECTDIR}/TrackWireService.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/RobotMain.o ${OBJECTDIR}/TapeService.o ${OBJECTDIR}/BumperService.o ${OBJECTDIR}/DepositSubHSM.o ${OBJECTDIR}/Motors.o ${OBJECTDIR}/MowerSubHSM.o ${OBJECTDIR}/_ext/720413242/AD.o ${OBJECTDIR}/_ext/720413242/BOARD.o ${OBJECTDIR}/_ext/720413242/ES_CheckEvents.o ${OBJECTDIR}/_ext/720413242/ES_Framework.o ${OBJECTDIR}/_ext/720413242/ES_KeyboardInput.o ${OBJECTDIR}/_ext/720413242/ES_PostList.o ${OBJECTDIR}/_ext/720413242/ES_Queue.o ${OBJECTDIR}/_ext/720413242/ES_TattleTale.o ${OBJECTDIR}/_ext/720413242/ES_Timers.o ${OBJECTDIR}/_ext/720413242/IO_Ports.o ${OBJECTDIR}/_ext/720413242/LED.o ${OBJECTDIR}/_ext/720413242/RC_Servo.o ${OBJECTDIR}/_ext/720413242/pwm.o ${OBJECTDIR}/_ext/720413242/roach.o ${OBJECTDIR}/_ext/720413242/serial.o ${OBJECTDIR}/_ext/720413242/timers.o ${OBJECTDIR}/FindDoorSubHSM.o ${OBJECTDIR}/RoamSubHSM.o ${OBJECTDIR}/TrackWireService.o

# Source Files
SOURCEFILES=RobotMain.c TapeService.c BumperService.c DepositSubHSM.c Motors.c MowerSubHSM.c ../../ECE118/src/AD.c ../../ECE118/src/BOARD.c ../../ECE118/src/ES_CheckEvents.c ../../ECE118/src/ES_Framework.c ../../ECE118/src/ES_KeyboardInput.c ../../ECE118/src/ES_PostList.c ../../ECE118/src/ES_Queue.c ../../ECE118/src/ES_TattleTale.c ../../ECE118/src/ES_Timers.c ../../ECE118/src/IO_Ports.c ../../ECE118/src/LED.c ../../ECE118/src/RC_Servo.c ../../ECE118/src/pwm.c ../../ECE118/src/roach.c ../../ECE118/src/serial.c ../../ECE118/src/timers.c FindDoorSubHSM.c RoamSubHSM.c TrackWireService.c



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
ProjectDir="C:\ECE118-Final-Project\FinalProject.X"
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
MP_LINKER_FILE_OPTION=,--script="bootloader320.ld"
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
${OBJECTDIR}/RobotMain.o: RobotMain.c  .generated_files/flags/default/a0109269a50ba36441deca2d24461c38814ad515 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RobotMain.o.d 
	@${RM} ${OBJECTDIR}/RobotMain.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/RobotMain.o.d" -o ${OBJECTDIR}/RobotMain.o RobotMain.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TapeService.o: TapeService.c  .generated_files/flags/default/b974089ede9dfa2abae5dbc78b2652c812ab7f66 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TapeService.o.d 
	@${RM} ${OBJECTDIR}/TapeService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/TapeService.o.d" -o ${OBJECTDIR}/TapeService.o TapeService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/BumperService.o: BumperService.c  .generated_files/flags/default/38cc5bb8a6c659c2749e0af271f811046890868c .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/BumperService.o.d 
	@${RM} ${OBJECTDIR}/BumperService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/BumperService.o.d" -o ${OBJECTDIR}/BumperService.o BumperService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/DepositSubHSM.o: DepositSubHSM.c  .generated_files/flags/default/b9d2dc785d938f118152e248ca71b9d9b043a52d .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/DepositSubHSM.o.d 
	@${RM} ${OBJECTDIR}/DepositSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/DepositSubHSM.o.d" -o ${OBJECTDIR}/DepositSubHSM.o DepositSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/Motors.o: Motors.c  .generated_files/flags/default/69f164e87755442ad01c9ac0b7bd6f8bb5ed3b18 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Motors.o.d 
	@${RM} ${OBJECTDIR}/Motors.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/Motors.o.d" -o ${OBJECTDIR}/Motors.o Motors.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/MowerSubHSM.o: MowerSubHSM.c  .generated_files/flags/default/ba1a901c5f279c5153855e735aaa1bf8cac3855f .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MowerSubHSM.o.d 
	@${RM} ${OBJECTDIR}/MowerSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/MowerSubHSM.o.d" -o ${OBJECTDIR}/MowerSubHSM.o MowerSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/AD.o: ../../ECE118/src/AD.c  .generated_files/flags/default/c743113a4a3ccde183c12e50a7ae68dc046f4e49 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/AD.o.d" -o ${OBJECTDIR}/_ext/720413242/AD.o ../../ECE118/src/AD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/BOARD.o: ../../ECE118/src/BOARD.c  .generated_files/flags/default/ecbd7a08fe97dd394053d36259481254b7d4fffb .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/BOARD.o.d" -o ${OBJECTDIR}/_ext/720413242/BOARD.o ../../ECE118/src/BOARD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/ES_CheckEvents.o: ../../ECE118/src/ES_CheckEvents.c  .generated_files/flags/default/585f095a84f1a8bc89bdf74dde57c8b12189e5bd .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/720413242/ES_CheckEvents.o ../../ECE118/src/ES_CheckEvents.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/ES_Framework.o: ../../ECE118/src/ES_Framework.c  .generated_files/flags/default/176994c44471571aba11d17a2bda8d7d1ef1e40 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/720413242/ES_Framework.o ../../ECE118/src/ES_Framework.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/ES_KeyboardInput.o: ../../ECE118/src/ES_KeyboardInput.c  .generated_files/flags/default/62ef39fa0ae1a74a64e4b158100b419c17ba22a4 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/720413242/ES_KeyboardInput.o ../../ECE118/src/ES_KeyboardInput.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/ES_PostList.o: ../../ECE118/src/ES_PostList.c  .generated_files/flags/default/1f86429b9e70c332c40e951e01e1468ff2b3e2b6 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/720413242/ES_PostList.o ../../ECE118/src/ES_PostList.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/ES_Queue.o: ../../ECE118/src/ES_Queue.c  .generated_files/flags/default/93018f93e877f1e5ad0f31a2f7bc3ca8b9ed770f .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/720413242/ES_Queue.o ../../ECE118/src/ES_Queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/ES_TattleTale.o: ../../ECE118/src/ES_TattleTale.c  .generated_files/flags/default/f07d8a135d08e7d4145faacaa87aeb8735635fbf .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/720413242/ES_TattleTale.o ../../ECE118/src/ES_TattleTale.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/ES_Timers.o: ../../ECE118/src/ES_Timers.c  .generated_files/flags/default/3b1e736667ded513c90778203b15a6636b73e56e .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/720413242/ES_Timers.o ../../ECE118/src/ES_Timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/IO_Ports.o: ../../ECE118/src/IO_Ports.c  .generated_files/flags/default/c4ff42c5667f35c3d4dc49a49133a62f12349631 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/720413242/IO_Ports.o ../../ECE118/src/IO_Ports.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/LED.o: ../../ECE118/src/LED.c  .generated_files/flags/default/a6503965f65ba2ec2022824e488cfead4eeb725 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/LED.o.d" -o ${OBJECTDIR}/_ext/720413242/LED.o ../../ECE118/src/LED.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/RC_Servo.o: ../../ECE118/src/RC_Servo.c  .generated_files/flags/default/5228350753237cb5b69d449c44fcf115865ff69b .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/RC_Servo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/720413242/RC_Servo.o ../../ECE118/src/RC_Servo.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/pwm.o: ../../ECE118/src/pwm.c  .generated_files/flags/default/983a5908144e964a3dfb64a1a8571afd6695b58 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/pwm.o.d" -o ${OBJECTDIR}/_ext/720413242/pwm.o ../../ECE118/src/pwm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/roach.o: ../../ECE118/src/roach.c  .generated_files/flags/default/65f95b7917d59c866e8211584fee694150e8291e .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/roach.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/roach.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/roach.o.d" -o ${OBJECTDIR}/_ext/720413242/roach.o ../../ECE118/src/roach.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/serial.o: ../../ECE118/src/serial.c  .generated_files/flags/default/5adad568ec687a43984e58209aa20ee21ba8e735 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/serial.o.d" -o ${OBJECTDIR}/_ext/720413242/serial.o ../../ECE118/src/serial.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/timers.o: ../../ECE118/src/timers.c  .generated_files/flags/default/74018cf67c31fcfc205ef86437474e8ec72375e9 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/timers.o.d" -o ${OBJECTDIR}/_ext/720413242/timers.o ../../ECE118/src/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FindDoorSubHSM.o: FindDoorSubHSM.c  .generated_files/flags/default/5b75acbfdfefb5e70632c6a0d6979cdf11a842b5 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FindDoorSubHSM.o.d 
	@${RM} ${OBJECTDIR}/FindDoorSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/FindDoorSubHSM.o.d" -o ${OBJECTDIR}/FindDoorSubHSM.o FindDoorSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/RoamSubHSM.o: RoamSubHSM.c  .generated_files/flags/default/5a32b1e0a2794a43cbc67ffc0f443a799a16317d .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RoamSubHSM.o.d 
	@${RM} ${OBJECTDIR}/RoamSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/RoamSubHSM.o.d" -o ${OBJECTDIR}/RoamSubHSM.o RoamSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TrackWireService.o: TrackWireService.c  .generated_files/flags/default/79e4268a519d663d72c81c4dc28d3c23e70cb324 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TrackWireService.o.d 
	@${RM} ${OBJECTDIR}/TrackWireService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/TrackWireService.o.d" -o ${OBJECTDIR}/TrackWireService.o TrackWireService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/RobotMain.o: RobotMain.c  .generated_files/flags/default/e185597b88cadfc3d087120670d449637f1a5f75 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RobotMain.o.d 
	@${RM} ${OBJECTDIR}/RobotMain.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/RobotMain.o.d" -o ${OBJECTDIR}/RobotMain.o RobotMain.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TapeService.o: TapeService.c  .generated_files/flags/default/c1a40b14da8d535e4acdb27425a330f3f3fa2564 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TapeService.o.d 
	@${RM} ${OBJECTDIR}/TapeService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/TapeService.o.d" -o ${OBJECTDIR}/TapeService.o TapeService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/BumperService.o: BumperService.c  .generated_files/flags/default/3e58183493b331fa6791d9d99cd4fe8aef90fa5d .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/BumperService.o.d 
	@${RM} ${OBJECTDIR}/BumperService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/BumperService.o.d" -o ${OBJECTDIR}/BumperService.o BumperService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/DepositSubHSM.o: DepositSubHSM.c  .generated_files/flags/default/48b57b9fc5c258616ddf5b9091182cb9c340262f .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/DepositSubHSM.o.d 
	@${RM} ${OBJECTDIR}/DepositSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/DepositSubHSM.o.d" -o ${OBJECTDIR}/DepositSubHSM.o DepositSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/Motors.o: Motors.c  .generated_files/flags/default/3d7a8c74c812f8ac316f76a4d43f319a0ef356bd .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Motors.o.d 
	@${RM} ${OBJECTDIR}/Motors.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/Motors.o.d" -o ${OBJECTDIR}/Motors.o Motors.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/MowerSubHSM.o: MowerSubHSM.c  .generated_files/flags/default/10817aca2ff805456e2d29254e7b6b58990afb0d .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MowerSubHSM.o.d 
	@${RM} ${OBJECTDIR}/MowerSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/MowerSubHSM.o.d" -o ${OBJECTDIR}/MowerSubHSM.o MowerSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/AD.o: ../../ECE118/src/AD.c  .generated_files/flags/default/d4ba0273b57893a44eedaf32f786b5dc452c84d6 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/AD.o.d" -o ${OBJECTDIR}/_ext/720413242/AD.o ../../ECE118/src/AD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/BOARD.o: ../../ECE118/src/BOARD.c  .generated_files/flags/default/fa4d4e7651e5409c8a26c89efcd9b2a153cd4867 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/BOARD.o.d" -o ${OBJECTDIR}/_ext/720413242/BOARD.o ../../ECE118/src/BOARD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/ES_CheckEvents.o: ../../ECE118/src/ES_CheckEvents.c  .generated_files/flags/default/d486f6a2a6d76d88a8ac084df2e60994c9ab7786 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/720413242/ES_CheckEvents.o ../../ECE118/src/ES_CheckEvents.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/ES_Framework.o: ../../ECE118/src/ES_Framework.c  .generated_files/flags/default/d81c9f9f544c1a4ca8c23e5c658353ee8fd68e37 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/720413242/ES_Framework.o ../../ECE118/src/ES_Framework.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/ES_KeyboardInput.o: ../../ECE118/src/ES_KeyboardInput.c  .generated_files/flags/default/21b03deed5ac66c82e635f560b112302a929a9f6 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/720413242/ES_KeyboardInput.o ../../ECE118/src/ES_KeyboardInput.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/ES_PostList.o: ../../ECE118/src/ES_PostList.c  .generated_files/flags/default/40d4e24532fc9a768de5b48ad8027a9e0c4f2ee0 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/720413242/ES_PostList.o ../../ECE118/src/ES_PostList.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/ES_Queue.o: ../../ECE118/src/ES_Queue.c  .generated_files/flags/default/ec4d3b36824d5fbe005a792bc3aa416eef6a8be0 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/720413242/ES_Queue.o ../../ECE118/src/ES_Queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/ES_TattleTale.o: ../../ECE118/src/ES_TattleTale.c  .generated_files/flags/default/3da1dee5d820cdc2dd728a04bb34b48c2c7e1dbe .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/720413242/ES_TattleTale.o ../../ECE118/src/ES_TattleTale.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/ES_Timers.o: ../../ECE118/src/ES_Timers.c  .generated_files/flags/default/6e057a52e66e223cebef2df8939b8a287d3c06ae .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/720413242/ES_Timers.o ../../ECE118/src/ES_Timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/IO_Ports.o: ../../ECE118/src/IO_Ports.c  .generated_files/flags/default/6d7b28ed05acee400a54c51e66468ead59954470 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/720413242/IO_Ports.o ../../ECE118/src/IO_Ports.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/LED.o: ../../ECE118/src/LED.c  .generated_files/flags/default/53f8856ac18e2a32741da5bd27cee3be8f194f64 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/LED.o.d" -o ${OBJECTDIR}/_ext/720413242/LED.o ../../ECE118/src/LED.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/RC_Servo.o: ../../ECE118/src/RC_Servo.c  .generated_files/flags/default/27d16ce6aa839a60de3f6ec4c188e504cbf29aec .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/RC_Servo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/720413242/RC_Servo.o ../../ECE118/src/RC_Servo.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/pwm.o: ../../ECE118/src/pwm.c  .generated_files/flags/default/8d7b009559327bd783c1750b2d468b9fc2c279d1 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/pwm.o.d" -o ${OBJECTDIR}/_ext/720413242/pwm.o ../../ECE118/src/pwm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/roach.o: ../../ECE118/src/roach.c  .generated_files/flags/default/a9148aac34cbc29080b875d19419be571f1b88b5 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/roach.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/roach.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/roach.o.d" -o ${OBJECTDIR}/_ext/720413242/roach.o ../../ECE118/src/roach.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/serial.o: ../../ECE118/src/serial.c  .generated_files/flags/default/f270fcdef9981617d421e67aebb1186d4e77e161 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/serial.o.d" -o ${OBJECTDIR}/_ext/720413242/serial.o ../../ECE118/src/serial.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/720413242/timers.o: ../../ECE118/src/timers.c  .generated_files/flags/default/fef73f9fe0e072aa82fba2f7637ebd0a70cb54be .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/720413242" 
	@${RM} ${OBJECTDIR}/_ext/720413242/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/720413242/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/_ext/720413242/timers.o.d" -o ${OBJECTDIR}/_ext/720413242/timers.o ../../ECE118/src/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FindDoorSubHSM.o: FindDoorSubHSM.c  .generated_files/flags/default/296269cc5d1c49556c33135013103b041b952a59 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FindDoorSubHSM.o.d 
	@${RM} ${OBJECTDIR}/FindDoorSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/FindDoorSubHSM.o.d" -o ${OBJECTDIR}/FindDoorSubHSM.o FindDoorSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/RoamSubHSM.o: RoamSubHSM.c  .generated_files/flags/default/851d9a754d803cc9e3bdeb63dd4c642a8b91c4b4 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RoamSubHSM.o.d 
	@${RM} ${OBJECTDIR}/RoamSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/RoamSubHSM.o.d" -o ${OBJECTDIR}/RoamSubHSM.o RoamSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TrackWireService.o: TrackWireService.c  .generated_files/flags/default/974c8f57828554e930344d0f214c87e19cb9e33f .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TrackWireService.o.d 
	@${RM} ${OBJECTDIR}/TrackWireService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"../../ECE118" -MP -MMD -MF "${OBJECTDIR}/TrackWireService.o.d" -o ${OBJECTDIR}/TrackWireService.o TrackWireService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/FinalProject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/FinalProject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=10,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/FinalProject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/FinalProject.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=10,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/FinalProject.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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
