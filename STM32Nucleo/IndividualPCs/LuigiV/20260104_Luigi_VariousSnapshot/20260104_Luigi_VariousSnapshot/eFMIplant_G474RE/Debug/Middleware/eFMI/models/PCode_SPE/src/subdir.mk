################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middleware/eFMI/models/PCode_SPE/src/block.c \
../Middleware/eFMI/models/PCode_SPE/src/galec_stl.c 

OBJS += \
./Middleware/eFMI/models/PCode_SPE/src/block.o \
./Middleware/eFMI/models/PCode_SPE/src/galec_stl.o 

C_DEPS += \
./Middleware/eFMI/models/PCode_SPE/src/block.d \
./Middleware/eFMI/models/PCode_SPE/src/galec_stl.d 


# Each subdirectory must supply rules for building sources it contributes
Middleware/eFMI/models/PCode_SPE/src/%.o Middleware/eFMI/models/PCode_SPE/src/%.su Middleware/eFMI/models/PCode_SPE/src/%.cyclo: ../Middleware/eFMI/models/PCode_SPE/src/%.c Middleware/eFMI/models/PCode_SPE/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G474xx -c -I../Core/Inc -I"C:/dev/efmi-pss-use-case/STM32Nucleo/IndividualPCs/LuigiV/20260104_Luigi_VariousSnapshot/20260104_Luigi_VariousSnapshot/eFMIplant_G474RE/Middleware/eFMI/models/PCode_SPE/inc" -I../Drivers/STM32G4xx_HAL_Driver/Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../Drivers/CMSIS/Include -Ofast -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middleware-2f-eFMI-2f-models-2f-PCode_SPE-2f-src

clean-Middleware-2f-eFMI-2f-models-2f-PCode_SPE-2f-src:
	-$(RM) ./Middleware/eFMI/models/PCode_SPE/src/block.cyclo ./Middleware/eFMI/models/PCode_SPE/src/block.d ./Middleware/eFMI/models/PCode_SPE/src/block.o ./Middleware/eFMI/models/PCode_SPE/src/block.su ./Middleware/eFMI/models/PCode_SPE/src/galec_stl.cyclo ./Middleware/eFMI/models/PCode_SPE/src/galec_stl.d ./Middleware/eFMI/models/PCode_SPE/src/galec_stl.o ./Middleware/eFMI/models/PCode_SPE/src/galec_stl.su

.PHONY: clean-Middleware-2f-eFMI-2f-models-2f-PCode_SPE-2f-src

