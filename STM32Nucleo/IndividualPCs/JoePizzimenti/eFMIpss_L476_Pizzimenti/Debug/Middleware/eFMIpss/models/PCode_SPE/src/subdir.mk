################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middleware/eFMIpss/models/PCode_SPE/src/block.c \
../Middleware/eFMIpss/models/PCode_SPE/src/mei_block_interface.c \
../Middleware/eFMIpss/models/PCode_SPE/src/sii_block_interface.c 

OBJS += \
./Middleware/eFMIpss/models/PCode_SPE/src/block.o \
./Middleware/eFMIpss/models/PCode_SPE/src/mei_block_interface.o \
./Middleware/eFMIpss/models/PCode_SPE/src/sii_block_interface.o 

C_DEPS += \
./Middleware/eFMIpss/models/PCode_SPE/src/block.d \
./Middleware/eFMIpss/models/PCode_SPE/src/mei_block_interface.d \
./Middleware/eFMIpss/models/PCode_SPE/src/sii_block_interface.d 


# Each subdirectory must supply rules for building sources it contributes
Middleware/eFMIpss/models/PCode_SPE/src/%.o Middleware/eFMIpss/models/PCode_SPE/src/%.su Middleware/eFMIpss/models/PCode_SPE/src/%.cyclo: ../Middleware/eFMIpss/models/PCode_SPE/src/%.c Middleware/eFMIpss/models/PCode_SPE/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L476xx -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I"C:/Users/jpizz/Documents/STMWorkspace/20260104_Luigi_VariousSnapshot/eFMIpss_L476_Pizzimenti/Middleware/eFMIpss/models/PCode_SPE/inc" -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middleware-2f-eFMIpss-2f-models-2f-PCode_SPE-2f-src

clean-Middleware-2f-eFMIpss-2f-models-2f-PCode_SPE-2f-src:
	-$(RM) ./Middleware/eFMIpss/models/PCode_SPE/src/block.cyclo ./Middleware/eFMIpss/models/PCode_SPE/src/block.d ./Middleware/eFMIpss/models/PCode_SPE/src/block.o ./Middleware/eFMIpss/models/PCode_SPE/src/block.su ./Middleware/eFMIpss/models/PCode_SPE/src/mei_block_interface.cyclo ./Middleware/eFMIpss/models/PCode_SPE/src/mei_block_interface.d ./Middleware/eFMIpss/models/PCode_SPE/src/mei_block_interface.o ./Middleware/eFMIpss/models/PCode_SPE/src/mei_block_interface.su ./Middleware/eFMIpss/models/PCode_SPE/src/sii_block_interface.cyclo ./Middleware/eFMIpss/models/PCode_SPE/src/sii_block_interface.d ./Middleware/eFMIpss/models/PCode_SPE/src/sii_block_interface.o ./Middleware/eFMIpss/models/PCode_SPE/src/sii_block_interface.su

.PHONY: clean-Middleware-2f-eFMIpss-2f-models-2f-PCode_SPE-2f-src

