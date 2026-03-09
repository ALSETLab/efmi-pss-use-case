################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
E:/modelica-libraries/efmi-pss-use-case/Modelica/work/PSSTypeIISimpleHPF/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/block.c \
E:/modelica-libraries/efmi-pss-use-case/Modelica/work/PSSTypeIISimpleHPF/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/galec_stl.c \
E:/modelica-libraries/efmi-pss-use-case/Modelica/work/PSSTypeIISimpleHPF/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/mei_block_interface.c \
E:/modelica-libraries/efmi-pss-use-case/Modelica/work/PSSTypeIISimpleHPF/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/sii_block_interface.c 

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
PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/block.o: E:/modelica-libraries/efmi-pss-use-case/Modelica/work/PSSTypeIISimpleHPF/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/block.c PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L476xx -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/galec_stl.o: E:/modelica-libraries/efmi-pss-use-case/Modelica/work/PSSTypeIISimpleHPF/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/galec_stl.c PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L476xx -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/mei_block_interface.o: E:/modelica-libraries/efmi-pss-use-case/Modelica/work/PSSTypeIISimpleHPF/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/mei_block_interface.c PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L476xx -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/sii_block_interface.o: E:/modelica-libraries/efmi-pss-use-case/Modelica/work/PSSTypeIISimpleHPF/eFMU/PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/sii_block_interface.c PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L476xx -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed

clean-PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed:
	-$(RM) ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/block.cyclo ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/block.d ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/block.o ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/block.su ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/galec_stl.cyclo ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/galec_stl.d ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/galec_stl.o ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/galec_stl.su ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/mei_block_interface.cyclo ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/mei_block_interface.d ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/mei_block_interface.o ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/mei_block_interface.su ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/sii_block_interface.cyclo ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/sii_block_interface.d ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/sii_block_interface.o ./PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed/sii_block_interface.su

.PHONY: clean-PCode_SPE_cb4a8a449b4ada864625ee5a4355578a3aaf08ed

