################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/dev/efmi-pss-use-case/Modelica/work/Grid4CHIL_IOplus/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/block.c \
C:/dev/efmi-pss-use-case/Modelica/work/Grid4CHIL_IOplus/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/galec_stl.c 

OBJS += \
./eFMU/Src/block.o \
./eFMU/Src/galec_stl.o 

C_DEPS += \
./eFMU/Src/block.d \
./eFMU/Src/galec_stl.d 


# Each subdirectory must supply rules for building sources it contributes
eFMU/Src/block.o: C:/dev/efmi-pss-use-case/Modelica/work/Grid4CHIL_IOplus/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/block.c eFMU/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G474xx -c -I../Core/Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../Drivers/CMSIS/Include -I"C:/dev/efmi-pss-use-case/Modelica/work/Grid4CHIL_IOplus/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
eFMU/Src/galec_stl.o: C:/dev/efmi-pss-use-case/Modelica/work/Grid4CHIL_IOplus/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/galec_stl.c eFMU/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G474xx -c -I../Core/Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../Drivers/CMSIS/Include -I"C:/dev/efmi-pss-use-case/Modelica/work/Grid4CHIL_IOplus/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-eFMU-2f-Src

clean-eFMU-2f-Src:
	-$(RM) ./eFMU/Src/block.cyclo ./eFMU/Src/block.d ./eFMU/Src/block.o ./eFMU/Src/block.su ./eFMU/Src/galec_stl.cyclo ./eFMU/Src/galec_stl.d ./eFMU/Src/galec_stl.o ./eFMU/Src/galec_stl.su

.PHONY: clean-eFMU-2f-Src

