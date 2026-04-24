################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/Modelica/work/Grid4CHIL/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/block.c \
C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/Modelica/work/Grid4CHIL/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/galec_stl.c 

OBJS += \
./eFMU/Src/block.o \
./eFMU/Src/galec_stl.o 

C_DEPS += \
./eFMU/Src/block.d \
./eFMU/Src/galec_stl.d 


# Each subdirectory must supply rules for building sources it contributes
eFMU/Src/block.o: C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/Modelica/work/Grid4CHIL/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/block.c eFMU/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=c18 -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H723xx -c -I../Core/Inc -I"C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/Modelica/work/Grid4CHIL/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/STM32/work/Grid4CHIL_H723ZG/eFMU/Src" -I"C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/STM32/work/Grid4CHIL_H723ZG/PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c" -O3 -ffunction-sections -fdata-sections -Wall -Wextra -pedantic -Wmissing-include-dirs -Wswitch-default -Wswitch-enum -Wconversion -v -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
eFMU/Src/galec_stl.o: C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/Modelica/work/Grid4CHIL/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/galec_stl.c eFMU/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=c18 -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H723xx -c -I../Core/Inc -I"C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/Modelica/work/Grid4CHIL/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/STM32/work/Grid4CHIL_H723ZG/eFMU/Src" -I"C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/STM32/work/Grid4CHIL_H723ZG/PCode_SPE_fba3e0dfa6c8985b41bcbe3594ee941ce98b740c" -O3 -ffunction-sections -fdata-sections -Wall -Wextra -pedantic -Wmissing-include-dirs -Wswitch-default -Wswitch-enum -Wconversion -v -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-eFMU-2f-Src

clean-eFMU-2f-Src:
	-$(RM) ./eFMU/Src/block.cyclo ./eFMU/Src/block.d ./eFMU/Src/block.o ./eFMU/Src/block.su ./eFMU/Src/galec_stl.cyclo ./eFMU/Src/galec_stl.d ./eFMU/Src/galec_stl.o ./eFMU/Src/galec_stl.su

.PHONY: clean-eFMU-2f-Src

