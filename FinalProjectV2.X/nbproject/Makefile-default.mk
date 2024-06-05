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
FINAL_IMAGE=${DISTDIR}/FinalProjectV2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/FinalProjectV2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=C:/ECE118/src/AD.c C:/ECE118/src/BOARD.c C:/ECE118/src/ES_CheckEvents.c C:/ECE118/src/ES_Framework.c C:/ECE118/src/ES_KeyboardInput.c C:/ECE118/src/ES_PostList.c C:/ECE118/src/ES_Queue.c C:/ECE118/src/ES_TattleTale.c C:/ECE118/src/ES_Timers.c C:/ECE118/src/IO_Ports.c C:/ECE118/src/LED.c C:/ECE118/src/RC_Servo.c C:/ECE118/src/pwm.c C:/ECE118/src/serial.c DepositSubHSM.c BumperService.c TrackWireService.c TapeService.c RobotMain.c RoboHSM.c RoamSubHSM.c MowerSubHSM.c Motors.c FindDoorSubHSM.c C:/ECE118/src/timers.c C:/ECE118-Final-Project/FinalProjectV2.X/BackTapeService.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1975241074/AD.o ${OBJECTDIR}/_ext/1975241074/BOARD.o ${OBJECTDIR}/_ext/1975241074/ES_CheckEvents.o ${OBJECTDIR}/_ext/1975241074/ES_Framework.o ${OBJECTDIR}/_ext/1975241074/ES_KeyboardInput.o ${OBJECTDIR}/_ext/1975241074/ES_PostList.o ${OBJECTDIR}/_ext/1975241074/ES_Queue.o ${OBJECTDIR}/_ext/1975241074/ES_TattleTale.o ${OBJECTDIR}/_ext/1975241074/ES_Timers.o ${OBJECTDIR}/_ext/1975241074/IO_Ports.o ${OBJECTDIR}/_ext/1975241074/LED.o ${OBJECTDIR}/_ext/1975241074/RC_Servo.o ${OBJECTDIR}/_ext/1975241074/pwm.o ${OBJECTDIR}/_ext/1975241074/serial.o ${OBJECTDIR}/DepositSubHSM.o ${OBJECTDIR}/BumperService.o ${OBJECTDIR}/TrackWireService.o ${OBJECTDIR}/TapeService.o ${OBJECTDIR}/RobotMain.o ${OBJECTDIR}/RoboHSM.o ${OBJECTDIR}/RoamSubHSM.o ${OBJECTDIR}/MowerSubHSM.o ${OBJECTDIR}/Motors.o ${OBJECTDIR}/FindDoorSubHSM.o ${OBJECTDIR}/_ext/1975241074/timers.o ${OBJECTDIR}/_ext/87958790/BackTapeService.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1975241074/AD.o.d ${OBJECTDIR}/_ext/1975241074/BOARD.o.d ${OBJECTDIR}/_ext/1975241074/ES_CheckEvents.o.d ${OBJECTDIR}/_ext/1975241074/ES_Framework.o.d ${OBJECTDIR}/_ext/1975241074/ES_KeyboardInput.o.d ${OBJECTDIR}/_ext/1975241074/ES_PostList.o.d ${OBJECTDIR}/_ext/1975241074/ES_Queue.o.d ${OBJECTDIR}/_ext/1975241074/ES_TattleTale.o.d ${OBJECTDIR}/_ext/1975241074/ES_Timers.o.d ${OBJECTDIR}/_ext/1975241074/IO_Ports.o.d ${OBJECTDIR}/_ext/1975241074/LED.o.d ${OBJECTDIR}/_ext/1975241074/RC_Servo.o.d ${OBJECTDIR}/_ext/1975241074/pwm.o.d ${OBJECTDIR}/_ext/1975241074/serial.o.d ${OBJECTDIR}/DepositSubHSM.o.d ${OBJECTDIR}/BumperService.o.d ${OBJECTDIR}/TrackWireService.o.d ${OBJECTDIR}/TapeService.o.d ${OBJECTDIR}/RobotMain.o.d ${OBJECTDIR}/RoboHSM.o.d ${OBJECTDIR}/RoamSubHSM.o.d ${OBJECTDIR}/MowerSubHSM.o.d ${OBJECTDIR}/Motors.o.d ${OBJECTDIR}/FindDoorSubHSM.o.d ${OBJECTDIR}/_ext/1975241074/timers.o.d ${OBJECTDIR}/_ext/87958790/BackTapeService.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1975241074/AD.o ${OBJECTDIR}/_ext/1975241074/BOARD.o ${OBJECTDIR}/_ext/1975241074/ES_CheckEvents.o ${OBJECTDIR}/_ext/1975241074/ES_Framework.o ${OBJECTDIR}/_ext/1975241074/ES_KeyboardInput.o ${OBJECTDIR}/_ext/1975241074/ES_PostList.o ${OBJECTDIR}/_ext/1975241074/ES_Queue.o ${OBJECTDIR}/_ext/1975241074/ES_TattleTale.o ${OBJECTDIR}/_ext/1975241074/ES_Timers.o ${OBJECTDIR}/_ext/1975241074/IO_Ports.o ${OBJECTDIR}/_ext/1975241074/LED.o ${OBJECTDIR}/_ext/1975241074/RC_Servo.o ${OBJECTDIR}/_ext/1975241074/pwm.o ${OBJECTDIR}/_ext/1975241074/serial.o ${OBJECTDIR}/DepositSubHSM.o ${OBJECTDIR}/BumperService.o ${OBJECTDIR}/TrackWireService.o ${OBJECTDIR}/TapeService.o ${OBJECTDIR}/RobotMain.o ${OBJECTDIR}/RoboHSM.o ${OBJECTDIR}/RoamSubHSM.o ${OBJECTDIR}/MowerSubHSM.o ${OBJECTDIR}/Motors.o ${OBJECTDIR}/FindDoorSubHSM.o ${OBJECTDIR}/_ext/1975241074/timers.o ${OBJECTDIR}/_ext/87958790/BackTapeService.o

# Source Files
SOURCEFILES=C:/ECE118/src/AD.c C:/ECE118/src/BOARD.c C:/ECE118/src/ES_CheckEvents.c C:/ECE118/src/ES_Framework.c C:/ECE118/src/ES_KeyboardInput.c C:/ECE118/src/ES_PostList.c C:/ECE118/src/ES_Queue.c C:/ECE118/src/ES_TattleTale.c C:/ECE118/src/ES_Timers.c C:/ECE118/src/IO_Ports.c C:/ECE118/src/LED.c C:/ECE118/src/RC_Servo.c C:/ECE118/src/pwm.c C:/ECE118/src/serial.c DepositSubHSM.c BumperService.c TrackWireService.c TapeService.c RobotMain.c RoboHSM.c RoamSubHSM.c MowerSubHSM.c Motors.c FindDoorSubHSM.c C:/ECE118/src/timers.c C:/ECE118-Final-Project/FinalProjectV2.X/BackTapeService.c



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
ProjectDir="C:\ECE118-Final-Project\FinalProjectV2.X"
ProjectName=FinalProjectV2
ConfName=default
ImagePath="${DISTDIR}\FinalProjectV2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ImageDir="${DISTDIR}"
ImageName="FinalProjectV2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IsDebug="true"
else
IsDebug="false"
endif

.build-conf:  .pre ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/FinalProjectV2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX320F128H
MP_LINKER_FILE_OPTION=,--script="C:\ECE118\bootloader320.ld"
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
${OBJECTDIR}/_ext/1975241074/AD.o: C:/ECE118/src/AD.c  .generated_files/flags/default/899a983c6a9e3e0d076edda26afb7b3fa69596b .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/AD.o.d" -o ${OBJECTDIR}/_ext/1975241074/AD.o C:/ECE118/src/AD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/BOARD.o: C:/ECE118/src/BOARD.c  .generated_files/flags/default/4d576aa7062edfca79096039b24b4356ead17149 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/BOARD.o.d" -o ${OBJECTDIR}/_ext/1975241074/BOARD.o C:/ECE118/src/BOARD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_CheckEvents.o: C:/ECE118/src/ES_CheckEvents.c  .generated_files/flags/default/6e2b9d39e10209919a97e08e6d259cc01b1f5c5d .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_CheckEvents.o C:/ECE118/src/ES_CheckEvents.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_Framework.o: C:/ECE118/src/ES_Framework.c  .generated_files/flags/default/688b321f26f95bdaecdb317efb09b0aa2ce9385e .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_Framework.o C:/ECE118/src/ES_Framework.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_KeyboardInput.o: C:/ECE118/src/ES_KeyboardInput.c  .generated_files/flags/default/6cd85442cb71c34398ffcc1861095a9ff07eaf15 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_KeyboardInput.o C:/ECE118/src/ES_KeyboardInput.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_PostList.o: C:/ECE118/src/ES_PostList.c  .generated_files/flags/default/bd71ac1d32f9e606682cb5fad4a26b36e9d768ef .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_PostList.o C:/ECE118/src/ES_PostList.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_Queue.o: C:/ECE118/src/ES_Queue.c  .generated_files/flags/default/3e372a4e084624bc2e7648b049f954916b259157 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_Queue.o C:/ECE118/src/ES_Queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_TattleTale.o: C:/ECE118/src/ES_TattleTale.c  .generated_files/flags/default/fdcd18c03dbfc0d87eb3a8685408d5c28795d127 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_TattleTale.o C:/ECE118/src/ES_TattleTale.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_Timers.o: C:/ECE118/src/ES_Timers.c  .generated_files/flags/default/2066a2ddb0d12ae4f2c8603477999fe1690bf796 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_Timers.o C:/ECE118/src/ES_Timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/IO_Ports.o: C:/ECE118/src/IO_Ports.c  .generated_files/flags/default/c93cb1b2846763e88de2363e0247a416070e1aa1 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/1975241074/IO_Ports.o C:/ECE118/src/IO_Ports.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/LED.o: C:/ECE118/src/LED.c  .generated_files/flags/default/541fb192d6f1b233f980657c756899a866fc6187 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/LED.o.d" -o ${OBJECTDIR}/_ext/1975241074/LED.o C:/ECE118/src/LED.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/RC_Servo.o: C:/ECE118/src/RC_Servo.c  .generated_files/flags/default/9a71bdb60e5ef8bc175402ed303dd246ac465c6a .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/RC_Servo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/1975241074/RC_Servo.o C:/ECE118/src/RC_Servo.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/pwm.o: C:/ECE118/src/pwm.c  .generated_files/flags/default/9e08d37337b07d4a729e7d9fe6415d0e9346d56d .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/pwm.o.d" -o ${OBJECTDIR}/_ext/1975241074/pwm.o C:/ECE118/src/pwm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/serial.o: C:/ECE118/src/serial.c  .generated_files/flags/default/a2346658289b4c6b922b8c820ae133b808861647 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/serial.o.d" -o ${OBJECTDIR}/_ext/1975241074/serial.o C:/ECE118/src/serial.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/DepositSubHSM.o: DepositSubHSM.c  .generated_files/flags/default/440509eea4aa0a6347514913af025853408947fc .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/DepositSubHSM.o.d 
	@${RM} ${OBJECTDIR}/DepositSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/DepositSubHSM.o.d" -o ${OBJECTDIR}/DepositSubHSM.o DepositSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/BumperService.o: BumperService.c  .generated_files/flags/default/4b46416e1f5cea3cf0d207b91b78276372a57452 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/BumperService.o.d 
	@${RM} ${OBJECTDIR}/BumperService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/BumperService.o.d" -o ${OBJECTDIR}/BumperService.o BumperService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TrackWireService.o: TrackWireService.c  .generated_files/flags/default/dbb34323e42491e95bcfff9d065e6256a4fbfa10 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TrackWireService.o.d 
	@${RM} ${OBJECTDIR}/TrackWireService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/TrackWireService.o.d" -o ${OBJECTDIR}/TrackWireService.o TrackWireService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TapeService.o: TapeService.c  .generated_files/flags/default/91fc87222c1e3ca91e7f67abe19881b43160887d .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TapeService.o.d 
	@${RM} ${OBJECTDIR}/TapeService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/TapeService.o.d" -o ${OBJECTDIR}/TapeService.o TapeService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/RobotMain.o: RobotMain.c  .generated_files/flags/default/9f3e5d860c251af19042f8a80f23e1a3f7dcefbe .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RobotMain.o.d 
	@${RM} ${OBJECTDIR}/RobotMain.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/RobotMain.o.d" -o ${OBJECTDIR}/RobotMain.o RobotMain.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/RoboHSM.o: RoboHSM.c  .generated_files/flags/default/47a8369ce5224dfd394d446644f6b14abb9a11f1 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RoboHSM.o.d 
	@${RM} ${OBJECTDIR}/RoboHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/RoboHSM.o.d" -o ${OBJECTDIR}/RoboHSM.o RoboHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/RoamSubHSM.o: RoamSubHSM.c  .generated_files/flags/default/d5d67026fa52b6a6da872210bfacc71907ea1372 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RoamSubHSM.o.d 
	@${RM} ${OBJECTDIR}/RoamSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/RoamSubHSM.o.d" -o ${OBJECTDIR}/RoamSubHSM.o RoamSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/MowerSubHSM.o: MowerSubHSM.c  .generated_files/flags/default/390e9b57c6c9913439f62f1844b95395433597d4 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MowerSubHSM.o.d 
	@${RM} ${OBJECTDIR}/MowerSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/MowerSubHSM.o.d" -o ${OBJECTDIR}/MowerSubHSM.o MowerSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/Motors.o: Motors.c  .generated_files/flags/default/4451d8bbf56f952a6a42d81550d9c4116a39644e .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Motors.o.d 
	@${RM} ${OBJECTDIR}/Motors.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/Motors.o.d" -o ${OBJECTDIR}/Motors.o Motors.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FindDoorSubHSM.o: FindDoorSubHSM.c  .generated_files/flags/default/3741f81f858b95dc8d0f2e15ce9c8b348f705be4 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FindDoorSubHSM.o.d 
	@${RM} ${OBJECTDIR}/FindDoorSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/FindDoorSubHSM.o.d" -o ${OBJECTDIR}/FindDoorSubHSM.o FindDoorSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/timers.o: C:/ECE118/src/timers.c  .generated_files/flags/default/55f4d6b5fae86998ad3910453785011b438bae64 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/timers.o.d" -o ${OBJECTDIR}/_ext/1975241074/timers.o C:/ECE118/src/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/87958790/BackTapeService.o: C:/ECE118-Final-Project/FinalProjectV2.X/BackTapeService.c  .generated_files/flags/default/c3a7f1d1b96823a1faf8c6d38f71aa109b1c123c .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/87958790" 
	@${RM} ${OBJECTDIR}/_ext/87958790/BackTapeService.o.d 
	@${RM} ${OBJECTDIR}/_ext/87958790/BackTapeService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/87958790/BackTapeService.o.d" -o ${OBJECTDIR}/_ext/87958790/BackTapeService.o C:/ECE118-Final-Project/FinalProjectV2.X/BackTapeService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1975241074/AD.o: C:/ECE118/src/AD.c  .generated_files/flags/default/94fe8e4dbbe0c1179e54189ecf044db62b3fee6f .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/AD.o.d" -o ${OBJECTDIR}/_ext/1975241074/AD.o C:/ECE118/src/AD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/BOARD.o: C:/ECE118/src/BOARD.c  .generated_files/flags/default/b2f77e949381c1aa4017c31ba1aceb1a8d461dfe .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/BOARD.o.d" -o ${OBJECTDIR}/_ext/1975241074/BOARD.o C:/ECE118/src/BOARD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_CheckEvents.o: C:/ECE118/src/ES_CheckEvents.c  .generated_files/flags/default/575e87b71a7332aebca6065b62432a7b5589b5a3 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_CheckEvents.o C:/ECE118/src/ES_CheckEvents.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_Framework.o: C:/ECE118/src/ES_Framework.c  .generated_files/flags/default/ec14aa85f5957001415836aec6a239188b12097c .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_Framework.o C:/ECE118/src/ES_Framework.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_KeyboardInput.o: C:/ECE118/src/ES_KeyboardInput.c  .generated_files/flags/default/1e4f26d6d5ed7fb3cf68852daec1964191187515 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_KeyboardInput.o C:/ECE118/src/ES_KeyboardInput.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_PostList.o: C:/ECE118/src/ES_PostList.c  .generated_files/flags/default/c91a2ae0e624afb92b05ea65a58016bb9e9286e5 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_PostList.o C:/ECE118/src/ES_PostList.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_Queue.o: C:/ECE118/src/ES_Queue.c  .generated_files/flags/default/d7930a9332d9b60655c53ee28cc87ee8168e8a87 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_Queue.o C:/ECE118/src/ES_Queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_TattleTale.o: C:/ECE118/src/ES_TattleTale.c  .generated_files/flags/default/2f68e86d361dae82e323f770614490949c25f20 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_TattleTale.o C:/ECE118/src/ES_TattleTale.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_Timers.o: C:/ECE118/src/ES_Timers.c  .generated_files/flags/default/23f1df715e64ca65029dc45243ea003c015d558b .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_Timers.o C:/ECE118/src/ES_Timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/IO_Ports.o: C:/ECE118/src/IO_Ports.c  .generated_files/flags/default/31af8cbd69993915c92f66f6f897793d20c29b5 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/1975241074/IO_Ports.o C:/ECE118/src/IO_Ports.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/LED.o: C:/ECE118/src/LED.c  .generated_files/flags/default/51effcfda5653f142b55c028937c72e616403745 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/LED.o.d" -o ${OBJECTDIR}/_ext/1975241074/LED.o C:/ECE118/src/LED.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/RC_Servo.o: C:/ECE118/src/RC_Servo.c  .generated_files/flags/default/1d358c521b28190bffb5efb0e2ac676e6a835569 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/RC_Servo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/1975241074/RC_Servo.o C:/ECE118/src/RC_Servo.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/pwm.o: C:/ECE118/src/pwm.c  .generated_files/flags/default/f91e981955a9cc4aa8f40368d3e2268b1098a8f8 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/pwm.o.d" -o ${OBJECTDIR}/_ext/1975241074/pwm.o C:/ECE118/src/pwm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/serial.o: C:/ECE118/src/serial.c  .generated_files/flags/default/f006578589775036f59a1f1daec8cd9fba3c6968 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/serial.o.d" -o ${OBJECTDIR}/_ext/1975241074/serial.o C:/ECE118/src/serial.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/DepositSubHSM.o: DepositSubHSM.c  .generated_files/flags/default/8f6be1571e6ac34168b1f7e9f9dcb78eb0e015 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/DepositSubHSM.o.d 
	@${RM} ${OBJECTDIR}/DepositSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/DepositSubHSM.o.d" -o ${OBJECTDIR}/DepositSubHSM.o DepositSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/BumperService.o: BumperService.c  .generated_files/flags/default/322d7636c035f0f6562d201d83a2abc06177cc84 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/BumperService.o.d 
	@${RM} ${OBJECTDIR}/BumperService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/BumperService.o.d" -o ${OBJECTDIR}/BumperService.o BumperService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TrackWireService.o: TrackWireService.c  .generated_files/flags/default/c92315b0f3633c68aafdb341d3e0f701638f566b .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TrackWireService.o.d 
	@${RM} ${OBJECTDIR}/TrackWireService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/TrackWireService.o.d" -o ${OBJECTDIR}/TrackWireService.o TrackWireService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TapeService.o: TapeService.c  .generated_files/flags/default/23df3382e346eaf97c2b673ea2fc259fad5d0830 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TapeService.o.d 
	@${RM} ${OBJECTDIR}/TapeService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/TapeService.o.d" -o ${OBJECTDIR}/TapeService.o TapeService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/RobotMain.o: RobotMain.c  .generated_files/flags/default/546b0da43847111628d41ea9ec8f188dd06c79d8 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RobotMain.o.d 
	@${RM} ${OBJECTDIR}/RobotMain.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/RobotMain.o.d" -o ${OBJECTDIR}/RobotMain.o RobotMain.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/RoboHSM.o: RoboHSM.c  .generated_files/flags/default/fd09ae4e2c38d2dff6b442c99d4999e4891c2f56 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RoboHSM.o.d 
	@${RM} ${OBJECTDIR}/RoboHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/RoboHSM.o.d" -o ${OBJECTDIR}/RoboHSM.o RoboHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/RoamSubHSM.o: RoamSubHSM.c  .generated_files/flags/default/54b5cfe96deaed76c6dff44eecb7f4649eb981a5 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RoamSubHSM.o.d 
	@${RM} ${OBJECTDIR}/RoamSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/RoamSubHSM.o.d" -o ${OBJECTDIR}/RoamSubHSM.o RoamSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/MowerSubHSM.o: MowerSubHSM.c  .generated_files/flags/default/71363b62599bf350d38c2841a6548e3567b0018 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MowerSubHSM.o.d 
	@${RM} ${OBJECTDIR}/MowerSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/MowerSubHSM.o.d" -o ${OBJECTDIR}/MowerSubHSM.o MowerSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/Motors.o: Motors.c  .generated_files/flags/default/b8e2904cabe5125302415124d64fda8e57b9768f .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Motors.o.d 
	@${RM} ${OBJECTDIR}/Motors.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/Motors.o.d" -o ${OBJECTDIR}/Motors.o Motors.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FindDoorSubHSM.o: FindDoorSubHSM.c  .generated_files/flags/default/995e03a2f2f52756ddc1f7da081610a2cfb991c7 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FindDoorSubHSM.o.d 
	@${RM} ${OBJECTDIR}/FindDoorSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/FindDoorSubHSM.o.d" -o ${OBJECTDIR}/FindDoorSubHSM.o FindDoorSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/timers.o: C:/ECE118/src/timers.c  .generated_files/flags/default/7ce31cc0521fe3be214d13b68520e23cef8ea820 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/timers.o.d" -o ${OBJECTDIR}/_ext/1975241074/timers.o C:/ECE118/src/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/87958790/BackTapeService.o: C:/ECE118-Final-Project/FinalProjectV2.X/BackTapeService.c  .generated_files/flags/default/b2a15278841e964e0a93d48445355ed86b685b60 .generated_files/flags/default/5c6b98b8923ce30ee24d180da03fe6585119c89b
	@${MKDIR} "${OBJECTDIR}/_ext/87958790" 
	@${RM} ${OBJECTDIR}/_ext/87958790/BackTapeService.o.d 
	@${RM} ${OBJECTDIR}/_ext/87958790/BackTapeService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/ECE118/include" -I"." -I"C:/ECE118-Final-Project/FinalProjectV2.X" -MP -MMD -MF "${OBJECTDIR}/_ext/87958790/BackTapeService.o.d" -o ${OBJECTDIR}/_ext/87958790/BackTapeService.o C:/ECE118-Final-Project/FinalProjectV2.X/BackTapeService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/FinalProjectV2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    C:/ECE118/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/FinalProjectV2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=10,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/FinalProjectV2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   C:/ECE118/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/FinalProjectV2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=10,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/FinalProjectV2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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
