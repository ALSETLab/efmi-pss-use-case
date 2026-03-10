################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
E:/modelica-libraries/efmi-pss-use-case/Modelica/work/PSSTypeIISimpleHPF/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/block.c \
E:/modelica-libraries/efmi-pss-use-case/Modelica/work/PSSTypeIISimpleHPF/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/galec_stl.c 

OBJS += \
./eFMU/Src/block.o \
./eFMU/Src/galec_stl.o 

C_DEPS += \
./eFMU/Src/block.d \
./eFMU/Src/galec_stl.d 


# Each subdirectory must supply rules for building sources it contributes
eFMU/Src/block.o: E:/modelica-libraries/efmi-pss-use-case/Modelica/work/PSSTypeIISimpleHPF/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/block.c eFMU/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32L476xx -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I"E:/modelica-libraries/efmi-pss-use-case/Modelica/work/PSSTypeIISimpleHPF/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
eFMU/Src/galec_stl.o: E:/modelica-libraries/efmi-pss-use-case/Modelica/work/PSSTypeIISimpleHPF/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/galec_stl.c eFMU/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32L476xx -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I"E:/modelica-libraries/efmi-pss-use-case/Modelica/work/PSSTypeIISimpleHPF/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed" -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-eFMU-2f-Src

clean-eFMU-2f-Src:
	-$(RM) ./eFMU/Src/block.cyclo ./eFMU/Src/block.d ./eFMU/Src/block.o ./eFMU/Src/block.su ./eFMU/Src/galec_stl.cyclo ./eFMU/Src/galec_stl.d ./eFMU/Src/galec_stl.o ./eFMU/Src/galec_stl.su

.PHONY: clean-eFMU-2f-Src

