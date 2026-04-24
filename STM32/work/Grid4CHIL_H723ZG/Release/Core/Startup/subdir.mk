################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Core/Startup/startup_stm32h723zgtx.s 

OBJS += \
./Core/Startup/startup_stm32h723zgtx.o 

S_DEPS += \
./Core/Startup/startup_stm32h723zgtx.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Startup/%.o: ../Core/Startup/%.s Core/Startup/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -c -I"C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/Modelica/work/Grid4CHIL/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed" -I"C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/STM32/work/Grid4CHIL_H723ZG/PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Core-2f-Startup

clean-Core-2f-Startup:
	-$(RM) ./Core/Startup/startup_stm32h723zgtx.d ./Core/Startup/startup_stm32h723zgtx.o

.PHONY: clean-Core-2f-Startup

