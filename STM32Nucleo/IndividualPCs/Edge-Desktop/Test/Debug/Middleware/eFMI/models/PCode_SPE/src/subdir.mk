################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middleware/eFMI/models/PCode_SPE/src/block.c \
../Middleware/eFMI/models/PCode_SPE/src/mei_block_interface.c \
../Middleware/eFMI/models/PCode_SPE/src/sii_block_interface.c 

OBJS += \
./Middleware/eFMI/models/PCode_SPE/src/block.o \
./Middleware/eFMI/models/PCode_SPE/src/mei_block_interface.o \
./Middleware/eFMI/models/PCode_SPE/src/sii_block_interface.o 

C_DEPS += \
./Middleware/eFMI/models/PCode_SPE/src/block.d \
./Middleware/eFMI/models/PCode_SPE/src/mei_block_interface.d \
./Middleware/eFMI/models/PCode_SPE/src/sii_block_interface.d 


# Each subdirectory must supply rules for building sources it contributes
Middleware/eFMI/models/PCode_SPE/src/%.o Middleware/eFMI/models/PCode_SPE/src/%.su Middleware/eFMI/models/PCode_SPE/src/%.cyclo: ../Middleware/eFMI/models/PCode_SPE/src/%.c Middleware/eFMI/models/PCode_SPE/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F303xE -c -I../Core/Inc -I"C:/Users/Luigi/Documents/Github/efmi-pss-use-case/STM32Nucleo/IndividualPCs/Edge-Desktop/Test/Middleware/eFMI/models/PCode_SPE/inc" -I../Drivers/STM32F3xx_HAL_Driver/Inc -I../Drivers/STM32F3xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F3xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middleware-2f-eFMI-2f-models-2f-PCode_SPE-2f-src

clean-Middleware-2f-eFMI-2f-models-2f-PCode_SPE-2f-src:
	-$(RM) ./Middleware/eFMI/models/PCode_SPE/src/block.cyclo ./Middleware/eFMI/models/PCode_SPE/src/block.d ./Middleware/eFMI/models/PCode_SPE/src/block.o ./Middleware/eFMI/models/PCode_SPE/src/block.su ./Middleware/eFMI/models/PCode_SPE/src/mei_block_interface.cyclo ./Middleware/eFMI/models/PCode_SPE/src/mei_block_interface.d ./Middleware/eFMI/models/PCode_SPE/src/mei_block_interface.o ./Middleware/eFMI/models/PCode_SPE/src/mei_block_interface.su ./Middleware/eFMI/models/PCode_SPE/src/sii_block_interface.cyclo ./Middleware/eFMI/models/PCode_SPE/src/sii_block_interface.d ./Middleware/eFMI/models/PCode_SPE/src/sii_block_interface.o ./Middleware/eFMI/models/PCode_SPE/src/sii_block_interface.su

.PHONY: clean-Middleware-2f-eFMI-2f-models-2f-PCode_SPE-2f-src

