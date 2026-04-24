################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/Modelica/work/Grid4CHIL/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/block.c \
C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/Modelica/work/Grid4CHIL/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/galec_stl.c \
C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/Modelica/work/Grid4CHIL/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/mei_block_interface.c \
C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/Modelica/work/Grid4CHIL/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/sii_block_interface.c 

OBJS += \
./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/block.o \
./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/galec_stl.o \
./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/mei_block_interface.o \
./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/sii_block_interface.o 

C_DEPS += \
./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/block.d \
./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/galec_stl.d \
./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/mei_block_interface.d \
./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/sii_block_interface.d 


# Each subdirectory must supply rules for building sources it contributes
PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/block.o: C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/Modelica/work/Grid4CHIL/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/block.c PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H723xx -c -I../Core/Inc -I"C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/Modelica/work/Grid4CHIL/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/STM32/work/Grid4CHIL_H723ZG/eFMU/Src" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/galec_stl.o: C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/Modelica/work/Grid4CHIL/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/galec_stl.c PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H723xx -c -I../Core/Inc -I"C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/Modelica/work/Grid4CHIL/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/STM32/work/Grid4CHIL_H723ZG/eFMU/Src" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/mei_block_interface.o: C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/Modelica/work/Grid4CHIL/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/mei_block_interface.c PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H723xx -c -I../Core/Inc -I"C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/Modelica/work/Grid4CHIL/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/STM32/work/Grid4CHIL_H723ZG/eFMU/Src" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/sii_block_interface.o: C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/Modelica/work/Grid4CHIL/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/sii_block_interface.c PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H723xx -c -I../Core/Inc -I"C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/Modelica/work/Grid4CHIL/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed" -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/jpizz/Documents/eFMUDev/efmi-pss-use-case/STM32/work/Grid4CHIL_H723ZG/eFMU/Src" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed

clean-PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed:
	-$(RM) ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/block.cyclo ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/block.d ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/block.o ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/block.su ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/galec_stl.cyclo ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/galec_stl.d ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/galec_stl.o ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/galec_stl.su ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/mei_block_interface.cyclo ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/mei_block_interface.d ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/mei_block_interface.o ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/mei_block_interface.su ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/sii_block_interface.cyclo ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/sii_block_interface.d ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/sii_block_interface.o ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/sii_block_interface.su

.PHONY: clean-PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed

