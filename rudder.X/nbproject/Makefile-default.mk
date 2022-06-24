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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/rudder.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/rudder.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS
SUB_IMAGE_ADDRESS_COMMAND=--image-address $(SUB_IMAGE_ADDRESS)
else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=core/src/main.c core/src/clock.c core/src/uart.c core/src/adc.c core/src/motorPwm.c core/src/controllers.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/core/src/main.o ${OBJECTDIR}/core/src/clock.o ${OBJECTDIR}/core/src/uart.o ${OBJECTDIR}/core/src/adc.o ${OBJECTDIR}/core/src/motorPwm.o ${OBJECTDIR}/core/src/controllers.o
POSSIBLE_DEPFILES=${OBJECTDIR}/core/src/main.o.d ${OBJECTDIR}/core/src/clock.o.d ${OBJECTDIR}/core/src/uart.o.d ${OBJECTDIR}/core/src/adc.o.d ${OBJECTDIR}/core/src/motorPwm.o.d ${OBJECTDIR}/core/src/controllers.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/core/src/main.o ${OBJECTDIR}/core/src/clock.o ${OBJECTDIR}/core/src/uart.o ${OBJECTDIR}/core/src/adc.o ${OBJECTDIR}/core/src/motorPwm.o ${OBJECTDIR}/core/src/controllers.o

# Source Files
SOURCEFILES=core/src/main.c core/src/clock.c core/src/uart.c core/src/adc.c core/src/motorPwm.c core/src/controllers.c



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

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/rudder.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33EP256GP506
MP_LINKER_FILE_OPTION=,--script=p33EP256GP506.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/core/src/main.o: core/src/main.c  .generated_files/flags/default/3abbc5d74833e42572f9143eb81d6d2973e8d58b .generated_files/flags/default/cf746db493ae6e9c8dd43321e46753b1122a0084
	@${MKDIR} "${OBJECTDIR}/core/src" 
	@${RM} ${OBJECTDIR}/core/src/main.o.d 
	@${RM} ${OBJECTDIR}/core/src/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  core/src/main.c  -o ${OBJECTDIR}/core/src/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/core/src/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"core/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/core/src/clock.o: core/src/clock.c  .generated_files/flags/default/ce598491f175646e67f7b2fce3004047a8632ed2 .generated_files/flags/default/cf746db493ae6e9c8dd43321e46753b1122a0084
	@${MKDIR} "${OBJECTDIR}/core/src" 
	@${RM} ${OBJECTDIR}/core/src/clock.o.d 
	@${RM} ${OBJECTDIR}/core/src/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  core/src/clock.c  -o ${OBJECTDIR}/core/src/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/core/src/clock.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"core/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/core/src/uart.o: core/src/uart.c  .generated_files/flags/default/dc4a344723e83649cfd1e734a0b4d61e7cf5b883 .generated_files/flags/default/cf746db493ae6e9c8dd43321e46753b1122a0084
	@${MKDIR} "${OBJECTDIR}/core/src" 
	@${RM} ${OBJECTDIR}/core/src/uart.o.d 
	@${RM} ${OBJECTDIR}/core/src/uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  core/src/uart.c  -o ${OBJECTDIR}/core/src/uart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/core/src/uart.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"core/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/core/src/adc.o: core/src/adc.c  .generated_files/flags/default/865c0919b2f3489e7c0361fea9ae565cd53daa80 .generated_files/flags/default/cf746db493ae6e9c8dd43321e46753b1122a0084
	@${MKDIR} "${OBJECTDIR}/core/src" 
	@${RM} ${OBJECTDIR}/core/src/adc.o.d 
	@${RM} ${OBJECTDIR}/core/src/adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  core/src/adc.c  -o ${OBJECTDIR}/core/src/adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/core/src/adc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"core/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/core/src/motorPwm.o: core/src/motorPwm.c  .generated_files/flags/default/18925591007db829d97e775b362fa1085f80373b .generated_files/flags/default/cf746db493ae6e9c8dd43321e46753b1122a0084
	@${MKDIR} "${OBJECTDIR}/core/src" 
	@${RM} ${OBJECTDIR}/core/src/motorPwm.o.d 
	@${RM} ${OBJECTDIR}/core/src/motorPwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  core/src/motorPwm.c  -o ${OBJECTDIR}/core/src/motorPwm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/core/src/motorPwm.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"core/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/core/src/controllers.o: core/src/controllers.c  .generated_files/flags/default/f9ca847ef822a70c5214bd9eafd3d2ee1740004b .generated_files/flags/default/cf746db493ae6e9c8dd43321e46753b1122a0084
	@${MKDIR} "${OBJECTDIR}/core/src" 
	@${RM} ${OBJECTDIR}/core/src/controllers.o.d 
	@${RM} ${OBJECTDIR}/core/src/controllers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  core/src/controllers.c  -o ${OBJECTDIR}/core/src/controllers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/core/src/controllers.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"core/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/core/src/main.o: core/src/main.c  .generated_files/flags/default/8e21a5b0bf69e1433e9bb2d8ea327eb3accde0a9 .generated_files/flags/default/cf746db493ae6e9c8dd43321e46753b1122a0084
	@${MKDIR} "${OBJECTDIR}/core/src" 
	@${RM} ${OBJECTDIR}/core/src/main.o.d 
	@${RM} ${OBJECTDIR}/core/src/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  core/src/main.c  -o ${OBJECTDIR}/core/src/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/core/src/main.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"core/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/core/src/clock.o: core/src/clock.c  .generated_files/flags/default/3f3824f425b6d8ff5463b1582b6d48d1a2045736 .generated_files/flags/default/cf746db493ae6e9c8dd43321e46753b1122a0084
	@${MKDIR} "${OBJECTDIR}/core/src" 
	@${RM} ${OBJECTDIR}/core/src/clock.o.d 
	@${RM} ${OBJECTDIR}/core/src/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  core/src/clock.c  -o ${OBJECTDIR}/core/src/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/core/src/clock.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"core/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/core/src/uart.o: core/src/uart.c  .generated_files/flags/default/813468409490f1691129d2cea2cb20ed590aae36 .generated_files/flags/default/cf746db493ae6e9c8dd43321e46753b1122a0084
	@${MKDIR} "${OBJECTDIR}/core/src" 
	@${RM} ${OBJECTDIR}/core/src/uart.o.d 
	@${RM} ${OBJECTDIR}/core/src/uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  core/src/uart.c  -o ${OBJECTDIR}/core/src/uart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/core/src/uart.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"core/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/core/src/adc.o: core/src/adc.c  .generated_files/flags/default/f685e0f1346cb16e0c2dda987bc3622229cce118 .generated_files/flags/default/cf746db493ae6e9c8dd43321e46753b1122a0084
	@${MKDIR} "${OBJECTDIR}/core/src" 
	@${RM} ${OBJECTDIR}/core/src/adc.o.d 
	@${RM} ${OBJECTDIR}/core/src/adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  core/src/adc.c  -o ${OBJECTDIR}/core/src/adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/core/src/adc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"core/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/core/src/motorPwm.o: core/src/motorPwm.c  .generated_files/flags/default/a1b88e0e400fa26246d0fa0112c6ca5ccbcd45a8 .generated_files/flags/default/cf746db493ae6e9c8dd43321e46753b1122a0084
	@${MKDIR} "${OBJECTDIR}/core/src" 
	@${RM} ${OBJECTDIR}/core/src/motorPwm.o.d 
	@${RM} ${OBJECTDIR}/core/src/motorPwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  core/src/motorPwm.c  -o ${OBJECTDIR}/core/src/motorPwm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/core/src/motorPwm.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"core/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/core/src/controllers.o: core/src/controllers.c  .generated_files/flags/default/7e71a03f35c787be9202c0394dee09cbf1a985f0 .generated_files/flags/default/cf746db493ae6e9c8dd43321e46753b1122a0084
	@${MKDIR} "${OBJECTDIR}/core/src" 
	@${RM} ${OBJECTDIR}/core/src/controllers.o.d 
	@${RM} ${OBJECTDIR}/core/src/controllers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  core/src/controllers.c  -o ${OBJECTDIR}/core/src/controllers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/core/src/controllers.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"core/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/rudder.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/rudder.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x1000:0x101B -mreserve=data@0x101C:0x101D -mreserve=data@0x101E:0x101F -mreserve=data@0x1020:0x1021 -mreserve=data@0x1022:0x1023 -mreserve=data@0x1024:0x1027 -mreserve=data@0x1028:0x104F   -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/rudder.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/rudder.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/rudder.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
